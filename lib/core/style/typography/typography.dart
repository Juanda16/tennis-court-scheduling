part of '../style.dart';

extension TypographyContext on BuildContext {
  /// Returns same as Theme.of(context).textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;
}

/// Inter family
TextStyle interRegular = const TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
  letterSpacing: 0,
);

class TextDef {
  final double? size;
  final FontWeight? weight;
  final double? height;
  final double? spacing;

  const TextDef({
    this.size = 16,
    this.weight = FontWeight.w500,
    this.height = 1.2,
    this.spacing,
  });

  TextStyle get interStyle => TextStyle(
        fontFamily: 'Inter',
        fontSize: size,
        fontWeight: weight,
        height: height,
        letterSpacing: spacing,
      );

  TextStyle get poppinsStyle => TextStyle(
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: weight,
        height: height,
        letterSpacing: spacing,
      );
}

enum TextVariant {
  displaySmall(
    TextDef(
      size: 24,
      height: 1.15,
      spacing: -0.1,
    ),
  ),
  displayMedium(
    TextDef(
      size: 32,
      height: 1.15,
      spacing: -0.1,
    ),
  ),
  displayLarge(
    TextDef(
      size: 44,
      spacing: -0.2,
    ),
  ),
  displayXLarge(
    TextDef(
      size: 56,
      weight: FontWeight.w600,
      height: 1.2,
      spacing: -0.3,
    ),
  ),
  subtitleSmall(
    TextDef(
      size: 14,
      weight: FontWeight.w500,
      height: 1.5,
    ),
  ),
  subtitleMedium(
    TextDef(
      size: 16,
      weight: FontWeight.w500,
      height: 1.6,
    ),
  ),
  subtitleLarge(
    TextDef(
      size: 18,
      weight: FontWeight.w500,
      height: 1.6,
    ),
  ),
  subtitleXLarge(
    TextDef(
      size: 20,
      weight: FontWeight.w500,
      height: 1.6,
    ),
  ),
  buttonSmall(
    TextDef(
      size: 14,
      weight: FontWeight.w500,
      height: 1.2,
      spacing: 0.1,
    ),
  ),
  buttonMedium(
    TextDef(
      size: 16,
      weight: FontWeight.w500,
      height: 1.2,
      spacing: 0.1,
    ),
  ),
  buttonLarge(
    TextDef(
      size: 18,
      weight: FontWeight.w500,
      height: 1.2,
      spacing: 0.1,
    ),
  ),
  buttonXLarge(
    TextDef(
      size: 22,
      weight: FontWeight.w500,
      height: 1.2,
      spacing: 0.1,
    ),
  ),
  bodyXsmall(
    TextDef(
      size: 12,
      weight: FontWeight.w400,
      height: 1.5,
    ),
  ),
  bodySmall(
    TextDef(
      size: 14,
      weight: FontWeight.w400,
      height: 1.5,
    ),
  ),
  bodyMedium(
    TextDef(
      size: 16,
      weight: FontWeight.w400,
      height: 1.5,
    ),
  ),
  bodyLarge(
    TextDef(
      size: 18,
      weight: FontWeight.w400,
      height: 1.6,
    ),
  ),
  labelSmall(
    TextDef(
      size: 14,
      weight: FontWeight.w500,
      height: 1,
    ),
  ),
  labelMedium(
    TextDef(
      size: 16,
      weight: FontWeight.w500,
      height: 1,
    ),
  ),
  eyebrowSmall(
    TextDef(
      size: 12,
      weight: FontWeight.w500,
      height: 1.4,
      spacing: 0.1,
    ),
  ),
  eyebrowMedium(
    TextDef(
      size: 14,
      weight: FontWeight.w500,
      height: 1.5,
      spacing: 0.1,
    ),
  ),
  eyebrowLarge(
    TextDef(
      size: 16,
      weight: FontWeight.w500,
      height: 1.6,
      spacing: 0.1,
    ),
  ),
  captionSmall(
    TextDef(
      size: 10,
      weight: FontWeight.w400,
      height: 1.2,
    ),
  ),
  captionMedium(
    TextDef(
      size: 12,
      weight: FontWeight.w400,
      height: 1.2,
    ),
  );

  const TextVariant(this.styleDef);

  final TextDef styleDef;

  TextStyle get style => styleDef.interStyle;
}

class TextStyles {
  TextStyles._();

  // DISPLAY
  static TextStyle displaySmall = TextVariant.displaySmall.style;
  static TextStyle displayMedium = TextVariant.displayMedium.style;
  static TextStyle displayLarge = TextVariant.displayLarge.style;
  static TextStyle displayXLarge = TextVariant.displayXLarge.style;

  // SUBTITLE
  static TextStyle subtitleSmall = TextVariant.subtitleSmall.style;
  static TextStyle subtitleMedium = TextVariant.subtitleMedium.style;
  static TextStyle subtitleLarge = TextVariant.subtitleLarge.style;
  static TextStyle subtitleXLarge = TextVariant.subtitleXLarge.style;

  // BUTTONS
  static TextStyle buttonSmall = TextVariant.buttonSmall.style;
  static TextStyle buttonMedium = TextVariant.buttonMedium.style;
  static TextStyle buttonLarge = TextVariant.buttonLarge.style;
  static TextStyle buttonXLarge = TextVariant.buttonXLarge.style;

  // BODY
  static TextStyle bodyXsmall = TextVariant.bodyXsmall.style;
  static TextStyle bodySmall = TextVariant.bodySmall.style;
  static TextStyle bodyMedium = TextVariant.bodyMedium.style;
  static TextStyle bodyLarge = TextVariant.bodyLarge.style;

  // LABEL
  static TextStyle labelSmall = TextVariant.labelSmall.style;
  static TextStyle labelMedium = TextVariant.labelMedium.style;

  // EYEBROW
  static TextStyle eyebrowSmall = TextVariant.eyebrowSmall.style;
  static TextStyle eyebrowMedium = TextVariant.eyebrowMedium.style;
  static TextStyle eyebrowLarge = TextVariant.eyebrowLarge.style;

  // CAPTION
  static TextStyle captionSmall = TextVariant.captionSmall.style;
  static TextStyle captionMedium = TextVariant.captionMedium.style;
}
