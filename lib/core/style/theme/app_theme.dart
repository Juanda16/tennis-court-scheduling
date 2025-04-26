part of '../style.dart';

class AppTheme {
  static ThemeData get baseTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.lightScaffoldBackgroundColor,
        iconTheme: const IconThemeData(
          color: AppColors.black,
        ),
        appBarTheme: appBarTheme,
        textTheme: textTheme,
        checkboxTheme: checkboxTheme,
        radioTheme: radioThemeData,
        primaryColor: AppColors.primary,
        colorScheme: colorScheme,
        switchTheme: switchThemeData,
        dialogTheme: dialogTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        brightness: Brightness.light,
        indicatorColor: AppColors.primary,
      );

  static ThemeData get lightTheme => baseTheme;

  static ThemeData darkTheme = baseTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: appBarTheme.copyWith(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.background,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
  );

  ///
  static AppBarTheme appBarTheme = AppBarTheme(
    color: AppColors.white,
    surfaceTintColor: Colors.transparent,
    scrolledUnderElevation: 0,
    elevation: 3,
    foregroundColor: AppColors.black,
    iconTheme: const IconThemeData(
      color: AppColors.black,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    titleTextStyle: AppTextStyles.appbarTitle,
  );

  /// Default text
  static TextTheme textTheme = TextTheme(bodyMedium: AppTextStyles.body);

  //dialogs
  static DialogTheme dialogTheme = DialogTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    backgroundColor: AppColors.white,
  );

  //elevated button
  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.gray.withAlpha(128);
          }
          return AppColors.primary;
        },
      ),
      shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
        (Set<WidgetState> states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          );
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          return AppColors.white;
        },
      ),
    ),
  );

  static CheckboxThemeData checkboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.all(AppColors.white),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primary;
      }
      return AppColors.gray.withAlpha(128);
    }),
    side: WidgetStateBorderSide.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const BorderSide(color: AppColors.primary, width: 1);
      }
      return const BorderSide(color: AppColors.gray, width: 1);
    }),
  );

  /// General Radio
  static RadioThemeData radioThemeData = RadioThemeData(
    fillColor: WidgetStateColor.resolveWith(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return AppColors.gray;
      },
    ),
  );

  ///switch theme
  static SwitchThemeData switchThemeData = SwitchThemeData(
    trackOutlineColor:
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      return AppColors.gray.withAlpha(25);
    }),
    trackOutlineWidth: WidgetStateProperty.resolveWith<double>(
      (Set<WidgetState> states) {
        return 0.5;
      },
    ),
    thumbColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        return AppColors.white;
      },
    ),
    thumbIcon: WidgetStateProperty.resolveWith<Icon>(
      (Set<WidgetState> states) {
        return const Icon(Icons.circle, size: 20, color: AppColors.white);
      },
    ),
    trackColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return AppColors.gray.withAlpha(128);
      },
    ),
  );
  static ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: AppColors.primary,
    secondary: AppColors.white,
  );
}
