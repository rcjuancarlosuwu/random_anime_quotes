import 'package:fluttertoast/fluttertoast.dart';
import 'package:translator/translator.dart';

import 'package:random_anime_quotes/src/features/settings/data/datasource/settings_local_datasource.dart';
import 'package:random_anime_quotes/src/features/quotes/data/models/quote.dart';

class Translator {
  Translator({
    required this.settingsLocalDataSource,
  });

  final GoogleTranslator googleTranslator = GoogleTranslator();
  final ISettingsLocalDataSource settingsLocalDataSource;

  /// Translate a [Quote] to the specified language.
  Future<String> translateQuote(String quote) async {
    try {
      final translation = await googleTranslator.translate(
        quote,
        to: settingsLocalDataSource.getTranslateCode(),
      );
      return translation.text;
    } catch (e) {
      await Fluttertoast.showToast(msg: 'Couldn\'t translate');
      rethrow;
    }
  }
}
