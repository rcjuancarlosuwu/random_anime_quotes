import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:random_anime_quotes/src/core/constants/constants.dart';
import 'package:random_anime_quotes/src/core/providers/providers.dart';
import 'package:random_anime_quotes/src/core/extensions/text_theme_styles_x.dart';

class TranslationOptions extends ConsumerWidget {
  const TranslationOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButton<String>(
      iconSize: 20,
      menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      icon: const Icon(Icons.language_rounded),
      value: ref.watch(translateCodeProvider),
      items: kSupportedLanguages.entries
          .map(
            (e) => DropdownMenuItem(
              child: Text(e.value, style: context.subtitle2),
              value: e.key,
            ),
          )
          .toList(),
      onChanged: (v) => ref
          .read(translateCodeProvider.notifier)
          .saveTranslateCode(v ?? kDefaultTranslationCode),
    );
  }
}
