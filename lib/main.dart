import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/core/constants/constants.dart';
import 'src/core/providers/providers.dart';
import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final quotesBox = await Hive.openBox(kQuotesBoxName);
  final settingsBox = await Hive.openBox(kSettingsBoxName);
  runApp(
    ProviderScope(
      overrides: [
        quotesBoxProvider.overrideWithValue(quotesBox),
        settingsBoxProvider.overrideWithValue(settingsBox)
      ],
      child: const App(),
    ),
  );
}
