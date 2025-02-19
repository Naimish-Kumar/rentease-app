// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';

import 'package:rentease/app/app_theme.dart';
import 'package:rentease/utils/hive_utils.dart';

class AppThemeCubit extends Cubit<ThemeState> {
  AppThemeCubit() : super(ThemeState(AppTheme.light));
// HiveUtils.getCurrentTheme()
  void changeTheme(AppTheme appTheme) {
    HiveUtils.setCurrentTheme(appTheme);
    emit(ThemeState(appTheme));
  }

  //dev!
  void toggleTheme() {
    if (state.appTheme == AppTheme.dark) {
      HiveUtils.setCurrentTheme(AppTheme.light);

      emit(ThemeState(AppTheme.light));
    } else {
      HiveUtils.setCurrentTheme(AppTheme.dark);

      emit(ThemeState(AppTheme.dark));
    }
  }

  bool isDarkMode() {
    return state.appTheme == AppTheme.dark;
  }
}

class ThemeState {
  ThemeState(this.appTheme);
  final AppTheme appTheme;
}
