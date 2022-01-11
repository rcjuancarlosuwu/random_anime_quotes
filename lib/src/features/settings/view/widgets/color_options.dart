import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:random_anime_quotes/src/core/providers/providers.dart';
import 'package:random_anime_quotes/src/core/theme/kawaii_theme.dart';

class ColorOptions extends ConsumerWidget {
  const ColorOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = ref.watch(primaryColorProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: KawaiiTheme.colors.map((color) {
          return InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            onTap: () =>
                ref.read(primaryColorProvider.notifier).setPrimaryColor(color),
            child: Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: color,
              ),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: primaryColor == color ? 1 : 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                    ),
                    child: const Icon(
                      CupertinoIcons.checkmark_alt,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(growable: false),
      ),
    );
  }
}
