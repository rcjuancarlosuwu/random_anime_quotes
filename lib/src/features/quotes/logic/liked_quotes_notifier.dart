part of 'quote_provider.dart';

class LikedQuotesNotifier extends StateNotifier<List<Quote>> {
  LikedQuotesNotifier({
    required this.localDataSource,
    required this.quoteState,
  }) : super(localDataSource.getLikedQuotes());

  final IQuotesLocalDataSource localDataSource;
  final QuoteState quoteState;

  delete(int id) {
    localDataSource.deleteQuote(id);
    state = localDataSource.getLikedQuotes();
  }
}
