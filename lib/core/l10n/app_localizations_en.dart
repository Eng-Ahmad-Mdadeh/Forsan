// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'forsan Platform';

  @override
  String get home => 'Return to Home';

  @override
  String get horses_platform => 'Horses Platform';

  @override
  String get camels_platform => 'Camels Platform';

  @override
  String get mass_auctions => 'Mass Auctions';

  @override
  String get mass_horse_auctions => 'Mass Horse Auctions';

  @override
  String get mass_camel_auctions => 'Mass Camel Auctions';

  @override
  String get services => 'Services';

  @override
  String get download_catalog => 'Download Catalog';

  @override
  String get i_agree_to_the => 'I agree to the';

  @override
  String get terms_and_conditions => 'terms and conditions';

  @override
  String get direct_electronic => 'Direct electronic';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get medical_services => 'Medical Services';

  @override
  String get transport_services => 'Transport Services';

  @override
  String get animal_products => 'Products';

  @override
  String get statistics => 'Statistics';

  @override
  String get contact_us => 'Contact Us';

  @override
  String get offers => 'Offers';

  @override
  String get auctions => 'Auctions';

  @override
  String get menu => 'Menu';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get tap_back_again_to_leave => 'Tap back again to leave';

  @override
  String get choose_language => 'Choose Language';

  @override
  String get language_arabic => 'Arabic';

  @override
  String get language_english => 'English';

  @override
  String get logout_success => ' Logged out successfully';

  @override
  String get logout_failed => ' Logout failed on server';

  @override
  String get logout_error => 'An error occurred during logout';

  @override
  String get title => 'Server Error';

  @override
  String get medical_services_title => 'Medical Services';

  @override
  String get medical_services_desc => 'Certified reports before sale.';

  @override
  String get transport_services_title => 'Transport Services';

  @override
  String get transport_services_desc => 'Safe transport with live tracking.';

  @override
  String get animal_products_title => 'Horse & Camel Products';

  @override
  String get animal_products_desc => 'Reliable and high-quality products.';

  @override
  String auction_card_time_left(Object time) {
    return 'Ends in $time';
  }

  @override
  String get auction_card_title => 'Horse 101 — \"Al-Hail\"';

  @override
  String auction_card_breed_age(Object breed, Object age) {
    return '$breed: Breed • $age: Age';
  }

  @override
  String get auction_card_join_now => 'Join Now';

  @override
  String get banner_default_title_html =>
      '<h2 style=\"color: #9C27B0;\">Advanced horse & camel auctions platform</h2>';

  @override
  String get banner_default_body_html =>
      '<p>Live auctions and fixed offers with veterinary checks and certified transport</p>';

  @override
  String get banner_default_button => 'Click';

  @override
  String get mass_auction_badge => 'Mass Auction';

  @override
  String get mass_auction_title => 'Horse Auction — Managed by forsan';

  @override
  String get countdown_label => 'Countdown';

  @override
  String get event_short_description =>
      'Starts in two months, 3-day event, 15 minutes per horse';

  @override
  String get download_booklet => 'Download Booklet';

  @override
  String get event_details => 'Event Details';

  @override
  String platform_sponsored_by(Object name) {
    return 'Sponsored by: $name';
  }

  @override
  String get live_auctions_title => 'Live Auctions';

  @override
  String get live_auctions_desc => 'Real-time bidding via live streaming.';

  @override
  String get subtitle =>
      'Here you can follow the latest updates and messages about your listings and auctions.';

  @override
  String get all => 'All';

  @override
  String get home_properties_title => 'Properties';

  @override
  String get properties_my_properties_title => 'My Properties';

  @override
  String get properties_filter_completed => 'Completed';

  @override
  String get properties_filter_active => 'Active';

  @override
  String get properties_total_count => 'Properties Count';

  @override
  String get properties_filter_accepted => 'Accepted';

  @override
  String get properties_filter_pending => 'Pending';

  @override
  String get properties_filter_draft => 'Draft';

  @override
  String get property_card_status_accepted => 'Accepted';

  @override
  String get property_card_status_pending => 'Pending';

  @override
  String get property_card_status_rejected => 'Rejected';

  @override
  String get property_card_status_draft => 'Draft';

  @override
  String get properties_total_value => 'Total Properties Value';

  @override
  String get properties_upcoming_returns => 'Upcoming Returns';

  @override
  String get properties_realized_returns => 'Realized Returns';

  @override
  String get properties_empty_title => 'You have not started your ownership journey yet';

  @override
  String get properties_empty_message => 'You do not have any properties yet. Browse available opportunities and start owning with ease.';

  @override
  String get properties_skeleton_apartment => 'Luxury Residential Apartment';

  @override
  String get properties_skeleton_villa => 'Elegant Residential Villa';

  @override
  String get properties_skeleton_floor => 'Luxury Independent Floor';

  @override
  String get home_welcome => 'Welcome';

  @override
  String get home_search_title => 'Looking for a property?';

  @override
  String get home_search_subtitle =>
      'Any location, any price, any property';

  @override
  String home_welcome_user(Object name) {
    return 'Welcome $name';
  }

  @override
  String get home_filter_all => 'All';

  @override
  String get home_filter_usufruct => 'Usufruct';

  @override
  String get home_filter_covered => 'Covered';

  @override
  String get cityLabel => 'City';

  @override
  String get loadMore => 'Load more';

  @override
  String get login_title => 'Login';

  @override
  String get login_description =>
      'Please enter your mobile number and choose the appropriate method to receive the verification code.';

  @override
  String get country_code_placeholder => '+966';

  @override
  String get via_sms => 'SMS';

  @override
  String get via_whatsapp => 'WhatsApp';

  @override
  String get otp_title => 'Verification Code';

  @override
  String get otp_sent_to => 'We sent a verification code to';

  @override
  String get otp_next => 'Next';

  @override
  String get otp_resend => 'Resend';

  @override
  String get complete_profile_app_bar_title => 'Complete profile';
  @override
  String get complete_profile_first_name_hint => 'Enter first name';
  @override
  String get complete_profile_last_name_hint => 'Enter last name';
  @override
  String get complete_profile_email_hint => 'Enter email';
  @override
  String get complete_profile_email_verification_title => 'Email verification';
  @override
  String complete_profile_email_verification_message(String email) => 'A verification code has been sent to $email\nPlease check it and enter the code';
  @override
  String get complete_profile_resend_code_hint => 'You can request a new code in';
  @override
  String get complete_profile_resend_code => 'Resend code';
  @override
  String get complete_profile_error_title => 'Error';


  @override
  String get complete_profile_required_field => 'This field is required';
  @override
  String get complete_profile_name_min_length => 'Name must be at least two characters';
  @override
  String get complete_profile_invalid_name => 'Please enter a valid name';
  @override
  String get complete_profile_email_required => 'Email is required';
  @override
  String get complete_profile_invalid_email => 'Please enter a valid email';
  @override
  String get complete_profile_otp_required => 'Verification code is required';
  @override
  String get complete_profile_invalid_otp => 'Verification code must be 4 digits';

  @override
  String get complete_profile_title =>
      'You must complete your personal information';

  @override
  String get first_name => 'First Name';

  @override
  String get last_name => 'Last Name';

  @override
  String get country => 'Country';

  @override
  String get city => 'City';

  @override
  String get district => 'District';

  @override
  String get enter_valid_phone => '⚠️ Please enter a valid phone number.';

  @override
  String get code_sent => '✅ Verification code sent to your number.';

  @override
  String get send_failed => '❌ Failed to send code, please try again.';

  @override
  String get login_success => '🎉 Logged in successfully';

  @override
  String get invalid_code => 'Invalid verification code, please try again.';

  @override
  String get verify_failed => '❌ Verification failed.';

  @override
  String get resent_info => '🔁 Code resent (test only).';

  @override
  String get sending => 'Sending';

  @override
  String get verifying => 'Verifying';

  @override
  String get fill_all_fields => '⚠️ Please fill in all fields.';

  @override
  String get profile_saved => '✅ Data saved successfully!';

  @override
  String get profile_save_error => '❌ Failed to save data, please try again.';

  @override
  String get saving => 'Saving';

  @override
  String get phone_number => 'Phone Number';

  @override
  String get login_required_title => 'Login Required';

  @override
  String get login_required_message =>
      'To access this page, you must be logged in. Please sign in with your account to continue.';

  @override
  String get login_now => 'Login Now';

  @override
  String get back_home => 'Back to Home';

  @override
  String get login_required_alt => 'Login icon';

  @override
  String get stable_name => 'Stable Name';

  @override
  String get full_name => 'Full Name';

  @override
  String get email => 'Email';

  @override
  String get signup_account_information => 'Account information';

  @override
  String get signup_enter_full_name => 'Please enter your full name';

  @override
  String get signup_nationality => 'Nationality';

  @override
  String get signup_select_hint => 'Please select';

  @override
  String get signup_enter_email => 'Please enter your email';

  @override
  String get signup_saudi_arabia => 'Saudi Arabia';

  @override
  String get signup_kuwait => 'Kuwait';

  @override
  String get signup_saudi => 'Saudi';

  @override
  String get signup_kuwaiti => 'Kuwaiti';

  @override
  String get gender => 'Gender';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get country_code => 'Country Code';

  @override
  String get profile_image => 'Profile Image';

  @override
  String get no_image => 'No Image';

  @override
  String get default_alt => 'Image';

  @override
  String get camel_title => 'Add Camel';

  @override
  String get horse_title => 'Add Horse';

  @override
  String get camel_offers => 'Camel Offers';

  @override
  String get camel_auctions => 'Camel Auctions';

  @override
  String get camel_offers_keyword => 'Offers';

  @override
  String get camel_auctions_keyword => 'Auction';

  @override
  String get horse_offers => 'Horse Offers';

  @override
  String get horse_auctions => 'Horse Auctions';

  @override
  String get coming_soon => 'Coming Soon';

  @override
  String get horse_badge => 'Horse Auction Managed by Abu Ubaid';

  @override
  String get camel_modal_title => 'Camel Platform — Coming Soon';

  @override
  String get camel_modal_body_1 =>
      'Sorry, the Camel Platform is launching soon.';

  @override
  String camel_modal_body_2(Object section) {
    return 'You can continue browsing or choose to go to the $section section.';
  }

  @override
  String get go_to_auctions => 'Go to Auctions';

  @override
  String get go_to_offers => 'Go to Offers';

  @override
  String get description =>
      'An unexpected error occurred on the server. Please try again later or contact support.';

  @override
  String get appstore => 'App Store';

  @override
  String get googleplay => 'Google Play';

  @override
  String get alt => 'Server error illustration';

  @override
  String get hero_title => 'Contact Us';

  @override
  String get hero_description =>
      'We are happy to serve you and listen to your feedback and inquiries.';

  @override
  String get breadcrumb_home => 'Home';

  @override
  String get breadcrumb_current => 'Contact Us';

  @override
  String get form_title => 'Send a Message';

  @override
  String get form_description =>
      'Fill in the fields below and we will get back to you during business hours.';

  @override
  String get form_success =>
      'Your message has been sent successfully. We will contact you soon.';

  @override
  String get form_fullname => 'Full Name';

  @override
  String get form_fullname_placeholder => 'e.g. Wael Al-Shammari';

  @override
  String get form_email => 'Email';

  @override
  String get form_email_placeholder => 'name@example.com';

  @override
  String get form_phone => 'Phone Number';

  @override
  String get form_topic => 'Message Subject';

  @override
  String get form_message => 'Message';

  @override
  String get form_message_placeholder => 'Write your message in detail...';

  @override
  String get form_file => 'Attachments (optional)';

  @override
  String get form_captcha => 'Verification Code';

  @override
  String get form_captcha_placeholder => 'Enter the code';

  @override
  String get form_terms => 'I agree to the';

  @override
  String get form_privacy => 'Privacy Policy';

  @override
  String get form_terms_conditions => 'Terms & Conditions';

  @override
  String get form_send => 'Send';

  @override
  String get form_clear => 'Clear';

  @override
  String get form_best_contact => 'Preferred Contact Method';

  @override
  String get choose => 'Choose a topic…';

  @override
  String get general => 'General Inquiry';

  @override
  String get auction => 'Auction Issue';

  @override
  String get transport => 'Transport Service Request';

  @override
  String get veterinary => 'Veterinary Inquiry';

  @override
  String get payment => 'Payment';

  @override
  String get suggestion => 'Improvement Suggestion';

  @override
  String get contact_info_title => 'Contact Information';

  @override
  String get contact_info_phone => 'Phone';

  @override
  String get contact_info_whatsapp => 'WhatsApp';

  @override
  String get contact_info_email => 'Email';

  @override
  String get contact_info_address => 'Address: Riyadh, Saudi Arabia';

  @override
  String get contact_info_hours => 'Working Hours: Sun–Thu 9 AM – 6 PM';

  @override
  String get map_title => 'Location';

  @override
  String get map_subtitle => '(Map)';

  @override
  String get add_listing => 'Add Listing / Auction';

  @override
  String get my_auctions => 'My Auctions';

  @override
  String get favorites => 'Favorites';

  @override
  String get live_listings => 'Live Listings';

  @override
  String get sales => 'Number of Sales Transactions';

  @override
  String get wallet => 'Wallet';

  @override
  String get payment_methods_title => 'Payment methods';

  @override
  String get notifications => 'Notifications';

  @override
  String get notifications_read_all => 'Read all';

  @override
  String get complaints => 'Complaints';

  @override
  String get reviews => 'Reviews';

  @override
  String get howToRate => 'How to rate';

  @override
  String get ratingGuideMessage =>
      'To rate a seller, you need to buy a horse or camel. After completing the amount, finishing payment, and confirming transfer, the rating interface will appear so you can leave your rating with a message.';

  @override
  String get unableToLoadReviewsNow => 'Unable to load reviews right now';

  @override
  String get noReviews => 'No reviews yet';

  @override
  String get loadMoreReviews => 'Load more reviews';

  @override
  String get viewReviews => 'View reviews';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get enable_biometrics => 'Enable biometrics';

  @override
  String get biometric_lock_disabled => 'Biometric app lock has been disabled';

  @override
  String get biometric_unavailable_message => 'This device does not support biometric authentication, or there is an issue with biometric settings';

  @override
  String get biometric_auth_reason => 'Use your fingerprint to enable app lock';

  @override
  String get biometric_auth_failed => 'Biometric authentication failed. App lock was not enabled';

  @override
  String get biometric_activation_title => 'Enable biometrics';

  @override
  String get biometric_activation_description => 'Use fingerprint or face recognition to access your account faster and more securely';

  @override
  String get enable => 'Enable';

  @override
  String get later => 'Later';

  @override
  String get profile => 'Profile';

  @override
  String get live_listings_count => 'Number of Live Listings';

  @override
  String get auctions_count => 'Number of Auctions';

  @override
  String get total_due => 'Total Amount Due';

  @override
  String get pending_transfers => 'Pending Transfers';

  @override
  String get image => 'Image';

  @override
  String get type => 'Type';

  @override
  String get start_date => 'Start Date';

  @override
  String get subscribers => 'Subscribers';

  @override
  String get status => 'Status';

  @override
  String get status_live => 'LIVE';

  @override
  String get status_upcoming => 'Upcoming';

  @override
  String get status_finished => 'Finished';

  @override
  String get enter_market => 'Enter Market';

  @override
  String get delay_auction => 'Postpone Auction';

  @override
  String get delete_auction => 'Delete Auction';

  @override
  String get confirm_delete => 'Are you sure you want to delete this auction?';

  @override
  String market_alert(Object id) {
    return 'Entered the market for auction #$id';
  }

  @override
  String delay_alert(Object id) {
    return 'Auction #$id has been postponed';
  }

  @override
  String delete_alert(Object id) {
    return 'Auction #$id has been deleted';
  }

  @override
  String get empty => 'No favorite ads currently ❤️';

  @override
  String get horse => 'Horse';

  @override
  String get camel => 'Camel';

  @override
  String get currency => 'SAR';

  @override
  String get dash_placeholder => '—';

  @override
  String get official_documents => 'Official documents';

  @override
  String get medical_exam_certificate => 'Veterinary exam certificate';

  @override
  String get owner_document => 'Owner document';

  @override
  String get horse_certificate => 'Horse certificate';

  @override
  String get no_documents_available => 'No documents available at the moment';

  @override
  String get download => 'Download';

  @override
  String get unavailable => 'Unavailable';

  @override
  String get auction_title_placeholder => 'Auction title';

  @override
  String get auction_status => 'Auction status';

  @override
  String get auction_type => 'Auction type';

  @override
  String get auction_starting_price => 'Starting price';

  @override
  String get auction_start => 'Auction start';

  @override
  String get auction_end => 'Auction end';

  @override
  String get auction_code => 'Auction code';

  @override
  String get auction_final_price => 'Final price';

  @override
  String get auction_type_live => 'Live';

  @override
  String get auction_type_online => 'Online auction';

  @override
  String get name_label => 'Name';

  @override
  String get auction_result => 'Auction result';

  @override
  String get last_bidder => 'Last bidder';

  @override
  String get final_bid_summary => 'Final Bid Summary';

  @override
  String get number_of_subscribers => 'Number of subscribers';

  @override
  String get animal_name_placeholder => 'Animal name';

  @override
  String get camels_count => 'Camels count';

  @override
  String get animal_count_placeholder => 'Animal count';

  @override
  String get animal_usage => 'Usage';

  @override
  String get animal_usage_placeholder => 'Animal usage';

  @override
  String get animal_color => 'Color';

  @override
  String get animal_color_placeholder => 'Animal color';

  @override
  String get animal_breed => 'Breed';

  @override
  String get animal_breed_placeholder => 'Animal breed';

  @override
  String get father_name => 'Father name';

  @override
  String get name_placeholder => 'Name';

  @override
  String get mother_name => 'Mother name';

  @override
  String get mother_name_placeholder => 'Mother name';

  @override
  String get maternal_grandfather_name => 'Maternal grandfather name';

  @override
  String get mother_father_name_placeholder => 'Maternal grandfather name';

  @override
  String get gender_placeholder => 'Select Gender';

  @override
  String get birth_date => 'Birth date';

  @override
  String get height => 'Height';

  @override
  String get animal_height_placeholder => 'Animal height';

  @override
  String get pregnant_status => 'Pregnant';

  @override
  String get classification => 'Classification';

  @override
  String get breed_placeholder => 'Breed';

  @override
  String get animal_type => 'Type';

  @override
  String get animal_type_placeholder => 'Animal type';

  @override
  String get horse_info => 'Horse info';

  @override
  String get camel_info => 'Camel info';

  @override
  String get auction_info => 'Auction info';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get horse_owner_info => 'Horse owner info';

  @override
  String get city_label => 'City';

  @override
  String get auction_phase_one => 'Auction one';

  @override
  String get auction_phase_two => 'Auction two';

  @override
  String get auction_phase_three => 'Auction three';

  @override
  String get auction_withdrawn => 'Auction withdrawn';

  @override
  String get auction_closed => 'Auction closed';

  @override
  String get auction_ended => 'Auction ended';

  @override
  String get ends_in => 'Ends in';

  @override
  String get price_on_request => 'Price on request';

  @override
  String get view_auction => 'View Auction';

  @override
  String remove_alert(Object name) {
    return '$name has been removed from favorites';
  }

  @override
  String get clear_all => 'Clear All Notifications';

  @override
  String get clear_all_alert => 'All notifications cleared ✅';

  @override
  String get price => 'Price';

  @override
  String get status_active => 'Active';

  @override
  String get status_paused => 'Paused';

  @override
  String get status_sold => 'Sold';

  @override
  String get modal_title => 'Complaint Sent';

  @override
  String get view_details => 'View Details / Edit';

  @override
  String get send_update_request => 'Send Update Request';

  @override
  String get add_payment_submit_request => 'Submit request';

  @override
  String get add_payment_done_title => 'Done';

  @override
  String get add_payment_proof_sent_success =>
      'Payment proof has been sent successfully.';

  @override
  String get mark_sold => 'Mark as Sold';

  @override
  String get pause_listing => 'Pause Listing';

  @override
  String get delete_listing => 'Delete Listing';

  @override
  String get close => 'Close';

  @override
  String get add_bank => 'Add Bank Account';

  @override
  String get link_stc => 'Link STC Pay';

  @override
  String get current_balance => 'Current Balance';

  @override
  String get current_formula => 'Total Wallet = Available + Pending - Due.';

  @override
  String get available_balance => 'Available Balance';

  @override
  String get available_info => 'Can be withdrawn to bank account or STC Pay.';

  @override
  String get hold_balance => 'Pending Balance';

  @override
  String get hold_info => 'Sales under verification or ownership transfer.';

  @override
  String get due_balance => 'Due Balance';

  @override
  String get due_info => 'Amounts you owe (auction fees, commissions, etc.).';

  @override
  String get auction_sim => 'Auction Result Simulation (Buyer)';

  @override
  String get paddle_value => 'Paddle Deposit (Paid Upfront)';

  @override
  String get hammer_value => 'Auction Winning Amount';

  @override
  String get fee_percentage => 'Buyer Commission (%)';

  @override
  String get calc_note =>
      'When you win: the commission is deducted from the total, then the paddle amount, showing the remaining due.';

  @override
  String get calculate => 'Calculate';

  @override
  String get reset => 'Reset';

  @override
  String get result_title => 'Result';

  @override
  String get enter_values => 'Enter values and press calculate.';

  @override
  String get auction_value => 'Auction Value';

  @override
  String get commission => 'Commission';

  @override
  String get paddle_paid => 'Paid Deposit (Paddle)';

  @override
  String get remaining_due => 'Remaining Due';

  @override
  String get commission_label => 'Commission';

  @override
  String get remaining_label => 'Remaining Due';

  @override
  String get remaining => 'Remaining';

  @override
  String get payment_method_wallet => 'Wallet';

  @override
  String get payment_method_apple_pay => 'Apple Pay';

  @override
  String get payment_method_bank_transfer => 'Bank Transfer';

  @override
  String get payment_method_network => 'Network';

  @override
  String get applicant_data => 'Applicant Data';

  @override
  String get order_number => 'Order Number';

  @override
  String get order_status => 'Order Status';

  @override
  String get shipping_date => 'Shipping Date';

  @override
  String get payment_method => 'Payment Method';

  @override
  String get transferred_amount => 'Transferred Amount';

  @override
  String get bank_account_data => 'Bank Account Details';

  @override
  String get account_holder_name => 'Account Holder';

  @override
  String get account_number => 'Account Number';

  @override
  String get iban_number => 'IBAN Number';

  @override
  String get transfer_attachments => 'Transfer Attachments';

  @override
  String get no_attachments_available =>
      'No attachments available for this order.';

  @override
  String get account_type_label => 'Account Type';

  @override
  String get amount_label => 'Amount';

  @override
  String get transaction_date_label => 'Transaction Date';

  @override
  String get details_label => 'Details';

  @override
  String get wallet_balance => 'Wallet Balance';

  @override
  String get pending_balance => 'Pending Balance';

  @override
  String get amount_due => 'Amount Due';

  @override
  String get company_commission => 'Company Commission';

  @override
  String get auto_update => 'Auto Update';

  @override
  String get submit_offer => 'Submit Offer';

  @override
  String get participants_table => 'Participants Table';

  @override
  String get your_paddle_number_is => 'Your paddle number: ';

  @override
  String get participating_horses => 'Participating Horses';

  @override
  String get participating_camels => 'Participating Camels';

  @override
  String get not_specified => 'Not specified';

  @override
  String get buy_paddle_now => 'Buy a paddle now';

  @override
  String get participate_in_auction_now => 'Participate in the auction now';

  @override
  String get public_auction => 'Public Auction';

  @override
  String get private_auction => 'Private Auction';

  @override
  String get choose_best_bank => 'Choose the best bank for you';

  @override
  String get bank_details_instructions =>
      'Review the bank account details, copy the account number or IBAN directly to complete the transfer process easily.';

  @override
  String get current_auction_on_platform_now =>
      'Current auction on the platform now';

  @override
  String get support_via_whatsapp => 'Support via WhatsApp';

  @override
  String get direct_contact_support =>
      'Direct contact with the support team — reply usually within minutes';

  @override
  String get delete_account => 'Delete Account';

  @override
  String get delete_account_warning =>
      'Once you delete your account, you cannot undo this action';

  @override
  String get logout_confirmation => 'Are you sure you want to log out?';

  @override
  String get back => 'Go Back';

  @override
  String get full_name_example => 'Example: Wael Al-Shammari';

  @override
  String get full_name_title => 'Full Name';

  @override
  String get email_hint => 'name@gmail.com';

  @override
  String get email_title => 'Email Address';

  @override
  String get phone_label => 'Phone Number';

  @override
  String get message_subject_title => 'Message Subject';

  @override
  String get message_subject_hint => 'Select message subject';

  @override
  String get inquiry_hint => 'Write your inquiry here...';

  @override
  String get inquiry_title => 'Inquiry';

  @override
  String get choose_file_label => 'Choose a file';

  @override
  String get agree_privacy_terms =>
      'I agree to the privacy policy and terms and conditions.';

  @override
  String get request_sent_success_title => 'Request sent successfully';

  @override
  String get request_sent_success_message => 'You will be contacted later';

  @override
  String get error_occurred_title => 'An error occurred';

  @override
  String get submit_button => 'Submit';

  @override
  String get best_way_to_communicate => 'Best way to communicate';

  @override
  String get whatsapp => 'WhatsApp';

  @override
  String get call => 'Call';

  @override
  String get service_card_price_label => 'Price:';

  @override
  String get service_filter_painting => 'Finishing';

  @override
  String get service_filter_engineering => 'Engineering offices';

  @override
  String get service_filter_furniture => 'Furniture moving';

  @override
  String get service_painting_title => 'Al Mahya Finishing and Decor';

  @override
  String get service_painting_description =>
      'A dedicated place for the service description';

  @override
  String get service_painting_price => 'KWD 50 - Duration: one month';

  @override
  String get verified_offices_title => 'Verified offices';

  @override
  String get verified_offices_description =>
      'Browse verified real estate offices near you';

  @override
  String get verified_offices_preview_name => 'Al Ebdaa Real Estate Office';

  @override
  String get verified_offices_preview_location =>
      'Damascus - Al Mezzeh - Al Basateen Street';

  @override
  String get verified_offices_show_map => 'Show map';

  @override
  String get more_desc_services =>
      'Browse finishing, engineering, and furniture moving services';

  @override
  String get delete_the_bid => 'Delete the bid';

  @override
  String get calculator_initial_result =>
      'Enter values and press calculate result.';

  @override
  String calculator_fee_value(Object fee) {
    return 'Auction fee: $fee SAR';
  }

  @override
  String calculator_commission(Object commission, Object commissionPercent) {
    return 'Commission ($commissionPercent%): $commission SAR';
  }

  @override
  String calculator_prepaid_tax(Object tax) {
    return 'Prepaid (tax): -$tax SAR';
  }

  @override
  String calculator_remaining(Object remaining) {
    return 'Remaining to pay: $remaining SAR';
  }

  @override
  String get calculator_title => 'Auction Result Simulator for Buyer';

  @override
  String get calculator_tax_label => 'Prepaid tax value';

  @override
  String get calculator_price_label => 'Auction fee value';

  @override
  String get calculator_commission_label => 'Buyer\'s commission';

  @override
  String get calculator_description =>
      'When winning: commission is deducted from the auction fee, then prepaid tax is deducted, showing the remaining amount to pay.';

  @override
  String get calculator_calculate_btn => 'Calculate';

  @override
  String get calculator_clear_btn => 'Clear';

  @override
  String get calculator_result_title => 'Result';

  @override
  String get you_have_pending_request => 'You have a pending request';

  @override
  String get payment_method_gateway => 'Payment Gateway';

  @override
  String get will_add_to_due => 'Will be added to your due balance';

  @override
  String get bank_account => 'Bank Account';

  @override
  String get linked => 'Linked';

  @override
  String get unlinked => 'Not Linked';

  @override
  String get transactions_title => 'Transaction History';

  @override
  String get date => 'Date';

  @override
  String get operation => 'Operation';

  @override
  String get details => 'Details';

  @override
  String get amount => 'Amount';

  @override
  String get deposit_paddle => 'Paddle Deposit';

  @override
  String get deposit_details => 'Paddle purchase for auction participation';

  @override
  String get on_you => 'Debit';

  @override
  String get for_you => 'Credit';

  @override
  String get completed => 'Completed';

  @override
  String get auction_win => 'Auction Won';

  @override
  String get awaiting_payment => 'Awaiting Payment';

  @override
  String get horse_sale => 'Horse Sale';

  @override
  String get pending_transfer => 'Pending – Ownership Transfer';

  @override
  String get transactions_note =>
      'Note: Once inspection and ownership transfer are confirmed, the pending amount becomes available for withdrawal.';

  @override
  String get cancel => 'Cancel';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get confirm => 'Confirm Request';

  @override
  String get add_bank_modal => 'Add Bank Account';

  @override
  String get bank_linked => 'Bank account linked successfully ✅';

  @override
  String get save => 'Save';

  @override
  String get full_name_placeholder => 'Full legal name';

  @override
  String get bank_name => 'Bank Name';

  @override
  String get bank_name_placeholder => 'Al Rajhi / NCB ...';

  @override
  String get link_stc_modal => 'Link STC Pay';

  @override
  String get stc_linked => 'STC Pay linked successfully ✅';

  @override
  String get stc_number => 'STC Pay Number';

  @override
  String get tabs_label => 'Notification Types';

  @override
  String get tab_all => 'All';

  @override
  String get tab_success => 'Success';

  @override
  String get tab_warning => 'Warnings';

  @override
  String get tab_info => 'Information';

  @override
  String get tab_error => 'Errors';

  @override
  String get no_notifications => 'No notifications currently 🎉';

  @override
  String get approved_title => 'Your listing was approved';

  @override
  String get approved_message =>
      'Your horse listing has been reviewed and approved successfully.';

  @override
  String get auction_soon_title => '24 hours left before auction starts';

  @override
  String get auction_soon_message =>
      'Make sure your camel photos and location are ready before the auction begins.';

  @override
  String get new_offer_title => 'New offer received';

  @override
  String get new_offer_message =>
      'A user has submitted an offer on one of your auctions.';

  @override
  String get rejected_title => 'Listing rejected';

  @override
  String get rejected_message =>
      'Your listing #215 was not approved due to missing information.';

  @override
  String get time_3h => '3 hours ago';

  @override
  String get time_6h => '6 hours ago';

  @override
  String get time_1d => '1 day ago';

  @override
  String get time_2d => '2 days ago';

  @override
  String get placeholder => 'Write your complaint...';

  @override
  String get send => 'Send';

  @override
  String get exit => 'Exit';

  @override
  String get response_time => 'A response will be provided within 24–48 hours.';

  @override
  String get empty_warning => 'Please write your complaint before submitting.';

  @override
  String get modal_message =>
      'Your complaint has been received successfully ✅\nWe will contact you within 24–48 hours via your dashboard or email.';

  @override
  String get fees => 'Fees';

  @override
  String get platform => 'Platform';

  @override
  String get category => 'Category / Offer Type';

  @override
  String get schedule => 'Scheduling (Auction)';

  @override
  String get basic_info => 'Basic Information';

  @override
  String get documents => 'Documents';

  @override
  String get location => 'Riyadh - Kingdom of Saudi Arabia';

  @override
  String get media => 'Media';

  @override
  String get review => 'Review';

  @override
  String get next => 'Next';

  @override
  String get pay => 'Pay Fees';

  @override
  String get submit => 'Submit for Review';

  @override
  String get accept_terms => 'Please accept the terms and conditions';

  @override
  String get set_price => 'Please set a price for the fixed offer';

  @override
  String get select_date_time => 'Please select a start date and time';

  @override
  String get date_too_soon => 'Start date must be at least 3 days from today';

  @override
  String get submitted =>
      'Submitted for review, and data saved to LocalStorage';

  @override
  String get horse_desc => 'Racing • Beauty • Show Jumping Horses';

  @override
  String get camel_desc => 'You can create a group auction for multiple camels';

  @override
  String get horse_classification => 'Horse Classification';

  @override
  String get horse_speed => 'Racing Horse';

  @override
  String get horse_beauty => 'Beauty Horse';

  @override
  String get horse_jump => 'Show Jumping Horse';

  @override
  String get camel_offer_type => 'Camel Offer Type';

  @override
  String get camel_individual => 'Individual';

  @override
  String get camel_group => 'Group';

  @override
  String get camels_count_label => 'Number of Camels';

  @override
  String get camels_count_placeholder => 'Example: 5';

  @override
  String get extra_services => 'Additional Services';

  @override
  String get fixed_sale => 'Fixed Sale';

  @override
  String get auction_sale => 'Auction';

  @override
  String get price_label => 'Price';

  @override
  String get price_placeholder => 'Saudi Riyal';

  @override
  String get deposit_label => 'Deposit for Reservation';

  @override
  String get deposit_placeholder => 'Optional';

  @override
  String get terms_text =>
      'I agree to the terms and conditions, and acknowledge that service fees are non-refundable upon cancellation.';

  @override
  String get start_time => 'Start Time';

  @override
  String get note =>
      'Note: In case of auction or sale cancellation, <bold>the fee is non-refundable</bold>.';

  @override
  String get name => 'Name';

  @override
  String get breed => 'Breed';

  @override
  String get age => 'Age';

  @override
  String get color => 'Color';

  @override
  String get short_desc => 'Short Description';

  @override
  String get short_desc_placeholder =>
      'Enter a brief description of the animal';

  @override
  String get medical_cert => 'Medical Examination Certificate (Optional)';

  @override
  String get animal_info_cert => 'Horse / Camel Information Certificate';

  @override
  String get other_docs => 'Other Documents';

  @override
  String get main_image => 'Main Image';

  @override
  String get gallery => 'Additional Images (at least 4)';

  @override
  String get video_links => 'Video Links';

  @override
  String get video_placeholder => 'YouTube or other player link (optional)';

  @override
  String get add_video => '+ Add Video Link';

  @override
  String get delete => 'Delete';

  @override
  String get fee_text => 'Payment method for the fee';

  @override
  String get card => 'Visa / Mada';

  @override
  String get card_name => 'Name on Card';

  @override
  String get card_number => 'Card Number';

  @override
  String get expiry => 'MM/YY';

  @override
  String get cvv => 'CVV';

  @override
  String get review_header => 'Final Review';

  @override
  String get review_text =>
      'Your request will be sent to the forsan administration for review before publishing.';

  @override
  String get support_title => 'Support & Help';

  @override
  String get contact => 'Contact Us';

  @override
  String get faqs => 'FAQs';

  @override
  String get privacy => 'Privacy Policy';

  @override
  String get terms => 'Terms & Conditions';

  @override
  String get important_links_title => 'Important Links';

  @override
  String get horse_platform => 'Horses Platform';

  @override
  String get camel_platform => 'Camels Platform';

  @override
  String get follow_us => 'Follow Us';

  @override
  String get rights => 'All rights reserved';

  @override
  String get horses => 'Number of Horses Listed';

  @override
  String get buyers => 'Number of Registered Buyers';

  @override
  String get last_30_days => 'Last 30 Days';

  @override
  String get last_update => 'Last update: Today 12:00 AM';

  @override
  String get thousand => ' K';

  @override
  String get explore => 'Explore Auctions';

  @override
  String get or_try => 'Or try';

  @override
  String get search => 'search';

  @override
  String get favorite => 'for your favorite horse.';

  @override
  String get try_again => 'Try Again';

  @override
  String get top_up_step_select_bank => 'Select Bank';

  @override
  String get top_up_step_transfer_details => 'Transfer Details';

  @override
  String get admin_panel_title => 'Admin Panel';

  @override
  String get admin_panel_email => 'admin@mail.com';

  @override
  String get admin_panel_users => 'Users';

  @override
  String get admin_panel_groups => 'Groups';

  @override
  String get admin_panel_programs => 'Programs';

  @override
  String get admin_panel_pro_programs => 'Pro Programs';

  @override
  String get admin_panel_events => 'Events';

  @override
  String get admin_panel_schedules => 'Schedules';

  @override
  String get enter_value_hint => 'Enter value';

  @override
  String get card_name_hint => 'Enter name on card';

  @override
  String get card_name_label => 'Name on Card';

  @override
  String get card_number_hint => '1111 1111 1111 1114';

  @override
  String get card_number_label => 'Card Number';

  @override
  String get card_expiry_hint => '12/27';

  @override
  String get card_expiry_label => 'Expiry Date';

  @override
  String get card_cvv_hint => '124';

  @override
  String get card_cvv_label => 'CVV';

  @override
  String get search_hint => 'What are you looking for?';

  @override
  String get payment_invoice_title => 'Payment Invoice';

  @override
  String get veterinary_services_title => 'Veterinary Services 🩺';

  @override
  String get veterinary_services_description => 'Exam and diagnostics.';

  @override
  String get transport_service_title => 'Transport Service 🚚';

  @override
  String get transport_service_description => 'Certified transport providers.';

  @override
  String get stats_horses_listed => 'Horses Listed';

  @override
  String get stats_horses_listed_default => '875';

  @override
  String get stats_buyers_count => 'Buyers';

  @override
  String get stats_buyers_count_default => '340';

  @override
  String get stats_sales_count => 'Sales';

  @override
  String get stats_sales_count_default => '120';

  @override
  String get default_camel_sponsor => 'Desert Caravans';

  @override
  String get default_horse_sponsor => 'Abu Ubaid Auction';

  @override
  String get camels_platform_description => 'Browse camel auctions and offers.';

  @override
  String get horses_platform_description => 'Browse horse auctions and offers.';

  @override
  String get success_partners_title => 'Success Partners';

  @override
  String get live_viewers_title => 'Viewers Now';

  @override
  String get live_viewers_value => '+1.2k';

  @override
  String get bids_count_title => 'Number of Bids';

  @override
  String get available_auctions_title => 'Available Auctions';

  @override
  String get quick_facts_title => 'Quick Facts';

  @override
  String get quick_facts_subtitle => 'Everything you need before bidding.';

  @override
  String get quick_facts_location_title => 'Location';

  @override
  String get quick_facts_location_description =>
      'Abu Ubaid auction arena • fully equipped for live streaming';

  @override
  String get quick_facts_medical_title => 'Medical Check';

  @override
  String get quick_facts_medical_description =>
      'The horse has been examined by a certified veterinary committee';

  @override
  String get quick_facts_guarantees_title => 'Auction Guarantees';

  @override
  String get quick_facts_guarantees_description =>
      'Temporary hold to ensure transparency';

  @override
  String get management_notices_title => 'Management Notices';

  @override
  String get management_notices_highlight_title =>
      'Instant messages from auction management';

  @override
  String get management_notices_highlight_description =>
      'Stay tuned for important instructions and alerts.';

  @override
  String get bidders_title => 'Bidders';

  @override
  String get active_now_label => 'Active Now';

  @override
  String get no_bids_yet => 'No bids have been placed yet.';

  @override
  String bid_option_amount(Object amount) {
    return '+ $amount';
  }

  @override
  String get current_price_label => 'Current Price';

  @override
  String get your_bids_label => 'Your Current Bids';

  @override
  String get my_bids_title => 'Auction history';

  @override
  String get my_bids_bid_label => 'Bid';

  @override
  String my_bids_bidder_number(Object number) {
    return 'Bidder #$number';
  }

  @override
  String my_bids_auction_number(Object number) {
    return 'Auction #$number';
  }

  @override
  String get custom_amount_label => 'Custom Amount';

  @override
  String get confirm_bid_label => 'Confirm Bid';

  @override
  String get custom_bid_dialog_title => 'Enter Custom Amount';

  @override
  String bid_increment_label(Object amount) {
    return 'Minimum bid increment is $amount SAR';
  }

  @override
  String get cancel_label => 'Cancel';

  @override
  String get confirm_label => 'Confirm';

  @override
  String get bidder_fallback_name => 'Bidder';

  @override
  String get new_bid_toast_title => '🔥 New Bid';

  @override
  String get announcement_toast_title => '📢 Notice from the administration';

  @override
  String get bid_raised_to_label => 'raised the bid to ';

  @override
  String get auction_details_title => 'Auction Details';

  @override
  String get personal_info_first_name_label => 'First name';

  @override
  String get personal_info_last_name_label => 'Last name';

  @override
  String get personal_info_email_label => 'Email';

  @override
  String get personal_info_add_email_label => 'Tap to add email';

  @override
  String get personal_info_phone_label => 'Phone number';

  @override
  String get personal_info_email_verified_message => 'Email verified successfully';

  @override
  String get personal_info_add_email_title => 'Add Email';

  @override
  String get personal_info_edit_email_title => 'Edit Email';

  @override
  String get personal_info_verify_email_title => 'Verify Email';

  @override
  String get personal_info_add_email_header => 'Add your email';

  @override
  String get personal_info_update_email_header => 'Update your email';

  @override
  String get personal_info_email_otp_request_subtitle => 'We will send a verification code to confirm you own this email before saving it to your account.';

  @override
  String get personal_info_send_verification_code => 'Send verification code';

  @override
  String get personal_info_email_required => 'Please enter your email';

  @override
  String get personal_info_invalid_email => 'Please enter a valid email';

  @override
  String get personal_info_enter_otp_title => 'Enter verification code';

  @override
  String get personal_info_otp_label => 'Verification code';

  @override
  String get personal_info_confirm_email => 'Verify email';

  @override
  String get personal_info_otp_required => 'Please enter the verification code';

  @override
  String get personal_info_invalid_otp => 'Invalid verification code';

  @override
  String personal_info_email_otp_sent_subtitle(String email) {
    return 'A verification code has been sent to $email. Enter it to complete updating your email.';
  }

  @override
  String get personal_info_title => 'Personal Information';

  @override
  String get continue_label => 'Continue';

  @override
  String get select_country_first => 'Select country first';

  @override
  String get stable_name_optional => 'Stable name (optional)';

  @override
  String get financial_management_title => 'Financial Management';

  @override
  String get wallet_top_up_title => 'Top Up Wallet';

  @override
  String get available_balance_title => 'Available Balance';

  @override
  String get available_balance_description =>
      'Withdrawable to bank account or STC Pay.';

  @override
  String get total_balance_title => 'Total Balance';

  @override
  String get total_balance_description =>
      'Total = available + pending - due - commission';

  @override
  String get company_commission_title => 'Company Commission';

  @override
  String get company_commission_description => 'Company commission';

  @override
  String get pending_balance_title => 'Pending Balance';

  @override
  String get pending_balance_description =>
      'Sales under verification or ownership transfer.';

  @override
  String get amount_due_title => 'Amount Due';

  @override
  String get amount_due_description =>
      'Amounts to be paid (auction, commissions...).';

  @override
  String get wallet_label => 'Wallet';

  @override
  String get system_label => 'System';

  @override
  String get bank_transfer_label => 'Bank Transfer';

  @override
  String get payment_gateway_label => 'Payment Gateway';

  @override
  String get transaction_history_title => 'Transaction History';

  @override
  String get filters_title => 'Filters';

  @override
  String get date_placeholder => 'mm/dd/yyyy';

  @override
  String get start_date_title => 'Start Date';

  @override
  String get end_date_title => 'End Date';

  @override
  String get search_label => 'Search';

  @override
  String get nav_home => 'Home';

  @override
  String get nav_offers => 'Offers';

  @override
  String get nav_auctions => 'Auctions';

  @override
  String get nav_mass_auctions => 'Mass Auctions';

  @override
  String get nav_more => 'More';

  @override
  String get more_section_auction => 'Auction';

  @override
  String get more_section_operations => 'Operations';

  @override
  String get more_section_account => 'Account';

  @override
  String get my_offers => 'My Offers';

  @override
  String get participating_auctions => 'Participating Auctions';

  @override
  String get my_mass_auctions => 'My Mass Auctions';

  @override
  String get purchases => 'My Purchases';

  @override
  String get my_sales => 'My Sales';

  @override
  String get wallet_top_up_requests => 'Wallet Top-up Requests';

  @override
  String get payment_history => 'Payment History';

  @override
  String get payment_history_timeline_title => 'Payment Timeline';

  @override
  String get payment_history_empty_state => 'No payments yet';

  @override
  String get payment_history_summary_title => 'Quick Overview';

  @override
  String payment_history_operations_count(int count) {
    return '$count operation';
  }

  @override
  String get payment_history_summary_description =>
      'Follow payment activity with clear status and source indicators.';

  @override
  String get payment_history_status_approved => 'Approved';

  @override
  String get payment_history_status_pending_review => 'Under Review';

  @override
  String get more_desc_add_listing => 'Add a new listing or auction easily';

  @override
  String get more_desc_participating_auctions =>
      'View auctions you\'re currently participating in';

  @override
  String get more_desc_my_mass_auctions =>
      'Track your current and past mass auctions';

  @override
  String get more_desc_my_auctions => 'Manage your active and ended auctions';

  @override
  String get more_desc_incoming_requests =>
      'Incoming purchase requests on your auctions';

  @override
  String get more_desc_sent_requests => 'Purchase requests you have sent';

  @override
  String get more_desc_my_offers => 'Your submitted offers across auctions';

  @override
  String get more_desc_purchases =>
      'Purchase orders and offers you have joined';

  @override
  String get more_desc_sales => 'Your current and previous offers and sales';

  @override
  String get more_desc_wallet =>
      'Balance and financial transactions in your wallet';

  @override
  String get more_desc_wallet_top_up_requests =>
      'Your current and previous balance top-up requests';

  @override
  String get more_desc_transaction_history =>
      'All account transactions and actions';

  @override
  String get more_desc_payment_history =>
      'All payments and invoices made via the platform';

  @override
  String get more_desc_profile => 'View and edit your account information';

  @override
  String get more_desc_notifications => 'View new alerts and notifications';

  @override
  String get more_desc_favorites => 'All items you have added to favorites';

  @override
  String get more_desc_privacy => 'Read the platform privacy policy';

  @override
  String get more_desc_terms => 'Review the terms and conditions';

  @override
  String get more_desc_contact_us => 'Reach out for inquiries and support';

  @override
  String get more_desc_faqs => 'Quick answers to the most common questions';

  @override
  String get more_desc_logout => 'Sign out from your current account';

  @override
  String get sent_requests => 'Sent requests';

  @override
  String get incoming_requests => 'Incoming requests';

  @override
  String get paddle_type_normal => 'Normal';

  @override
  String get paddle_type_premium => 'Premium';

  @override
  String get confirm_inspection_remaining_amount_message =>
      'Upon confirming the inspection, you must complete the remaining amount';

  @override
  String get paddle_type_vip => 'VIP';

  @override
  String get confirm_transfer_and_receipt => 'Confirm Transfer & Receipt';

  @override
  String get confirm_inspection => 'Confirm Inspection';

  @override
  String get cancel_purchase_confirmation =>
      'Are you sure you want to cancel the purchase?';

  @override
  String get cancel_purchase_title => 'Cancel Purchase';

  @override
  String get total_price_label => 'Total Price';

  @override
  String get confirm_transfer_message => 'Please confirm the transfer process.';

  @override
  String complete_remaining_amount_message(Object remainingAmount) {
    return 'Upon confirming the inspection, you must complete the remaining amount $remainingAmount ';
  }

  @override
  String get paddle_type_label => 'Paddle Type';

  @override
  String get share_app_title => 'Share forsan App';

  @override
  String get share_app_description =>
      'Invite someone you love to try forsan and enjoy unique auctions and services together.';

  @override
  String get share_tag_friends => 'Share with friends';

  @override
  String get share_tag_discover => 'Discover new auctions';

  @override
  String get share_now => 'Share Now';

  @override
  String get share_message_no_link =>
      'Try the forsan app and share our exclusive auctions with someone you love.';

  @override
  String share_message_with_link(Object url) {
    return 'Try the forsan app and share our exclusive auctions with someone you love.\nDownload the app now: $url';
  }

  @override
  String get add_ad_created_success => 'Ad created successfully';

  @override
  String get add_ad_payment_url_error => 'Unable to open payment link';

  @override
  String get add_ad_payment_declined => 'Payment was declined';

  @override
  String get add_ad_payment_cancelled => 'Payment was cancelled';

  @override
  String get payment_success => 'Payment completed successfully';

  @override
  String get payment_complete_amount_title => 'Complete Amount';

  @override
  String get payment_buy_paddle_title => 'Buy Paddle';

  @override
  String get payment_complete_purchase_title => 'Complete Purchase';

  @override
  String get payment_paddle_value_label => 'Paddle value';

  @override
  String get payment_required_amount_label => 'Required amount';

  @override
  String get payment_purpose_enter_amount => 'Please enter amount';

  @override
  String get payment_inspection_note =>
      'Note: If the examination is confirmed, a bribe commission will be paid.';

  @override
  String get annual_auction_card_fallback_title => 'Auction Name';

  @override
  String get annual_auction_card_type_label => 'Auction Type';

  @override
  String get annual_auction_card_type_public => 'Annual';

  @override
  String get annual_auction_card_type_private => 'Private';

  @override
  String get annual_auction_card_sponsor_label => 'Sponsored by';

  @override
  String get annual_auction_card_sponsor_fallback => 'Sponsor';

  @override
  String get annual_auction_card_participants_label => 'Participants Count';

  @override
  String get annual_auction_card_classification_label => 'Classification';

  @override
  String get annual_auction_card_classification_fallback => 'Classification';

  @override
  String get annual_auction_card_start_date_label => 'Auction Start Date';

  @override
  String get annual_auction_card_start_date_fallback =>
      'The date will be determined later.';

  @override
  String get annual_auction_card_state_label => 'Auction Status';

  @override
  String get annual_auction_card_state_sellers =>
      'Open for seller registration';

  @override
  String get annual_auction_card_state_buyers => 'Open for buyer registration';

  @override
  String get annual_auction_card_location_label => 'Auction Location';

  @override
  String get annual_auction_card_location_country_fallback => 'Country';

  @override
  String get annual_auction_card_location_state_fallback => 'City';

  @override
  String get annual_auction_card_button_unavailable => 'Unavailable';

  @override
  String get annual_auction_card_button_show_details => 'Show Details';

  @override
  String get annual_auction_card_button_register_sellers =>
      'Seller Registration';

  @override
  String get annual_auction_card_button_register_buyers => 'Buyer Registration';

  @override
  String get annual_auction_card_button_enter_auction => 'Enter Auction';

  @override
  String get annual_auction_card_button_show_results => 'Show Results';

  @override
  String get annual_auction_card_status_upcoming => 'Upcoming';

  @override
  String get annual_auction_card_status_live_now => 'Live Now';

  @override
  String get annual_auction_card_status_ended => 'Ended';

  @override
  String get annual_auction_card_countdown_start_sellers =>
      'Countdown to seller registration start';

  @override
  String get annual_auction_card_countdown_end_sellers =>
      'Countdown to seller registration end';

  @override
  String get annual_auction_card_countdown_start_auction =>
      'Countdown to auction start';

  @override
  String get annual_auction_card_countdown_end_auction =>
      'Countdown to auction end';

  @override
  String get ad_card_fallback_title => 'Title';

  @override
  String get ad_card_fallback_unique_id => '0000000';

  @override
  String get ad_card_fallback_price => 'Price';

  @override
  String get ad_card_last_price_label => 'Last price:';

  @override
  String get ad_card_auction_type_electronic => 'Electronic';

  @override
  String get ad_card_status_pending => 'Upcoming';

  @override
  String get ad_card_status_accepted => 'Active';

  @override
  String get ad_card_status_rejected => 'Rejected';

  @override
  String get ad_card_status_withdrawn => 'Withdrawn';

  @override
  String get ad_card_status_sold => 'Sold';

  @override
  String get ad_card_status_unsold => 'Unsold';

  @override
  String get ad_card_status_active => 'Active';

  @override
  String get ad_card_status_ended => 'Ended';

  @override
  String get ad_card_status_live => 'Live';

  @override
  String get ad_card_status_skipped => 'Skipped';

  @override
  String get transport_card_company_name => 'Company Name';

  @override
  String get transport_card_category_fallback => 'Transport Category';

  @override
  String get transport_card_horse_transport => '🐎 Horse Transport';

  @override
  String get transport_card_camel_transport => '🐪 Camel Transport';

  @override
  String get transport_card_type_all_ksa => '📍 All regions of Saudi Arabia';

  @override
  String get transport_card_type_outside_ksa => '📍 Outside Saudi Arabia';

  @override
  String get transport_card_location_fallback =>
      'Location City - Location Country';

  @override
  String get transport_card_listed => 'Listed';

  @override
  String get transport_card_call => 'Call';

  @override
  String get transport_card_transport_external => 'External Transport';

  @override
  String get transport_card_transport_internal => 'Internal Transport';

  @override
  String get transport_card_transport_internal_external =>
      'Internal & External Transport';

  @override
  String get auctions_screen_camel_title => 'Camel Auctions';

  @override
  String get auctions_screen_horse_title => 'Horse Auctions';

  @override
  String get auctions_screen_header_subtitle =>
      'Choose the auction type to continue.';

  @override
  String get auctions_screen_individual_title => 'Individual Auction';

  @override
  String get auctions_screen_individual_subtitle =>
      'Direct sale - one listing with full details.';

  @override
  String get auctions_screen_individual_badge => 'Individual';

  @override
  String get auctions_screen_group_title => 'Group / Annual Auction';

  @override
  String get auctions_screen_group_subtitle =>
      'Multiple entries - a major auction with seasonal schedule.';

  @override
  String get auctions_screen_group_badge => 'Group';

  @override
  String get partners_title => 'Success Partners';

  @override
  String get partners_subtitle =>
      'Brands we collaborate with to deliver the best experience';

  @override
  String get partner_interstitial_skip => 'Skip';

  @override
  String partner_interstitial_auto_skip(Object seconds) {
    return 'Ad will close in ${seconds}s';
  }

  @override
  String developed_by(Object company) {
    return 'Developed by $company';
  }

  @override
  String app_version(Object version) {
    return 'Version $version';
  }

  @override
  String get stay_logged_in => 'Stay logged in';

  @override
  String get error => 'Error';

  @override
  String get success => 'Success';

  @override
  String get continue_as_guest => 'Continue as guest';

  @override
  String get withdrawn_label => 'Withdrawn';

  @override
  String get no_auctions_available => 'No auctions available right now';

  @override
  String get no_participating_auctions => 'No participating auctions right now';

  @override
  String get highest_price_label => 'Highest price';

  @override
  String get participants_label => 'Participants';

  @override
  String get bidder_number_label => 'Bidder number';

  @override
  String get no_offers_available => 'No offers available right now';

  @override
  String get ad_deleted_success => 'Ad deleted successfully';

  @override
  String get warning_label => 'Warning';

  @override
  String get delete_ad_not_active =>
      'You can only delete the ad if it is active.';

  @override
  String get group_auction_label => 'Group auction';

  @override
  String get select_country_label => 'Select country';

  @override
  String get select_city_label => 'Select city';

  @override
  String get select_type_label => 'Select type';

  @override
  String get training_usage_label => 'Training/Usage';

  @override
  String get select_training_usage_label => 'Select training/usage';

  @override
  String get from_birth_date_label => 'From birth date';

  @override
  String get to_birth_date_label => 'To birth date';

  @override
  String get height_cm_label => 'Height (cm)';

  @override
  String get height_cm_placeholder => 'Enter height (cm)';

  @override
  String get main_image_label => 'Main image';

  @override
  String get add_main_image_help => 'Add the main ad image';

  @override
  String get main_video_label => 'Main video';

  @override
  String get add_main_video_help => 'Add the main ad video';

  @override
  String get additional_images_label => 'Additional images';

  @override
  String get additional_images_required_help =>
      'At least four images are required';

  @override
  String get current_additional_images_label => 'Current additional images';

  @override
  String get no_additional_images_available =>
      'No additional images available right now';

  @override
  String get owner_name_label => 'Owner name';

  @override
  String get owner_name_placeholder => 'Enter owner\'s name';

  @override
  String get owner_phone_label => 'Owner phone';

  @override
  String get owner_phone_placeholder => 'Enter owner\'s phone';

  @override
  String get edit_success_message => 'Updated successfully';

  @override
  String get birth_date_select_label => 'Select birth date';

  @override
  String get description_label => 'Description';

  @override
  String get no_data_available => 'No data available';

  @override
  String get sale_terms_title => 'Sale terms';

  @override
  String get auction_terms_title => 'Auction terms';

  @override
  String get sale_term_payment =>
      'Payment is made via wallet or available payment methods in the system.';

  @override
  String get sale_term_deposit =>
      'After paying the deposit, you must complete the process within 3 days.';

  @override
  String get sale_term_shipping =>
      'The buyer bears transport and veterinary inspection costs if any.';

  @override
  String get sale_term_bidder_fee =>
      'The bidder fee is non-refundable after the auction is awarded to you.';

  @override
  String get min_count_label => 'Minimum count';

  @override
  String get min_count_placeholder => 'Enter minimum count';

  @override
  String get max_count_label => 'Maximum count';

  @override
  String get max_count_placeholder => 'Enter maximum count';

  @override
  String get select_color_label => 'Select color';

  @override
  String get profile_update_success_message => 'Profile updated successfully';

  @override
  String get high_bid_notification_label =>
      'Notify when a higher bid is received';

  @override
  String get offer_details_owner_name_label => 'Owner name';

  @override
  String get offer_details_owner_stable_label => 'Stable name';

  @override
  String get offer_details_owner_contact_label => 'Contact number';

  @override
  String get offer_details_owner_name_placeholder => 'User Name';

  @override
  String get offer_details_owner_stable_placeholder => 'Stable Name Or Farm';

  @override
  String get offer_details_owner_phone_placeholder => '+0000000000000';

  @override
  String get offer_details_animal_name_label => 'Name';

  @override
  String get offer_details_animal_name_placeholder => 'Title Or Name';

  @override
  String get offer_details_father_name_label => 'Father name';

  @override
  String get offer_details_father_name_placeholder => 'Father Name';

  @override
  String get offer_details_mother_name_label => 'Mother name';

  @override
  String get offer_details_mother_name_placeholder => 'Mother Name';

  @override
  String get offer_details_mother_father_name_label => 'Mother\'s father name';

  @override
  String get offer_details_mother_father_name_placeholder =>
      'Father Mother Name';

  @override
  String get offer_details_birth_date_label => 'Date of birth';

  @override
  String get offer_details_height_label => 'Height';

  @override
  String get offer_details_height_placeholder => 'Height';

  @override
  String get offer_details_gender_label => 'Gender';

  @override
  String get offer_details_gender_placeholder => 'Gender (M/F)';

  @override
  String get offer_details_color_label => 'Color';

  @override
  String get offer_details_color_placeholder => 'Animal Color';

  @override
  String get offer_details_usage_label => 'Animal usage';

  @override
  String get offer_details_usage_placeholder => 'Animal Usage';

  @override
  String get offer_details_count_label => 'Count';

  @override
  String get offer_details_group_count_placeholder => 'Group members count';

  @override
  String get offer_details_state_fallback => 'State';

  @override
  String get offer_details_country_fallback => 'Country';

  @override
  String get offer_details_owner_info_title => 'Owner information';

  @override
  String get offer_details_offer_info_title => 'Offer information';

  @override
  String get offer_details_verified_badge => 'Verified';

  @override
  String get offer_details_photos_title => 'Photos';

  @override
  String get offer_details_video_title => 'Video';

  @override
  String get offer_details_videos_title => 'Videos';

  @override
  String get offer_details_description_title => 'Offer description';

  @override
  String get offer_details_photo_gallery_title => 'Photo gallery';

  @override
  String get offer_details_price_label => 'Price: ';

  @override
  String get offer_details_deposit_label => 'deposit: ';

  @override
  String get offer_details_buy_now => 'Buy now';

  @override
  String get auction_state_upcoming => 'Upcoming';

  @override
  String get auction_state_active => 'Active';

  @override
  String get auction_state_ended => 'Ended';

  @override
  String get auction_state_live => 'Live';

  @override
  String get auction_state_closed => 'Closed';

  @override
  String get add_ad_untitled => 'Untitled ad';

  @override
  String get add_ad_location_not_set => 'Location not set';

  @override
  String add_ad_city_number(int stateId) {
    return 'City #$stateId';
  }

  @override
  String get add_ad_offer_type => 'Offer type';

  @override
  String get count => 'Count';

  @override
  String get camels => 'Camels';

  @override
  String get not_available => 'Not available';

  @override
  String get saudi_arabia => 'Kingdom of Saudi Arabia';

  @override
  String get cm_unit => 'cm';

  @override
  String get total => 'Total';

  @override
  String get no_results_available => 'No results are currently available';

  @override
  String add_ad_video_link(int index) {
    return 'Link $index';
  }

  @override
  String get add_ad_main_image_hint =>
      'Add the main image for the ad — max size 10 MB.';

  @override
  String get add_ad_main_video_hint => 'Add the main ad video (up to 10 MB).';

  @override
  String get add_ad_extra_images_title => 'Additional images';

  @override
  String get add_ad_extra_images_hint =>
      'At least four images are required, each no more than 2 MB.';

  @override
  String get add_ad_intro_title => 'Tell us about your ad';

  @override
  String get add_ad_intro_subtitle =>
      '🐪🐎 Add your ad now with ease!\nFill in the ad details accurately to reach the largest number of interested users.\n';

  @override
  String get add_ad_add_camels => 'Add Camels';

  @override
  String get add_ad_add_horses => 'Add Horses';

  @override
  String get add_ad_platform_camel_web_desc =>
      'You can create a group auction for multiple camels with settings tailored for organized camel sales.';

  @override
  String get add_ad_platform_horse_web_desc =>
      'Racing, beauty, show jumping horses, and more, with next steps prepared based on horse type.';

  @override
  String get add_ad_platform_camel_web_badge => 'Individual / Group';

  @override
  String get add_ad_platform_horse_web_badge => 'Solo auction / offer';

  @override
  String get add_ad_wallet_deduction => 'Amount to be deducted from wallet';

  @override
  String get add_ad_card_required_amount => 'Amount required for card payment';

  @override
  String get add_ad_apple_pay_required_amount =>
      'Amount required via Apple Pay';

  @override
  String get add_ad_auction_fee => 'Auction fee';

  @override
  String get add_ad_offer_fee => 'Offer fee';

  @override
  String get add_ad_pay_before_publish => 'Paid before publishing the ad';

  @override
  String get add_ad_note_no_refund =>
      'After paying the ad fee and approval, the amount is non-refundable.';

  @override
  String get add_ad_note_duration =>
      'Ad duration is 30 days. Renewal requires paying the fee again to reactivate the ad.';

  @override
  String get add_ad_pay_and_continue => 'Pay and continue';

  @override
  String get add_ad_select_country_first => 'Please select country first';

  @override
  String get add_ad_select_city => 'Select city';

  @override
  String get add_ad_select_age => 'Select age';

  @override
  String get add_ad_title_hint => 'Enter ad title';

  @override
  String get add_ad_title_label => 'Ad title';

  @override
  String get add_ad_name_hint => 'Enter name';

  @override
  String get add_ad_father_name_hint => 'Enter father name';

  @override
  String get add_ad_mother_name_hint => 'Enter mother name';

  @override
  String get add_ad_mother_father_name_hint =>
      'Enter maternal grandfather name';

  @override
  String get add_ad_breed_hint => 'Enter breed';

  @override
  String get add_ad_select_type => 'Select type';

  @override
  String get add_ad_height_hint => 'Enter height';

  @override
  String get add_ad_select_color => 'Select color';

  @override
  String get add_ad_pregnant_label => 'Pregnant';

  @override
  String get add_ad_pregnancy_status_pregnant => 'Pregnant';

  @override
  String get add_ad_pregnancy_status_not_pregnant => 'Not pregnant';

  @override
  String get add_ad_pregnancy_status_unsure => 'Unsure';

  @override
  String get add_ad_pregnancy_status_hint => 'Select status';

  @override
  String get add_ad_male_type => 'Stud';

  @override
  String get add_ad_castrated_type => 'Castrated';

  @override
  String get add_ad_foal_male_type => 'Foal';

  @override
  String get add_ad_foal_female_type => 'Filly';

  @override
  String get add_ad_camel_breeding_female => 'Breeding she-camel';

  @override
  String get add_ad_horse_breeding_female => 'Breeding mare';

  @override
  String get add_ad_camel_non_breeding_female => 'She-camel';

  @override
  String get add_ad_horse_non_breeding_female => 'Mare';

  @override
  String get add_ad_camel_group => 'Camel group';

  @override
  String get add_ad_champions => 'Champions';

  @override
  String get add_ad_select_start_date_first => 'Please select start date first';

  @override
  String get add_ad_time_unavailable =>
      'This time is unavailable, please choose another time';

  @override
  String get add_ad_start_date => 'Start date';

  @override
  String get add_ad_end_date => 'End date';

  @override
  String get add_ad_auction_start_time => 'Auction start time';

  @override
  String get add_ad_auction_end_time => 'Auction end time';

  @override
  String get add_ad_unavailable_times => 'Unavailable times';

  @override
  String get add_ad_unavailable_times_desc =>
      'We show booking periods so you can pick a time that doesn’t conflict with another live stream.';

  @override
  String get add_ad_unavailable_times_error =>
      'Unable to load unavailable times, please try again later.';

  @override
  String get add_ad_no_unavailable_times_today =>
      'No reserved times for this day, you can choose the suitable time.';

  @override
  String get add_ad_select_live_auction_date =>
      'Select the live auction date to view reserved times.';

  @override
  String get add_ad_choose_start_date_for_slots =>
      'Choose start date to view unavailable times.';

  @override
  String get add_ad_end_time_after_start =>
      'Auction end time must be later than start time';

  @override
  String get add_ad_slot_duration => '15-minute duration';

  @override
  String get add_ad_auction_opening_price => 'Auction opening price';

  @override
  String get add_ad_auction_starts_from_price =>
      'The auction will start from your selected initial price.';

  @override
  String get add_ad_electronic_only => 'Electronic only';

  @override
  String get add_ad_entry_price => 'Entry price';

  @override
  String get add_ad_exit_confirm => 'Are you sure you want to exit?';

  @override
  String get add_ad_live_electronic => 'Live electronic';

  @override
  String get add_ad_market_entry_price => 'Market entry price';

  @override
  String get add_ad_no_additional_services =>
      'No additional services are currently available.';

  @override
  String get add_ad_no_usages_available => 'No usages are currently available.';

  @override
  String get add_ad_select_birth_date => 'Select birth date';

  @override
  String get add_ad_select_country => 'Select country';

  @override
  String get add_ad_select_payment_method => 'Please select a payment method';

  @override
  String get add_ad_set_starting_price => 'Set starting price';

  @override
  String get add_ad_title => 'Add direct offer / auction';

  @override
  String get add_ad_wallet_empty => 'Wallet balance is empty';

  @override
  String get offer => 'Offer';

  @override
  String get annual_auction_participation_title =>
      'Apply to participate in the annual auction';

  @override
  String get annual_auction_participation_description =>
      'Let your auction shine in front of interested buyers — send your details in simple steps to secure your place this year.';

  @override
  String get annual_auction_owner_participation_fee_title =>
      'Owner participation fee';

  @override
  String get annual_auction_owner_participation_fee_subtitle =>
      'Your request is activated immediately after payment confirmation.';

  @override
  String get annual_auction_premium_paddle_price_title =>
      'Premium paddle price';

  @override
  String get annual_auction_normal_paddle_price_title => 'Regular paddle price';

  @override
  String get annual_auction_paddle_price_subtitle =>
      'It will be issued immediately after payment.';

  @override
  String get annual_auction_code_title => 'Auction code';

  @override
  String get annual_auction_code_subtitle =>
      'A unique code for your auction participation.';

  @override
  String get annual_auction_terms_note =>
      'You must review and agree to the terms before completing registration.';

  @override
  String get sold_group_mobile_card_group_number => 'Group number';

  @override
  String get sold_group_mobile_card_group_name => 'Group name';

  @override
  String get sold_group_mobile_card_camels_count => 'Camels count';

  @override
  String get sold_group_mobile_card_sale_status => 'Sale status';

  @override
  String get sold_group_mobile_card_seller_name => 'Seller name';

  @override
  String get sold_group_mobile_card_seller_phone => 'Seller phone';

  @override
  String get sold_group_mobile_card_buyer_name => 'Buyer name';

  @override
  String get sold_group_mobile_card_purchase_date => 'Purchase date';

  @override
  String get sold_group_mobile_card_purchase_date_placeholder => '---';

  @override
  String get sold_group_mobile_card_group_info_title => 'Group information';

  @override
  String get sold_group_mobile_card_group_info_subtitle =>
      'Quick view of group data after sale';

  @override
  String get sold_group_mobile_card_final_price_note =>
      'The price has been approved and the auction has been closed.';

  @override
  String get account_archived_title => 'Your account is archived';

  @override
  String get account_archived_description =>
      'For security reasons, access to this account is currently suspended. You can sign in with another account or contact support to review the status.';

  @override
  String get account_archived_contact_support => 'Contact support';

  @override
  String get account_archived_support_unavailable =>
      'Support number is currently unavailable';

  @override
  String get account_archived_support_message => 'Hello, I have an inquiry.';

  @override
  String annual_results_day_label(Object day) {
    return 'Day $day';
  }

  @override
  String no_video_for_day(Object dayNumber) {
    return 'There is no video for day $dayNumber at the moment';
  }

  @override
  String get winner_label => 'Winner';

  @override
  String get purchase_details_seller_info => 'Seller information';

  @override
  String get purchase_details_buyer_info => 'Buyer information';

  @override
  String get purchase_details_payment_details => 'Payment details';

  @override
  String get purchase_details_basic_amount => 'Base amount';

  @override
  String get purchase_details_commission_label => 'Commission';

  @override
  String get purchase_details_tax_label => 'Tax';

  @override
  String get purchase_details_paid_amount => 'Paid amount';

  @override
  String get purchase_details_remaining_amount => 'Remaining amount';

  @override
  String get purchase_details_final_total => 'Final total';

  @override
  String get purchase_details_note =>
      'Note: Company commission and tax are not due and are not included in the final amount until inspection is confirmed.';

  @override
  String get purchase_details_pending_inspection => 'Pending inspection';

  @override
  String get purchase_details_pending_transfer =>
      'Pending transfer and receipt';

  @override
  String get purchase_details_full_payment => 'Full payment';

  @override
  String get purchase_details_paddle_price => 'Paddle price';

  @override
  String get seller_due_amount => 'Seller Dues';

  @override
  String get delete_account_screen_title => 'Delete Account';

  @override
  String get delete_account_warning_title => 'Warning before deleting account';

  @override
  String get delete_account_warning_message =>
      'Dear user, when you delete your account, your data will be deleted and cannot be restored except by contacting the support team.';

  @override
  String get delete_account_now => 'Delete account now';

  @override
  String get delete_account_confirm_message =>
      'Are you sure you want to delete your account?';

  @override
  String get delete_account_cancel_action => 'Go back';

  @override
  String get delete_account_confirm_action => 'Confirm';

  @override
  String get delete_account_changed_mind => 'I changed my mind';

  @override
  String get home_dialog_camels_title => 'Camel auctions';

  @override
  String get home_dialog_horses_title => 'Horse auctions';

  @override
  String get home_dialog_subtitle => 'Choose the auction type to continue.';

  @override
  String get home_dialog_option_single_title => 'Single auction';

  @override
  String get home_dialog_option_single_subtitle =>
      'Direct sale with one clear listing and full details.';

  @override
  String get home_dialog_option_single_badge => 'Single';

  @override
  String get home_dialog_option_group_title => 'Group / annual auction';

  @override
  String get home_dialog_option_group_subtitle =>
      'Multiple participations in a large seasonal auction.';

  @override
  String get home_dialog_option_group_badge => 'Group';

  @override
  String get add_ad_live_electronic_subtitle => 'Hybrid option';

  @override
  String get add_ad_electronic_only_subtitle => 'No live attendance';

  @override
  String get add_ad_show_auction_opening_price_hint =>
      'Enable this option to show the auction starting price to buyers.';

  @override
  String get add_ad_market_entry_price_visibility_hint =>
      'Show or hide the market entry fee within the listing.';

  @override
  String get auction_sold_label => 'Sold';

  @override
  String get auction_unsold_label => 'Unsold';

  @override
  String get auction_participating_label => 'Participating';

  @override
  String get auction_withdrawn_label => 'Withdrawn';

  @override
  String get auction_paddles_count_label => 'Number of Bidders';
  @override
  String get property_details_title => 'Property Details';

  @override
  String get property_contact_advertiser => 'Contact Advertiser';

  @override
  String get property_choose_contact_method => 'Choose your preferred contact method';

  @override
  String get property_phone_call => 'Phone Call';

  @override
  String get property_no_data => 'No property data available';

  @override
  String get property_skeleton_title => 'Luxury residential apartment in a prime location';

  @override
  String get property_skeleton_description => 'A short property overview appears while property details are loading from the server';

  @override
  String get property_about => 'About the Property';

  @override
  String get property_ad_details => 'Advertisement Details';

  @override
  String get property_coverage_details => 'Coverage Details';

  @override
  String get property_price => 'Property Price';

  @override
  String get property_ownable_amount => 'Ownable Amount';

  @override
  String get property_covered_amount => 'Covered';

  @override
  String get property_remaining_amount => 'Remaining';

  @override
  String get property_completed => 'Completed';

  @override
  String get property_documents => 'Property Documents';

  @override
  String get property_document_title_deed => 'Title Deed';

  @override
  String get property_document_valuation_report => 'Valuation Report';

  @override
  String get property_document_financial_study => 'Financial Study';

  @override
  String get property_document_investment_contract => 'Investment Contract';

  @override
  String get property_download => 'Download';

  @override
  String get property_no_documents => 'No documents available';

  @override
  String get property_sale_terms => 'Sale Terms';

  @override
  String get property_more => 'More';

  @override
  String get property_no_sale_terms => 'No sale terms available';

  @override
  String get property_value => 'Property Value';

  @override
  String get property_specifications => 'Property Specifications';

  @override
  String get property_age => 'Property Age';

  @override
  String get property_face => 'Property Face';

  @override
  String get property_street_width => 'Street Width';

  @override
  String get property_title_deed_type => 'Title Deed Type';

  @override
  String get property_usages => 'Usages';

  @override
  String get property_utilities => 'Utilities';

  @override
  String get property_location_data => 'Location Data';

  @override
  String get property_region => 'Region';

  @override
  String get property_city => 'City';

  @override
  String get property_district => 'District';

  @override
  String get property_street => 'Street';

  @override
  String get property_building_number => 'Building Number';

  @override
  String get property_additional_number => 'Additional Number';

  @override
  String get property_latitude => 'Latitude';

  @override
  String get property_longitude => 'Longitude';

  @override
  String get property_advertiser_data => 'Advertiser Data';

  @override
  String get property_advertiser_name => 'Advertiser Name';

  @override
  String get advertiser_profile_title => 'Advertiser profile';
  @override
  String get advertiser_unknown => 'Advertiser';
  @override
  String get advertiser_info_tab => 'Information';
  @override
  String get advertiser_ads_tab => 'Advertisements';
  @override
  String get advertiser_reviews_tab => 'Reviews';

  @override
  String get my_reviews => 'My reviews';

  @override
  String get more_desc_my_reviews => 'View the reviews you have received';
  @override
  String get advertiser_information => 'Advertiser information';
  @override
  String get advertiser_full_name => 'Full name';
  @override
  String get advertiser_phone => 'Phone number';
  @override
  String get advertiser_email => 'Email address';
  @override
  String get advertiser_no_reviews => 'No reviews yet';
  @override
  String get advertiser_rate => 'Rate';
  @override
  String get advertiser_rate_title => 'Rate advertiser';
  @override
  String get advertiser_rating_description => 'Description';
  @override
  String get advertiser_rating_description_hint => 'Enter description';
  @override
  String get advertiser_choose_rating => 'Choose your rating';
  @override
  String get advertiser_send_rating => 'Send';
  @override
  String advertiser_reviews_count(int count) => '$count reviews';
  @override
  String get advertiser_reviews_label => 'reviews';
  @override
  String get advertiser_star_rating => 'star rating';
  @override
  String advertiser_membership_duration(int count) => '$count months\non forsan';
  @override
  String get advertiser_preview_reviewer_name => 'Mohammed Saeed';
  @override
  String get advertiser_preview_review_comment =>
      'This space is reserved for the review text. This space is reserved for the review text.';

  @override
  String get property_mobile_number => 'Mobile Number';

  @override
  String get property_brokerage_license => 'Brokerage License';

  @override
  String get property_employee_name => 'Employee Name';

  @override
  String get property_employee_mobile => 'Employee Mobile';

  @override
  String get property_license_data => 'License Data';

  @override
  String get property_end_date => 'End Date';

  @override
  String get property_ad_channels => 'Advertisement Channels';

  @override
  String get property_ad_license_link => 'Advertisement License Link';

  @override
  String get property_attributes => 'Property Attributes';

  @override
  String get property_no_data_available => 'No data available';

  @override
  String get property_meter_unit => 'm';

  @override
  String get property_details_summary => 'Property Details';

  @override
  String get property_area => 'Area';

  @override
  String get property_type => 'Property Type';

  @override
  String get property_ad_license_number => 'Advertisement License Number';

  @override
  String get property_available_ownership_percentage => 'Available Ownership Percentage';

  @override
  String get property_ownership_details => 'Ownership Details';

  @override
  String get property_ownership_percentage => 'Ownership Percentage';

  @override
  String get property_total_investment => 'Total Investment';

  @override
  String get property_timeline => 'Timeline';

  @override
  String get property_ownership_registration => 'Ownership Registration';

  @override
  String get property_partial_purchase => 'Partial Purchase';

  @override
  String get property_opportunity_listed => 'Opportunity Listed';

  @override
  String get property_opportunity_listed_desc => 'The opportunity has been listed and is now available for fractional ownership';

  @override
  String get property_opportunity_opened => 'Opportunity Opened';

  @override
  String get property_opportunity_opened_desc => 'The opportunity is now open for ownership';

  @override
  String get property_funding_completed => 'Funding Completed';

  @override
  String get property_funding_completed_desc => 'The opportunity has reached 100% funding';

  @override
  String get property_opportunity_closed => 'Opportunity Closed';

  @override
  String get property_opportunity_closed_desc => 'The opportunity has been closed and ownership certificates have been issued';

  @override
  String get property_purchased_prefix => 'Purchased ';

  @override
  String get property_purchased_amount_connector => ' for ';

  @override
  String get property_riyal => 'SAR';

  @override
  String get property_registered_prefix => 'Registered ownership of ';

  @override
  String get property_registered_suffix => ' of the property';

  @override
  String get property_list_separator => ', ';



  @override
  String get add_property_title => 'New listing';

  @override
  String add_property_step(int current, int total) => 'Step $current of $total';

  @override
  String get add_property_listing_title => 'Choose listing type';

  @override
  String get add_property_listing_subtitle => 'Select the listing purpose and property type to get started.';

  @override
  String get add_property_listing_type => 'Listing purpose';

  @override
  String get add_property_operation_type => 'Operation type';

  @override
  String get add_property_for_sale => 'For sale';

  @override
  String get add_property_for_rent => 'For rent';

  @override
  String get add_property_property_type => 'Property type';

  @override
  String get add_property_apartment => 'Apartment';

  @override
  String get add_property_villa => 'Villa';

  @override
  String get add_property_arabic_house => 'Arabic house';

  @override
  String get add_property_building => 'Building';

  @override
  String get add_property_chalet => 'Chalet';

  @override
  String get add_property_land => 'Land';

  @override
  String get add_property_office => 'Office';

  @override
  String get add_property_commercial_shop => 'Commercial shop';

  @override
  String get add_property_farm => 'Farm';

  @override
  String get add_property_warehouse => 'Warehouse';

  @override
  String get add_property_advertiser_type => 'Advertiser type';

  @override
  String get add_property_advertiser_owner => 'Owner';

  @override
  String get add_property_advertiser_agent => 'Real estate agent';

  @override
  String get add_property_select_hint => 'Please select';

  @override
  String get add_property_governorate => 'Province';

  @override
  String get add_property_district_hint => 'Please enter the district';

  @override
  String get add_property_map_location => 'Location';

  @override
  String get add_property_riyadh_province => 'Riyadh Province';

  @override
  String get add_property_makkah_province => 'Makkah Province';

  @override
  String get add_property_eastern_province => 'Eastern Province';

  @override
  String get add_property_riyadh_city => 'Riyadh';

  @override
  String get add_property_jeddah_city => 'Jeddah';

  @override
  String get add_property_dammam_city => 'Dammam';

  @override
  String get add_property_location_title => 'Where is the property?';

  @override
  String get add_property_location_subtitle => 'Enter the property’s basic location information.';

  @override
  String get add_property_city => 'City';

  @override
  String get add_property_district => 'District';

  @override
  String get add_property_details_title => 'Property details';

  @override
  String get add_property_details_subtitle => 'Add information that helps people understand your property.';

  @override
  String get add_property_ad_title => 'Listing title';

  @override
  String get add_property_description => 'Property description';

  @override
  String get add_property_area => 'Area (m²)';

  @override
  String get add_property_price => 'Price (SAR)';

  @override
  String get add_property_review_title => 'Review your listing';

  @override
  String get add_property_review_subtitle => 'Make sure the information is correct before publishing.';

  @override
  String get add_property_required => 'This field is required';

  @override
  String get add_property_positive_number => 'Enter a number greater than zero';

  @override
  String get add_property_previous => 'Previous';

  @override
  String get add_property_continue => 'Continue';

  @override
  String get add_property_publish => 'Publish property';

  @override
  String get add_property_success => 'Property submitted successfully';

  @override
  String get add_property_discard_title => 'Discard listing?';

  @override
  String get add_property_discard_message => 'You will lose the information entered during this session.';

  @override
  String get add_property_keep_editing => 'Keep editing';

  @override
  String get add_property_discard => 'Discard';


  @override
  String get add_property_bedrooms => 'Bedrooms';

  @override
  String get add_property_bathrooms => 'Bathrooms';

  @override
  String get add_property_features_title => 'Property features';

  @override
  String get add_property_features_subtitle => 'Select the features available at the property.';

  @override
  String get add_property_feature_parking => 'Parking';

  @override
  String get add_property_feature_elevator => 'Elevator';

  @override
  String get add_property_feature_pool => 'Pool';

  @override
  String get add_property_feature_garden => 'Garden';

  @override
  String get add_property_feature_security => 'Security';

  @override
  String get add_property_feature_furnished => 'Furnished';

  @override
  String get add_property_media_title => 'Property photos';

  @override
  String get add_property_media_subtitle => 'Add clear photos that showcase the property.';

  @override
  String get add_property_add_photos => 'Add photos';

  @override
  String get add_property_remove_photo => 'Remove photo';

  @override
  @override
  String get add_property_price_label => 'Price';

  @override
  String get add_property_currency_sar => 'SAR';

  @override
  String get add_property_price_hint => 'Enter the price';

  @override
  String get add_property_ad_title_hint => 'Example: New apartment for sale';

  @override
  String get add_property_description_hint => 'Enter description';

  @override
  String get add_property_price_info_note => 'Note: Use a clear, appealing title and describe the key features to attract more interested buyers.';

  @override
  String get add_property_conditions_title => 'Listing conditions (optional)';

  @override
  String get add_property_conditions_subtitle => 'Add conditions the buyer / tenant should know';

  @override
  String get add_property_condition_as_is => 'Property as-is condition';

  @override
  String get add_property_condition_bank_transfer => 'Payment by bank transfer';

  @override
  String get add_property_condition_viewing => 'Property viewing';

  @override
  String get add_property_condition_hint => 'Enter a condition';

  @override
  String get add_property_add_condition => 'Add';

  String get add_property_price_title => 'Set the price';

  @override
  String get add_property_price_subtitle => 'Enter the asking price for the property.';


  @override
  String get add_property_location_progress => 'Location';

  @override
  String get add_property_address_progress => 'Address';

  @override
  String get add_property_details_progress => 'Details';

  @override
  String get add_property_features_progress => 'Features';

  @override
  String get add_property_media_progress => 'Photos';

  @override
  String get add_property_price_progress => 'Price';

  @override
  String get add_property_review_progress => 'Review';

  @override
  String get property_owner_pending_title => 'Pending';

  @override
  String get property_owner_pending_description => 'Your listing was submitted for review. We will notify you once it is approved.';

  @override
  String get property_owner_rejected_title => 'Listing rejected';

  @override
  String get property_owner_rejected_description => 'Your listing could not be approved because it requires changes.';

  @override
  String get property_owner_draft_title => 'Draft';

  @override
  String get property_owner_draft_description => 'This listing has not been published yet. Complete the steps to publish it.';

  @override
  String property_owner_rejection_reason(Object reason) => 'Rejection reason: $reason';

  @override
  String get property_gallery_view_video => 'Watch video';

  @override
  String get customerServiceTitle => 'Customer Service';

  @override
  String get customerServiceContactVia => 'Contact via';

  @override
  String get customerServiceWhatsapp => 'WhatsApp';

  @override
  String get customerServiceCall => 'Call';

  @override
  String get customerServiceSocialHint => 'Or you can contact us through';

  @override
  String get account_verification_title => 'Account verification';

  @override
  String get account_verification_id_front => 'ID image - front';

  @override
  String get account_verification_id_front_hint => 'Please add a photo of the front of your ID';

  @override
  String get account_verification_id_back => 'ID image - back';

  @override
  String get account_verification_id_back_hint => 'Please add a photo of the back of your ID';

  @override
  String get account_verification_commercial_record => 'Commercial registration';

  @override
  String get account_verification_commercial_record_hint => 'Please add a clear image of a valid commercial registration';

  @override
  String get account_verification_add_image => 'Add image';

  @override
  String get account_verification_registration_number => 'Commercial registration number';

  @override
  String get account_verification_registration_number_hint => 'Enter the commercial registration number';

  @override
  String get account_verification_upload_note => 'Images must be clear and in color (PNG - JPG). Maximum image size is 5MB.';

  @override
  String get account_verification_submit => 'Submit request';

  @override
  String get account_verification_request_sent => 'Verification request submitted';

  @override
  String get account_verification_success_title => 'Verification request submitted';

  @override
  String get account_verification_success_message => 'Your request is under review. We will notify you of the result as soon as possible.';

  @override
  String get account_verification_back_home => 'Back to home';

  @override
  String get account_verification_verified_title => 'Your account is verified';

  @override
  String get account_verification_verified_description => 'Congratulations! Your account has been verified and the verification badge will appear on your profile.';

  @override
  String get account_verification_under_review_title => 'Under review';

  @override
  String get account_verification_under_review_description => 'Your verification request has been received and the team is reviewing the documents.';

  @override
  String get account_verification_rejected_title => 'Verification request rejected';

  @override
  String get account_verification_rejected_description => 'Sorry, we could not verify your account because there is an issue with the uploaded documents.';

  @override
  String get account_verification_rejection_reason => 'Rejection reason: Please use clear, high-quality images.';

  @override
  String get account_verification_submission_date => 'Request date';

  @override
  String get account_verification_approval_date => 'Approval date';

  @override
  String get account_verification_rejection_date => 'Rejection date';

  @override
  String get account_verification_resubmit => 'Resubmit request';

  @override
  String get order_details => 'Order details';

  @override
  String get order_summary => 'Order summary';

  @override
  String get order_submitter => 'Submitted by';

  @override
  String get order_date => 'Order date';

  @override
  String get order_service => 'Service';

  @override
  String get order_service_type => 'Service type';

  @override
  String get order_fees => 'Fees';

  @override
  String get order_submitter_abroad => 'Expatriate / Outside Syria';

  @override
  String get order_business_establishment => 'Business establishment';

  @override
  String get order_fees_after_review => 'Determined after review';

  @override
  String get order_stages => 'Order stages';

  @override
  String get order_documents => 'Order documents';

  @override
  String get order_required_action => 'Action required';

  @override
  String get order_required_documents_message => 'Please attach the required documents to complete the order';

  @override
  String get order_complete_requirements => 'Complete requirements';

  @override
  String get complete_requirements_notice =>
      'The following documents are required to complete your order review.\nAfter all documents are uploaded, they will be reviewed by the Forsan team.';

  @override
  String get complete_requirements_documents_title => 'Required documents';

  @override
  String get complete_requirements_conviction_certificate =>
      'Certificate of no conviction';

  @override
  String get complete_requirements_upload => 'Tap to upload';

  @override
  String get complete_requirements_upload_hint =>
      'Maximum file size is 5 MB (PNG-JPG-PDF)';


  @override
  String get complete_requirements_confirm => 'Confirm';

  @override
  String get order_contact_consultant => 'Contact a Forsan consultant';


  @override
  String get order_attached_documents => 'Attached documents';

  @override
  String get order_price_quote => 'Price quote';


  @override
  String get order_approve_and_pay => 'Approve and pay';


  @override
  String get order_document_passport => 'Passport';

  @override
  String get order_document_commercial_record => 'Commercial registration';

  @override
  String get order_document_identity => 'Identity document';

  @override
  String get order_document_company_address => 'Company address document';

  @override
  String get order_document_status_approved => 'Approved';

  @override
  String get order_document_status_rejected => 'Rejected';

  @override
  String get order_document_status_under_review => 'Under review';

  @override
  String get order_document_status_required => 'Required';

  @override
  String get order_document_status_not_required => 'Not currently required';

  @override
  String get order_stage_received_title => 'Order received';

  @override
  String get order_stage_received_description => 'The transaction file was received and its details were sent to the business setup services team.';

  @override
  String get order_stage_review_title => 'Order review';

  @override
  String get order_stage_review_description => 'The order and its basic information were reviewed, and an advisor was assigned.';

  @override
  String get order_stage_documents_title => 'Documents';

  @override
  String get order_stage_documents_description => 'The documents will be reviewed. If anything is missing, the team will send you a request to complete them.';

  @override
  String get order_stage_quote_title => 'Quote and plan preparation';

  @override
  String get order_stage_quote_description => 'Once the documents are complete, the service quote will appear with the fees, duration, and approved implementation steps.';

  @override
  String get order_stage_payment_title => 'Quote approval and payment';

  @override
  String get order_stage_payment_description => 'You can approve the quote, choose a payment method, and download the invoice and receipt from the dashboard.';

  @override
  String get order_stage_execution_title => 'Execution and follow-up';

  @override
  String get order_stage_execution_description => 'The Forsan team will handle the transaction and keep you updated about every step or new requirement.';

  @override
  String get order_stage_completion_title => 'Completion and delivery';

  @override
  String get order_stage_completion_description => 'When the service is complete, the final documents will be uploaded and the order closed, with the option to rate the service.';

  @override
  String get order_stage_sample_date => '26 January 2026';

  @override
  String get create_order_title => 'Create order';

  @override
  String get create_order_choose_service => 'Choose a service type';

  @override
  String get create_order_licensing => 'Licensing';

  @override
  String get create_order_business_setup => 'Business setup';

  @override
  String get create_order_company_management => 'Company management';

  @override
  String get create_order_property => 'Property and real estate';

  @override
  String get create_order_investment => 'Investment (coming soon)';

  @override
  String get create_order_expatriate_services => 'Expatriate services';

  @override
  String get create_order_help_title => 'Need help?';

  @override
  String get create_order_help_description =>
      'Our team is available to help you choose the right service';
  @override
  String get new_order_title => 'New order';

  @override
  String get new_order_step_establishment => 'Setup type';

  @override
  String get new_order_step_applicant => 'Applicant';

  @override
  String get new_order_step_company_info => 'Company details';

  @override
  String get new_order_establishment_title => 'Select the establishment type';

  @override
  String get new_order_establishment_description => 'Choose the option closest to your situation. If you are unsure, you can ask the Forsan team for help.';

  @override
  String get new_order_new_company => 'Establish a new company';

  @override
  String get new_order_company_branch => 'Open a branch of an existing company';

  @override
  String get new_order_contact_identity_title => 'Contact and identity details';

  @override
  String get new_order_contact_identity_description =>
      'We will use this information to review the request and contact you about missing information or additional steps.';

  @override
  String get new_order_full_name => 'Full name';

  @override
  String get new_order_full_name_hint => 'Example: Mohammad Khatib';

  @override
  String get new_order_father_name => "Father's name";
  @override
  String get new_order_father_name_hint => "Enter father's name";
  @override
  String get new_order_nationality => 'Nationality';
  @override
  String get new_order_select_hint => 'Please select';
  @override
  String get new_order_male => 'Male';
  @override
  String get new_order_female => 'Female';
  @override
  String get new_order_syrian_nationality => 'Syrian';
  @override
  String get new_order_non_syrian_nationality => 'Non-Syrian';
  @override
  String get new_order_passport_number_optional => 'Passport number (optional)';
  @override
  String get new_order_passport_number_hint => 'Enter passport number';
  @override
  String get new_order_national_id => 'National number / ID number';
  @override
  String get new_order_national_id_hint => 'Enter national number / ID number';
  @override
  String get new_order_mobile_number => 'Mobile number';
  @override
  String get new_order_mobile_number_hint => '000 000 000';
  @override
  String get new_order_whatsapp_number => 'WhatsApp number';
  @override
  String get new_order_whatsapp_number_hint => 'Leave empty if it is the same as the mobile number';
  @override
  String get new_order_email => 'Email';
  @override
  String get new_order_email_hint => 'Enter email';

  @override
  String get new_order_delegation_in_syria => 'Authorization inside Syria';
  @override
  String get new_order_delegation_in_syria_description => 'Specify whether you have an authorized person or agent inside Syria';
  @override
  String get new_order_has_representative_in_syria => 'I have an authorized person or agent inside Syria';
  @override
  String get new_order_representative_details_description => 'Their details and power of attorney can be added later with the documents.';

  @override
  String get new_order_next => 'Next';

  @override
  String get new_order_submit => 'Submit request';

  @override
  String get new_order_proposed_company_info_title =>
      'Proposed company information';

  @override
  String get new_order_proposed_company_info_description =>
      'You can enter more than one proposed trade name to increase the likelihood that one option is approved.';

  @override
  String get new_order_proposed_company_name => 'First proposed trade name';

  @override
  String get new_order_proposed_company_name_hint =>
      'Example: Forsan Technology';

  @override
  String get new_order_second_proposed_company_name_optional =>
      'Second proposed name (optional)';

  @override
  String get new_order_second_proposed_company_name_hint =>
      'Enter the second proposed name';

  @override
  String get new_order_third_proposed_company_name_optional =>
      'Third proposed name (optional)';

  @override
  String get new_order_third_proposed_company_name_hint =>
      'Enter the third proposed name';

  @override
  String get new_order_company_name_english_optional =>
      'Name in English (optional)';

  @override
  String get new_order_company_name_english_hint => 'Enter the name in English';

  @override
  String get new_order_governorate => 'Governorate';

  @override
  String get new_order_city_or_area => 'City / area';

  @override
  String get new_order_city_or_area_hint => 'Enter the city / area';

  @override
  String get new_order_has_headquarters_currently =>
      'Do you currently have a headquarters?';

  @override
  String get new_order_yes => 'Yes';

  @override
  String get new_order_no => 'No';

  @override
  String get new_order_headquarters_address => 'Headquarters address';

  @override
  String get new_order_headquarters_address_hint =>
      'Enter the headquarters address';

  @override
  String get new_order_trade_name_approval_notice =>
      'Trade-name approval and final regulatory requirements are determined after the request is reviewed by the Forsan team and the relevant authorities.';

  @override
  String get new_order_company_activity => 'Company activity';

  @override
  String get new_order_company_activity_hint => "Enter the company's main activity";

  @override
  String get new_order_company_headquarters => 'Proposed company headquarters';

  @override
  String get new_order_company_headquarters_hint =>
      'Enter the city or governorate';

  @override
  String get new_order_company_capital => 'Proposed capital';

  @override
  String get new_order_company_capital_hint => 'Enter the expected capital';

  @override
  String get new_order_one_person_company => 'Single-person company';

  @override
  String get new_order_one_person_company_description => 'One owner manages and owns the company.';

  @override
  String get new_order_limited_liability_company => 'Limited liability company';

  @override
  String get new_order_limited_liability_company_description => 'A company formed by two or more partners.';

  @override
  String get new_order_foreign_partner_company => 'Company with a foreign partner';

  @override
  String get new_order_foreign_partner_company_description => 'One partner is abroad or is a foreign national.';

  @override
  String get new_order_individual_establishment => 'Sole proprietorship';

  @override
  String get new_order_individual_establishment_description => 'An individual business under the owner’s name.';

  @override
  String get new_order_joint_stock_company => 'General partnership';

  @override
  String get new_order_joint_stock_company_description => 'A partnership under the appropriate legal form.';

  @override
  String get new_order_applicant_role_title => 'Applicant role';

  @override
  String get new_order_applicant_role_description => 'Select the capacity in which you are submitting this request.';

  @override
  String get new_order_syrian_citizen => 'Syrian citizen';

  @override
  String get new_order_syrian_citizen_description => 'I am submitting this request personally.';

  @override
  String get new_order_expatriate => 'Expatriate / Outside Syria';

  @override
  String get new_order_expatriate_description => 'I am submitting this request from outside Syria.';

  @override
  String get new_order_foreign_investor => 'Foreign investor';

  @override
  String get new_order_foreign_investor_description => 'I am not Syrian and want to establish a business.';

  @override
  String get new_order_company_representative => 'Company representative';

  @override
  String get new_order_company_representative_description => 'I am submitting this request on behalf of an entity.';

}
