import 'dart:io';
import 'dart:typed_data';

import 'package:clipboard/clipboard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'package:random_anime_quotes/src/core/providers/providers.dart';
import 'package:random_anime_quotes/src/core/providers/translator.dart';
import 'package:random_anime_quotes/src/features/quotes/data/datasource/quotes_local_datasource.dart';
import 'package:random_anime_quotes/src/features/quotes/data/datasource/quotes_remote_datasource.dart';
import 'package:random_anime_quotes/src/features/quotes/data/models/quote.dart';

import 'quote_state.dart';

part 'quote_notifier.dart';
part 'liked_quotes_notifier.dart';

final screenshotControllerProvider = Provider((_) => ScreenshotController());

final quotesLocalDataSourceProvider = Provider<IQuotesLocalDataSource>(
  (ref) => QuotesLocalDataSourcer(ref.read(quotesBoxProvider)),
);

final quotesRemoteDataSourceProvider = Provider<IQuotesRemoteDataSource>(
  (ref) => QuotesRemoteDataSource(client: ref.read(clientProvider)),
);

final quoteProvider = StateNotifierProvider<QuoteNotifier, QuoteState>((ref) {
  return QuoteNotifier(
    translator: ref.read(translatorProvider),
    localDataSource: ref.read(quotesLocalDataSourceProvider),
    screenshotController: ref.read(screenshotControllerProvider),
    remoteDataSource: ref.read(quotesRemoteDataSourceProvider),
  );
});

final likedQuotesProvider =
    StateNotifierProvider<LikedQuotesNotifier, List<Quote>>((ref) {
  return LikedQuotesNotifier(
      localDataSource: ref.read(quotesLocalDataSourceProvider),
      quoteState: ref.watch(quoteProvider));
});

final quotesProvider = StateProvider<List<Quote>>((ref) {
  return ref.read(quotesLocalDataSourceProvider).getLikedQuotes();
});
