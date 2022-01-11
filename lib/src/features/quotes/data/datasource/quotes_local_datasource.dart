import 'package:hive/hive.dart';

import 'package:random_anime_quotes/src/features/quotes/data/models/quote.dart';

abstract class IQuotesLocalDataSource {
  List<Quote> getLikedQuotes();
  void saveQuote(Quote quote);
  void deleteQuote(int id);
}

class QuotesLocalDataSourcer implements IQuotesLocalDataSource {
  QuotesLocalDataSourcer(this.box);

  final Box box;

  @override
  List<Quote> getLikedQuotes() {
    List<Quote> quotes = box.values
        .map((e) => Quote.fromJson(Map<String, dynamic>.from(e)))
        .toList();
    return quotes;
  }

  @override
  void deleteQuote(int id) {
    box.delete(id);
  }

  @override
  void saveQuote(Quote quote) {
    box.put(quote.id, quote.toJson());
  }
}
