import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:random_anime_quotes/src/core/providers/providers.dart';
import 'package:random_anime_quotes/src/core/theme/kawaii_theme.dart';

class ThemeOptions extends ConsumerWidget {
  const ThemeOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final primaryColor = ref.watch(primaryColorProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: KawaiiTheme.options.map((option) {
          final _isSelected = themeMode == option.themeMode;
          return InkWell(
            onTap: () => ref
                .read(themeModeProvider.notifier)
                .setThemeMode(option.themeMode),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: AnimatedScale(
              scale: _isSelected ? 1.1 : 1,
              duration: const Duration(milliseconds: 150),
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      _isSelected ? option.activeImage : option.inactiveImage,
                    ),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  border: Border.all(
                    color: _isSelected ? primaryColor : Colors.transparent,
                    width: 3,
                  ),
                ),
                child: _ThemeOptionName(name: option.name),
              ),
            ),
          );
        }).toList(growable: false),
      ),
    );
  }
}

class _ThemeOptionName extends StatelessWidget {
  const _ThemeOptionName({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        margin: const EdgeInsets.only(top: 2),
        decoration: const BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
