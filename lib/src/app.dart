import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/constants/constants.dart';
import 'core/providers/providers.dart';
import 'core/theme/kawaii_theme.dart';
import 'features/quotes/view/quote_page.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final primaryColor = ref.watch(primaryColorProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const QuotesPage(),
      title: kAppName,
      themeMode: themeMode,
      theme: KawaiiTheme.shiro(primaryColor),
      darkTheme: KawaiiTheme.kuro(primaryColor),
    );
  }
}
