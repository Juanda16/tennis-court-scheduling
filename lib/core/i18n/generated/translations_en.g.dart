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
	late final TranslationsOnboardingEn onboarding = TranslationsOnboardingEn._(_root);
	late final TranslationsLoginEn login = TranslationsLoginEn._(_root);
	late final TranslationsRegisterEn register = TranslationsRegisterEn._(_root);
	late final TranslationsHomePageEn home_page = TranslationsHomePageEn._(_root);
	late final TranslationsBookPageEn book_page = TranslationsBookPageEn._(_root);
	late final TranslationsFavoritePageEn favorite_page = TranslationsFavoritePageEn._(_root);
}

// Path: onboarding
class TranslationsOnboardingEn {
	TranslationsOnboardingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get login => 'Login';
	String get register => 'Register';
}

// Path: login
class TranslationsLoginEn {
	TranslationsLoginEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get login => 'Login';
	String get email => 'Email';
	String get password => 'Password';
	String get remember_me => 'Remember Me';
	String get remember_password => 'Remember Password';
	String get forgot_password => 'Forgot Password?';
	String get login_button => 'Login';
	String get no_account => 'Don\'t have an account?';
	String get register_here => 'Register here';
	String get hint_email => 'anyEmail@mail.com';
	String get hint_password => 'yourPassword';
}

// Path: register
class TranslationsRegisterEn {
	TranslationsRegisterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get register => 'Register';
	String get full_name => 'Full Name';
	String get email => 'Email';
	String get phone => 'Phone';
	String get password => 'Password';
	String get confirm_password => 'Confirm Password';
	String get register_button => 'Register';
	String get already_have_account => 'Already have an account?';
	String get login_here => 'Login here';
	String get hint_email => 'email@mail.com';
	String get hint_password => 'password';
	String get password_no_match => 'Passwords do not match';
}

// Path: home_page
class TranslationsHomePageEn {
	TranslationsHomePageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get home => 'Home';
	String get welcome => 'Welcome';
	String get search => 'Search';
	String get hello => 'Hello';
	String get courts => 'Courts';
	String get court_types => 'Court Type';
	String get available => 'Available';
	String get book_now => 'Book Now';
	String get booked => 'Booked';
}

// Path: book_page
class TranslationsBookPageEn {
	TranslationsBookPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get bookings => 'Bookings';
	String get my_bookings => 'My Bookings';
	String get court => 'Court';
	String get date => 'Date';
	String get booked_by => 'Booked By';
	String get court_type => 'Court Type';
	String get available => 'Available';
	String get per_hour => 'Per Hour';
	String get add_instructor => 'Add Instructor';
	String get set_time_date => 'Set Time & Date';
	String get start_time => 'Start Time';
	String get end_time => 'End Time';
	String get add_comment => 'Add Comment';
	String get book_now => 'Book Now';
	String get instructor => 'Instructor';
	String get rebook => 'Rebook';
	String get cancel => 'Cancel';
	String get payment => 'Payment';
	String get summary => 'Summary';
	String get total_amount => 'Total Amount';
	String get rain_chance => 'Rain Chance';
	String get already_booked => 'Already Booked with this date';
}

// Path: favorite_page
class TranslationsFavoritePageEn {
	TranslationsFavoritePageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get favorite => 'Favorite';
	String get my_favorites => 'My Favorites';
	String get no_favorites => 'You have no favorite courts';
	String get add_to_favorites => 'Add to Favorites';
	String get remove_from_favorites => 'Remove from Favorites';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'onboarding.login': return 'Login';
			case 'onboarding.register': return 'Register';
			case 'login.login': return 'Login';
			case 'login.email': return 'Email';
			case 'login.password': return 'Password';
			case 'login.remember_me': return 'Remember Me';
			case 'login.remember_password': return 'Remember Password';
			case 'login.forgot_password': return 'Forgot Password?';
			case 'login.login_button': return 'Login';
			case 'login.no_account': return 'Don\'t have an account?';
			case 'login.register_here': return 'Register here';
			case 'login.hint_email': return 'anyEmail@mail.com';
			case 'login.hint_password': return 'yourPassword';
			case 'register.register': return 'Register';
			case 'register.full_name': return 'Full Name';
			case 'register.email': return 'Email';
			case 'register.phone': return 'Phone';
			case 'register.password': return 'Password';
			case 'register.confirm_password': return 'Confirm Password';
			case 'register.register_button': return 'Register';
			case 'register.already_have_account': return 'Already have an account?';
			case 'register.login_here': return 'Login here';
			case 'register.hint_email': return 'email@mail.com';
			case 'register.hint_password': return 'password';
			case 'register.password_no_match': return 'Passwords do not match';
			case 'home_page.home': return 'Home';
			case 'home_page.welcome': return 'Welcome';
			case 'home_page.search': return 'Search';
			case 'home_page.hello': return 'Hello';
			case 'home_page.courts': return 'Courts';
			case 'home_page.court_types': return 'Court Type';
			case 'home_page.available': return 'Available';
			case 'home_page.book_now': return 'Book Now';
			case 'home_page.booked': return 'Booked';
			case 'book_page.bookings': return 'Bookings';
			case 'book_page.my_bookings': return 'My Bookings';
			case 'book_page.court': return 'Court';
			case 'book_page.date': return 'Date';
			case 'book_page.booked_by': return 'Booked By';
			case 'book_page.court_type': return 'Court Type';
			case 'book_page.available': return 'Available';
			case 'book_page.per_hour': return 'Per Hour';
			case 'book_page.add_instructor': return 'Add Instructor';
			case 'book_page.set_time_date': return 'Set Time & Date';
			case 'book_page.start_time': return 'Start Time';
			case 'book_page.end_time': return 'End Time';
			case 'book_page.add_comment': return 'Add Comment';
			case 'book_page.book_now': return 'Book Now';
			case 'book_page.instructor': return 'Instructor';
			case 'book_page.rebook': return 'Rebook';
			case 'book_page.cancel': return 'Cancel';
			case 'book_page.payment': return 'Payment';
			case 'book_page.summary': return 'Summary';
			case 'book_page.total_amount': return 'Total Amount';
			case 'book_page.rain_chance': return 'Rain Chance';
			case 'book_page.already_booked': return 'Already Booked with this date';
			case 'favorite_page.favorite': return 'Favorite';
			case 'favorite_page.my_favorites': return 'My Favorites';
			case 'favorite_page.no_favorites': return 'You have no favorite courts';
			case 'favorite_page.add_to_favorites': return 'Add to Favorites';
			case 'favorite_page.remove_from_favorites': return 'Remove from Favorites';
			default: return null;
		}
	}
}

