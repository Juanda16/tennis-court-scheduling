import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Images {
  static String get logoPath => 'assets/images/logo.png';
  static String get logoWhite => 'assets/images/logo_white.svg';
  static String get isotypePath => 'assets/images/isotype.svg';
  static String get myPicture => 'assets/images/my_picture.png';
  static String get emptyAlertsHistory =>
      'assets/images/empty_alert history.png';
  static String get noNetwork => 'assets/images/no_network.png';
  static String get customAlertComingSoon =>
      'assets/images/settings_img_alert.svg';

  static String get defaultToken => 'assets/images/default.png';
  static String get platform => 'assets/icons/platform.png';
  static String get defaultAvatar => 'assets/images/default_avatar.png';
  static String get onboardingImage => 'assets/images/onboarding.png';
  static String get headerImage => 'assets/images/header.png';
  static String get defaultUser => 'assets/images/user.png';

  static Widget _defaultLogoImage(double size) => Image(
        image: AssetImage(defaultToken),
        width: size,
        height: size,
      );

  static Widget _networkImage(String url, double size) {
    final bool isDemoLogo = url.startsWith('https://demo_token');
    final String demoLogo = url.split('/').last;
    final bool isSvgImage = url.endsWith('.svg');

    if (isDemoLogo) {
      return Image(
        image: AssetImage('assets/token_logos/$demoLogo'),
        errorBuilder: (___, __, _) => Image(
          image: AssetImage(defaultToken),
          width: size,
          height: size,
        ),
        width: size,
        height: size,
      );
    }

    if (isSvgImage) {
      return SvgPicture.network(
        url,
        placeholderBuilder: (_) => Image(
          image: AssetImage(defaultToken),
          width: size,
          height: size,
          errorBuilder: (___, __, _) => Image(
            image: AssetImage(defaultToken),
            width: size,
            height: size,
          ),
        ),
        height: size,
        width: size,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: url,
        placeholder: (__, _) => Image(
          image: AssetImage(defaultToken),
          width: size,
          height: size,
        ),
        errorWidget: (___, __, _) => Image(
          image: AssetImage(defaultToken),
          width: size,
          height: size,
        ),
        fadeOutDuration: const Duration(milliseconds: 500),
        width: size,
        height: size,
      );
    }
  }

  static Widget networkImage(String url, double size) {
    final bool isSvgImage = url.endsWith('.svg');

    if (isSvgImage) {
      return SvgPicture.network(
        url,
        placeholderBuilder: (_) => Image(
          image: AssetImage(defaultToken),
          width: size,
          height: size,
          errorBuilder: (___, __, _) => Image(
            image: AssetImage(defaultToken),
            width: size,
            height: size,
          ),
        ),
        height: size,
        width: size,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: url,
        placeholder: (__, _) => Image(
          image: AssetImage(defaultToken),
          width: size,
          height: size,
        ),
        errorWidget: (___, __, _) => Image(
          image: AssetImage(defaultToken),
          width: size,
          height: size,
        ),
        fadeOutDuration: const Duration(milliseconds: 500),
        width: size,
        height: size,
      );
    }
  }

  /// Draw token logo from url if not null and is not empty or default token logo if it is.
  static Widget getTokenLogo({required String? logoUrl, double size = 32}) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: (logoUrl == null || logoUrl.isEmpty)
            ? Images._defaultLogoImage(size)
            : Images._networkImage(
                logoUrl,
                size,
              ),
      );

  static Widget build(String url, {double? width, double? height}) =>
      SvgPicture.asset(url, width: width, height: height);

  static Widget logo({double? height = 20}) => build(logoPath, height: height);

  static Widget logoW({double? height = 110}) =>
      build(logoWhite, height: height);

  static Widget isotype({double width = 32}) =>
      build(isotypePath, width: width);
}
