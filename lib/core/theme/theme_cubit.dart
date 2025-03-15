// theme_cubit.dart
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constants/constants.dart';
import 'package:marketi/core/helper/shared_pref_helper.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false) {
    _loadTheme();
  }

  /// Load the saved theme from SharedPreferences
  Future<void> _loadTheme() async {
    final isDark =
       await SharedPrefHelper.getBool(SharedPrefKeys.isDarkTheme) ?? false;
    debugPrint('ThemeCubit: _loadTheme: $isDark');
    emit(isDark);
  }

  /// Toggle the theme and save the preference
  Future<void> toggleTheme() async {
    final newTheme = !state;
    emit(newTheme);
    await SharedPrefHelper.setData(SharedPrefKeys.isDarkTheme, newTheme);
  }
}
