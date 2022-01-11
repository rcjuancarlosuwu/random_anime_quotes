part of 'quote_provider.dart';

class QuoteNotifier extends StateNotifier<QuoteState> {
  QuoteNotifier({
    required this.screenshotController,
    required this.translator,
    required this.localDataSource,
    required this.remoteDataSource,
  }) : super(const QuoteState.loading()) {
    getQuote();
  }

  final IQuotesLocalDataSource localDataSource;
  final IQuotesRemoteDataSource remoteDataSource;
  final ScreenshotController screenshotController;
  final Translator translator;

  /// Get a new [Quote]
  Future<void> getQuote() async {
    state = const QuoteState.loading();
    try {
      final quote = await remoteDataSource.getRandomQuote();
      state = QuoteState.data(quote: quote);
    } catch (e) {
      state = const QuoteState.error('An error has ocurred.');
    }
  }

  /// Like a [Quote]
  void like(Quote quote) {
    Quote newQuote = quote.copyWith(liked: !quote.liked);
    state = QuoteState.data(quote: newQuote);

    if (newQuote.liked) {
      localDataSource.saveQuote(newQuote);
      return;
    }

    localDataSource.deleteQuote(newQuote.id);
  }

  /// Copy a [Quote] to clipboard.
  Future<void> copy(Quote quote) async {
    try {
      await FlutterClipboard.copy(
        '${quote.quote}\n${quote.said}\n${quote.anime}',
      );
      await Fluttertoast.showToast(msg: 'Copied!');
    } catch (_) {
      await Fluttertoast.showToast(msg: 'Couldn\'t copy');
    }
  }

  /// Translate a [Quote] to the specified language.
  Future<void> translate(Quote quote) async {
    state = const QuoteState.loading();
    try {
      final translatedQuote = await translator.translateQuote(quote.quote);
      Quote newQuote = quote.copyWith(quote: translatedQuote);
      state = QuoteState.data(quote: newQuote);
      if (newQuote.liked) localDataSource.saveQuote(newQuote);
    } catch (_) {
      state = QuoteState.data(quote: quote);
    }
  }

  /// Translate a [Quote] to the specified language.
  Future<void> share() async {
    Uint8List? capture = await screenshotController.capture();

    if (capture != null) {
      final directory = await getTemporaryDirectory();
      final path = '${directory.path}/quote.png';
      final image = await File(path).create();
      await image.writeAsBytes(capture);
      await Share.shareFiles([image.path]);
      return;
    }

    await Fluttertoast.showToast(msg: 'Couldn\'t share');
  }
}
