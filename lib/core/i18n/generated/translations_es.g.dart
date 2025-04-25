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
	@override late final _TranslationsOnboardingEs onboarding = _TranslationsOnboardingEs._(_root);
	@override late final _TranslationsLoginEs login = _TranslationsLoginEs._(_root);
	@override late final _TranslationsRegisterEs register = _TranslationsRegisterEs._(_root);
	@override late final _TranslationsHomePageEs home_page = _TranslationsHomePageEs._(_root);
	@override late final _TranslationsBookPageEs book_page = _TranslationsBookPageEs._(_root);
}

// Path: onboarding
class _TranslationsOnboardingEs implements TranslationsOnboardingEn {
	_TranslationsOnboardingEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get login => 'Iniciar sesión';
	@override String get register => 'Registrarse';
}

// Path: login
class _TranslationsLoginEs implements TranslationsLoginEn {
	_TranslationsLoginEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get login => 'Iniciar sesión';
	@override String get email => 'Correo electrónico';
	@override String get password => 'Contraseña';
	@override String get remember_me => 'Recuérdame';
	@override String get remember_password => 'Recuerda contraseña';
	@override String get forgot_password => '¿Olvidaste tu contraseña?';
	@override String get login_button => 'Iniciar sesión';
	@override String get no_account => '¿Aun tienes una cuenta?';
	@override String get register_here => 'Regístrate';
	@override String get hint_email => 'tuEmail@mail.com';
	@override String get hint_password => 'tuContraseña';
}

// Path: register
class _TranslationsRegisterEs implements TranslationsRegisterEn {
	_TranslationsRegisterEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get register => 'Registrarse';
	@override String get full_name => 'Nombre y apellido';
	@override String get email => 'Correo electrónico';
	@override String get phone => 'Teléfono';
	@override String get password => 'Contraseña';
	@override String get confirm_password => 'Confirmar contraseña';
	@override String get register_button => 'Registrarse';
	@override String get already_have_account => '¿Ya tienes una cuenta?';
	@override String get login_here => 'Inicia sesión aquí';
	@override String get hint_email => 'email@mail.com';
	@override String get hint_password => 'contraseña';
	@override String get password_no_match => 'Las contraseñas no coinciden';
}

// Path: home_page
class _TranslationsHomePageEs implements TranslationsHomePageEn {
	_TranslationsHomePageEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Inicio';
	@override String get welcome => 'Bienvenido';
	@override String get search => 'Buscar';
	@override String get hello => 'Hola';
	@override String get courts => 'Canchas';
	@override String get court_types => 'Tipo de cancha';
	@override String get available => 'Disponible';
	@override String get book_now => 'Reservar ahora';
	@override String get booked => 'Reservado';
}

// Path: book_page
class _TranslationsBookPageEs implements TranslationsBookPageEn {
	_TranslationsBookPageEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get my_bookings => 'Mis reservas';
	@override String get court => 'Cancha';
	@override String get date => 'Fecha';
	@override String get booked_by => 'Reservado por';
	@override String get court_type => 'Tipo de cancha';
	@override String get available => 'Disponible';
	@override String get per_hour => 'Por hora';
	@override String get add_instructor => 'Agregar instructor';
	@override String get set_time_date => 'Establecer hora y fecha';
	@override String get start_time => 'Hora de inicio';
	@override String get end_time => 'Hora de finalización';
	@override String get add_comment => 'Agregar comentario';
	@override String get book_now => 'Reservar ahora';
	@override String get instructor => 'Instructor';
	@override String get rebook => 'Reprogramar';
	@override String get cancel => 'Cancelar';
	@override String get payment => 'Pago';
	@override String get summary => 'Resumen';
	@override String get total_amount => 'Total a pagar';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'onboarding.login': return 'Iniciar sesión';
			case 'onboarding.register': return 'Registrarse';
			case 'login.login': return 'Iniciar sesión';
			case 'login.email': return 'Correo electrónico';
			case 'login.password': return 'Contraseña';
			case 'login.remember_me': return 'Recuérdame';
			case 'login.remember_password': return 'Recuerda contraseña';
			case 'login.forgot_password': return '¿Olvidaste tu contraseña?';
			case 'login.login_button': return 'Iniciar sesión';
			case 'login.no_account': return '¿Aun tienes una cuenta?';
			case 'login.register_here': return 'Regístrate';
			case 'login.hint_email': return 'tuEmail@mail.com';
			case 'login.hint_password': return 'tuContraseña';
			case 'register.register': return 'Registrarse';
			case 'register.full_name': return 'Nombre y apellido';
			case 'register.email': return 'Correo electrónico';
			case 'register.phone': return 'Teléfono';
			case 'register.password': return 'Contraseña';
			case 'register.confirm_password': return 'Confirmar contraseña';
			case 'register.register_button': return 'Registrarse';
			case 'register.already_have_account': return '¿Ya tienes una cuenta?';
			case 'register.login_here': return 'Inicia sesión aquí';
			case 'register.hint_email': return 'email@mail.com';
			case 'register.hint_password': return 'contraseña';
			case 'register.password_no_match': return 'Las contraseñas no coinciden';
			case 'home_page.home': return 'Inicio';
			case 'home_page.welcome': return 'Bienvenido';
			case 'home_page.search': return 'Buscar';
			case 'home_page.hello': return 'Hola';
			case 'home_page.courts': return 'Canchas';
			case 'home_page.court_types': return 'Tipo de cancha';
			case 'home_page.available': return 'Disponible';
			case 'home_page.book_now': return 'Reservar ahora';
			case 'home_page.booked': return 'Reservado';
			case 'book_page.my_bookings': return 'Mis reservas';
			case 'book_page.court': return 'Cancha';
			case 'book_page.date': return 'Fecha';
			case 'book_page.booked_by': return 'Reservado por';
			case 'book_page.court_type': return 'Tipo de cancha';
			case 'book_page.available': return 'Disponible';
			case 'book_page.per_hour': return 'Por hora';
			case 'book_page.add_instructor': return 'Agregar instructor';
			case 'book_page.set_time_date': return 'Establecer hora y fecha';
			case 'book_page.start_time': return 'Hora de inicio';
			case 'book_page.end_time': return 'Hora de finalización';
			case 'book_page.add_comment': return 'Agregar comentario';
			case 'book_page.book_now': return 'Reservar ahora';
			case 'book_page.instructor': return 'Instructor';
			case 'book_page.rebook': return 'Reprogramar';
			case 'book_page.cancel': return 'Cancelar';
			case 'book_page.payment': return 'Pago';
			case 'book_page.summary': return 'Resumen';
			case 'book_page.total_amount': return 'Total a pagar';
			default: return null;
		}
	}
}

