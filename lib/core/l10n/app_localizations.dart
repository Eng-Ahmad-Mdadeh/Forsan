import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ar'), Locale('en')];

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'forsan Platform'**
  String get app_name;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Return to Home'**
  String get home;

  /// No description provided for @horses_platform.
  ///
  /// In en, this message translates to:
  /// **'Horses Platform'**
  String get horses_platform;

  /// No description provided for @camels_platform.
  ///
  /// In en, this message translates to:
  /// **'Camels Platform'**
  String get camels_platform;

  /// No description provided for @mass_auctions.
  ///
  /// In en, this message translates to:
  /// **'Mass Auctions'**
  String get mass_auctions;

  /// No description provided for @mass_horse_auctions.
  ///
  /// In en, this message translates to:
  /// **'Mass Horse Auctions'**
  String get mass_horse_auctions;

  /// No description provided for @mass_camel_auctions.
  ///
  /// In en, this message translates to:
  /// **'Mass Camel Auctions'**
  String get mass_camel_auctions;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @download_catalog.
  ///
  /// In en, this message translates to:
  /// **'Download Catalog'**
  String get download_catalog;

  /// No description provided for @i_agree_to_the.
  ///
  /// In en, this message translates to:
  /// **'I agree to the'**
  String get i_agree_to_the;

  /// No description provided for @terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **'terms and conditions'**
  String get terms_and_conditions;

  /// No description provided for @direct_electronic.
  ///
  /// In en, this message translates to:
  /// **'Direct electronic'**
  String get direct_electronic;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @medical_services.
  ///
  /// In en, this message translates to:
  /// **'Medical Services'**
  String get medical_services;

  /// No description provided for @transport_services.
  ///
  /// In en, this message translates to:
  /// **'Transport Services'**
  String get transport_services;

  /// No description provided for @animal_products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get animal_products;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @contact_us.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contact_us;

  /// No description provided for @offers.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offers;

  /// No description provided for @auctions.
  ///
  /// In en, this message translates to:
  /// **'Auctions'**
  String get auctions;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @tap_back_again_to_leave.
  ///
  /// In en, this message translates to:
  /// **'Tap back again to leave'**
  String get tap_back_again_to_leave;

  /// No description provided for @choose_language.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get choose_language;

  /// No description provided for @language_arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get language_arabic;

  /// No description provided for @language_english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language_english;

  /// No description provided for @logout_success.
  ///
  /// In en, this message translates to:
  /// **' Logged out successfully'**
  String get logout_success;

  /// No description provided for @logout_failed.
  ///
  /// In en, this message translates to:
  /// **' Logout failed on server'**
  String get logout_failed;

  /// No description provided for @logout_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred during logout'**
  String get logout_error;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Server Error'**
  String get title;

  /// No description provided for @medical_services_title.
  ///
  /// In en, this message translates to:
  /// **'Medical Services'**
  String get medical_services_title;

  /// No description provided for @medical_services_desc.
  ///
  /// In en, this message translates to:
  /// **'Certified reports before sale.'**
  String get medical_services_desc;

  /// No description provided for @transport_services_title.
  ///
  /// In en, this message translates to:
  /// **'Transport Services'**
  String get transport_services_title;

  /// No description provided for @transport_services_desc.
  ///
  /// In en, this message translates to:
  /// **'Safe transport with live tracking.'**
  String get transport_services_desc;

  /// No description provided for @animal_products_title.
  ///
  /// In en, this message translates to:
  /// **'Horse & Camel Products'**
  String get animal_products_title;

  /// No description provided for @animal_products_desc.
  ///
  /// In en, this message translates to:
  /// **'Reliable and high-quality products.'**
  String get animal_products_desc;

  /// No description provided for @auction_card_time_left.
  ///
  /// In en, this message translates to:
  /// **'Ends in {time}'**
  String auction_card_time_left(Object time);

  /// No description provided for @auction_card_title.
  ///
  /// In en, this message translates to:
  /// **'Horse 101 — \"Al-Hail\"'**
  String get auction_card_title;

  /// No description provided for @auction_card_breed_age.
  ///
  /// In en, this message translates to:
  /// **'{breed}: Breed • {age}: Age'**
  String auction_card_breed_age(Object breed, Object age);

  /// No description provided for @auction_card_join_now.
  ///
  /// In en, this message translates to:
  /// **'Join Now'**
  String get auction_card_join_now;

  /// No description provided for @banner_default_title_html.
  ///
  /// In en, this message translates to:
  /// **'<h2 style=\"color: #9C27B0;\">Advanced horse & camel auctions platform</h2>'**
  String get banner_default_title_html;

  /// No description provided for @banner_default_body_html.
  ///
  /// In en, this message translates to:
  /// **'<p>Live auctions and fixed offers with veterinary checks and certified transport</p>'**
  String get banner_default_body_html;

  /// No description provided for @banner_default_button.
  ///
  /// In en, this message translates to:
  /// **'Click'**
  String get banner_default_button;

  /// No description provided for @mass_auction_badge.
  ///
  /// In en, this message translates to:
  /// **'Mass Auction'**
  String get mass_auction_badge;

  /// No description provided for @mass_auction_title.
  ///
  /// In en, this message translates to:
  /// **'Horse Auction — Managed by forsan'**
  String get mass_auction_title;

  /// No description provided for @countdown_label.
  ///
  /// In en, this message translates to:
  /// **'Countdown'**
  String get countdown_label;

  /// No description provided for @event_short_description.
  ///
  /// In en, this message translates to:
  /// **'Starts in two months, 3-day event, 15 minutes per horse'**
  String get event_short_description;

  /// No description provided for @download_booklet.
  ///
  /// In en, this message translates to:
  /// **'Download Booklet'**
  String get download_booklet;

  /// No description provided for @event_details.
  ///
  /// In en, this message translates to:
  /// **'Event Details'**
  String get event_details;

  /// No description provided for @platform_sponsored_by.
  ///
  /// In en, this message translates to:
  /// **'Sponsored by: {name}'**
  String platform_sponsored_by(Object name);

  /// No description provided for @live_auctions_title.
  ///
  /// In en, this message translates to:
  /// **'Live Auctions'**
  String get live_auctions_title;

  /// No description provided for @live_auctions_desc.
  ///
  /// In en, this message translates to:
  /// **'Real-time bidding via live streaming.'**
  String get live_auctions_desc;

  /// No description provided for @subtitle.
  ///
  /// In en, this message translates to:
  /// **'Here you can follow the latest updates and messages about your listings and auctions.'**
  String get subtitle;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @home_properties_title.
  ///
  /// In en, this message translates to:
  /// **'Properties'**
  String get home_properties_title;

  /// No description provided for @properties_my_properties_title.
  ///
  /// In en, this message translates to:
  /// **'My Properties'**
  String get properties_my_properties_title;

  /// No description provided for @properties_filter_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get properties_filter_completed;

  /// No description provided for @properties_filter_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get properties_filter_active;

  /// No description provided for @properties_total_count.
  ///
  /// In en, this message translates to:
  /// **'Properties Count'**
  String get properties_total_count;

  /// No description provided for @properties_filter_accepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get properties_filter_accepted;

  /// No description provided for @properties_filter_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get properties_filter_pending;

  /// No description provided for @properties_filter_draft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get properties_filter_draft;

  /// No description provided for @property_card_status_accepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get property_card_status_accepted;

  /// No description provided for @property_card_status_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get property_card_status_pending;

  /// No description provided for @property_card_status_rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get property_card_status_rejected;

  /// No description provided for @property_card_status_draft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get property_card_status_draft;

  /// No description provided for @properties_total_value.
  ///
  /// In en, this message translates to:
  /// **'Total Properties Value'**
  String get properties_total_value;

  /// No description provided for @properties_upcoming_returns.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Returns'**
  String get properties_upcoming_returns;

  /// No description provided for @properties_realized_returns.
  ///
  /// In en, this message translates to:
  /// **'Realized Returns'**
  String get properties_realized_returns;

  /// No description provided for @properties_empty_title.
  ///
  /// In en, this message translates to:
  /// **'You have not started your ownership journey yet'**
  String get properties_empty_title;

  /// No description provided for @properties_empty_message.
  ///
  /// In en, this message translates to:
  /// **'You do not have any properties yet. Browse available opportunities and start owning with ease.'**
  String get properties_empty_message;

  /// No description provided for @properties_skeleton_apartment.
  ///
  /// In en, this message translates to:
  /// **'Luxury Residential Apartment'**
  String get properties_skeleton_apartment;

  /// No description provided for @properties_skeleton_villa.
  ///
  /// In en, this message translates to:
  /// **'Elegant Residential Villa'**
  String get properties_skeleton_villa;

  /// No description provided for @properties_skeleton_floor.
  ///
  /// In en, this message translates to:
  /// **'Luxury Independent Floor'**
  String get properties_skeleton_floor;

  /// No description provided for @home_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get home_welcome;

  /// No description provided for @home_search_title.
  ///
  /// In en, this message translates to:
  /// **'Looking for a property?'**
  String get home_search_title;

  /// No description provided for @home_search_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Any location, any price, any property'**
  String get home_search_subtitle;

  /// No description provided for @home_welcome_user.
  ///
  /// In en, this message translates to:
  /// **'Welcome {name}'**
  String home_welcome_user(Object name);

  /// No description provided for @home_filter_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get home_filter_all;

  /// No description provided for @home_filter_usufruct.
  ///
  /// In en, this message translates to:
  /// **'Usufruct'**
  String get home_filter_usufruct;

  /// No description provided for @home_filter_covered.
  ///
  /// In en, this message translates to:
  /// **'Covered'**
  String get home_filter_covered;

  /// No description provided for @cityLabel.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get cityLabel;

  /// No description provided for @loadMore.
  ///
  /// In en, this message translates to:
  /// **'Load more'**
  String get loadMore;

  /// No description provided for @login_title.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login_title;

  /// No description provided for @login_description.
  ///
  /// In en, this message translates to:
  /// **'Please enter your mobile number and choose the appropriate method to receive the verification code.'**
  String get login_description;

  /// No description provided for @country_code_placeholder.
  ///
  /// In en, this message translates to:
  /// **'+966'**
  String get country_code_placeholder;

  /// No description provided for @via_sms.
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get via_sms;

  /// No description provided for @via_whatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get via_whatsapp;

  /// No description provided for @otp_title.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get otp_title;

  /// No description provided for @otp_sent_to.
  ///
  /// In en, this message translates to:
  /// **'We sent a verification code to'**
  String get otp_sent_to;

  /// No description provided for @otp_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get otp_next;

  /// No description provided for @otp_resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get otp_resend;

  /// No description provided for @complete_profile_title.
  ///
  /// In en, this message translates to:
  /// **'You must complete your personal information'**
  String get complete_profile_title;

  /// No description provided for @complete_profile_app_bar_title.
  ///
  /// In en, this message translates to:
  /// **'Complete profile'**
  String get complete_profile_app_bar_title;

  /// No description provided for @complete_profile_first_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter first name'**
  String get complete_profile_first_name_hint;

  /// No description provided for @complete_profile_last_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter last name'**
  String get complete_profile_last_name_hint;

  /// No description provided for @complete_profile_email_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get complete_profile_email_hint;

  /// No description provided for @complete_profile_email_verification_title.
  ///
  /// In en, this message translates to:
  /// **'Email verification'**
  String get complete_profile_email_verification_title;

  /// No description provided for @complete_profile_email_verification_message.
  ///
  /// In en, this message translates to:
  /// **'A verification code has been sent to {email}\nPlease check it and enter the code'**
  String complete_profile_email_verification_message(String email);

  /// No description provided for @complete_profile_resend_code_hint.
  ///
  /// In en, this message translates to:
  /// **'You can request a new code in'**
  String get complete_profile_resend_code_hint;

  /// No description provided for @complete_profile_resend_code.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get complete_profile_resend_code;

  /// No description provided for @complete_profile_error_title.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get complete_profile_error_title;

  /// No description provided for @complete_profile_required_field.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get complete_profile_required_field;

  /// No description provided for @complete_profile_name_min_length.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least two characters'**
  String get complete_profile_name_min_length;

  /// No description provided for @complete_profile_invalid_name.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid name'**
  String get complete_profile_invalid_name;

  /// No description provided for @complete_profile_email_required.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get complete_profile_email_required;

  /// No description provided for @complete_profile_invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get complete_profile_invalid_email;

  /// No description provided for @complete_profile_otp_required.
  ///
  /// In en, this message translates to:
  /// **'Verification code is required'**
  String get complete_profile_otp_required;

  /// No description provided for @complete_profile_invalid_otp.
  ///
  /// In en, this message translates to:
  /// **'Verification code must be 4 digits'**
  String get complete_profile_invalid_otp;

  /// No description provided for @first_name.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get first_name;

  /// No description provided for @last_name.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get last_name;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @district.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get district;

  /// No description provided for @enter_valid_phone.
  ///
  /// In en, this message translates to:
  /// **'⚠️ Please enter a valid phone number.'**
  String get enter_valid_phone;

  /// No description provided for @code_sent.
  ///
  /// In en, this message translates to:
  /// **'✅ Verification code sent to your number.'**
  String get code_sent;

  /// No description provided for @send_failed.
  ///
  /// In en, this message translates to:
  /// **'❌ Failed to send code, please try again.'**
  String get send_failed;

  /// No description provided for @login_success.
  ///
  /// In en, this message translates to:
  /// **'🎉 Logged in successfully'**
  String get login_success;

  /// No description provided for @invalid_code.
  ///
  /// In en, this message translates to:
  /// **'Invalid verification code, please try again.'**
  String get invalid_code;

  /// No description provided for @verify_failed.
  ///
  /// In en, this message translates to:
  /// **'❌ Verification failed.'**
  String get verify_failed;

  /// No description provided for @resent_info.
  ///
  /// In en, this message translates to:
  /// **'🔁 Code resent (test only).'**
  String get resent_info;

  /// No description provided for @sending.
  ///
  /// In en, this message translates to:
  /// **'Sending'**
  String get sending;

  /// No description provided for @verifying.
  ///
  /// In en, this message translates to:
  /// **'Verifying'**
  String get verifying;

  /// No description provided for @fill_all_fields.
  ///
  /// In en, this message translates to:
  /// **'⚠️ Please fill in all fields.'**
  String get fill_all_fields;

  /// No description provided for @profile_saved.
  ///
  /// In en, this message translates to:
  /// **'✅ Data saved successfully!'**
  String get profile_saved;

  /// No description provided for @profile_save_error.
  ///
  /// In en, this message translates to:
  /// **'❌ Failed to save data, please try again.'**
  String get profile_save_error;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving'**
  String get saving;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @login_required_title.
  ///
  /// In en, this message translates to:
  /// **'Login Required'**
  String get login_required_title;

  /// No description provided for @login_required_message.
  ///
  /// In en, this message translates to:
  /// **'To access this page, you must be logged in. Please sign in with your account to continue.'**
  String get login_required_message;

  /// No description provided for @login_now.
  ///
  /// In en, this message translates to:
  /// **'Login Now'**
  String get login_now;

  /// No description provided for @back_home.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get back_home;

  /// No description provided for @login_required_alt.
  ///
  /// In en, this message translates to:
  /// **'Login icon'**
  String get login_required_alt;

  /// No description provided for @stable_name.
  ///
  /// In en, this message translates to:
  /// **'Stable Name'**
  String get stable_name;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get full_name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @signup_account_information.
  String get signup_account_information;

  /// No description provided for @signup_enter_full_name.
  String get signup_enter_full_name;

  /// No description provided for @signup_nationality.
  String get signup_nationality;

  /// No description provided for @signup_select_hint.
  String get signup_select_hint;

  /// No description provided for @signup_enter_email.
  String get signup_enter_email;

  /// No description provided for @signup_saudi_arabia.
  String get signup_saudi_arabia;

  /// No description provided for @signup_kuwait.
  String get signup_kuwait;

  /// No description provided for @signup_saudi.
  String get signup_saudi;

  /// No description provided for @signup_kuwaiti.
  String get signup_kuwaiti;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @country_code.
  ///
  /// In en, this message translates to:
  /// **'Country Code'**
  String get country_code;

  /// No description provided for @profile_image.
  ///
  /// In en, this message translates to:
  /// **'Profile Image'**
  String get profile_image;

  /// No description provided for @no_image.
  ///
  /// In en, this message translates to:
  /// **'No Image'**
  String get no_image;

  /// No description provided for @default_alt.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get default_alt;

  /// No description provided for @camel_title.
  ///
  /// In en, this message translates to:
  /// **'Add Camel'**
  String get camel_title;

  /// No description provided for @horse_title.
  ///
  /// In en, this message translates to:
  /// **'Add Horse'**
  String get horse_title;

  /// No description provided for @camel_offers.
  ///
  /// In en, this message translates to:
  /// **'Camel Offers'**
  String get camel_offers;

  /// No description provided for @camel_auctions.
  ///
  /// In en, this message translates to:
  /// **'Camel Auctions'**
  String get camel_auctions;

  /// No description provided for @camel_offers_keyword.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get camel_offers_keyword;

  /// No description provided for @camel_auctions_keyword.
  ///
  /// In en, this message translates to:
  /// **'Auction'**
  String get camel_auctions_keyword;

  /// No description provided for @horse_offers.
  ///
  /// In en, this message translates to:
  /// **'Horse Offers'**
  String get horse_offers;

  /// No description provided for @horse_auctions.
  ///
  /// In en, this message translates to:
  /// **'Horse Auctions'**
  String get horse_auctions;

  /// No description provided for @coming_soon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get coming_soon;

  /// No description provided for @horse_badge.
  ///
  /// In en, this message translates to:
  /// **'Horse Auction Managed by Abu Ubaid'**
  String get horse_badge;

  /// No description provided for @camel_modal_title.
  ///
  /// In en, this message translates to:
  /// **'Camel Platform — Coming Soon'**
  String get camel_modal_title;

  /// No description provided for @camel_modal_body_1.
  ///
  /// In en, this message translates to:
  /// **'Sorry, the Camel Platform is launching soon.'**
  String get camel_modal_body_1;

  /// No description provided for @camel_modal_body_2.
  ///
  /// In en, this message translates to:
  /// **'You can continue browsing or choose to go to the {section} section.'**
  String camel_modal_body_2(Object section);

  /// No description provided for @go_to_auctions.
  ///
  /// In en, this message translates to:
  /// **'Go to Auctions'**
  String get go_to_auctions;

  /// No description provided for @go_to_offers.
  ///
  /// In en, this message translates to:
  /// **'Go to Offers'**
  String get go_to_offers;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred on the server. Please try again later or contact support.'**
  String get description;

  /// No description provided for @appstore.
  ///
  /// In en, this message translates to:
  /// **'App Store'**
  String get appstore;

  /// No description provided for @googleplay.
  ///
  /// In en, this message translates to:
  /// **'Google Play'**
  String get googleplay;

  /// No description provided for @alt.
  ///
  /// In en, this message translates to:
  /// **'Server error illustration'**
  String get alt;

  /// No description provided for @hero_title.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get hero_title;

  /// No description provided for @hero_description.
  ///
  /// In en, this message translates to:
  /// **'We are happy to serve you and listen to your feedback and inquiries.'**
  String get hero_description;

  /// No description provided for @breadcrumb_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get breadcrumb_home;

  /// No description provided for @breadcrumb_current.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get breadcrumb_current;

  /// No description provided for @form_title.
  ///
  /// In en, this message translates to:
  /// **'Send a Message'**
  String get form_title;

  /// No description provided for @form_description.
  ///
  /// In en, this message translates to:
  /// **'Fill in the fields below and we will get back to you during business hours.'**
  String get form_description;

  /// No description provided for @form_success.
  ///
  /// In en, this message translates to:
  /// **'Your message has been sent successfully. We will contact you soon.'**
  String get form_success;

  /// No description provided for @form_fullname.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get form_fullname;

  /// No description provided for @form_fullname_placeholder.
  ///
  /// In en, this message translates to:
  /// **'e.g. Wael Al-Shammari'**
  String get form_fullname_placeholder;

  /// No description provided for @form_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get form_email;

  /// No description provided for @form_email_placeholder.
  ///
  /// In en, this message translates to:
  /// **'name@example.com'**
  String get form_email_placeholder;

  /// No description provided for @form_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get form_phone;

  /// No description provided for @form_topic.
  ///
  /// In en, this message translates to:
  /// **'Message Subject'**
  String get form_topic;

  /// No description provided for @form_message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get form_message;

  /// No description provided for @form_message_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Write your message in detail...'**
  String get form_message_placeholder;

  /// No description provided for @form_file.
  ///
  /// In en, this message translates to:
  /// **'Attachments (optional)'**
  String get form_file;

  /// No description provided for @form_captcha.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get form_captcha;

  /// No description provided for @form_captcha_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter the code'**
  String get form_captcha_placeholder;

  /// No description provided for @form_terms.
  ///
  /// In en, this message translates to:
  /// **'I agree to the'**
  String get form_terms;

  /// No description provided for @form_privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get form_privacy;

  /// No description provided for @form_terms_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get form_terms_conditions;

  /// No description provided for @form_send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get form_send;

  /// No description provided for @form_clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get form_clear;

  /// No description provided for @form_best_contact.
  ///
  /// In en, this message translates to:
  /// **'Preferred Contact Method'**
  String get form_best_contact;

  /// No description provided for @choose.
  ///
  /// In en, this message translates to:
  /// **'Choose a topic…'**
  String get choose;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General Inquiry'**
  String get general;

  /// No description provided for @auction.
  ///
  /// In en, this message translates to:
  /// **'Auction Issue'**
  String get auction;

  /// No description provided for @transport.
  ///
  /// In en, this message translates to:
  /// **'Transport Service Request'**
  String get transport;

  /// No description provided for @veterinary.
  ///
  /// In en, this message translates to:
  /// **'Veterinary Inquiry'**
  String get veterinary;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @suggestion.
  ///
  /// In en, this message translates to:
  /// **'Improvement Suggestion'**
  String get suggestion;

  /// No description provided for @contact_info_title.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contact_info_title;

  /// No description provided for @contact_info_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get contact_info_phone;

  /// No description provided for @contact_info_whatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get contact_info_whatsapp;

  /// No description provided for @contact_info_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contact_info_email;

  /// No description provided for @contact_info_address.
  ///
  /// In en, this message translates to:
  /// **'Address: Riyadh, Saudi Arabia'**
  String get contact_info_address;

  /// No description provided for @contact_info_hours.
  ///
  /// In en, this message translates to:
  /// **'Working Hours: Sun–Thu 9 AM – 6 PM'**
  String get contact_info_hours;

  /// No description provided for @map_title.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get map_title;

  /// No description provided for @map_subtitle.
  ///
  /// In en, this message translates to:
  /// **'(Map)'**
  String get map_subtitle;

  /// No description provided for @add_listing.
  ///
  /// In en, this message translates to:
  /// **'Add Listing / Auction'**
  String get add_listing;

  /// No description provided for @my_auctions.
  ///
  /// In en, this message translates to:
  /// **'My Auctions'**
  String get my_auctions;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @live_listings.
  ///
  /// In en, this message translates to:
  /// **'Live Listings'**
  String get live_listings;

  /// No description provided for @sales.
  ///
  /// In en, this message translates to:
  /// **'Number of Sales Transactions'**
  String get sales;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @payment_methods_title.
  ///
  /// In en, this message translates to:
  /// **'Payment methods'**
  String get payment_methods_title;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notifications_read_all.
  ///
  /// In en, this message translates to:
  /// **'Read all'**
  String get notifications_read_all;

  /// No description provided for @complaints.
  ///
  /// In en, this message translates to:
  /// **'Complaints'**
  String get complaints;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @howToRate.
  ///
  /// In en, this message translates to:
  /// **'How to rate'**
  String get howToRate;

  /// No description provided for @ratingGuideMessage.
  ///
  /// In en, this message translates to:
  /// **'To rate a seller, you need to buy a horse or camel. After completing the amount, finishing payment, and confirming transfer, the rating interface will appear so you can leave your rating with a message.'**
  String get ratingGuideMessage;

  /// No description provided for @unableToLoadReviewsNow.
  ///
  /// In en, this message translates to:
  /// **'Unable to load reviews right now'**
  String get unableToLoadReviewsNow;

  /// No description provided for @noReviews.
  ///
  /// In en, this message translates to:
  /// **'No reviews yet'**
  String get noReviews;

  /// No description provided for @loadMoreReviews.
  ///
  /// In en, this message translates to:
  /// **'Load more reviews'**
  String get loadMoreReviews;

  /// No description provided for @viewReviews.
  ///
  /// In en, this message translates to:
  /// **'View reviews'**
  String get viewReviews;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @enable_biometrics.
  ///
  /// In en, this message translates to:
  /// **'Enable biometrics'**
  String get enable_biometrics;

  /// No description provided for @biometric_lock_disabled.
  ///
  /// In en, this message translates to:
  /// **'Biometric app lock has been disabled'**
  String get biometric_lock_disabled;

  /// No description provided for @biometric_unavailable_message.
  ///
  /// In en, this message translates to:
  /// **'This device does not support biometric authentication, or there is an issue with biometric settings'**
  String get biometric_unavailable_message;

  /// No description provided for @biometric_auth_reason.
  ///
  /// In en, this message translates to:
  /// **'Use your fingerprint to enable app lock'**
  String get biometric_auth_reason;

  /// No description provided for @biometric_auth_failed.
  ///
  /// In en, this message translates to:
  /// **'Biometric authentication failed. App lock was not enabled'**
  String get biometric_auth_failed;

  /// No description provided for @biometric_activation_title.
  ///
  /// In en, this message translates to:
  /// **'Enable biometrics'**
  String get biometric_activation_title;

  /// No description provided for @biometric_activation_description.
  ///
  /// In en, this message translates to:
  /// **'Use fingerprint or face recognition to access your account faster and more securely'**
  String get biometric_activation_description;

  /// No description provided for @enable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// No description provided for @later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @live_listings_count.
  ///
  /// In en, this message translates to:
  /// **'Number of Live Listings'**
  String get live_listings_count;

  /// No description provided for @auctions_count.
  ///
  /// In en, this message translates to:
  /// **'Number of Auctions'**
  String get auctions_count;

  /// No description provided for @total_due.
  ///
  /// In en, this message translates to:
  /// **'Total Amount Due'**
  String get total_due;

  /// No description provided for @pending_transfers.
  ///
  /// In en, this message translates to:
  /// **'Pending Transfers'**
  String get pending_transfers;

  /// No description provided for @image.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get image;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @start_date.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get start_date;

  /// No description provided for @subscribers.
  ///
  /// In en, this message translates to:
  /// **'Subscribers'**
  String get subscribers;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @status_live.
  ///
  /// In en, this message translates to:
  /// **'LIVE'**
  String get status_live;

  /// No description provided for @status_upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get status_upcoming;

  /// No description provided for @status_finished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get status_finished;

  /// No description provided for @enter_market.
  ///
  /// In en, this message translates to:
  /// **'Enter Market'**
  String get enter_market;

  /// No description provided for @delay_auction.
  ///
  /// In en, this message translates to:
  /// **'Postpone Auction'**
  String get delay_auction;

  /// No description provided for @delete_auction.
  ///
  /// In en, this message translates to:
  /// **'Delete Auction'**
  String get delete_auction;

  /// No description provided for @confirm_delete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this auction?'**
  String get confirm_delete;

  /// No description provided for @market_alert.
  ///
  /// In en, this message translates to:
  /// **'Entered the market for auction #{id}'**
  String market_alert(Object id);

  /// No description provided for @delay_alert.
  ///
  /// In en, this message translates to:
  /// **'Auction #{id} has been postponed'**
  String delay_alert(Object id);

  /// No description provided for @delete_alert.
  ///
  /// In en, this message translates to:
  /// **'Auction #{id} has been deleted'**
  String delete_alert(Object id);

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **'No favorite ads currently ❤️'**
  String get empty;

  /// No description provided for @horse.
  ///
  /// In en, this message translates to:
  /// **'Horse'**
  String get horse;

  /// No description provided for @camel.
  ///
  /// In en, this message translates to:
  /// **'Camel'**
  String get camel;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get currency;

  /// No description provided for @dash_placeholder.
  ///
  /// In en, this message translates to:
  /// **'—'**
  String get dash_placeholder;

  /// No description provided for @official_documents.
  ///
  /// In en, this message translates to:
  /// **'Official documents'**
  String get official_documents;

  /// No description provided for @medical_exam_certificate.
  ///
  /// In en, this message translates to:
  /// **'Veterinary exam certificate'**
  String get medical_exam_certificate;

  /// No description provided for @owner_document.
  ///
  /// In en, this message translates to:
  /// **'Owner document'**
  String get owner_document;

  /// No description provided for @horse_certificate.
  ///
  /// In en, this message translates to:
  /// **'Horse certificate'**
  String get horse_certificate;

  /// No description provided for @no_documents_available.
  ///
  /// In en, this message translates to:
  /// **'No documents available at the moment'**
  String get no_documents_available;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @unavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get unavailable;

  /// No description provided for @auction_title_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Auction title'**
  String get auction_title_placeholder;

  /// No description provided for @auction_status.
  ///
  /// In en, this message translates to:
  /// **'Auction status'**
  String get auction_status;

  /// No description provided for @auction_type.
  ///
  /// In en, this message translates to:
  /// **'Auction type'**
  String get auction_type;

  /// No description provided for @auction_starting_price.
  ///
  /// In en, this message translates to:
  /// **'Starting price'**
  String get auction_starting_price;

  /// No description provided for @auction_start.
  ///
  /// In en, this message translates to:
  /// **'Auction start'**
  String get auction_start;

  /// No description provided for @auction_end.
  ///
  /// In en, this message translates to:
  /// **'Auction end'**
  String get auction_end;

  /// No description provided for @auction_code.
  ///
  /// In en, this message translates to:
  /// **'Auction code'**
  String get auction_code;

  /// No description provided for @auction_final_price.
  ///
  /// In en, this message translates to:
  /// **'Final price'**
  String get auction_final_price;

  /// No description provided for @auction_type_live.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get auction_type_live;

  /// No description provided for @auction_type_online.
  ///
  /// In en, this message translates to:
  /// **'Online auction'**
  String get auction_type_online;

  /// No description provided for @name_label.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name_label;

  /// No description provided for @auction_result.
  ///
  /// In en, this message translates to:
  /// **'Auction result'**
  String get auction_result;

  /// No description provided for @last_bidder.
  ///
  /// In en, this message translates to:
  /// **'Last bidder'**
  String get last_bidder;

  /// No description provided for @final_bid_summary.
  ///
  /// In en, this message translates to:
  /// **'Final Bid Summary'**
  String get final_bid_summary;

  /// No description provided for @number_of_subscribers.
  ///
  /// In en, this message translates to:
  /// **'Number of subscribers'**
  String get number_of_subscribers;

  /// No description provided for @animal_name_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Animal name'**
  String get animal_name_placeholder;

  /// No description provided for @camels_count.
  ///
  /// In en, this message translates to:
  /// **'Camels count'**
  String get camels_count;

  /// No description provided for @animal_count_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Animal count'**
  String get animal_count_placeholder;

  /// No description provided for @animal_usage.
  ///
  /// In en, this message translates to:
  /// **'Usage'**
  String get animal_usage;

  /// No description provided for @animal_usage_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Animal usage'**
  String get animal_usage_placeholder;

  /// No description provided for @animal_color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get animal_color;

  /// No description provided for @animal_color_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Animal color'**
  String get animal_color_placeholder;

  /// No description provided for @animal_breed.
  ///
  /// In en, this message translates to:
  /// **'Breed'**
  String get animal_breed;

  /// No description provided for @animal_breed_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Animal breed'**
  String get animal_breed_placeholder;

  /// No description provided for @father_name.
  ///
  /// In en, this message translates to:
  /// **'Father name'**
  String get father_name;

  /// No description provided for @name_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name_placeholder;

  /// No description provided for @mother_name.
  ///
  /// In en, this message translates to:
  /// **'Mother name'**
  String get mother_name;

  /// No description provided for @mother_name_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Mother name'**
  String get mother_name_placeholder;

  /// No description provided for @maternal_grandfather_name.
  ///
  /// In en, this message translates to:
  /// **'Maternal grandfather name'**
  String get maternal_grandfather_name;

  /// No description provided for @mother_father_name_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Maternal grandfather name'**
  String get mother_father_name_placeholder;

  /// No description provided for @gender_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Select Gender'**
  String get gender_placeholder;

  /// No description provided for @birth_date.
  ///
  /// In en, this message translates to:
  /// **'Birth date'**
  String get birth_date;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// No description provided for @animal_height_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Animal height'**
  String get animal_height_placeholder;

  /// No description provided for @pregnant_status.
  ///
  /// In en, this message translates to:
  /// **'Pregnant'**
  String get pregnant_status;

  /// No description provided for @classification.
  ///
  /// In en, this message translates to:
  /// **'Classification'**
  String get classification;

  /// No description provided for @breed_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Breed'**
  String get breed_placeholder;

  /// No description provided for @animal_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get animal_type;

  /// No description provided for @animal_type_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Animal type'**
  String get animal_type_placeholder;

  /// No description provided for @horse_info.
  ///
  /// In en, this message translates to:
  /// **'Horse info'**
  String get horse_info;

  /// No description provided for @camel_info.
  ///
  /// In en, this message translates to:
  /// **'Camel info'**
  String get camel_info;

  /// No description provided for @auction_info.
  ///
  /// In en, this message translates to:
  /// **'Auction info'**
  String get auction_info;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @horse_owner_info.
  ///
  /// In en, this message translates to:
  /// **'Horse owner info'**
  String get horse_owner_info;

  /// No description provided for @city_label.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city_label;

  /// No description provided for @auction_phase_one.
  ///
  /// In en, this message translates to:
  /// **'Auction one'**
  String get auction_phase_one;

  /// No description provided for @auction_phase_two.
  ///
  /// In en, this message translates to:
  /// **'Auction two'**
  String get auction_phase_two;

  /// No description provided for @auction_phase_three.
  ///
  /// In en, this message translates to:
  /// **'Auction three'**
  String get auction_phase_three;

  /// No description provided for @auction_withdrawn.
  ///
  /// In en, this message translates to:
  /// **'Auction withdrawn'**
  String get auction_withdrawn;

  /// No description provided for @auction_closed.
  ///
  /// In en, this message translates to:
  /// **'Auction closed'**
  String get auction_closed;

  /// No description provided for @auction_ended.
  ///
  /// In en, this message translates to:
  /// **'Auction ended'**
  String get auction_ended;

  /// No description provided for @ends_in.
  ///
  /// In en, this message translates to:
  /// **'Ends in'**
  String get ends_in;

  /// No description provided for @price_on_request.
  ///
  /// In en, this message translates to:
  /// **'Price on request'**
  String get price_on_request;

  /// No description provided for @view_auction.
  ///
  /// In en, this message translates to:
  /// **'View Auction'**
  String get view_auction;

  /// No description provided for @remove_alert.
  ///
  /// In en, this message translates to:
  /// **'{name} has been removed from favorites'**
  String remove_alert(Object name);

  /// No description provided for @clear_all.
  ///
  /// In en, this message translates to:
  /// **'Clear All Notifications'**
  String get clear_all;

  /// No description provided for @clear_all_alert.
  ///
  /// In en, this message translates to:
  /// **'All notifications cleared ✅'**
  String get clear_all_alert;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @status_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get status_active;

  /// No description provided for @status_paused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get status_paused;

  /// No description provided for @status_sold.
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get status_sold;

  /// No description provided for @modal_title.
  ///
  /// In en, this message translates to:
  /// **'Complaint Sent'**
  String get modal_title;

  /// No description provided for @view_details.
  ///
  /// In en, this message translates to:
  /// **'View Details / Edit'**
  String get view_details;

  /// No description provided for @send_update_request.
  ///
  /// In en, this message translates to:
  /// **'Send Update Request'**
  String get send_update_request;

  /// No description provided for @add_payment_submit_request.
  ///
  /// In en, this message translates to:
  /// **'Submit request'**
  String get add_payment_submit_request;

  /// No description provided for @add_payment_done_title.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get add_payment_done_title;

  /// No description provided for @add_payment_proof_sent_success.
  ///
  /// In en, this message translates to:
  /// **'Payment proof has been sent successfully.'**
  String get add_payment_proof_sent_success;

  /// No description provided for @mark_sold.
  ///
  /// In en, this message translates to:
  /// **'Mark as Sold'**
  String get mark_sold;

  /// No description provided for @pause_listing.
  ///
  /// In en, this message translates to:
  /// **'Pause Listing'**
  String get pause_listing;

  /// No description provided for @delete_listing.
  ///
  /// In en, this message translates to:
  /// **'Delete Listing'**
  String get delete_listing;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @add_bank.
  ///
  /// In en, this message translates to:
  /// **'Add Bank Account'**
  String get add_bank;

  /// No description provided for @link_stc.
  ///
  /// In en, this message translates to:
  /// **'Link STC Pay'**
  String get link_stc;

  /// No description provided for @current_balance.
  ///
  /// In en, this message translates to:
  /// **'Current Balance'**
  String get current_balance;

  /// No description provided for @current_formula.
  ///
  /// In en, this message translates to:
  /// **'Total Wallet = Available + Pending - Due.'**
  String get current_formula;

  /// No description provided for @available_balance.
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get available_balance;

  /// No description provided for @available_info.
  ///
  /// In en, this message translates to:
  /// **'Can be withdrawn to bank account or STC Pay.'**
  String get available_info;

  /// No description provided for @hold_balance.
  ///
  /// In en, this message translates to:
  /// **'Pending Balance'**
  String get hold_balance;

  /// No description provided for @hold_info.
  ///
  /// In en, this message translates to:
  /// **'Sales under verification or ownership transfer.'**
  String get hold_info;

  /// No description provided for @due_balance.
  ///
  /// In en, this message translates to:
  /// **'Due Balance'**
  String get due_balance;

  /// No description provided for @due_info.
  ///
  /// In en, this message translates to:
  /// **'Amounts you owe (auction fees, commissions, etc.).'**
  String get due_info;

  /// No description provided for @auction_sim.
  ///
  /// In en, this message translates to:
  /// **'Auction Result Simulation (Buyer)'**
  String get auction_sim;

  /// No description provided for @paddle_value.
  ///
  /// In en, this message translates to:
  /// **'Paddle Deposit (Paid Upfront)'**
  String get paddle_value;

  /// No description provided for @hammer_value.
  ///
  /// In en, this message translates to:
  /// **'Auction Winning Amount'**
  String get hammer_value;

  /// No description provided for @fee_percentage.
  ///
  /// In en, this message translates to:
  /// **'Buyer Commission (%)'**
  String get fee_percentage;

  /// No description provided for @calc_note.
  ///
  /// In en, this message translates to:
  /// **'When you win: the commission is deducted from the total, then the paddle amount, showing the remaining due.'**
  String get calc_note;

  /// No description provided for @calculate.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get calculate;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @result_title.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get result_title;

  /// No description provided for @enter_values.
  ///
  /// In en, this message translates to:
  /// **'Enter values and press calculate.'**
  String get enter_values;

  /// No description provided for @auction_value.
  ///
  /// In en, this message translates to:
  /// **'Auction Value'**
  String get auction_value;

  /// No description provided for @commission.
  ///
  /// In en, this message translates to:
  /// **'Commission'**
  String get commission;

  /// No description provided for @paddle_paid.
  ///
  /// In en, this message translates to:
  /// **'Paid Deposit (Paddle)'**
  String get paddle_paid;

  /// No description provided for @remaining_due.
  ///
  /// In en, this message translates to:
  /// **'Remaining Due'**
  String get remaining_due;

  /// No description provided for @commission_label.
  ///
  /// In en, this message translates to:
  /// **'Commission'**
  String get commission_label;

  /// No description provided for @remaining_label.
  ///
  /// In en, this message translates to:
  /// **'Remaining Due'**
  String get remaining_label;

  /// No description provided for @remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get remaining;

  /// No description provided for @payment_method_wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get payment_method_wallet;

  /// No description provided for @payment_method_apple_pay.
  ///
  /// In en, this message translates to:
  /// **'Apple Pay'**
  String get payment_method_apple_pay;

  /// No description provided for @payment_method_bank_transfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get payment_method_bank_transfer;

  /// No description provided for @payment_method_network.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get payment_method_network;

  /// No description provided for @applicant_data.
  ///
  /// In en, this message translates to:
  /// **'Applicant Data'**
  String get applicant_data;

  /// No description provided for @order_number.
  ///
  /// In en, this message translates to:
  /// **'Order Number'**
  String get order_number;

  /// No description provided for @order_status.
  ///
  /// In en, this message translates to:
  /// **'Order Status'**
  String get order_status;

  /// No description provided for @shipping_date.
  ///
  /// In en, this message translates to:
  /// **'Shipping Date'**
  String get shipping_date;

  /// No description provided for @payment_method.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get payment_method;

  /// No description provided for @transferred_amount.
  ///
  /// In en, this message translates to:
  /// **'Transferred Amount'**
  String get transferred_amount;

  /// No description provided for @bank_account_data.
  ///
  /// In en, this message translates to:
  /// **'Bank Account Details'**
  String get bank_account_data;

  /// No description provided for @account_holder_name.
  ///
  /// In en, this message translates to:
  /// **'Account Holder'**
  String get account_holder_name;

  /// No description provided for @account_number.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get account_number;

  /// No description provided for @iban_number.
  ///
  /// In en, this message translates to:
  /// **'IBAN Number'**
  String get iban_number;

  /// No description provided for @transfer_attachments.
  ///
  /// In en, this message translates to:
  /// **'Transfer Attachments'**
  String get transfer_attachments;

  /// No description provided for @no_attachments_available.
  ///
  /// In en, this message translates to:
  /// **'No attachments available for this order.'**
  String get no_attachments_available;

  /// No description provided for @account_type_label.
  ///
  /// In en, this message translates to:
  /// **'Account Type'**
  String get account_type_label;

  /// No description provided for @amount_label.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount_label;

  /// No description provided for @transaction_date_label.
  ///
  /// In en, this message translates to:
  /// **'Transaction Date'**
  String get transaction_date_label;

  /// No description provided for @details_label.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details_label;

  /// No description provided for @wallet_balance.
  ///
  /// In en, this message translates to:
  /// **'Wallet Balance'**
  String get wallet_balance;

  /// No description provided for @pending_balance.
  ///
  /// In en, this message translates to:
  /// **'Pending Balance'**
  String get pending_balance;

  /// No description provided for @amount_due.
  ///
  /// In en, this message translates to:
  /// **'Amount Due'**
  String get amount_due;

  /// No description provided for @company_commission.
  ///
  /// In en, this message translates to:
  /// **'Company Commission'**
  String get company_commission;

  /// No description provided for @auto_update.
  ///
  /// In en, this message translates to:
  /// **'Auto Update'**
  String get auto_update;

  /// No description provided for @submit_offer.
  ///
  /// In en, this message translates to:
  /// **'Submit Offer'**
  String get submit_offer;

  /// No description provided for @participants_table.
  ///
  /// In en, this message translates to:
  /// **'Participants Table'**
  String get participants_table;

  /// No description provided for @your_paddle_number_is.
  ///
  /// In en, this message translates to:
  /// **'Your paddle number: '**
  String get your_paddle_number_is;

  /// No description provided for @participating_horses.
  ///
  /// In en, this message translates to:
  /// **'Participating Horses'**
  String get participating_horses;

  /// No description provided for @participating_camels.
  ///
  /// In en, this message translates to:
  /// **'Participating Camels'**
  String get participating_camels;

  /// No description provided for @not_specified.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get not_specified;

  /// No description provided for @buy_paddle_now.
  ///
  /// In en, this message translates to:
  /// **'Buy a paddle now'**
  String get buy_paddle_now;

  /// No description provided for @participate_in_auction_now.
  ///
  /// In en, this message translates to:
  /// **'Participate in the auction now'**
  String get participate_in_auction_now;

  /// No description provided for @public_auction.
  ///
  /// In en, this message translates to:
  /// **'Public Auction'**
  String get public_auction;

  /// No description provided for @private_auction.
  ///
  /// In en, this message translates to:
  /// **'Private Auction'**
  String get private_auction;

  /// No description provided for @choose_best_bank.
  ///
  /// In en, this message translates to:
  /// **'Choose the best bank for you'**
  String get choose_best_bank;

  /// No description provided for @bank_details_instructions.
  ///
  /// In en, this message translates to:
  /// **'Review the bank account details, copy the account number or IBAN directly to complete the transfer process easily.'**
  String get bank_details_instructions;

  /// No description provided for @current_auction_on_platform_now.
  ///
  /// In en, this message translates to:
  /// **'Current auction on the platform now'**
  String get current_auction_on_platform_now;

  /// No description provided for @support_via_whatsapp.
  ///
  /// In en, this message translates to:
  /// **'Support via WhatsApp'**
  String get support_via_whatsapp;

  /// No description provided for @direct_contact_support.
  ///
  /// In en, this message translates to:
  /// **'Direct contact with the support team — reply usually within minutes'**
  String get direct_contact_support;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_account;

  /// No description provided for @delete_account_warning.
  ///
  /// In en, this message translates to:
  /// **'Once you delete your account, you cannot undo this action'**
  String get delete_account_warning;

  /// No description provided for @logout_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logout_confirmation;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get back;

  /// No description provided for @full_name_example.
  ///
  /// In en, this message translates to:
  /// **'Example: Wael Al-Shammari'**
  String get full_name_example;

  /// No description provided for @full_name_title.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get full_name_title;

  /// No description provided for @email_hint.
  ///
  /// In en, this message translates to:
  /// **'name@gmail.com'**
  String get email_hint;

  /// No description provided for @email_title.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get email_title;

  /// No description provided for @phone_label.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_label;

  /// No description provided for @message_subject_title.
  ///
  /// In en, this message translates to:
  /// **'Message Subject'**
  String get message_subject_title;

  /// No description provided for @message_subject_hint.
  ///
  /// In en, this message translates to:
  /// **'Select message subject'**
  String get message_subject_hint;

  /// No description provided for @inquiry_hint.
  ///
  /// In en, this message translates to:
  /// **'Write your inquiry here...'**
  String get inquiry_hint;

  /// No description provided for @inquiry_title.
  ///
  /// In en, this message translates to:
  /// **'Inquiry'**
  String get inquiry_title;

  /// No description provided for @choose_file_label.
  ///
  /// In en, this message translates to:
  /// **'Choose a file'**
  String get choose_file_label;

  /// No description provided for @agree_privacy_terms.
  ///
  /// In en, this message translates to:
  /// **'I agree to the privacy policy and terms and conditions.'**
  String get agree_privacy_terms;

  /// No description provided for @request_sent_success_title.
  ///
  /// In en, this message translates to:
  /// **'Request sent successfully'**
  String get request_sent_success_title;

  /// No description provided for @request_sent_success_message.
  ///
  /// In en, this message translates to:
  /// **'You will be contacted later'**
  String get request_sent_success_message;

  /// No description provided for @error_occurred_title.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get error_occurred_title;

  /// No description provided for @submit_button.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit_button;

  /// No description provided for @best_way_to_communicate.
  ///
  /// In en, this message translates to:
  /// **'Best way to communicate'**
  String get best_way_to_communicate;

  /// No description provided for @whatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get whatsapp;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @service_card_price_label.
  ///
  /// In en, this message translates to:
  /// **'Price:'**
  String get service_card_price_label;

  String get service_filter_painting;

  String get service_filter_engineering;

  String get service_filter_furniture;

  String get service_painting_title;

  String get service_painting_description;

  String get service_painting_price;

  String get verified_offices_title;

  String get verified_offices_description;

  String get verified_offices_preview_name;

  String get verified_offices_preview_location;

  String get verified_offices_show_map;

  String get more_desc_services;

  /// No description provided for @delete_the_bid.
  ///
  /// In en, this message translates to:
  /// **'Delete the bid'**
  String get delete_the_bid;

  /// No description provided for @calculator_initial_result.
  ///
  /// In en, this message translates to:
  /// **'Enter values and press calculate result.'**
  String get calculator_initial_result;

  /// No description provided for @calculator_fee_value.
  ///
  /// In en, this message translates to:
  /// **'Auction fee: {fee} SAR'**
  String calculator_fee_value(Object fee);

  /// No description provided for @calculator_commission.
  ///
  /// In en, this message translates to:
  /// **'Commission ({commissionPercent}%): {commission} SAR'**
  String calculator_commission(Object commission, Object commissionPercent);

  /// No description provided for @calculator_prepaid_tax.
  ///
  /// In en, this message translates to:
  /// **'Prepaid (tax): -{tax} SAR'**
  String calculator_prepaid_tax(Object tax);

  /// No description provided for @calculator_remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining to pay: {remaining} SAR'**
  String calculator_remaining(Object remaining);

  /// No description provided for @calculator_title.
  ///
  /// In en, this message translates to:
  /// **'Auction Result Simulator for Buyer'**
  String get calculator_title;

  /// No description provided for @calculator_tax_label.
  ///
  /// In en, this message translates to:
  /// **'Prepaid tax value'**
  String get calculator_tax_label;

  /// No description provided for @calculator_price_label.
  ///
  /// In en, this message translates to:
  /// **'Auction fee value'**
  String get calculator_price_label;

  /// No description provided for @calculator_commission_label.
  ///
  /// In en, this message translates to:
  /// **'Buyer\'s commission'**
  String get calculator_commission_label;

  /// No description provided for @calculator_description.
  ///
  /// In en, this message translates to:
  /// **'When winning: commission is deducted from the auction fee, then prepaid tax is deducted, showing the remaining amount to pay.'**
  String get calculator_description;

  /// No description provided for @calculator_calculate_btn.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get calculator_calculate_btn;

  /// No description provided for @calculator_clear_btn.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get calculator_clear_btn;

  /// No description provided for @calculator_result_title.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get calculator_result_title;

  /// No description provided for @you_have_pending_request.
  ///
  /// In en, this message translates to:
  /// **'You have a pending request'**
  String get you_have_pending_request;

  /// No description provided for @payment_method_gateway.
  ///
  /// In en, this message translates to:
  /// **'Payment Gateway'**
  String get payment_method_gateway;

  /// No description provided for @will_add_to_due.
  ///
  /// In en, this message translates to:
  /// **'Will be added to your due balance'**
  String get will_add_to_due;

  /// No description provided for @bank_account.
  ///
  /// In en, this message translates to:
  /// **'Bank Account'**
  String get bank_account;

  /// No description provided for @linked.
  ///
  /// In en, this message translates to:
  /// **'Linked'**
  String get linked;

  /// No description provided for @unlinked.
  ///
  /// In en, this message translates to:
  /// **'Not Linked'**
  String get unlinked;

  /// No description provided for @transactions_title.
  ///
  /// In en, this message translates to:
  /// **'Transaction History'**
  String get transactions_title;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @operation.
  ///
  /// In en, this message translates to:
  /// **'Operation'**
  String get operation;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @deposit_paddle.
  ///
  /// In en, this message translates to:
  /// **'Paddle Deposit'**
  String get deposit_paddle;

  /// No description provided for @deposit_details.
  ///
  /// In en, this message translates to:
  /// **'Paddle purchase for auction participation'**
  String get deposit_details;

  /// No description provided for @on_you.
  ///
  /// In en, this message translates to:
  /// **'Debit'**
  String get on_you;

  /// No description provided for @for_you.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get for_you;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @auction_win.
  ///
  /// In en, this message translates to:
  /// **'Auction Won'**
  String get auction_win;

  /// No description provided for @awaiting_payment.
  ///
  /// In en, this message translates to:
  /// **'Awaiting Payment'**
  String get awaiting_payment;

  /// No description provided for @horse_sale.
  ///
  /// In en, this message translates to:
  /// **'Horse Sale'**
  String get horse_sale;

  /// No description provided for @pending_transfer.
  ///
  /// In en, this message translates to:
  /// **'Pending – Ownership Transfer'**
  String get pending_transfer;

  /// No description provided for @transactions_note.
  ///
  /// In en, this message translates to:
  /// **'Note: Once inspection and ownership transfer are confirmed, the pending amount becomes available for withdrawal.'**
  String get transactions_note;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm Request'**
  String get confirm;

  /// No description provided for @add_bank_modal.
  ///
  /// In en, this message translates to:
  /// **'Add Bank Account'**
  String get add_bank_modal;

  /// No description provided for @bank_linked.
  ///
  /// In en, this message translates to:
  /// **'Bank account linked successfully ✅'**
  String get bank_linked;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @full_name_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Full legal name'**
  String get full_name_placeholder;

  /// No description provided for @bank_name.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get bank_name;

  /// No description provided for @bank_name_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Al Rajhi / NCB ...'**
  String get bank_name_placeholder;

  /// No description provided for @link_stc_modal.
  ///
  /// In en, this message translates to:
  /// **'Link STC Pay'**
  String get link_stc_modal;

  /// No description provided for @stc_linked.
  ///
  /// In en, this message translates to:
  /// **'STC Pay linked successfully ✅'**
  String get stc_linked;

  /// No description provided for @stc_number.
  ///
  /// In en, this message translates to:
  /// **'STC Pay Number'**
  String get stc_number;

  /// No description provided for @tabs_label.
  ///
  /// In en, this message translates to:
  /// **'Notification Types'**
  String get tabs_label;

  /// No description provided for @tab_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get tab_all;

  /// No description provided for @tab_success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get tab_success;

  /// No description provided for @tab_warning.
  ///
  /// In en, this message translates to:
  /// **'Warnings'**
  String get tab_warning;

  /// No description provided for @tab_info.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get tab_info;

  /// No description provided for @tab_error.
  ///
  /// In en, this message translates to:
  /// **'Errors'**
  String get tab_error;

  /// No description provided for @no_notifications.
  ///
  /// In en, this message translates to:
  /// **'No notifications currently 🎉'**
  String get no_notifications;

  /// No description provided for @approved_title.
  ///
  /// In en, this message translates to:
  /// **'Your listing was approved'**
  String get approved_title;

  /// No description provided for @approved_message.
  ///
  /// In en, this message translates to:
  /// **'Your horse listing has been reviewed and approved successfully.'**
  String get approved_message;

  /// No description provided for @auction_soon_title.
  ///
  /// In en, this message translates to:
  /// **'24 hours left before auction starts'**
  String get auction_soon_title;

  /// No description provided for @auction_soon_message.
  ///
  /// In en, this message translates to:
  /// **'Make sure your camel photos and location are ready before the auction begins.'**
  String get auction_soon_message;

  /// No description provided for @new_offer_title.
  ///
  /// In en, this message translates to:
  /// **'New offer received'**
  String get new_offer_title;

  /// No description provided for @new_offer_message.
  ///
  /// In en, this message translates to:
  /// **'A user has submitted an offer on one of your auctions.'**
  String get new_offer_message;

  /// No description provided for @rejected_title.
  ///
  /// In en, this message translates to:
  /// **'Listing rejected'**
  String get rejected_title;

  /// No description provided for @rejected_message.
  ///
  /// In en, this message translates to:
  /// **'Your listing #215 was not approved due to missing information.'**
  String get rejected_message;

  /// No description provided for @time_3h.
  ///
  /// In en, this message translates to:
  /// **'3 hours ago'**
  String get time_3h;

  /// No description provided for @time_6h.
  ///
  /// In en, this message translates to:
  /// **'6 hours ago'**
  String get time_6h;

  /// No description provided for @time_1d.
  ///
  /// In en, this message translates to:
  /// **'1 day ago'**
  String get time_1d;

  /// No description provided for @time_2d.
  ///
  /// In en, this message translates to:
  /// **'2 days ago'**
  String get time_2d;

  /// No description provided for @placeholder.
  ///
  /// In en, this message translates to:
  /// **'Write your complaint...'**
  String get placeholder;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @response_time.
  ///
  /// In en, this message translates to:
  /// **'A response will be provided within 24–48 hours.'**
  String get response_time;

  /// No description provided for @empty_warning.
  ///
  /// In en, this message translates to:
  /// **'Please write your complaint before submitting.'**
  String get empty_warning;

  /// No description provided for @modal_message.
  ///
  /// In en, this message translates to:
  /// **'Your complaint has been received successfully ✅\nWe will contact you within 24–48 hours via your dashboard or email.'**
  String get modal_message;

  /// No description provided for @fees.
  ///
  /// In en, this message translates to:
  /// **'Fees'**
  String get fees;

  /// No description provided for @platform.
  ///
  /// In en, this message translates to:
  /// **'Platform'**
  String get platform;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category / Offer Type'**
  String get category;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Scheduling (Auction)'**
  String get schedule;

  /// No description provided for @basic_info.
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get basic_info;

  /// No description provided for @documents.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documents;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Riyadh - Kingdom of Saudi Arabia'**
  String get location;

  /// No description provided for @media.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get media;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay Fees'**
  String get pay;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit for Review'**
  String get submit;

  /// No description provided for @accept_terms.
  ///
  /// In en, this message translates to:
  /// **'Please accept the terms and conditions'**
  String get accept_terms;

  /// No description provided for @set_price.
  ///
  /// In en, this message translates to:
  /// **'Please set a price for the fixed offer'**
  String get set_price;

  /// No description provided for @select_date_time.
  ///
  /// In en, this message translates to:
  /// **'Please select a start date and time'**
  String get select_date_time;

  /// No description provided for @date_too_soon.
  ///
  /// In en, this message translates to:
  /// **'Start date must be at least 3 days from today'**
  String get date_too_soon;

  /// No description provided for @submitted.
  ///
  /// In en, this message translates to:
  /// **'Submitted for review, and data saved to LocalStorage'**
  String get submitted;

  /// No description provided for @horse_desc.
  ///
  /// In en, this message translates to:
  /// **'Racing • Beauty • Show Jumping Horses'**
  String get horse_desc;

  /// No description provided for @camel_desc.
  ///
  /// In en, this message translates to:
  /// **'You can create a group auction for multiple camels'**
  String get camel_desc;

  /// No description provided for @horse_classification.
  ///
  /// In en, this message translates to:
  /// **'Horse Classification'**
  String get horse_classification;

  /// No description provided for @horse_speed.
  ///
  /// In en, this message translates to:
  /// **'Racing Horse'**
  String get horse_speed;

  /// No description provided for @horse_beauty.
  ///
  /// In en, this message translates to:
  /// **'Beauty Horse'**
  String get horse_beauty;

  /// No description provided for @horse_jump.
  ///
  /// In en, this message translates to:
  /// **'Show Jumping Horse'**
  String get horse_jump;

  /// No description provided for @camel_offer_type.
  ///
  /// In en, this message translates to:
  /// **'Camel Offer Type'**
  String get camel_offer_type;

  /// No description provided for @camel_individual.
  ///
  /// In en, this message translates to:
  /// **'Individual'**
  String get camel_individual;

  /// No description provided for @camel_group.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get camel_group;

  /// No description provided for @camels_count_label.
  ///
  /// In en, this message translates to:
  /// **'Number of Camels'**
  String get camels_count_label;

  /// No description provided for @camels_count_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Example: 5'**
  String get camels_count_placeholder;

  /// No description provided for @extra_services.
  ///
  /// In en, this message translates to:
  /// **'Additional Services'**
  String get extra_services;

  /// No description provided for @fixed_sale.
  ///
  /// In en, this message translates to:
  /// **'Fixed Sale'**
  String get fixed_sale;

  /// No description provided for @auction_sale.
  ///
  /// In en, this message translates to:
  /// **'Auction'**
  String get auction_sale;

  /// No description provided for @price_label.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price_label;

  /// No description provided for @price_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Saudi Riyal'**
  String get price_placeholder;

  /// No description provided for @deposit_label.
  ///
  /// In en, this message translates to:
  /// **'Deposit for Reservation'**
  String get deposit_label;

  /// No description provided for @deposit_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get deposit_placeholder;

  /// No description provided for @terms_text.
  ///
  /// In en, this message translates to:
  /// **'I agree to the terms and conditions, and acknowledge that service fees are non-refundable upon cancellation.'**
  String get terms_text;

  /// No description provided for @start_time.
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get start_time;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note: In case of auction or sale cancellation, <bold>the fee is non-refundable</bold>.'**
  String get note;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @breed.
  ///
  /// In en, this message translates to:
  /// **'Breed'**
  String get breed;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @short_desc.
  ///
  /// In en, this message translates to:
  /// **'Short Description'**
  String get short_desc;

  /// No description provided for @short_desc_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter a brief description of the animal'**
  String get short_desc_placeholder;

  /// No description provided for @medical_cert.
  ///
  /// In en, this message translates to:
  /// **'Medical Examination Certificate (Optional)'**
  String get medical_cert;

  /// No description provided for @animal_info_cert.
  ///
  /// In en, this message translates to:
  /// **'Horse / Camel Information Certificate'**
  String get animal_info_cert;

  /// No description provided for @other_docs.
  ///
  /// In en, this message translates to:
  /// **'Other Documents'**
  String get other_docs;

  /// No description provided for @main_image.
  ///
  /// In en, this message translates to:
  /// **'Main Image'**
  String get main_image;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Additional Images (at least 4)'**
  String get gallery;

  /// No description provided for @video_links.
  ///
  /// In en, this message translates to:
  /// **'Video Links'**
  String get video_links;

  /// No description provided for @video_placeholder.
  ///
  /// In en, this message translates to:
  /// **'YouTube or other player link (optional)'**
  String get video_placeholder;

  /// No description provided for @add_video.
  ///
  /// In en, this message translates to:
  /// **'+ Add Video Link'**
  String get add_video;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @fee_text.
  ///
  /// In en, this message translates to:
  /// **'Payment method for the fee'**
  String get fee_text;

  /// No description provided for @card.
  ///
  /// In en, this message translates to:
  /// **'Visa / Mada'**
  String get card;

  /// No description provided for @card_name.
  ///
  /// In en, this message translates to:
  /// **'Name on Card'**
  String get card_name;

  /// No description provided for @card_number.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get card_number;

  /// No description provided for @expiry.
  ///
  /// In en, this message translates to:
  /// **'MM/YY'**
  String get expiry;

  /// No description provided for @cvv.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get cvv;

  /// No description provided for @review_header.
  ///
  /// In en, this message translates to:
  /// **'Final Review'**
  String get review_header;

  /// No description provided for @review_text.
  ///
  /// In en, this message translates to:
  /// **'Your request will be sent to the forsan administration for review before publishing.'**
  String get review_text;

  /// No description provided for @support_title.
  ///
  /// In en, this message translates to:
  /// **'Support & Help'**
  String get support_title;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contact;

  /// No description provided for @faqs.
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get faqs;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy;

  /// No description provided for @terms.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get terms;

  /// No description provided for @important_links_title.
  ///
  /// In en, this message translates to:
  /// **'Important Links'**
  String get important_links_title;

  /// No description provided for @horse_platform.
  ///
  /// In en, this message translates to:
  /// **'Horses Platform'**
  String get horse_platform;

  /// No description provided for @camel_platform.
  ///
  /// In en, this message translates to:
  /// **'Camels Platform'**
  String get camel_platform;

  /// No description provided for @follow_us.
  ///
  /// In en, this message translates to:
  /// **'Follow Us'**
  String get follow_us;

  /// No description provided for @rights.
  ///
  /// In en, this message translates to:
  /// **'All rights reserved'**
  String get rights;

  /// No description provided for @horses.
  ///
  /// In en, this message translates to:
  /// **'Number of Horses Listed'**
  String get horses;

  /// No description provided for @buyers.
  ///
  /// In en, this message translates to:
  /// **'Number of Registered Buyers'**
  String get buyers;

  /// No description provided for @last_30_days.
  ///
  /// In en, this message translates to:
  /// **'Last 30 Days'**
  String get last_30_days;

  /// No description provided for @last_update.
  ///
  /// In en, this message translates to:
  /// **'Last update: Today 12:00 AM'**
  String get last_update;

  /// No description provided for @thousand.
  ///
  /// In en, this message translates to:
  /// **' K'**
  String get thousand;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore Auctions'**
  String get explore;

  /// No description provided for @or_try.
  ///
  /// In en, this message translates to:
  /// **'Or try'**
  String get or_try;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'search'**
  String get search;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'for your favorite horse.'**
  String get favorite;

  /// No description provided for @try_again.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get try_again;

  /// No description provided for @top_up_step_select_bank.
  ///
  /// In en, this message translates to:
  /// **'Select Bank'**
  String get top_up_step_select_bank;

  /// No description provided for @top_up_step_transfer_details.
  ///
  /// In en, this message translates to:
  /// **'Transfer Details'**
  String get top_up_step_transfer_details;

  /// No description provided for @admin_panel_title.
  ///
  /// In en, this message translates to:
  /// **'Admin Panel'**
  String get admin_panel_title;

  /// No description provided for @admin_panel_email.
  ///
  /// In en, this message translates to:
  /// **'admin@mail.com'**
  String get admin_panel_email;

  /// No description provided for @admin_panel_users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get admin_panel_users;

  /// No description provided for @admin_panel_groups.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get admin_panel_groups;

  /// No description provided for @admin_panel_programs.
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get admin_panel_programs;

  /// No description provided for @admin_panel_pro_programs.
  ///
  /// In en, this message translates to:
  /// **'Pro Programs'**
  String get admin_panel_pro_programs;

  /// No description provided for @admin_panel_events.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get admin_panel_events;

  /// No description provided for @admin_panel_schedules.
  ///
  /// In en, this message translates to:
  /// **'Schedules'**
  String get admin_panel_schedules;

  /// No description provided for @enter_value_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter value'**
  String get enter_value_hint;

  /// No description provided for @card_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter name on card'**
  String get card_name_hint;

  /// No description provided for @card_name_label.
  ///
  /// In en, this message translates to:
  /// **'Name on Card'**
  String get card_name_label;

  /// No description provided for @card_number_hint.
  ///
  /// In en, this message translates to:
  /// **'1111 1111 1111 1114'**
  String get card_number_hint;

  /// No description provided for @card_number_label.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get card_number_label;

  /// No description provided for @card_expiry_hint.
  ///
  /// In en, this message translates to:
  /// **'12/27'**
  String get card_expiry_hint;

  /// No description provided for @card_expiry_label.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get card_expiry_label;

  /// No description provided for @card_cvv_hint.
  ///
  /// In en, this message translates to:
  /// **'124'**
  String get card_cvv_hint;

  /// No description provided for @card_cvv_label.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get card_cvv_label;

  /// No description provided for @search_hint.
  ///
  /// In en, this message translates to:
  /// **'What are you looking for?'**
  String get search_hint;

  /// No description provided for @payment_invoice_title.
  ///
  /// In en, this message translates to:
  /// **'Payment Invoice'**
  String get payment_invoice_title;

  /// No description provided for @veterinary_services_title.
  ///
  /// In en, this message translates to:
  /// **'Veterinary Services 🩺'**
  String get veterinary_services_title;

  /// No description provided for @veterinary_services_description.
  ///
  /// In en, this message translates to:
  /// **'Exam and diagnostics.'**
  String get veterinary_services_description;

  /// No description provided for @transport_service_title.
  ///
  /// In en, this message translates to:
  /// **'Transport Service 🚚'**
  String get transport_service_title;

  /// No description provided for @transport_service_description.
  ///
  /// In en, this message translates to:
  /// **'Certified transport providers.'**
  String get transport_service_description;

  /// No description provided for @stats_horses_listed.
  ///
  /// In en, this message translates to:
  /// **'Horses Listed'**
  String get stats_horses_listed;

  /// No description provided for @stats_horses_listed_default.
  ///
  /// In en, this message translates to:
  /// **'875'**
  String get stats_horses_listed_default;

  /// No description provided for @stats_buyers_count.
  ///
  /// In en, this message translates to:
  /// **'Buyers'**
  String get stats_buyers_count;

  /// No description provided for @stats_buyers_count_default.
  ///
  /// In en, this message translates to:
  /// **'340'**
  String get stats_buyers_count_default;

  /// No description provided for @stats_sales_count.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get stats_sales_count;

  /// No description provided for @stats_sales_count_default.
  ///
  /// In en, this message translates to:
  /// **'120'**
  String get stats_sales_count_default;

  /// No description provided for @default_camel_sponsor.
  ///
  /// In en, this message translates to:
  /// **'Desert Caravans'**
  String get default_camel_sponsor;

  /// No description provided for @default_horse_sponsor.
  ///
  /// In en, this message translates to:
  /// **'Abu Ubaid Auction'**
  String get default_horse_sponsor;

  /// No description provided for @camels_platform_description.
  ///
  /// In en, this message translates to:
  /// **'Browse camel auctions and offers.'**
  String get camels_platform_description;

  /// No description provided for @horses_platform_description.
  ///
  /// In en, this message translates to:
  /// **'Browse horse auctions and offers.'**
  String get horses_platform_description;

  /// No description provided for @success_partners_title.
  ///
  /// In en, this message translates to:
  /// **'Success Partners'**
  String get success_partners_title;

  /// No description provided for @live_viewers_title.
  ///
  /// In en, this message translates to:
  /// **'Viewers Now'**
  String get live_viewers_title;

  /// No description provided for @live_viewers_value.
  ///
  /// In en, this message translates to:
  /// **'+1.2k'**
  String get live_viewers_value;

  /// No description provided for @bids_count_title.
  ///
  /// In en, this message translates to:
  /// **'Number of Bids'**
  String get bids_count_title;

  /// No description provided for @available_auctions_title.
  ///
  /// In en, this message translates to:
  /// **'Available Auctions'**
  String get available_auctions_title;

  /// No description provided for @quick_facts_title.
  ///
  /// In en, this message translates to:
  /// **'Quick Facts'**
  String get quick_facts_title;

  /// No description provided for @quick_facts_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Everything you need before bidding.'**
  String get quick_facts_subtitle;

  /// No description provided for @quick_facts_location_title.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get quick_facts_location_title;

  /// No description provided for @quick_facts_location_description.
  ///
  /// In en, this message translates to:
  /// **'Abu Ubaid auction arena • fully equipped for live streaming'**
  String get quick_facts_location_description;

  /// No description provided for @quick_facts_medical_title.
  ///
  /// In en, this message translates to:
  /// **'Medical Check'**
  String get quick_facts_medical_title;

  /// No description provided for @quick_facts_medical_description.
  ///
  /// In en, this message translates to:
  /// **'The horse has been examined by a certified veterinary committee'**
  String get quick_facts_medical_description;

  /// No description provided for @quick_facts_guarantees_title.
  ///
  /// In en, this message translates to:
  /// **'Auction Guarantees'**
  String get quick_facts_guarantees_title;

  /// No description provided for @quick_facts_guarantees_description.
  ///
  /// In en, this message translates to:
  /// **'Temporary hold to ensure transparency'**
  String get quick_facts_guarantees_description;

  /// No description provided for @management_notices_title.
  ///
  /// In en, this message translates to:
  /// **'Management Notices'**
  String get management_notices_title;

  /// No description provided for @management_notices_highlight_title.
  ///
  /// In en, this message translates to:
  /// **'Instant messages from auction management'**
  String get management_notices_highlight_title;

  /// No description provided for @management_notices_highlight_description.
  ///
  /// In en, this message translates to:
  /// **'Stay tuned for important instructions and alerts.'**
  String get management_notices_highlight_description;

  /// No description provided for @bidders_title.
  ///
  /// In en, this message translates to:
  /// **'Bidders'**
  String get bidders_title;

  /// No description provided for @active_now_label.
  ///
  /// In en, this message translates to:
  /// **'Active Now'**
  String get active_now_label;

  /// No description provided for @no_bids_yet.
  ///
  /// In en, this message translates to:
  /// **'No bids have been placed yet.'**
  String get no_bids_yet;

  /// No description provided for @bid_option_amount.
  ///
  /// In en, this message translates to:
  /// **'+ {amount}'**
  String bid_option_amount(Object amount);

  /// No description provided for @current_price_label.
  ///
  /// In en, this message translates to:
  /// **'Current Price'**
  String get current_price_label;

  /// No description provided for @your_bids_label.
  ///
  /// In en, this message translates to:
  /// **'Your Current Bids'**
  String get your_bids_label;

  /// No description provided for @my_bids_title.
  ///
  /// In en, this message translates to:
  /// **'Auction history'**
  String get my_bids_title;

  /// No description provided for @my_bids_bid_label.
  ///
  /// In en, this message translates to:
  /// **'Bid'**
  String get my_bids_bid_label;

  /// No description provided for @my_bids_bidder_number.
  ///
  /// In en, this message translates to:
  /// **'Bidder #{number}'**
  String my_bids_bidder_number(Object number);

  /// No description provided for @my_bids_auction_number.
  ///
  /// In en, this message translates to:
  /// **'Auction #{number}'**
  String my_bids_auction_number(Object number);

  /// No description provided for @custom_amount_label.
  ///
  /// In en, this message translates to:
  /// **'Custom Amount'**
  String get custom_amount_label;

  /// No description provided for @confirm_bid_label.
  ///
  /// In en, this message translates to:
  /// **'Confirm Bid'**
  String get confirm_bid_label;

  /// No description provided for @custom_bid_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Enter Custom Amount'**
  String get custom_bid_dialog_title;

  /// No description provided for @bid_increment_label.
  ///
  /// In en, this message translates to:
  /// **'Minimum bid increment is {amount} SAR'**
  String bid_increment_label(Object amount);

  /// No description provided for @cancel_label.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel_label;

  /// No description provided for @confirm_label.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm_label;

  /// No description provided for @bidder_fallback_name.
  ///
  /// In en, this message translates to:
  /// **'Bidder'**
  String get bidder_fallback_name;

  /// No description provided for @new_bid_toast_title.
  ///
  /// In en, this message translates to:
  /// **'🔥 New Bid'**
  String get new_bid_toast_title;

  /// No description provided for @announcement_toast_title.
  ///
  /// In en, this message translates to:
  /// **'📢 Notice from the administration'**
  String get announcement_toast_title;

  /// No description provided for @bid_raised_to_label.
  ///
  /// In en, this message translates to:
  /// **'raised the bid to '**
  String get bid_raised_to_label;

  /// No description provided for @auction_details_title.
  ///
  /// In en, this message translates to:
  /// **'Auction Details'**
  String get auction_details_title;

  /// No description provided for @personal_info_title.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personal_info_title;

  /// No description provided for @personal_info_first_name_label.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get personal_info_first_name_label;

  /// No description provided for @personal_info_last_name_label.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get personal_info_last_name_label;

  /// No description provided for @personal_info_email_label.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get personal_info_email_label;

  /// No description provided for @personal_info_add_email_label.
  ///
  /// In en, this message translates to:
  /// **'Tap to add email'**
  String get personal_info_add_email_label;

  /// No description provided for @personal_info_phone_label.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get personal_info_phone_label;

  /// No description provided for @personal_info_email_verified_message.
  ///
  /// In en, this message translates to:
  /// **'Email verified successfully'**
  String get personal_info_email_verified_message;

  /// No description provided for @personal_info_add_email_title.
  ///
  /// In en, this message translates to:
  /// **'Add Email'**
  String get personal_info_add_email_title;

  /// No description provided for @personal_info_edit_email_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Email'**
  String get personal_info_edit_email_title;

  /// No description provided for @personal_info_verify_email_title.
  ///
  /// In en, this message translates to:
  /// **'Verify Email'**
  String get personal_info_verify_email_title;

  /// No description provided for @personal_info_add_email_header.
  ///
  /// In en, this message translates to:
  /// **'Add your email'**
  String get personal_info_add_email_header;

  /// No description provided for @personal_info_update_email_header.
  ///
  /// In en, this message translates to:
  /// **'Update your email'**
  String get personal_info_update_email_header;

  /// No description provided for @personal_info_email_otp_request_subtitle.
  ///
  /// In en, this message translates to:
  /// **'We will send a verification code to confirm you own this email before saving it to your account.'**
  String get personal_info_email_otp_request_subtitle;

  /// No description provided for @personal_info_send_verification_code.
  ///
  /// In en, this message translates to:
  /// **'Send verification code'**
  String get personal_info_send_verification_code;

  /// No description provided for @personal_info_email_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get personal_info_email_required;

  /// No description provided for @personal_info_invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get personal_info_invalid_email;

  /// No description provided for @personal_info_enter_otp_title.
  ///
  /// In en, this message translates to:
  /// **'Enter verification code'**
  String get personal_info_enter_otp_title;

  /// No description provided for @personal_info_otp_label.
  ///
  /// In en, this message translates to:
  /// **'Verification code'**
  String get personal_info_otp_label;

  /// No description provided for @personal_info_confirm_email.
  ///
  /// In en, this message translates to:
  /// **'Verify email'**
  String get personal_info_confirm_email;

  /// No description provided for @personal_info_otp_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter the verification code'**
  String get personal_info_otp_required;

  /// No description provided for @personal_info_invalid_otp.
  ///
  /// In en, this message translates to:
  /// **'Invalid verification code'**
  String get personal_info_invalid_otp;

  /// No description provided for @personal_info_email_otp_sent_subtitle.
  ///
  /// In en, this message translates to:
  /// **'A verification code has been sent to {email}. Enter it to complete updating your email.'**
  String personal_info_email_otp_sent_subtitle(String email);

  /// No description provided for @continue_label.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_label;

  /// No description provided for @select_country_first.
  ///
  /// In en, this message translates to:
  /// **'Select country first'**
  String get select_country_first;

  /// No description provided for @stable_name_optional.
  ///
  /// In en, this message translates to:
  /// **'Stable name (optional)'**
  String get stable_name_optional;

  /// No description provided for @financial_management_title.
  ///
  /// In en, this message translates to:
  /// **'Financial Management'**
  String get financial_management_title;

  /// No description provided for @wallet_top_up_title.
  ///
  /// In en, this message translates to:
  /// **'Top Up Wallet'**
  String get wallet_top_up_title;

  /// No description provided for @available_balance_title.
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get available_balance_title;

  /// No description provided for @available_balance_description.
  ///
  /// In en, this message translates to:
  /// **'Withdrawable to bank account or STC Pay.'**
  String get available_balance_description;

  /// No description provided for @total_balance_title.
  ///
  /// In en, this message translates to:
  /// **'Total Balance'**
  String get total_balance_title;

  /// No description provided for @total_balance_description.
  ///
  /// In en, this message translates to:
  /// **'Total = available + pending - due - commission'**
  String get total_balance_description;

  /// No description provided for @company_commission_title.
  ///
  /// In en, this message translates to:
  /// **'Company Commission'**
  String get company_commission_title;

  /// No description provided for @company_commission_description.
  ///
  /// In en, this message translates to:
  /// **'Company commission'**
  String get company_commission_description;

  /// No description provided for @pending_balance_title.
  ///
  /// In en, this message translates to:
  /// **'Pending Balance'**
  String get pending_balance_title;

  /// No description provided for @pending_balance_description.
  ///
  /// In en, this message translates to:
  /// **'Sales under verification or ownership transfer.'**
  String get pending_balance_description;

  /// No description provided for @amount_due_title.
  ///
  /// In en, this message translates to:
  /// **'Amount Due'**
  String get amount_due_title;

  /// No description provided for @amount_due_description.
  ///
  /// In en, this message translates to:
  /// **'Amounts to be paid (auction, commissions...).'**
  String get amount_due_description;

  /// No description provided for @wallet_label.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet_label;

  /// No description provided for @system_label.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system_label;

  /// No description provided for @bank_transfer_label.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get bank_transfer_label;

  /// No description provided for @payment_gateway_label.
  ///
  /// In en, this message translates to:
  /// **'Payment Gateway'**
  String get payment_gateway_label;

  /// No description provided for @transaction_history_title.
  ///
  /// In en, this message translates to:
  /// **'Transaction History'**
  String get transaction_history_title;

  /// No description provided for @filters_title.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters_title;

  /// No description provided for @date_placeholder.
  ///
  /// In en, this message translates to:
  /// **'mm/dd/yyyy'**
  String get date_placeholder;

  /// No description provided for @start_date_title.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get start_date_title;

  /// No description provided for @end_date_title.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get end_date_title;

  /// No description provided for @search_label.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search_label;

  /// No description provided for @nav_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get nav_home;

  /// No description provided for @nav_offers.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get nav_offers;

  /// No description provided for @nav_auctions.
  ///
  /// In en, this message translates to:
  /// **'Auctions'**
  String get nav_auctions;

  /// No description provided for @nav_mass_auctions.
  ///
  /// In en, this message translates to:
  /// **'Mass Auctions'**
  String get nav_mass_auctions;

  /// No description provided for @nav_more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get nav_more;

  /// No description provided for @more_section_auction.
  ///
  /// In en, this message translates to:
  /// **'Auction'**
  String get more_section_auction;

  /// No description provided for @more_section_operations.
  ///
  /// In en, this message translates to:
  /// **'Operations'**
  String get more_section_operations;

  /// No description provided for @more_section_account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get more_section_account;

  /// No description provided for @my_offers.
  ///
  /// In en, this message translates to:
  /// **'My Offers'**
  String get my_offers;

  /// No description provided for @participating_auctions.
  ///
  /// In en, this message translates to:
  /// **'Participating Auctions'**
  String get participating_auctions;

  /// No description provided for @my_mass_auctions.
  ///
  /// In en, this message translates to:
  /// **'My Mass Auctions'**
  String get my_mass_auctions;

  /// No description provided for @purchases.
  ///
  /// In en, this message translates to:
  /// **'My Purchases'**
  String get purchases;

  /// No description provided for @my_sales.
  ///
  /// In en, this message translates to:
  /// **'My Sales'**
  String get my_sales;

  /// No description provided for @wallet_top_up_requests.
  ///
  /// In en, this message translates to:
  /// **'Wallet Top-up Requests'**
  String get wallet_top_up_requests;

  /// No description provided for @payment_history.
  ///
  /// In en, this message translates to:
  /// **'Payment History'**
  String get payment_history;

  /// No description provided for @payment_history_timeline_title.
  ///
  /// In en, this message translates to:
  /// **'Payment Timeline'**
  String get payment_history_timeline_title;

  /// No description provided for @payment_history_empty_state.
  ///
  /// In en, this message translates to:
  /// **'No payments yet'**
  String get payment_history_empty_state;

  /// No description provided for @payment_history_summary_title.
  ///
  /// In en, this message translates to:
  /// **'Quick Overview'**
  String get payment_history_summary_title;

  /// No description provided for @payment_history_operations_count.
  ///
  /// In en, this message translates to:
  /// **'{count} operation'**
  String payment_history_operations_count(int count);

  /// No description provided for @payment_history_summary_description.
  ///
  /// In en, this message translates to:
  /// **'Follow payment activity with clear status and source indicators.'**
  String get payment_history_summary_description;

  /// No description provided for @payment_history_status_approved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get payment_history_status_approved;

  /// No description provided for @payment_history_status_pending_review.
  ///
  /// In en, this message translates to:
  /// **'Under Review'**
  String get payment_history_status_pending_review;

  /// No description provided for @more_desc_add_listing.
  ///
  /// In en, this message translates to:
  /// **'Add a new listing or auction easily'**
  String get more_desc_add_listing;

  /// No description provided for @more_desc_participating_auctions.
  ///
  /// In en, this message translates to:
  /// **'View auctions you\'re currently participating in'**
  String get more_desc_participating_auctions;

  /// No description provided for @more_desc_my_mass_auctions.
  ///
  /// In en, this message translates to:
  /// **'Track your current and past mass auctions'**
  String get more_desc_my_mass_auctions;

  /// No description provided for @more_desc_my_auctions.
  ///
  /// In en, this message translates to:
  /// **'Manage your active and ended auctions'**
  String get more_desc_my_auctions;

  /// No description provided for @more_desc_incoming_requests.
  ///
  /// In en, this message translates to:
  /// **'Incoming purchase requests on your auctions'**
  String get more_desc_incoming_requests;

  /// No description provided for @more_desc_sent_requests.
  ///
  /// In en, this message translates to:
  /// **'Purchase requests you have sent'**
  String get more_desc_sent_requests;

  /// No description provided for @more_desc_my_offers.
  ///
  /// In en, this message translates to:
  /// **'Your submitted offers across auctions'**
  String get more_desc_my_offers;

  /// No description provided for @more_desc_purchases.
  ///
  /// In en, this message translates to:
  /// **'Purchase orders and offers you have joined'**
  String get more_desc_purchases;

  /// No description provided for @more_desc_sales.
  ///
  /// In en, this message translates to:
  /// **'Your current and previous offers and sales'**
  String get more_desc_sales;

  /// No description provided for @more_desc_wallet.
  ///
  /// In en, this message translates to:
  /// **'Balance and financial transactions in your wallet'**
  String get more_desc_wallet;

  /// No description provided for @more_desc_wallet_top_up_requests.
  ///
  /// In en, this message translates to:
  /// **'Your current and previous balance top-up requests'**
  String get more_desc_wallet_top_up_requests;

  /// No description provided for @more_desc_transaction_history.
  ///
  /// In en, this message translates to:
  /// **'All account transactions and actions'**
  String get more_desc_transaction_history;

  /// No description provided for @more_desc_payment_history.
  ///
  /// In en, this message translates to:
  /// **'All payments and invoices made via the platform'**
  String get more_desc_payment_history;

  /// No description provided for @more_desc_profile.
  ///
  /// In en, this message translates to:
  /// **'View and edit your account information'**
  String get more_desc_profile;

  /// No description provided for @more_desc_notifications.
  ///
  /// In en, this message translates to:
  /// **'View new alerts and notifications'**
  String get more_desc_notifications;

  /// No description provided for @more_desc_favorites.
  ///
  /// In en, this message translates to:
  /// **'All items you have added to favorites'**
  String get more_desc_favorites;

  /// No description provided for @more_desc_privacy.
  ///
  /// In en, this message translates to:
  /// **'Read the platform privacy policy'**
  String get more_desc_privacy;

  /// No description provided for @more_desc_terms.
  ///
  /// In en, this message translates to:
  /// **'Review the terms and conditions'**
  String get more_desc_terms;

  /// No description provided for @more_desc_contact_us.
  ///
  /// In en, this message translates to:
  /// **'Reach out for inquiries and support'**
  String get more_desc_contact_us;

  /// No description provided for @more_desc_faqs.
  ///
  /// In en, this message translates to:
  /// **'Quick answers to the most common questions'**
  String get more_desc_faqs;

  /// No description provided for @more_desc_logout.
  ///
  /// In en, this message translates to:
  /// **'Sign out from your current account'**
  String get more_desc_logout;

  /// No description provided for @sent_requests.
  ///
  /// In en, this message translates to:
  /// **'Sent requests'**
  String get sent_requests;

  /// No description provided for @incoming_requests.
  ///
  /// In en, this message translates to:
  /// **'Incoming requests'**
  String get incoming_requests;

  /// No description provided for @paddle_type_normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get paddle_type_normal;

  /// No description provided for @paddle_type_premium.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get paddle_type_premium;

  /// No description provided for @confirm_inspection_remaining_amount_message.
  ///
  /// In en, this message translates to:
  /// **'Upon confirming the inspection, you must complete the remaining amount'**
  String get confirm_inspection_remaining_amount_message;

  /// No description provided for @paddle_type_vip.
  ///
  /// In en, this message translates to:
  /// **'VIP'**
  String get paddle_type_vip;

  /// No description provided for @confirm_transfer_and_receipt.
  ///
  /// In en, this message translates to:
  /// **'Confirm Transfer & Receipt'**
  String get confirm_transfer_and_receipt;

  /// No description provided for @confirm_inspection.
  ///
  /// In en, this message translates to:
  /// **'Confirm Inspection'**
  String get confirm_inspection;

  /// No description provided for @cancel_purchase_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel the purchase?'**
  String get cancel_purchase_confirmation;

  /// No description provided for @cancel_purchase_title.
  ///
  /// In en, this message translates to:
  /// **'Cancel Purchase'**
  String get cancel_purchase_title;

  /// No description provided for @total_price_label.
  ///
  /// In en, this message translates to:
  /// **'Total Price'**
  String get total_price_label;

  /// No description provided for @confirm_transfer_message.
  ///
  /// In en, this message translates to:
  /// **'Please confirm the transfer process.'**
  String get confirm_transfer_message;

  /// No description provided for @complete_remaining_amount_message.
  ///
  /// In en, this message translates to:
  /// **'Upon confirming the inspection, you must complete the remaining amount {remainingAmount} '**
  String complete_remaining_amount_message(Object remainingAmount);

  /// No description provided for @paddle_type_label.
  ///
  /// In en, this message translates to:
  /// **'Paddle Type'**
  String get paddle_type_label;

  /// No description provided for @share_app_title.
  ///
  /// In en, this message translates to:
  /// **'Share forsan App'**
  String get share_app_title;

  /// No description provided for @share_app_description.
  ///
  /// In en, this message translates to:
  /// **'Invite someone you love to try forsan and enjoy unique auctions and services together.'**
  String get share_app_description;

  /// No description provided for @share_tag_friends.
  ///
  /// In en, this message translates to:
  /// **'Share with friends'**
  String get share_tag_friends;

  /// No description provided for @share_tag_discover.
  ///
  /// In en, this message translates to:
  /// **'Discover new auctions'**
  String get share_tag_discover;

  /// No description provided for @share_now.
  ///
  /// In en, this message translates to:
  /// **'Share Now'**
  String get share_now;

  /// No description provided for @share_message_no_link.
  ///
  /// In en, this message translates to:
  /// **'Try the forsan app and share our exclusive auctions with someone you love.'**
  String get share_message_no_link;

  /// No description provided for @share_message_with_link.
  ///
  /// In en, this message translates to:
  /// **'Try the forsan app and share our exclusive auctions with someone you love.\nDownload the app now: {url}'**
  String share_message_with_link(Object url);

  /// No description provided for @add_ad_created_success.
  ///
  /// In en, this message translates to:
  /// **'Ad created successfully'**
  String get add_ad_created_success;

  /// No description provided for @add_ad_payment_url_error.
  ///
  /// In en, this message translates to:
  /// **'Unable to open payment link'**
  String get add_ad_payment_url_error;

  /// No description provided for @add_ad_payment_declined.
  ///
  /// In en, this message translates to:
  /// **'Payment was declined'**
  String get add_ad_payment_declined;

  /// No description provided for @add_ad_payment_cancelled.
  ///
  /// In en, this message translates to:
  /// **'Payment was cancelled'**
  String get add_ad_payment_cancelled;

  /// No description provided for @payment_success.
  ///
  /// In en, this message translates to:
  /// **'Payment completed successfully'**
  String get payment_success;

  /// No description provided for @payment_complete_amount_title.
  ///
  /// In en, this message translates to:
  /// **'Complete Amount'**
  String get payment_complete_amount_title;

  /// No description provided for @payment_buy_paddle_title.
  ///
  /// In en, this message translates to:
  /// **'Buy Paddle'**
  String get payment_buy_paddle_title;

  /// No description provided for @payment_complete_purchase_title.
  ///
  /// In en, this message translates to:
  /// **'Complete Purchase'**
  String get payment_complete_purchase_title;

  /// No description provided for @payment_paddle_value_label.
  ///
  /// In en, this message translates to:
  /// **'Paddle value'**
  String get payment_paddle_value_label;

  /// No description provided for @payment_required_amount_label.
  ///
  /// In en, this message translates to:
  /// **'Required amount'**
  String get payment_required_amount_label;

  /// No description provided for @payment_purpose_enter_amount.
  ///
  /// In en, this message translates to:
  /// **'Please enter amount'**
  String get payment_purpose_enter_amount;

  /// No description provided for @payment_inspection_note.
  ///
  /// In en, this message translates to:
  /// **'Note: If the examination is confirmed, a bribe commission will be paid.'**
  String get payment_inspection_note;

  /// No description provided for @annual_auction_card_fallback_title.
  ///
  /// In en, this message translates to:
  /// **'Auction Name'**
  String get annual_auction_card_fallback_title;

  /// No description provided for @annual_auction_card_type_label.
  ///
  /// In en, this message translates to:
  /// **'Auction Type'**
  String get annual_auction_card_type_label;

  /// No description provided for @annual_auction_card_type_public.
  ///
  /// In en, this message translates to:
  /// **'Annual'**
  String get annual_auction_card_type_public;

  /// No description provided for @annual_auction_card_type_private.
  ///
  /// In en, this message translates to:
  /// **'Private'**
  String get annual_auction_card_type_private;

  /// No description provided for @annual_auction_card_sponsor_label.
  ///
  /// In en, this message translates to:
  /// **'Sponsored by'**
  String get annual_auction_card_sponsor_label;

  /// No description provided for @annual_auction_card_sponsor_fallback.
  ///
  /// In en, this message translates to:
  /// **'Sponsor'**
  String get annual_auction_card_sponsor_fallback;

  /// No description provided for @annual_auction_card_participants_label.
  ///
  /// In en, this message translates to:
  /// **'Participants Count'**
  String get annual_auction_card_participants_label;

  /// No description provided for @annual_auction_card_classification_label.
  ///
  /// In en, this message translates to:
  /// **'Classification'**
  String get annual_auction_card_classification_label;

  /// No description provided for @annual_auction_card_classification_fallback.
  ///
  /// In en, this message translates to:
  /// **'Classification'**
  String get annual_auction_card_classification_fallback;

  /// No description provided for @annual_auction_card_start_date_label.
  ///
  /// In en, this message translates to:
  /// **'Auction Start Date'**
  String get annual_auction_card_start_date_label;

  /// No description provided for @annual_auction_card_start_date_fallback.
  ///
  /// In en, this message translates to:
  /// **'The date will be determined later.'**
  String get annual_auction_card_start_date_fallback;

  /// No description provided for @annual_auction_card_state_label.
  ///
  /// In en, this message translates to:
  /// **'Auction Status'**
  String get annual_auction_card_state_label;

  /// No description provided for @annual_auction_card_state_sellers.
  ///
  /// In en, this message translates to:
  /// **'Open for seller registration'**
  String get annual_auction_card_state_sellers;

  /// No description provided for @annual_auction_card_state_buyers.
  ///
  /// In en, this message translates to:
  /// **'Open for buyer registration'**
  String get annual_auction_card_state_buyers;

  /// No description provided for @annual_auction_card_location_label.
  ///
  /// In en, this message translates to:
  /// **'Auction Location'**
  String get annual_auction_card_location_label;

  /// No description provided for @annual_auction_card_location_country_fallback.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get annual_auction_card_location_country_fallback;

  /// No description provided for @annual_auction_card_location_state_fallback.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get annual_auction_card_location_state_fallback;

  /// No description provided for @annual_auction_card_button_unavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get annual_auction_card_button_unavailable;

  /// No description provided for @annual_auction_card_button_show_details.
  ///
  /// In en, this message translates to:
  /// **'Show Details'**
  String get annual_auction_card_button_show_details;

  /// No description provided for @annual_auction_card_button_register_sellers.
  ///
  /// In en, this message translates to:
  /// **'Seller Registration'**
  String get annual_auction_card_button_register_sellers;

  /// No description provided for @annual_auction_card_button_register_buyers.
  ///
  /// In en, this message translates to:
  /// **'Buyer Registration'**
  String get annual_auction_card_button_register_buyers;

  /// No description provided for @annual_auction_card_button_enter_auction.
  ///
  /// In en, this message translates to:
  /// **'Enter Auction'**
  String get annual_auction_card_button_enter_auction;

  /// No description provided for @annual_auction_card_button_show_results.
  ///
  /// In en, this message translates to:
  /// **'Show Results'**
  String get annual_auction_card_button_show_results;

  /// No description provided for @annual_auction_card_status_upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get annual_auction_card_status_upcoming;

  /// No description provided for @annual_auction_card_status_live_now.
  ///
  /// In en, this message translates to:
  /// **'Live Now'**
  String get annual_auction_card_status_live_now;

  /// No description provided for @annual_auction_card_status_ended.
  ///
  /// In en, this message translates to:
  /// **'Ended'**
  String get annual_auction_card_status_ended;

  /// No description provided for @annual_auction_card_countdown_start_sellers.
  ///
  /// In en, this message translates to:
  /// **'Countdown to seller registration start'**
  String get annual_auction_card_countdown_start_sellers;

  /// No description provided for @annual_auction_card_countdown_end_sellers.
  ///
  /// In en, this message translates to:
  /// **'Countdown to seller registration end'**
  String get annual_auction_card_countdown_end_sellers;

  /// No description provided for @annual_auction_card_countdown_start_auction.
  ///
  /// In en, this message translates to:
  /// **'Countdown to auction start'**
  String get annual_auction_card_countdown_start_auction;

  /// No description provided for @annual_auction_card_countdown_end_auction.
  ///
  /// In en, this message translates to:
  /// **'Countdown to auction end'**
  String get annual_auction_card_countdown_end_auction;

  /// No description provided for @ad_card_fallback_title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get ad_card_fallback_title;

  /// No description provided for @ad_card_fallback_unique_id.
  ///
  /// In en, this message translates to:
  /// **'0000000'**
  String get ad_card_fallback_unique_id;

  /// No description provided for @ad_card_fallback_price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get ad_card_fallback_price;

  /// No description provided for @ad_card_last_price_label.
  ///
  /// In en, this message translates to:
  /// **'Last price:'**
  String get ad_card_last_price_label;

  /// No description provided for @ad_card_auction_type_electronic.
  ///
  /// In en, this message translates to:
  /// **'Electronic'**
  String get ad_card_auction_type_electronic;

  /// No description provided for @ad_card_status_pending.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get ad_card_status_pending;

  /// No description provided for @ad_card_status_accepted.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get ad_card_status_accepted;

  /// No description provided for @ad_card_status_rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get ad_card_status_rejected;

  /// No description provided for @ad_card_status_withdrawn.
  ///
  /// In en, this message translates to:
  /// **'Withdrawn'**
  String get ad_card_status_withdrawn;

  /// No description provided for @ad_card_status_sold.
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get ad_card_status_sold;

  /// No description provided for @ad_card_status_unsold.
  ///
  /// In en, this message translates to:
  /// **'Unsold'**
  String get ad_card_status_unsold;

  /// No description provided for @ad_card_status_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get ad_card_status_active;

  /// No description provided for @ad_card_status_ended.
  ///
  /// In en, this message translates to:
  /// **'Ended'**
  String get ad_card_status_ended;

  /// No description provided for @ad_card_status_live.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get ad_card_status_live;

  /// No description provided for @ad_card_status_skipped.
  ///
  /// In en, this message translates to:
  /// **'Skipped'**
  String get ad_card_status_skipped;

  /// No description provided for @transport_card_company_name.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get transport_card_company_name;

  /// No description provided for @transport_card_category_fallback.
  ///
  /// In en, this message translates to:
  /// **'Transport Category'**
  String get transport_card_category_fallback;

  /// No description provided for @transport_card_horse_transport.
  ///
  /// In en, this message translates to:
  /// **'🐎 Horse Transport'**
  String get transport_card_horse_transport;

  /// No description provided for @transport_card_camel_transport.
  ///
  /// In en, this message translates to:
  /// **'🐪 Camel Transport'**
  String get transport_card_camel_transport;

  /// No description provided for @transport_card_type_all_ksa.
  ///
  /// In en, this message translates to:
  /// **'📍 All regions of Saudi Arabia'**
  String get transport_card_type_all_ksa;

  /// No description provided for @transport_card_type_outside_ksa.
  ///
  /// In en, this message translates to:
  /// **'📍 Outside Saudi Arabia'**
  String get transport_card_type_outside_ksa;

  /// No description provided for @transport_card_location_fallback.
  ///
  /// In en, this message translates to:
  /// **'Location City - Location Country'**
  String get transport_card_location_fallback;

  /// No description provided for @transport_card_listed.
  ///
  /// In en, this message translates to:
  /// **'Listed'**
  String get transport_card_listed;

  /// No description provided for @transport_card_call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get transport_card_call;

  /// No description provided for @transport_card_transport_external.
  ///
  /// In en, this message translates to:
  /// **'External Transport'**
  String get transport_card_transport_external;

  /// No description provided for @transport_card_transport_internal.
  ///
  /// In en, this message translates to:
  /// **'Internal Transport'**
  String get transport_card_transport_internal;

  /// No description provided for @transport_card_transport_internal_external.
  ///
  /// In en, this message translates to:
  /// **'Internal & External Transport'**
  String get transport_card_transport_internal_external;

  /// No description provided for @auctions_screen_camel_title.
  ///
  /// In en, this message translates to:
  /// **'Camel Auctions'**
  String get auctions_screen_camel_title;

  /// No description provided for @auctions_screen_horse_title.
  ///
  /// In en, this message translates to:
  /// **'Horse Auctions'**
  String get auctions_screen_horse_title;

  /// No description provided for @auctions_screen_header_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the auction type to continue.'**
  String get auctions_screen_header_subtitle;

  /// No description provided for @auctions_screen_individual_title.
  ///
  /// In en, this message translates to:
  /// **'Individual Auction'**
  String get auctions_screen_individual_title;

  /// No description provided for @auctions_screen_individual_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Direct sale - one listing with full details.'**
  String get auctions_screen_individual_subtitle;

  /// No description provided for @auctions_screen_individual_badge.
  ///
  /// In en, this message translates to:
  /// **'Individual'**
  String get auctions_screen_individual_badge;

  /// No description provided for @auctions_screen_group_title.
  ///
  /// In en, this message translates to:
  /// **'Group / Annual Auction'**
  String get auctions_screen_group_title;

  /// No description provided for @auctions_screen_group_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Multiple entries - a major auction with seasonal schedule.'**
  String get auctions_screen_group_subtitle;

  /// No description provided for @auctions_screen_group_badge.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get auctions_screen_group_badge;

  /// No description provided for @partners_title.
  ///
  /// In en, this message translates to:
  /// **'Success Partners'**
  String get partners_title;

  /// No description provided for @partners_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Brands we collaborate with to deliver the best experience'**
  String get partners_subtitle;

  /// No description provided for @partner_interstitial_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get partner_interstitial_skip;

  /// No description provided for @partner_interstitial_auto_skip.
  ///
  /// In en, this message translates to:
  /// **'Ad will close in {seconds}s'**
  String partner_interstitial_auto_skip(Object seconds);

  /// No description provided for @developed_by.
  ///
  /// In en, this message translates to:
  /// **'Developed by {company}'**
  String developed_by(Object company);

  /// No description provided for @app_version.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String app_version(Object version);

  /// No description provided for @stay_logged_in.
  ///
  /// In en, this message translates to:
  /// **'Stay logged in'**
  String get stay_logged_in;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @continue_as_guest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get continue_as_guest;

  /// No description provided for @withdrawn_label.
  ///
  /// In en, this message translates to:
  /// **'Withdrawn'**
  String get withdrawn_label;

  /// No description provided for @no_auctions_available.
  ///
  /// In en, this message translates to:
  /// **'No auctions available right now'**
  String get no_auctions_available;

  /// No description provided for @no_participating_auctions.
  ///
  /// In en, this message translates to:
  /// **'No participating auctions right now'**
  String get no_participating_auctions;

  /// No description provided for @highest_price_label.
  ///
  /// In en, this message translates to:
  /// **'Highest price'**
  String get highest_price_label;

  /// No description provided for @participants_label.
  ///
  /// In en, this message translates to:
  /// **'Participants'**
  String get participants_label;

  /// No description provided for @bidder_number_label.
  ///
  /// In en, this message translates to:
  /// **'Bidder number'**
  String get bidder_number_label;

  /// No description provided for @no_offers_available.
  ///
  /// In en, this message translates to:
  /// **'No offers available right now'**
  String get no_offers_available;

  /// No description provided for @ad_deleted_success.
  ///
  /// In en, this message translates to:
  /// **'Ad deleted successfully'**
  String get ad_deleted_success;

  /// No description provided for @warning_label.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning_label;

  /// No description provided for @delete_ad_not_active.
  ///
  /// In en, this message translates to:
  /// **'You can only delete the ad if it is active.'**
  String get delete_ad_not_active;

  /// No description provided for @group_auction_label.
  ///
  /// In en, this message translates to:
  /// **'Group auction'**
  String get group_auction_label;

  /// No description provided for @select_country_label.
  ///
  /// In en, this message translates to:
  /// **'Select country'**
  String get select_country_label;

  /// No description provided for @select_city_label.
  ///
  /// In en, this message translates to:
  /// **'Select city'**
  String get select_city_label;

  /// No description provided for @select_type_label.
  ///
  /// In en, this message translates to:
  /// **'Select type'**
  String get select_type_label;

  /// No description provided for @training_usage_label.
  ///
  /// In en, this message translates to:
  /// **'Training/Usage'**
  String get training_usage_label;

  /// No description provided for @select_training_usage_label.
  ///
  /// In en, this message translates to:
  /// **'Select training/usage'**
  String get select_training_usage_label;

  /// No description provided for @from_birth_date_label.
  ///
  /// In en, this message translates to:
  /// **'From birth date'**
  String get from_birth_date_label;

  /// No description provided for @to_birth_date_label.
  ///
  /// In en, this message translates to:
  /// **'To birth date'**
  String get to_birth_date_label;

  /// No description provided for @height_cm_label.
  ///
  /// In en, this message translates to:
  /// **'Height (cm)'**
  String get height_cm_label;

  /// No description provided for @height_cm_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter height (cm)'**
  String get height_cm_placeholder;

  /// No description provided for @main_image_label.
  ///
  /// In en, this message translates to:
  /// **'Main image'**
  String get main_image_label;

  /// No description provided for @add_main_image_help.
  ///
  /// In en, this message translates to:
  /// **'Add the main ad image'**
  String get add_main_image_help;

  /// No description provided for @main_video_label.
  ///
  /// In en, this message translates to:
  /// **'Main video'**
  String get main_video_label;

  /// No description provided for @add_main_video_help.
  ///
  /// In en, this message translates to:
  /// **'Add the main ad video'**
  String get add_main_video_help;

  /// No description provided for @additional_images_label.
  ///
  /// In en, this message translates to:
  /// **'Additional images'**
  String get additional_images_label;

  /// No description provided for @additional_images_required_help.
  ///
  /// In en, this message translates to:
  /// **'At least four images are required'**
  String get additional_images_required_help;

  /// No description provided for @current_additional_images_label.
  ///
  /// In en, this message translates to:
  /// **'Current additional images'**
  String get current_additional_images_label;

  /// No description provided for @no_additional_images_available.
  ///
  /// In en, this message translates to:
  /// **'No additional images available right now'**
  String get no_additional_images_available;

  /// No description provided for @owner_name_label.
  ///
  /// In en, this message translates to:
  /// **'Owner name'**
  String get owner_name_label;

  /// No description provided for @owner_name_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter owner\'s name'**
  String get owner_name_placeholder;

  /// No description provided for @owner_phone_label.
  ///
  /// In en, this message translates to:
  /// **'Owner phone'**
  String get owner_phone_label;

  /// No description provided for @owner_phone_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter owner\'s phone'**
  String get owner_phone_placeholder;

  /// No description provided for @edit_success_message.
  ///
  /// In en, this message translates to:
  /// **'Updated successfully'**
  String get edit_success_message;

  /// No description provided for @birth_date_select_label.
  ///
  /// In en, this message translates to:
  /// **'Select birth date'**
  String get birth_date_select_label;

  /// No description provided for @description_label.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description_label;

  /// No description provided for @no_data_available.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get no_data_available;

  /// No description provided for @sale_terms_title.
  ///
  /// In en, this message translates to:
  /// **'Sale terms'**
  String get sale_terms_title;

  /// No description provided for @auction_terms_title.
  ///
  /// In en, this message translates to:
  /// **'Auction terms'**
  String get auction_terms_title;

  /// No description provided for @sale_term_payment.
  ///
  /// In en, this message translates to:
  /// **'Payment is made via wallet or available payment methods in the system.'**
  String get sale_term_payment;

  /// No description provided for @sale_term_deposit.
  ///
  /// In en, this message translates to:
  /// **'After paying the deposit, you must complete the process within 3 days.'**
  String get sale_term_deposit;

  /// No description provided for @sale_term_shipping.
  ///
  /// In en, this message translates to:
  /// **'The buyer bears transport and veterinary inspection costs if any.'**
  String get sale_term_shipping;

  /// No description provided for @sale_term_bidder_fee.
  ///
  /// In en, this message translates to:
  /// **'The bidder fee is non-refundable after the auction is awarded to you.'**
  String get sale_term_bidder_fee;

  /// No description provided for @min_count_label.
  ///
  /// In en, this message translates to:
  /// **'Minimum count'**
  String get min_count_label;

  /// No description provided for @min_count_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter minimum count'**
  String get min_count_placeholder;

  /// No description provided for @max_count_label.
  ///
  /// In en, this message translates to:
  /// **'Maximum count'**
  String get max_count_label;

  /// No description provided for @max_count_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter maximum count'**
  String get max_count_placeholder;

  /// No description provided for @select_color_label.
  ///
  /// In en, this message translates to:
  /// **'Select color'**
  String get select_color_label;

  /// No description provided for @profile_update_success_message.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profile_update_success_message;

  /// No description provided for @high_bid_notification_label.
  ///
  /// In en, this message translates to:
  /// **'Notify when a higher bid is received'**
  String get high_bid_notification_label;

  /// No description provided for @offer_details_owner_name_label.
  ///
  /// In en, this message translates to:
  /// **'Owner name'**
  String get offer_details_owner_name_label;

  /// No description provided for @offer_details_owner_stable_label.
  ///
  /// In en, this message translates to:
  /// **'Stable name'**
  String get offer_details_owner_stable_label;

  /// No description provided for @offer_details_owner_contact_label.
  ///
  /// In en, this message translates to:
  /// **'Contact number'**
  String get offer_details_owner_contact_label;

  /// No description provided for @offer_details_owner_name_placeholder.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get offer_details_owner_name_placeholder;

  /// No description provided for @offer_details_owner_stable_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Stable Name Or Farm'**
  String get offer_details_owner_stable_placeholder;

  /// No description provided for @offer_details_owner_phone_placeholder.
  ///
  /// In en, this message translates to:
  /// **'+0000000000000'**
  String get offer_details_owner_phone_placeholder;

  /// No description provided for @offer_details_animal_name_label.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get offer_details_animal_name_label;

  /// No description provided for @offer_details_animal_name_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Title Or Name'**
  String get offer_details_animal_name_placeholder;

  /// No description provided for @offer_details_father_name_label.
  ///
  /// In en, this message translates to:
  /// **'Father name'**
  String get offer_details_father_name_label;

  /// No description provided for @offer_details_father_name_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Father Name'**
  String get offer_details_father_name_placeholder;

  /// No description provided for @offer_details_mother_name_label.
  ///
  /// In en, this message translates to:
  /// **'Mother name'**
  String get offer_details_mother_name_label;

  /// No description provided for @offer_details_mother_name_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Mother Name'**
  String get offer_details_mother_name_placeholder;

  /// No description provided for @offer_details_mother_father_name_label.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s father name'**
  String get offer_details_mother_father_name_label;

  /// No description provided for @offer_details_mother_father_name_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Father Mother Name'**
  String get offer_details_mother_father_name_placeholder;

  /// No description provided for @offer_details_birth_date_label.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get offer_details_birth_date_label;

  /// No description provided for @offer_details_height_label.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get offer_details_height_label;

  /// No description provided for @offer_details_height_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get offer_details_height_placeholder;

  /// No description provided for @offer_details_gender_label.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get offer_details_gender_label;

  /// No description provided for @offer_details_gender_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Gender (M/F)'**
  String get offer_details_gender_placeholder;

  /// No description provided for @offer_details_color_label.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get offer_details_color_label;

  /// No description provided for @offer_details_color_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Animal Color'**
  String get offer_details_color_placeholder;

  /// No description provided for @offer_details_usage_label.
  ///
  /// In en, this message translates to:
  /// **'Animal usage'**
  String get offer_details_usage_label;

  /// No description provided for @offer_details_usage_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Animal Usage'**
  String get offer_details_usage_placeholder;

  /// No description provided for @offer_details_count_label.
  ///
  /// In en, this message translates to:
  /// **'Count'**
  String get offer_details_count_label;

  /// No description provided for @offer_details_group_count_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Group members count'**
  String get offer_details_group_count_placeholder;

  /// No description provided for @offer_details_state_fallback.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get offer_details_state_fallback;

  /// No description provided for @offer_details_country_fallback.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get offer_details_country_fallback;

  /// No description provided for @offer_details_owner_info_title.
  ///
  /// In en, this message translates to:
  /// **'Owner information'**
  String get offer_details_owner_info_title;

  /// No description provided for @offer_details_offer_info_title.
  ///
  /// In en, this message translates to:
  /// **'Offer information'**
  String get offer_details_offer_info_title;

  /// No description provided for @offer_details_verified_badge.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get offer_details_verified_badge;

  /// No description provided for @offer_details_photos_title.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get offer_details_photos_title;

  /// No description provided for @offer_details_video_title.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get offer_details_video_title;

  /// No description provided for @offer_details_videos_title.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get offer_details_videos_title;

  /// No description provided for @offer_details_description_title.
  ///
  /// In en, this message translates to:
  /// **'Offer description'**
  String get offer_details_description_title;

  /// No description provided for @offer_details_photo_gallery_title.
  ///
  /// In en, this message translates to:
  /// **'Photo gallery'**
  String get offer_details_photo_gallery_title;

  /// No description provided for @offer_details_price_label.
  ///
  /// In en, this message translates to:
  /// **'Price: '**
  String get offer_details_price_label;

  /// No description provided for @offer_details_deposit_label.
  ///
  /// In en, this message translates to:
  /// **'deposit: '**
  String get offer_details_deposit_label;

  /// No description provided for @offer_details_buy_now.
  ///
  /// In en, this message translates to:
  /// **'Buy now'**
  String get offer_details_buy_now;

  /// No description provided for @auction_state_upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get auction_state_upcoming;

  /// No description provided for @auction_state_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get auction_state_active;

  /// No description provided for @auction_state_ended.
  ///
  /// In en, this message translates to:
  /// **'Ended'**
  String get auction_state_ended;

  /// No description provided for @auction_state_live.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get auction_state_live;

  /// No description provided for @auction_state_closed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get auction_state_closed;

  /// No description provided for @add_ad_untitled.
  ///
  /// In en, this message translates to:
  /// **'Untitled ad'**
  String get add_ad_untitled;

  /// No description provided for @add_ad_location_not_set.
  ///
  /// In en, this message translates to:
  /// **'Location not set'**
  String get add_ad_location_not_set;

  /// No description provided for @add_ad_city_number.
  ///
  /// In en, this message translates to:
  /// **'City #{stateId}'**
  String add_ad_city_number(int stateId);

  /// No description provided for @add_ad_offer_type.
  ///
  /// In en, this message translates to:
  /// **'Offer type'**
  String get add_ad_offer_type;

  /// No description provided for @count.
  ///
  /// In en, this message translates to:
  /// **'Count'**
  String get count;

  /// No description provided for @camels.
  ///
  /// In en, this message translates to:
  /// **'Camels'**
  String get camels;

  /// No description provided for @not_available.
  ///
  /// In en, this message translates to:
  /// **'Not available'**
  String get not_available;

  /// No description provided for @saudi_arabia.
  ///
  /// In en, this message translates to:
  /// **'Kingdom of Saudi Arabia'**
  String get saudi_arabia;

  /// No description provided for @cm_unit.
  ///
  /// In en, this message translates to:
  /// **'cm'**
  String get cm_unit;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @no_results_available.
  ///
  /// In en, this message translates to:
  /// **'No results are currently available'**
  String get no_results_available;

  /// No description provided for @add_ad_video_link.
  ///
  /// In en, this message translates to:
  /// **'Link {index}'**
  String add_ad_video_link(int index);

  /// No description provided for @add_ad_main_image_hint.
  ///
  /// In en, this message translates to:
  /// **'Add the main image for the ad — max size 10 MB.'**
  String get add_ad_main_image_hint;

  /// No description provided for @add_ad_main_video_hint.
  ///
  /// In en, this message translates to:
  /// **'Add the main ad video (up to 10 MB).'**
  String get add_ad_main_video_hint;

  /// No description provided for @add_ad_extra_images_title.
  ///
  /// In en, this message translates to:
  /// **'Additional images'**
  String get add_ad_extra_images_title;

  /// No description provided for @add_ad_extra_images_hint.
  ///
  /// In en, this message translates to:
  /// **'At least four images are required, each no more than 2 MB.'**
  String get add_ad_extra_images_hint;

  /// No description provided for @add_ad_intro_title.
  ///
  /// In en, this message translates to:
  /// **'Tell us about your ad'**
  String get add_ad_intro_title;

  /// No description provided for @add_ad_intro_subtitle.
  ///
  /// In en, this message translates to:
  /// **'🐪🐎 Add your ad now with ease!\nFill in the ad details accurately to reach the largest number of interested users.\n'**
  String get add_ad_intro_subtitle;

  /// No description provided for @add_ad_add_camels.
  ///
  /// In en, this message translates to:
  /// **'Add Camels'**
  String get add_ad_add_camels;

  /// No description provided for @add_ad_add_horses.
  ///
  /// In en, this message translates to:
  /// **'Add Horses'**
  String get add_ad_add_horses;

  /// No description provided for @add_ad_platform_camel_web_desc.
  ///
  /// In en, this message translates to:
  /// **'You can create a group auction for multiple camels with settings tailored for organized camel sales.'**
  String get add_ad_platform_camel_web_desc;

  /// No description provided for @add_ad_platform_horse_web_desc.
  ///
  /// In en, this message translates to:
  /// **'Racing, beauty, show jumping horses, and more, with next steps prepared based on horse type.'**
  String get add_ad_platform_horse_web_desc;

  /// No description provided for @add_ad_platform_camel_web_badge.
  ///
  /// In en, this message translates to:
  /// **'Individual / Group'**
  String get add_ad_platform_camel_web_badge;

  /// No description provided for @add_ad_platform_horse_web_badge.
  ///
  /// In en, this message translates to:
  /// **'Solo auction / offer'**
  String get add_ad_platform_horse_web_badge;

  /// No description provided for @add_ad_wallet_deduction.
  ///
  /// In en, this message translates to:
  /// **'Amount to be deducted from wallet'**
  String get add_ad_wallet_deduction;

  /// No description provided for @add_ad_card_required_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount required for card payment'**
  String get add_ad_card_required_amount;

  /// No description provided for @add_ad_apple_pay_required_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount required via Apple Pay'**
  String get add_ad_apple_pay_required_amount;

  /// No description provided for @add_ad_auction_fee.
  ///
  /// In en, this message translates to:
  /// **'Auction fee'**
  String get add_ad_auction_fee;

  /// No description provided for @add_ad_offer_fee.
  ///
  /// In en, this message translates to:
  /// **'Offer fee'**
  String get add_ad_offer_fee;

  /// No description provided for @add_ad_pay_before_publish.
  ///
  /// In en, this message translates to:
  /// **'Paid before publishing the ad'**
  String get add_ad_pay_before_publish;

  /// No description provided for @add_ad_note_no_refund.
  ///
  /// In en, this message translates to:
  /// **'After paying the ad fee and approval, the amount is non-refundable.'**
  String get add_ad_note_no_refund;

  /// No description provided for @add_ad_note_duration.
  ///
  /// In en, this message translates to:
  /// **'Ad duration is 30 days. Renewal requires paying the fee again to reactivate the ad.'**
  String get add_ad_note_duration;

  /// No description provided for @add_ad_pay_and_continue.
  ///
  /// In en, this message translates to:
  /// **'Pay and continue'**
  String get add_ad_pay_and_continue;

  /// No description provided for @add_ad_select_country_first.
  ///
  /// In en, this message translates to:
  /// **'Please select country first'**
  String get add_ad_select_country_first;

  /// No description provided for @add_ad_select_city.
  ///
  /// In en, this message translates to:
  /// **'Select city'**
  String get add_ad_select_city;

  /// No description provided for @add_ad_select_age.
  ///
  /// In en, this message translates to:
  /// **'Select age'**
  String get add_ad_select_age;

  /// No description provided for @add_ad_title_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter ad title'**
  String get add_ad_title_hint;

  /// No description provided for @add_ad_title_label.
  ///
  /// In en, this message translates to:
  /// **'Ad title'**
  String get add_ad_title_label;

  /// No description provided for @add_ad_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter name'**
  String get add_ad_name_hint;

  /// No description provided for @add_ad_father_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter father name'**
  String get add_ad_father_name_hint;

  /// No description provided for @add_ad_mother_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter mother name'**
  String get add_ad_mother_name_hint;

  /// No description provided for @add_ad_mother_father_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter maternal grandfather name'**
  String get add_ad_mother_father_name_hint;

  /// No description provided for @add_ad_breed_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter breed'**
  String get add_ad_breed_hint;

  /// No description provided for @add_ad_select_type.
  ///
  /// In en, this message translates to:
  /// **'Select type'**
  String get add_ad_select_type;

  /// No description provided for @add_ad_height_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter height'**
  String get add_ad_height_hint;

  /// No description provided for @add_ad_select_color.
  ///
  /// In en, this message translates to:
  /// **'Select color'**
  String get add_ad_select_color;

  /// No description provided for @add_ad_pregnant_label.
  ///
  /// In en, this message translates to:
  /// **'Pregnant'**
  String get add_ad_pregnant_label;

  /// No description provided for @add_ad_pregnancy_status_pregnant.
  ///
  /// In en, this message translates to:
  /// **'Pregnant'**
  String get add_ad_pregnancy_status_pregnant;

  /// No description provided for @add_ad_pregnancy_status_not_pregnant.
  ///
  /// In en, this message translates to:
  /// **'Not pregnant'**
  String get add_ad_pregnancy_status_not_pregnant;

  /// No description provided for @add_ad_pregnancy_status_unsure.
  ///
  /// In en, this message translates to:
  /// **'Unsure'**
  String get add_ad_pregnancy_status_unsure;

  /// No description provided for @add_ad_pregnancy_status_hint.
  ///
  /// In en, this message translates to:
  /// **'Select status'**
  String get add_ad_pregnancy_status_hint;

  /// No description provided for @add_ad_male_type.
  ///
  /// In en, this message translates to:
  /// **'Stud'**
  String get add_ad_male_type;

  /// No description provided for @add_ad_castrated_type.
  ///
  /// In en, this message translates to:
  /// **'Castrated'**
  String get add_ad_castrated_type;

  /// No description provided for @add_ad_foal_male_type.
  ///
  /// In en, this message translates to:
  /// **'Foal'**
  String get add_ad_foal_male_type;

  /// No description provided for @add_ad_foal_female_type.
  ///
  /// In en, this message translates to:
  /// **'Filly'**
  String get add_ad_foal_female_type;

  /// No description provided for @add_ad_camel_breeding_female.
  ///
  /// In en, this message translates to:
  /// **'Breeding she-camel'**
  String get add_ad_camel_breeding_female;

  /// No description provided for @add_ad_horse_breeding_female.
  ///
  /// In en, this message translates to:
  /// **'Breeding mare'**
  String get add_ad_horse_breeding_female;

  /// No description provided for @add_ad_camel_non_breeding_female.
  ///
  /// In en, this message translates to:
  /// **'She-camel'**
  String get add_ad_camel_non_breeding_female;

  /// No description provided for @add_ad_horse_non_breeding_female.
  ///
  /// In en, this message translates to:
  /// **'Mare'**
  String get add_ad_horse_non_breeding_female;

  /// No description provided for @add_ad_camel_group.
  ///
  /// In en, this message translates to:
  /// **'Camel group'**
  String get add_ad_camel_group;

  /// No description provided for @add_ad_champions.
  ///
  /// In en, this message translates to:
  /// **'Champions'**
  String get add_ad_champions;

  /// No description provided for @add_ad_select_start_date_first.
  ///
  /// In en, this message translates to:
  /// **'Please select start date first'**
  String get add_ad_select_start_date_first;

  /// No description provided for @add_ad_time_unavailable.
  ///
  /// In en, this message translates to:
  /// **'This time is unavailable, please choose another time'**
  String get add_ad_time_unavailable;

  /// No description provided for @add_ad_start_date.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get add_ad_start_date;

  /// No description provided for @add_ad_end_date.
  ///
  /// In en, this message translates to:
  /// **'End date'**
  String get add_ad_end_date;

  /// No description provided for @add_ad_auction_start_time.
  ///
  /// In en, this message translates to:
  /// **'Auction start time'**
  String get add_ad_auction_start_time;

  /// No description provided for @add_ad_auction_end_time.
  ///
  /// In en, this message translates to:
  /// **'Auction end time'**
  String get add_ad_auction_end_time;

  /// No description provided for @add_ad_unavailable_times.
  ///
  /// In en, this message translates to:
  /// **'Unavailable times'**
  String get add_ad_unavailable_times;

  /// No description provided for @add_ad_unavailable_times_desc.
  ///
  /// In en, this message translates to:
  /// **'We show booking periods so you can pick a time that doesn’t conflict with another live stream.'**
  String get add_ad_unavailable_times_desc;

  /// No description provided for @add_ad_unavailable_times_error.
  ///
  /// In en, this message translates to:
  /// **'Unable to load unavailable times, please try again later.'**
  String get add_ad_unavailable_times_error;

  /// No description provided for @add_ad_no_unavailable_times_today.
  ///
  /// In en, this message translates to:
  /// **'No reserved times for this day, you can choose the suitable time.'**
  String get add_ad_no_unavailable_times_today;

  /// No description provided for @add_ad_select_live_auction_date.
  ///
  /// In en, this message translates to:
  /// **'Select the live auction date to view reserved times.'**
  String get add_ad_select_live_auction_date;

  /// No description provided for @add_ad_choose_start_date_for_slots.
  ///
  /// In en, this message translates to:
  /// **'Choose start date to view unavailable times.'**
  String get add_ad_choose_start_date_for_slots;

  /// No description provided for @add_ad_end_time_after_start.
  ///
  /// In en, this message translates to:
  /// **'Auction end time must be later than start time'**
  String get add_ad_end_time_after_start;

  /// No description provided for @add_ad_slot_duration.
  ///
  /// In en, this message translates to:
  /// **'15-minute duration'**
  String get add_ad_slot_duration;

  /// No description provided for @add_ad_auction_opening_price.
  ///
  /// In en, this message translates to:
  /// **'Auction opening price'**
  String get add_ad_auction_opening_price;

  /// No description provided for @add_ad_auction_starts_from_price.
  ///
  /// In en, this message translates to:
  /// **'The auction will start from your selected initial price.'**
  String get add_ad_auction_starts_from_price;

  /// No description provided for @add_ad_electronic_only.
  ///
  /// In en, this message translates to:
  /// **'Electronic only'**
  String get add_ad_electronic_only;

  /// No description provided for @add_ad_entry_price.
  ///
  /// In en, this message translates to:
  /// **'Entry price'**
  String get add_ad_entry_price;

  /// No description provided for @add_ad_exit_confirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit?'**
  String get add_ad_exit_confirm;

  /// No description provided for @add_ad_live_electronic.
  ///
  /// In en, this message translates to:
  /// **'Live electronic'**
  String get add_ad_live_electronic;

  /// No description provided for @add_ad_market_entry_price.
  ///
  /// In en, this message translates to:
  /// **'Market entry price'**
  String get add_ad_market_entry_price;

  /// No description provided for @add_ad_no_additional_services.
  ///
  /// In en, this message translates to:
  /// **'No additional services are currently available.'**
  String get add_ad_no_additional_services;

  /// No description provided for @add_ad_no_usages_available.
  ///
  /// In en, this message translates to:
  /// **'No usages are currently available.'**
  String get add_ad_no_usages_available;

  /// No description provided for @add_ad_select_birth_date.
  ///
  /// In en, this message translates to:
  /// **'Select birth date'**
  String get add_ad_select_birth_date;

  /// No description provided for @add_ad_select_country.
  ///
  /// In en, this message translates to:
  /// **'Select country'**
  String get add_ad_select_country;

  /// No description provided for @add_ad_select_payment_method.
  ///
  /// In en, this message translates to:
  /// **'Please select a payment method'**
  String get add_ad_select_payment_method;

  /// No description provided for @add_ad_set_starting_price.
  ///
  /// In en, this message translates to:
  /// **'Set starting price'**
  String get add_ad_set_starting_price;

  /// No description provided for @add_ad_title.
  ///
  /// In en, this message translates to:
  /// **'Add direct offer / auction'**
  String get add_ad_title;

  /// No description provided for @add_ad_wallet_empty.
  ///
  /// In en, this message translates to:
  /// **'Wallet balance is empty'**
  String get add_ad_wallet_empty;

  /// No description provided for @offer.
  ///
  /// In en, this message translates to:
  /// **'Offer'**
  String get offer;

  /// No description provided for @annual_auction_participation_title.
  ///
  /// In en, this message translates to:
  /// **'Apply to participate in the annual auction'**
  String get annual_auction_participation_title;

  /// No description provided for @annual_auction_participation_description.
  ///
  /// In en, this message translates to:
  /// **'Let your auction shine in front of interested buyers — send your details in simple steps to secure your place this year.'**
  String get annual_auction_participation_description;

  /// No description provided for @annual_auction_owner_participation_fee_title.
  ///
  /// In en, this message translates to:
  /// **'Owner participation fee'**
  String get annual_auction_owner_participation_fee_title;

  /// No description provided for @annual_auction_owner_participation_fee_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your request is activated immediately after payment confirmation.'**
  String get annual_auction_owner_participation_fee_subtitle;

  /// No description provided for @annual_auction_premium_paddle_price_title.
  ///
  /// In en, this message translates to:
  /// **'Premium paddle price'**
  String get annual_auction_premium_paddle_price_title;

  /// No description provided for @annual_auction_normal_paddle_price_title.
  ///
  /// In en, this message translates to:
  /// **'Regular paddle price'**
  String get annual_auction_normal_paddle_price_title;

  /// No description provided for @annual_auction_paddle_price_subtitle.
  ///
  /// In en, this message translates to:
  /// **'It will be issued immediately after payment.'**
  String get annual_auction_paddle_price_subtitle;

  /// No description provided for @annual_auction_code_title.
  ///
  /// In en, this message translates to:
  /// **'Auction code'**
  String get annual_auction_code_title;

  /// No description provided for @annual_auction_code_subtitle.
  ///
  /// In en, this message translates to:
  /// **'A unique code for your auction participation.'**
  String get annual_auction_code_subtitle;

  /// No description provided for @annual_auction_terms_note.
  ///
  /// In en, this message translates to:
  /// **'You must review and agree to the terms before completing registration.'**
  String get annual_auction_terms_note;

  /// No description provided for @sold_group_mobile_card_group_number.
  ///
  /// In en, this message translates to:
  /// **'Group number'**
  String get sold_group_mobile_card_group_number;

  /// No description provided for @sold_group_mobile_card_group_name.
  ///
  /// In en, this message translates to:
  /// **'Group name'**
  String get sold_group_mobile_card_group_name;

  /// No description provided for @sold_group_mobile_card_camels_count.
  ///
  /// In en, this message translates to:
  /// **'Camels count'**
  String get sold_group_mobile_card_camels_count;

  /// No description provided for @sold_group_mobile_card_sale_status.
  ///
  /// In en, this message translates to:
  /// **'Sale status'**
  String get sold_group_mobile_card_sale_status;

  /// No description provided for @sold_group_mobile_card_seller_name.
  ///
  /// In en, this message translates to:
  /// **'Seller name'**
  String get sold_group_mobile_card_seller_name;

  /// No description provided for @sold_group_mobile_card_seller_phone.
  ///
  /// In en, this message translates to:
  /// **'Seller phone'**
  String get sold_group_mobile_card_seller_phone;

  /// No description provided for @sold_group_mobile_card_buyer_name.
  ///
  /// In en, this message translates to:
  /// **'Buyer name'**
  String get sold_group_mobile_card_buyer_name;

  /// No description provided for @sold_group_mobile_card_purchase_date.
  ///
  /// In en, this message translates to:
  /// **'Purchase date'**
  String get sold_group_mobile_card_purchase_date;

  /// No description provided for @sold_group_mobile_card_purchase_date_placeholder.
  ///
  /// In en, this message translates to:
  /// **'---'**
  String get sold_group_mobile_card_purchase_date_placeholder;

  /// No description provided for @sold_group_mobile_card_group_info_title.
  ///
  /// In en, this message translates to:
  /// **'Group information'**
  String get sold_group_mobile_card_group_info_title;

  /// No description provided for @sold_group_mobile_card_group_info_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Quick view of group data after sale'**
  String get sold_group_mobile_card_group_info_subtitle;

  /// No description provided for @sold_group_mobile_card_final_price_note.
  ///
  /// In en, this message translates to:
  /// **'The price has been approved and the auction has been closed.'**
  String get sold_group_mobile_card_final_price_note;

  /// No description provided for @account_archived_title.
  ///
  /// In en, this message translates to:
  /// **'Your account is archived'**
  String get account_archived_title;

  /// No description provided for @account_archived_description.
  ///
  /// In en, this message translates to:
  /// **'For security reasons, access to this account is currently suspended. You can sign in with another account or contact support to review the status.'**
  String get account_archived_description;

  /// No description provided for @account_archived_contact_support.
  ///
  /// In en, this message translates to:
  /// **'Contact support'**
  String get account_archived_contact_support;

  /// No description provided for @account_archived_support_unavailable.
  ///
  /// In en, this message translates to:
  /// **'Support number is currently unavailable'**
  String get account_archived_support_unavailable;

  /// No description provided for @account_archived_support_message.
  ///
  /// In en, this message translates to:
  /// **'Hello, I have an inquiry.'**
  String get account_archived_support_message;

  /// No description provided for @annual_results_day_label.
  ///
  /// In en, this message translates to:
  /// **'Day {day}'**
  String annual_results_day_label(Object day);

  /// No description provided for @no_video_for_day.
  ///
  /// In en, this message translates to:
  /// **'There is no video for day {dayNumber} at the moment'**
  String no_video_for_day(Object dayNumber);

  /// No description provided for @winner_label.
  ///
  /// In en, this message translates to:
  /// **'Winner'**
  String get winner_label;

  /// No description provided for @purchase_details_seller_info.
  ///
  /// In en, this message translates to:
  /// **'Seller information'**
  String get purchase_details_seller_info;

  /// No description provided for @purchase_details_buyer_info.
  ///
  /// In en, this message translates to:
  /// **'Buyer information'**
  String get purchase_details_buyer_info;

  /// No description provided for @purchase_details_payment_details.
  ///
  /// In en, this message translates to:
  /// **'Payment details'**
  String get purchase_details_payment_details;

  /// No description provided for @purchase_details_basic_amount.
  ///
  /// In en, this message translates to:
  /// **'Base amount'**
  String get purchase_details_basic_amount;

  /// No description provided for @purchase_details_commission_label.
  ///
  /// In en, this message translates to:
  /// **'Commission'**
  String get purchase_details_commission_label;

  /// No description provided for @purchase_details_tax_label.
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get purchase_details_tax_label;

  /// No description provided for @purchase_details_paid_amount.
  ///
  /// In en, this message translates to:
  /// **'Paid amount'**
  String get purchase_details_paid_amount;

  /// No description provided for @purchase_details_remaining_amount.
  ///
  /// In en, this message translates to:
  /// **'Remaining amount'**
  String get purchase_details_remaining_amount;

  /// No description provided for @purchase_details_final_total.
  ///
  /// In en, this message translates to:
  /// **'Final total'**
  String get purchase_details_final_total;

  /// No description provided for @purchase_details_note.
  ///
  /// In en, this message translates to:
  /// **'Note: Company commission and tax are not due and are not included in the final amount until inspection is confirmed.'**
  String get purchase_details_note;

  /// No description provided for @purchase_details_pending_inspection.
  ///
  /// In en, this message translates to:
  /// **'Pending inspection'**
  String get purchase_details_pending_inspection;

  /// No description provided for @purchase_details_pending_transfer.
  ///
  /// In en, this message translates to:
  /// **'Pending transfer and receipt'**
  String get purchase_details_pending_transfer;

  /// No description provided for @purchase_details_full_payment.
  ///
  /// In en, this message translates to:
  /// **'Full payment'**
  String get purchase_details_full_payment;

  /// No description provided for @purchase_details_paddle_price.
  ///
  /// In en, this message translates to:
  /// **'Paddle price'**
  String get purchase_details_paddle_price;

  /// No description provided for @seller_due_amount.
  ///
  /// In en, this message translates to:
  /// **'Seller Dues'**
  String get seller_due_amount;

  /// No description provided for @delete_account_screen_title.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_account_screen_title;

  /// No description provided for @delete_account_warning_title.
  ///
  /// In en, this message translates to:
  /// **'Warning before deleting account'**
  String get delete_account_warning_title;

  /// No description provided for @delete_account_warning_message.
  ///
  /// In en, this message translates to:
  /// **'Dear user, when you delete your account, your data will be deleted and cannot be restored except by contacting the support team.'**
  String get delete_account_warning_message;

  /// No description provided for @delete_account_now.
  ///
  /// In en, this message translates to:
  /// **'Delete account now'**
  String get delete_account_now;

  /// No description provided for @delete_account_confirm_message.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get delete_account_confirm_message;

  /// No description provided for @delete_account_cancel_action.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get delete_account_cancel_action;

  /// No description provided for @delete_account_confirm_action.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get delete_account_confirm_action;

  /// No description provided for @delete_account_changed_mind.
  ///
  /// In en, this message translates to:
  /// **'I changed my mind'**
  String get delete_account_changed_mind;

  /// No description provided for @home_dialog_camels_title.
  ///
  /// In en, this message translates to:
  /// **'Camel auctions'**
  String get home_dialog_camels_title;

  /// No description provided for @home_dialog_horses_title.
  ///
  /// In en, this message translates to:
  /// **'Horse auctions'**
  String get home_dialog_horses_title;

  /// No description provided for @home_dialog_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the auction type to continue.'**
  String get home_dialog_subtitle;

  /// No description provided for @home_dialog_option_single_title.
  ///
  /// In en, this message translates to:
  /// **'Single auction'**
  String get home_dialog_option_single_title;

  /// No description provided for @home_dialog_option_single_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Direct sale with one clear listing and full details.'**
  String get home_dialog_option_single_subtitle;

  /// No description provided for @home_dialog_option_single_badge.
  ///
  /// In en, this message translates to:
  /// **'Single'**
  String get home_dialog_option_single_badge;

  /// No description provided for @home_dialog_option_group_title.
  ///
  /// In en, this message translates to:
  /// **'Group / annual auction'**
  String get home_dialog_option_group_title;

  /// No description provided for @home_dialog_option_group_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Multiple participations in a large seasonal auction.'**
  String get home_dialog_option_group_subtitle;

  /// No description provided for @home_dialog_option_group_badge.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get home_dialog_option_group_badge;

  /// No description provided for @add_ad_live_electronic_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Hybrid option'**
  String get add_ad_live_electronic_subtitle;

  /// No description provided for @add_ad_electronic_only_subtitle.
  ///
  /// In en, this message translates to:
  /// **'No live attendance'**
  String get add_ad_electronic_only_subtitle;

  /// No description provided for @add_ad_show_auction_opening_price_hint.
  ///
  /// In en, this message translates to:
  /// **'Enable this option to show the auction starting price to buyers.'**
  String get add_ad_show_auction_opening_price_hint;

  /// No description provided for @add_ad_market_entry_price_visibility_hint.
  ///
  /// In en, this message translates to:
  /// **'Show or hide the market entry fee within the listing.'**
  String get add_ad_market_entry_price_visibility_hint;

  /// No description provided for @auction_sold_label.
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get auction_sold_label;

  /// No description provided for @auction_unsold_label.
  ///
  /// In en, this message translates to:
  /// **'Unsold'**
  String get auction_unsold_label;

  /// No description provided for @auction_participating_label.
  ///
  /// In en, this message translates to:
  /// **'Participating'**
  String get auction_participating_label;

  /// No description provided for @auction_withdrawn_label.
  ///
  /// In en, this message translates to:
  /// **'Withdrawn'**
  String get auction_withdrawn_label;

  /// No description provided for @auction_paddles_count_label.
  ///
  /// In en, this message translates to:
  /// **'Number of Bidders'**
  String get auction_paddles_count_label;

  /// No description provided for @property_details_title.
  ///
  /// In en, this message translates to:
  /// **'Property Details'**
  String get property_details_title;

  /// No description provided for @property_contact_advertiser.
  String get property_contact_advertiser;

  /// No description provided for @property_choose_contact_method.
  String get property_choose_contact_method;

  /// No description provided for @property_phone_call.
  String get property_phone_call;

  /// No description provided for @property_no_data.
  ///
  /// In en, this message translates to:
  /// **'No property data available'**
  String get property_no_data;

  /// No description provided for @property_skeleton_title.
  ///
  /// In en, this message translates to:
  /// **'Luxury residential apartment in a prime location'**
  String get property_skeleton_title;

  /// No description provided for @property_skeleton_description.
  ///
  /// In en, this message translates to:
  /// **'A short property overview appears while property details are loading from the server'**
  String get property_skeleton_description;

  /// No description provided for @property_about.
  ///
  /// In en, this message translates to:
  /// **'About the Property'**
  String get property_about;

  /// No description provided for @property_ad_details.
  ///
  /// In en, this message translates to:
  /// **'Advertisement Details'**
  String get property_ad_details;

  /// No description provided for @property_coverage_details.
  ///
  /// In en, this message translates to:
  /// **'Coverage Details'**
  String get property_coverage_details;

  /// No description provided for @property_price.
  ///
  /// In en, this message translates to:
  /// **'Property Price'**
  String get property_price;

  /// No description provided for @property_ownable_amount.
  ///
  /// In en, this message translates to:
  /// **'Ownable Amount'**
  String get property_ownable_amount;

  /// No description provided for @property_covered_amount.
  ///
  /// In en, this message translates to:
  /// **'Covered'**
  String get property_covered_amount;

  /// No description provided for @property_remaining_amount.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get property_remaining_amount;

  /// No description provided for @property_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get property_completed;

  /// No description provided for @property_documents.
  ///
  /// In en, this message translates to:
  /// **'Property Documents'**
  String get property_documents;

  /// No description provided for @property_document_title_deed.
  ///
  /// In en, this message translates to:
  /// **'Title Deed'**
  String get property_document_title_deed;

  /// No description provided for @property_document_valuation_report.
  ///
  /// In en, this message translates to:
  /// **'Valuation Report'**
  String get property_document_valuation_report;

  /// No description provided for @property_document_financial_study.
  ///
  /// In en, this message translates to:
  /// **'Financial Study'**
  String get property_document_financial_study;

  /// No description provided for @property_document_investment_contract.
  ///
  /// In en, this message translates to:
  /// **'Investment Contract'**
  String get property_document_investment_contract;

  /// No description provided for @property_download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get property_download;

  /// No description provided for @property_no_documents.
  ///
  /// In en, this message translates to:
  /// **'No documents available'**
  String get property_no_documents;

  /// No description provided for @property_sale_terms.
  ///
  /// In en, this message translates to:
  /// **'Sale Terms'**
  String get property_sale_terms;

  /// No description provided for @property_more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get property_more;

  /// No description provided for @property_no_sale_terms.
  ///
  /// In en, this message translates to:
  /// **'No sale terms available'**
  String get property_no_sale_terms;

  /// No description provided for @property_value.
  ///
  /// In en, this message translates to:
  /// **'Property Value'**
  String get property_value;

  /// No description provided for @property_specifications.
  ///
  /// In en, this message translates to:
  /// **'Property Specifications'**
  String get property_specifications;

  /// No description provided for @property_age.
  ///
  /// In en, this message translates to:
  /// **'Property Age'**
  String get property_age;

  /// No description provided for @property_face.
  ///
  /// In en, this message translates to:
  /// **'Property Face'**
  String get property_face;

  /// No description provided for @property_street_width.
  ///
  /// In en, this message translates to:
  /// **'Street Width'**
  String get property_street_width;

  /// No description provided for @property_title_deed_type.
  ///
  /// In en, this message translates to:
  /// **'Title Deed Type'**
  String get property_title_deed_type;

  /// No description provided for @property_usages.
  ///
  /// In en, this message translates to:
  /// **'Usages'**
  String get property_usages;

  /// No description provided for @property_utilities.
  ///
  /// In en, this message translates to:
  /// **'Utilities'**
  String get property_utilities;

  /// No description provided for @property_location_data.
  ///
  /// In en, this message translates to:
  /// **'Location Data'**
  String get property_location_data;

  /// No description provided for @property_region.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get property_region;

  /// No description provided for @property_city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get property_city;

  /// No description provided for @property_district.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get property_district;

  /// No description provided for @property_street.
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get property_street;

  /// No description provided for @property_building_number.
  ///
  /// In en, this message translates to:
  /// **'Building Number'**
  String get property_building_number;

  /// No description provided for @property_additional_number.
  ///
  /// In en, this message translates to:
  /// **'Additional Number'**
  String get property_additional_number;

  /// No description provided for @property_latitude.
  ///
  /// In en, this message translates to:
  /// **'Latitude'**
  String get property_latitude;

  /// No description provided for @property_longitude.
  ///
  /// In en, this message translates to:
  /// **'Longitude'**
  String get property_longitude;

  /// No description provided for @property_advertiser_data.
  ///
  /// In en, this message translates to:
  /// **'Advertiser Data'**
  String get property_advertiser_data;

  /// No description provided for @property_advertiser_name.
  ///
  /// In en, this message translates to:
  /// **'Advertiser Name'**
  String get property_advertiser_name;

  String get advertiser_profile_title;
  String get advertiser_unknown;
  String get advertiser_info_tab;
  String get advertiser_ads_tab;
  String get advertiser_reviews_tab;

  /// No description provided for @my_reviews.
  ///
  /// In en, this message translates to:
  /// **'My reviews'**
  String get my_reviews;

  /// No description provided for @more_desc_my_reviews.
  ///
  /// In en, this message translates to:
  /// **'View the reviews you have received'**
  String get more_desc_my_reviews;
  String get advertiser_information;
  String get advertiser_full_name;
  String get advertiser_phone;
  String get advertiser_email;
  String get advertiser_no_reviews;
  String get advertiser_rate;
  String get advertiser_rate_title;
  String get advertiser_rating_description;
  String get advertiser_rating_description_hint;
  String get advertiser_choose_rating;
  String get advertiser_send_rating;
  String advertiser_reviews_count(int count);
  String get advertiser_reviews_label;
  String get advertiser_star_rating;
  String advertiser_membership_duration(int count);
  String get advertiser_preview_reviewer_name;
  String get advertiser_preview_review_comment;

  /// No description provided for @property_mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get property_mobile_number;

  /// No description provided for @property_brokerage_license.
  ///
  /// In en, this message translates to:
  /// **'Brokerage License'**
  String get property_brokerage_license;

  /// No description provided for @property_employee_name.
  ///
  /// In en, this message translates to:
  /// **'Employee Name'**
  String get property_employee_name;

  /// No description provided for @property_employee_mobile.
  ///
  /// In en, this message translates to:
  /// **'Employee Mobile'**
  String get property_employee_mobile;

  /// No description provided for @property_license_data.
  ///
  /// In en, this message translates to:
  /// **'License Data'**
  String get property_license_data;

  /// No description provided for @property_end_date.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get property_end_date;

  /// No description provided for @property_ad_channels.
  ///
  /// In en, this message translates to:
  /// **'Advertisement Channels'**
  String get property_ad_channels;

  /// No description provided for @property_ad_license_link.
  ///
  /// In en, this message translates to:
  /// **'Advertisement License Link'**
  String get property_ad_license_link;

  /// No description provided for @property_attributes.
  ///
  /// In en, this message translates to:
  /// **'Property Attributes'**
  String get property_attributes;

  /// No description provided for @property_no_data_available.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get property_no_data_available;

  /// No description provided for @property_meter_unit.
  ///
  /// In en, this message translates to:
  /// **'m'**
  String get property_meter_unit;

  /// No description provided for @property_details_summary.
  ///
  /// In en, this message translates to:
  /// **'Property Details'**
  String get property_details_summary;

  /// No description provided for @property_area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get property_area;

  /// No description provided for @property_type.
  ///
  /// In en, this message translates to:
  /// **'Property Type'**
  String get property_type;

  /// No description provided for @property_ad_license_number.
  ///
  /// In en, this message translates to:
  /// **'Advertisement License Number'**
  String get property_ad_license_number;

  /// No description provided for @property_available_ownership_percentage.
  ///
  /// In en, this message translates to:
  /// **'Available Ownership Percentage'**
  String get property_available_ownership_percentage;

  /// No description provided for @property_ownership_details.
  ///
  /// In en, this message translates to:
  /// **'Ownership Details'**
  String get property_ownership_details;

  /// No description provided for @property_ownership_percentage.
  ///
  /// In en, this message translates to:
  /// **'Ownership Percentage'**
  String get property_ownership_percentage;

  /// No description provided for @property_total_investment.
  ///
  /// In en, this message translates to:
  /// **'Total Investment'**
  String get property_total_investment;

  /// No description provided for @property_timeline.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get property_timeline;

  /// No description provided for @property_ownership_registration.
  ///
  /// In en, this message translates to:
  /// **'Ownership Registration'**
  String get property_ownership_registration;

  /// No description provided for @property_partial_purchase.
  ///
  /// In en, this message translates to:
  /// **'Partial Purchase'**
  String get property_partial_purchase;

  /// No description provided for @property_opportunity_listed.
  ///
  /// In en, this message translates to:
  /// **'Opportunity Listed'**
  String get property_opportunity_listed;

  /// No description provided for @property_opportunity_listed_desc.
  ///
  /// In en, this message translates to:
  /// **'The opportunity has been listed and is now available for fractional ownership'**
  String get property_opportunity_listed_desc;

  /// No description provided for @property_opportunity_opened.
  ///
  /// In en, this message translates to:
  /// **'Opportunity Opened'**
  String get property_opportunity_opened;

  /// No description provided for @property_opportunity_opened_desc.
  ///
  /// In en, this message translates to:
  /// **'The opportunity is now open for ownership'**
  String get property_opportunity_opened_desc;

  /// No description provided for @property_funding_completed.
  ///
  /// In en, this message translates to:
  /// **'Funding Completed'**
  String get property_funding_completed;

  /// No description provided for @property_funding_completed_desc.
  ///
  /// In en, this message translates to:
  /// **'The opportunity has reached 100% funding'**
  String get property_funding_completed_desc;

  /// No description provided for @property_opportunity_closed.
  ///
  /// In en, this message translates to:
  /// **'Opportunity Closed'**
  String get property_opportunity_closed;

  /// No description provided for @property_opportunity_closed_desc.
  ///
  /// In en, this message translates to:
  /// **'The opportunity has been closed and ownership certificates have been issued'**
  String get property_opportunity_closed_desc;

  /// No description provided for @property_purchased_prefix.
  ///
  /// In en, this message translates to:
  /// **'Purchased '**
  String get property_purchased_prefix;

  /// No description provided for @property_purchased_amount_connector.
  ///
  /// In en, this message translates to:
  /// **' for '**
  String get property_purchased_amount_connector;

  /// No description provided for @property_riyal.
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get property_riyal;

  /// No description provided for @property_registered_prefix.
  ///
  /// In en, this message translates to:
  /// **'Registered ownership of '**
  String get property_registered_prefix;

  /// No description provided for @property_registered_suffix.
  ///
  /// In en, this message translates to:
  /// **' of the property'**
  String get property_registered_suffix;

  /// No description provided for @property_list_separator.
  ///
  /// In en, this message translates to:
  /// **', '**
  String get property_list_separator;

  String get add_property_title;

  String add_property_step(int current, int total);

  String get add_property_listing_title;

  String get add_property_listing_subtitle;

  String get add_property_listing_type;

  String get add_property_operation_type;

  String get add_property_for_sale;

  String get add_property_for_rent;

  String get add_property_property_type;

  String get add_property_apartment;

  String get add_property_villa;

  String get add_property_arabic_house;

  String get add_property_building;

  String get add_property_chalet;

  String get add_property_land;

  String get add_property_office;

  String get add_property_commercial_shop;

  String get add_property_farm;

  String get add_property_warehouse;

  String get add_property_advertiser_type;

  String get add_property_advertiser_owner;

  String get add_property_advertiser_agent;

  String get add_property_select_hint;

  String get add_property_governorate;

  String get add_property_district_hint;

  String get add_property_map_location;

  String get add_property_riyadh_province;

  String get add_property_makkah_province;

  String get add_property_eastern_province;

  String get add_property_riyadh_city;

  String get add_property_jeddah_city;

  String get add_property_dammam_city;

  String get add_property_location_title;

  String get add_property_location_subtitle;

  String get add_property_city;

  String get add_property_district;

  String get add_property_details_title;

  String get add_property_details_subtitle;

  String get add_property_ad_title;

  String get add_property_description;

  String get add_property_area;

  String get add_property_price;

  String get add_property_review_title;

  String get add_property_review_subtitle;

  String get add_property_required;

  String get add_property_positive_number;

  String get add_property_previous;

  String get add_property_continue;

  String get add_property_publish;

  String get add_property_success;

  String get add_property_discard_title;

  String get add_property_discard_message;

  String get add_property_keep_editing;

  String get add_property_discard;

  String get add_property_bedrooms;

  String get add_property_bathrooms;

  String get add_property_features_title;

  String get add_property_features_subtitle;

  String get add_property_feature_parking;

  String get add_property_feature_elevator;

  String get add_property_feature_pool;

  String get add_property_feature_garden;

  String get add_property_feature_security;

  String get add_property_feature_furnished;

  String get add_property_media_title;

  String get add_property_media_subtitle;

  String get add_property_add_photos;

  String get add_property_remove_photo;

  /// No description provided for @add_property_price_label.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get add_property_price_label;

  /// No description provided for @add_property_currency_sar.
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get add_property_currency_sar;

  /// No description provided for @add_property_price_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter the price'**
  String get add_property_price_hint;

  /// No description provided for @add_property_ad_title_hint.
  ///
  /// In en, this message translates to:
  /// **'Example: New apartment for sale'**
  String get add_property_ad_title_hint;

  /// No description provided for @add_property_description_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter description'**
  String get add_property_description_hint;

  /// No description provided for @add_property_price_info_note.
  ///
  /// In en, this message translates to:
  /// **'Note: Use a clear, appealing title and describe the key features to attract more interested buyers.'**
  String get add_property_price_info_note;

  /// No description provided for @add_property_conditions_title.
  ///
  /// In en, this message translates to:
  /// **'Listing conditions (optional)'**
  String get add_property_conditions_title;

  /// No description provided for @add_property_conditions_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Add conditions the buyer / tenant should know'**
  String get add_property_conditions_subtitle;

  /// No description provided for @add_property_condition_as_is.
  ///
  /// In en, this message translates to:
  /// **'Property as-is condition'**
  String get add_property_condition_as_is;

  /// No description provided for @add_property_condition_bank_transfer.
  ///
  /// In en, this message translates to:
  /// **'Payment by bank transfer'**
  String get add_property_condition_bank_transfer;

  /// No description provided for @add_property_condition_viewing.
  ///
  /// In en, this message translates to:
  /// **'Property viewing'**
  String get add_property_condition_viewing;

  /// No description provided for @add_property_condition_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter a condition'**
  String get add_property_condition_hint;

  /// No description provided for @add_property_add_condition.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add_property_add_condition;

  String get add_property_price_title;

  String get add_property_price_subtitle;

  String get add_property_location_progress;

  /// No description provided for @add_property_address_progress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get add_property_address_progress;

  String get add_property_details_progress;

  String get add_property_features_progress;

  String get add_property_media_progress;

  String get add_property_price_progress;

  String get add_property_review_progress;

  String get property_owner_pending_title;

  String get property_owner_pending_description;

  String get property_owner_rejected_title;

  String get property_owner_rejected_description;

  String property_owner_rejection_reason(Object reason);

  String get property_owner_draft_title;

  String get property_owner_draft_description;

  /// Label for opening the property's video from its image gallery.
  ///
  /// In en, this message translates to:
  /// **'Watch video'**
  String get property_gallery_view_video;

  String get customerServiceTitle;

  String get customerServiceContactVia;

  String get customerServiceWhatsapp;

  String get customerServiceCall;

  String get customerServiceSocialHint;

  /// No description provided for @account_verification_title.
  ///
  /// In en, this message translates to:
  /// **'Account verification'**
  String get account_verification_title;

  /// No description provided for @account_verification_id_front.
  ///
  /// In en, this message translates to:
  /// **'ID image - front'**
  String get account_verification_id_front;

  /// No description provided for @account_verification_id_front_hint.
  ///
  /// In en, this message translates to:
  /// **'Please add a photo of the front of your ID'**
  String get account_verification_id_front_hint;

  /// No description provided for @account_verification_id_back.
  ///
  /// In en, this message translates to:
  /// **'ID image - back'**
  String get account_verification_id_back;

  /// No description provided for @account_verification_id_back_hint.
  ///
  /// In en, this message translates to:
  /// **'Please add a photo of the back of your ID'**
  String get account_verification_id_back_hint;

  /// No description provided for @account_verification_commercial_record.
  ///
  /// In en, this message translates to:
  /// **'Commercial registration'**
  String get account_verification_commercial_record;

  /// No description provided for @account_verification_commercial_record_hint.
  ///
  /// In en, this message translates to:
  /// **'Please add a clear image of a valid commercial registration'**
  String get account_verification_commercial_record_hint;

  /// No description provided for @account_verification_add_image.
  ///
  /// In en, this message translates to:
  /// **'Add image'**
  String get account_verification_add_image;

  /// No description provided for @account_verification_registration_number.
  ///
  /// In en, this message translates to:
  /// **'Commercial registration number'**
  String get account_verification_registration_number;

  /// No description provided for @account_verification_registration_number_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter the commercial registration number'**
  String get account_verification_registration_number_hint;

  /// No description provided for @account_verification_upload_note.
  ///
  /// In en, this message translates to:
  /// **'Images must be clear and in color (PNG - JPG). Maximum image size is 5MB.'**
  String get account_verification_upload_note;

  /// No description provided for @account_verification_submit.
  ///
  /// In en, this message translates to:
  /// **'Submit request'**
  String get account_verification_submit;

  /// No description provided for @account_verification_request_sent.
  ///
  /// In en, this message translates to:
  /// **'Verification request submitted'**
  String get account_verification_request_sent;

  /// No description provided for @account_verification_success_title.
  ///
  /// In en, this message translates to:
  /// **'Verification request submitted'**
  String get account_verification_success_title;

  /// No description provided for @account_verification_success_message.
  ///
  /// In en, this message translates to:
  /// **'Your request is under review. We will notify you of the result as soon as possible.'**
  String get account_verification_success_message;

  /// No description provided for @account_verification_back_home.
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get account_verification_back_home;

  /// No description provided for @account_verification_verified_title.
  ///
  /// In en, this message translates to:
  /// **'Your account is verified'**
  String get account_verification_verified_title;

  /// No description provided for @account_verification_verified_description.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! Your account has been verified and the verification badge will appear on your profile.'**
  String get account_verification_verified_description;

  /// No description provided for @account_verification_under_review_title.
  ///
  /// In en, this message translates to:
  /// **'Under review'**
  String get account_verification_under_review_title;

  /// No description provided for @account_verification_under_review_description.
  ///
  /// In en, this message translates to:
  /// **'Your verification request has been received and the team is reviewing the documents.'**
  String get account_verification_under_review_description;

  /// No description provided for @account_verification_rejected_title.
  ///
  /// In en, this message translates to:
  /// **'Verification request rejected'**
  String get account_verification_rejected_title;

  /// No description provided for @account_verification_rejected_description.
  ///
  /// In en, this message translates to:
  /// **'Sorry, we could not verify your account because there is an issue with the uploaded documents.'**
  String get account_verification_rejected_description;

  /// No description provided for @account_verification_rejection_reason.
  ///
  /// In en, this message translates to:
  /// **'Rejection reason: Please use clear, high-quality images.'**
  String get account_verification_rejection_reason;

  /// No description provided for @account_verification_submission_date.
  ///
  /// In en, this message translates to:
  /// **'Request date'**
  String get account_verification_submission_date;

  /// No description provided for @account_verification_approval_date.
  ///
  /// In en, this message translates to:
  /// **'Approval date'**
  String get account_verification_approval_date;

  /// No description provided for @account_verification_rejection_date.
  ///
  /// In en, this message translates to:
  /// **'Rejection date'**
  String get account_verification_rejection_date;

  /// No description provided for @account_verification_resubmit.
  ///
  /// In en, this message translates to:
  /// **'Resubmit request'**
  String get account_verification_resubmit;

  String get order_details;

  String get order_summary;

  String get order_submitter;

  String get order_date;

  String get order_service;

  String get order_service_type;

  String get order_fees;

  String get order_submitter_abroad;

  String get order_business_establishment;

  String get order_fees_after_review;

  String get order_stages;

  String get order_documents;

  String get order_required_action;

  String get order_required_documents_message;

  String get order_complete_requirements;

  /// No description provided for @complete_requirements_notice.
  ///
  /// In en, this message translates to:
  /// **'The following documents are required to complete your order review.\nAfter all documents are uploaded, they will be reviewed by the Forsan team.'**
  String get complete_requirements_notice;


  String get complete_requirements_documents_title;

  String get complete_requirements_conviction_certificate;

  String get complete_requirements_upload;

  String get complete_requirements_upload_hint;


  String get complete_requirements_confirm;

  String get order_contact_consultant;


  String get order_attached_documents;

  String get order_price_quote;


  String get order_approve_and_pay;

  String get order_document_passport;

  String get order_document_commercial_record;

  String get order_document_identity;

  String get order_document_company_address;

  String get order_document_status_approved;

  String get order_document_status_rejected;

  String get order_document_status_under_review;

  String get order_document_status_required;

  String get order_document_status_not_required;

  String get order_stage_received_title;

  String get order_stage_received_description;

  String get order_stage_review_title;

  String get order_stage_review_description;

  String get order_stage_documents_title;

  String get order_stage_documents_description;

  String get order_stage_quote_title;

  String get order_stage_quote_description;

  String get order_stage_payment_title;

  String get order_stage_payment_description;

  String get order_stage_execution_title;

  String get order_stage_execution_description;

  String get order_stage_completion_title;

  String get order_stage_completion_description;

  String get order_stage_sample_date;

  String get create_order_title;

  String get create_order_choose_service;

  String get create_order_licensing;

  String get create_order_business_setup;

  String get create_order_company_management;

  String get create_order_property;

  String get create_order_investment;

  String get create_order_expatriate_services;

  String get create_order_help_title;

  String get create_order_help_description;
  String get new_order_title;

  String get new_order_step_establishment;

  String get new_order_step_applicant;

  String get new_order_establishment_title;

  String get new_order_establishment_description;

  String get new_order_new_company;

  String get new_order_company_branch;

  String get new_order_contact_identity_title;

  String get new_order_contact_identity_description;

  String get new_order_full_name;

  String get new_order_full_name_hint;

  String get new_order_father_name;
  String get new_order_father_name_hint;
  String get new_order_nationality;
  String get new_order_select_hint;
  String get new_order_male;
  String get new_order_female;
  String get new_order_syrian_nationality;
  String get new_order_non_syrian_nationality;
  String get new_order_passport_number_optional;
  String get new_order_passport_number_hint;
  String get new_order_national_id;
  String get new_order_national_id_hint;
  String get new_order_mobile_number;
  String get new_order_mobile_number_hint;
  String get new_order_whatsapp_number;
  String get new_order_whatsapp_number_hint;
  String get new_order_email;
  String get new_order_email_hint;

  String get new_order_next;

  String get new_order_submit;

  String get new_order_one_person_company;

  String get new_order_one_person_company_description;

  String get new_order_limited_liability_company;

  String get new_order_limited_liability_company_description;

  String get new_order_foreign_partner_company;

  String get new_order_foreign_partner_company_description;

  String get new_order_individual_establishment;

  String get new_order_individual_establishment_description;

  String get new_order_joint_stock_company;

  String get new_order_joint_stock_company_description;

  String get new_order_applicant_role_title;

  String get new_order_applicant_role_description;

  String get new_order_syrian_citizen;

  String get new_order_syrian_citizen_description;

  String get new_order_expatriate;

  String get new_order_expatriate_description;

  String get new_order_foreign_investor;

  String get new_order_foreign_investor_description;

  String get new_order_company_representative;

  String get new_order_company_representative_description;

}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
