///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsEs implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override String get name => 'Juan Arismendy';
	@override late final _TranslationsHomePageEs home_page = _TranslationsHomePageEs._(_root);
}

// Path: home_page
class _TranslationsHomePageEs implements TranslationsHomePageEn {
	_TranslationsHomePageEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Inicio';
	@override String get about => 'Sobre de';
	@override String get about_me => 'Sobre mí';
	@override String get experience => 'experiencia';
	@override String get services => 'Servicios';
	@override String get resume => 'CV';
	@override String get skills => 'Habilidades';
	@override String get projects => 'Proyectos';
	@override String get contact => 'Contacto';
	@override String get blog => 'Blog';
	@override String get portfolio => 'Portafolio';
	@override String get hire_me => 'Contrátame';
	@override String get download_cv => 'Descargar CV';
	@override String get hello => 'HOLA, Soy';
	@override String get software_engineer => 'Ingeniero de Software';
	@override String get contact_me => 'Contáctame';
	@override String get slogan => 'Me gusta hacer que las cosas sucedan';
	@override String get special_services => 'Servicios Especiales';
	@override String get development => 'Desarrollo';
	@override TextSpan my_special_services({required InlineSpan specialServices, required InlineSpan development}) => TextSpan(children: [
		const TextSpan(text: 'Mis '),
		specialServices,
		const TextSpan(text: ' para el '),
		development,
		const TextSpan(text: ' de tu negocio'),
	]);
	@override String get professional_skills => 'Habilidades Profesionales';
	@override String get my_skills => 'Mis Habilidades';
	@override String get my_talents => 'Mis Talentos';
	@override String get latest_projects => 'Últimos Proyectos';
	@override TextSpan explore_projects({required InlineSpan Projects}) => TextSpan(children: [
		const TextSpan(text: 'Explora Mis '),
		Projects,
		const TextSpan(text: ' Más Recientes'),
	]);
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'name': return 'Juan Arismendy';
			case 'home_page.home': return 'Inicio';
			case 'home_page.about': return 'Sobre de';
			case 'home_page.about_me': return 'Sobre mí';
			case 'home_page.experience': return 'experiencia';
			case 'home_page.services': return 'Servicios';
			case 'home_page.resume': return 'CV';
			case 'home_page.skills': return 'Habilidades';
			case 'home_page.projects': return 'Proyectos';
			case 'home_page.contact': return 'Contacto';
			case 'home_page.blog': return 'Blog';
			case 'home_page.portfolio': return 'Portafolio';
			case 'home_page.hire_me': return 'Contrátame';
			case 'home_page.download_cv': return 'Descargar CV';
			case 'home_page.hello': return 'HOLA, Soy';
			case 'home_page.software_engineer': return 'Ingeniero de Software';
			case 'home_page.contact_me': return 'Contáctame';
			case 'home_page.slogan': return 'Me gusta hacer que las cosas sucedan';
			case 'home_page.special_services': return 'Servicios Especiales';
			case 'home_page.development': return 'Desarrollo';
			case 'home_page.my_special_services': return ({required InlineSpan specialServices, required InlineSpan development}) => TextSpan(children: [
				const TextSpan(text: 'Mis '),
				specialServices,
				const TextSpan(text: ' para el '),
				development,
				const TextSpan(text: ' de tu negocio'),
			]);
			case 'home_page.professional_skills': return 'Habilidades Profesionales';
			case 'home_page.my_skills': return 'Mis Habilidades';
			case 'home_page.my_talents': return 'Mis Talentos';
			case 'home_page.latest_projects': return 'Últimos Proyectos';
			case 'home_page.explore_projects': return ({required InlineSpan Projects}) => TextSpan(children: [
				const TextSpan(text: 'Explora Mis '),
				Projects,
				const TextSpan(text: ' Más Recientes'),
			]);
			default: return null;
		}
	}
}

