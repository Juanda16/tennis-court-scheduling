///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final translate = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	String get name => 'Juan Arismendy';
	late final TranslationsHomePageEn home_page = TranslationsHomePageEn._(_root);
}

// Path: home_page
class TranslationsHomePageEn {
	TranslationsHomePageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get home => 'Home';
	String get about => 'About';
	String get about_me => 'About Me';
	String get experience => 'Experience';
	String get services => 'Services';
	String get resume => 'Resume';
	String get skills => 'Skills';
	String get projects => 'Projects';
	String get contact => 'Contact';
	String get blog => 'Blog';
	String get portfolio => 'Portfolio';
	String get hire_me => 'Hire Me';
	String get download_cv => 'Download Resume';
	String get hello => 'HELLO, I\'m';
	String get software_engineer => 'Software Engineer';
	String get contact_me => 'Contact Me';
	String get slogan => 'I like to make things happen';
	String get special_services => 'Special Services';
	String get development => 'Development';
	TextSpan my_special_services({required InlineSpan specialServices, required InlineSpan development}) => TextSpan(children: [
		const TextSpan(text: 'My '),
		specialServices,
		const TextSpan(text: ' For Your Business '),
		development,
	]);
	String get professional_skills => 'Professional Skills';
	String get my_skills => 'My Skills';
	String get my_talents => 'My Talents';
	String get latest_projects => 'Latest Projects';
	TextSpan explore_projects({required InlineSpan Projects}) => TextSpan(children: [
		const TextSpan(text: 'Explore My Popular '),
		Projects,
	]);
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'name': return 'Juan Arismendy';
			case 'home_page.home': return 'Home';
			case 'home_page.about': return 'About';
			case 'home_page.about_me': return 'About Me';
			case 'home_page.experience': return 'Experience';
			case 'home_page.services': return 'Services';
			case 'home_page.resume': return 'Resume';
			case 'home_page.skills': return 'Skills';
			case 'home_page.projects': return 'Projects';
			case 'home_page.contact': return 'Contact';
			case 'home_page.blog': return 'Blog';
			case 'home_page.portfolio': return 'Portfolio';
			case 'home_page.hire_me': return 'Hire Me';
			case 'home_page.download_cv': return 'Download Resume';
			case 'home_page.hello': return 'HELLO, I\'m';
			case 'home_page.software_engineer': return 'Software Engineer';
			case 'home_page.contact_me': return 'Contact Me';
			case 'home_page.slogan': return 'I like to make things happen';
			case 'home_page.special_services': return 'Special Services';
			case 'home_page.development': return 'Development';
			case 'home_page.my_special_services': return ({required InlineSpan specialServices, required InlineSpan development}) => TextSpan(children: [
				const TextSpan(text: 'My '),
				specialServices,
				const TextSpan(text: ' For Your Business '),
				development,
			]);
			case 'home_page.professional_skills': return 'Professional Skills';
			case 'home_page.my_skills': return 'My Skills';
			case 'home_page.my_talents': return 'My Talents';
			case 'home_page.latest_projects': return 'Latest Projects';
			case 'home_page.explore_projects': return ({required InlineSpan Projects}) => TextSpan(children: [
				const TextSpan(text: 'Explore My Popular '),
				Projects,
			]);
			default: return null;
		}
	}
}

