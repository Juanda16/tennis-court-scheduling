import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum SocialIcon {
  facebook,
  twitter,
  instagram,
  linkedin,
  youtube,
  tiktok,
  snapchat,
  pinterest,
  reddit,
  whatsapp,
  github,
  telegram,
  discord,
  mail,
}

class SocialMediaIcons {
  static const Map<SocialIcon, String> icons = <SocialIcon, String>{
    SocialIcon.facebook: 'assets/icons/social_media/facebook.svg',
    SocialIcon.twitter: 'assets/icons/social_media/twitter.svg',
    SocialIcon.instagram: 'assets/icons/social_media/instagram.svg',
    SocialIcon.linkedin: 'assets/icons/social_media/linkedin.svg',
    SocialIcon.youtube: 'assets/icons/social_media/youtube.svg',
    SocialIcon.tiktok: 'assets/icons/social_media/tiktok.svg',
    SocialIcon.snapchat: 'assets/icons/social_media/snapchat.svg',
    SocialIcon.pinterest: 'assets/icons/social_media/pinterest.svg',
    SocialIcon.reddit: 'assets/icons/social_media/reddit.svg',
    SocialIcon.whatsapp: 'assets/icons/social_media/whatsapp.svg',
    SocialIcon.github: 'assets/icons/social_media/github.svg',
    SocialIcon.telegram: 'assets/icons/social_media/telegram.svg',
    SocialIcon.discord: 'assets/icons/social_media/discord.svg',
    SocialIcon.mail: 'assets/icons/social_media/mail.svg',
  };

  static SvgPicture build(
    SocialIcon iconName, {
    double width = 24,
    double height = 24,
    Color? color,
  }) =>
      SvgPicture.asset(
        icons[iconName]!,
        colorFilter: ColorFilter.mode(
          color ?? Colors.white,
          BlendMode.srcIn,
        ),
        width: width,
        height: width,
        matchTextDirection: true,
      );
}
