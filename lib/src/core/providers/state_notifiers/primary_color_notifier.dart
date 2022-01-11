part of '../providers.dart';

class PrimaryColorNotifier extends StateNotifier<Color> {
  PrimaryColorNotifier({
    required this.localDataSource,
  }) : super(localDataSource.getPrimaryColor());

  final ISettingsLocalDataSource localDataSource;

  setPrimaryColor(Color color) {
    state = color;
    localDataSource.savePrimaryColor(color);
  }
}
