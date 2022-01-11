import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:random_anime_quotes/src/features/settings/data/datasource/settings_local_datasource.dart';
import 'package:random_anime_quotes/src/core/env/env_config.dart';
import 'translator.dart';

part 'state_notifiers/primary_color_notifier.dart';
part 'state_notifiers/theme_mode_notifier.dart';
part 'state_notifiers/translate_code_notifier.dart';

final settingsBoxProvider = Provider<Box>((ref) => throw UnimplementedError());

final quotesBoxProvider = Provider<Box>((ref) => throw UnimplementedError());

final clientProvider = Provider<Dio>(
  (_) => Dio(BaseOptions(
    baseUrl: EnvConfig.apiUrl,
    headers: {'Auth': EnvConfig.apiToken},
  )),
);

final translatorProvider = Provider(
  (ref) => Translator(
    settingsLocalDataSource: ref.read(settingsLocalDataSourceProvider),
  ),
);

final settingsLocalDataSourceProvider = Provider<ISettingsLocalDataSource>(
  (ref) => SettingsLocalDataSource(ref.read(settingsBoxProvider)),
);

final translateCodeProvider =
    StateNotifierProvider<TranslateCodeNotifier, String>(
  (ref) => TranslateCodeNotifier(
    localDataSource: ref.read(settingsLocalDataSourceProvider),
  ),
);

final primaryColorProvider = StateNotifierProvider<PrimaryColorNotifier, Color>(
  (ref) => PrimaryColorNotifier(
    localDataSource: ref.read(settingsLocalDataSourceProvider),
  ),
);

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(
    localDataSource: ref.read(settingsLocalDataSourceProvider),
  ),
);
