// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get app_name => 'منصة عطايا';

  @override
  String get home => 'العودة إلى الرئيسية';

  @override
  String get horses_platform => 'منصة الخيول';

  @override
  String get camels_platform => 'منصة الإبل';

  @override
  String get mass_auctions => 'المزادات الجماعية';

  @override
  String get mass_horse_auctions => 'مزادات الخيول الجماعية';

  @override
  String get mass_camel_auctions => 'مزادات الإبل الجماعية';

  @override
  String get services => 'الخدمات';

  @override
  String get download_catalog => 'تحميل الكتيب';

  @override
  String get i_agree_to_the => 'أوافق على';

  @override
  String get terms_and_conditions => 'الشروط والأحكام';

  @override
  String get direct_electronic => 'إلكتروني مباشر';

  @override
  String get dashboard => 'لوحة التحكم';

  @override
  String get medical_services => 'خدمات طبية';

  @override
  String get transport_services => 'خدمات نقل';

  @override
  String get animal_products => 'منتجات';

  @override
  String get statistics => 'الإحصائيات';

  @override
  String get contact_us => 'اتصل بنا';

  @override
  String get offers => 'العروض';

  @override
  String get auctions => 'المزادات';

  @override
  String get menu => 'القائمة';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get tap_back_again_to_leave => 'انقر للرجوع مرة أخرى للخروج :)';

  @override
  String get choose_language => 'اختر اللغة';

  @override
  String get language_arabic => 'العربية';

  @override
  String get language_english => 'الإنجليزية';

  @override
  String get logout_success => ' تم تسجيل الخروج بنجاح';

  @override
  String get logout_failed => ' فشل تسجيل الخروج من الخادم';

  @override
  String get logout_error => 'حدث خطأ أثناء تسجيل الخروج';

  @override
  String get title => 'خطأ في الخادم';

  @override
  String get medical_services_title => 'خدمات طبية';

  @override
  String get medical_services_desc => 'تقارير معتمدة قبل البيع.';

  @override
  String get transport_services_title => 'خدمات نقل';

  @override
  String get transport_services_desc => 'نقل آمن وتتبع مباشر.';

  @override
  String get animal_products_title => 'منتجات الخيل والإبل';

  @override
  String get animal_products_desc => 'منتجات موثوقة وعالية الجودة.';

  @override
  String auction_card_time_left(Object time) {
    return 'ينتهي خلال $time';
  }

  @override
  String get auction_card_title => 'الخيل 101 — \"الهيل\"';

  @override
  String auction_card_breed_age(Object breed, Object age) {
    return '$breed : السلالة • $age : العمر';
  }

  @override
  String get auction_card_join_now => 'شارك الآن';

  @override
  String get banner_default_title_html =>
      '<h2 style=\"color: #9C27B0;\">منصة المزادات المتقدمة للخيول والأبل</h2>';

  @override
  String get banner_default_body_html =>
      '<p>مزادات مباشرة وعروض ثابتة مع خدمات فحص بيطري ونقل معتمد</p>';

  @override
  String get banner_default_button => 'اضغط';

  @override
  String get mass_auction_badge => 'المزاد الجماعي';

  @override
  String get mass_auction_title => 'مزاد خيل — بإدارة عطايا';

  @override
  String get countdown_label => 'العد التنازلي';

  @override
  String get event_short_description =>
      'يبدأ بعد شهرين، مدة الحدث 3 أيام، كل خيل 15 دقيقة';

  @override
  String get download_booklet => 'تحميل الكتيّب';

  @override
  String get event_details => 'تفاصيل الحدث';

  @override
  String platform_sponsored_by(Object name) {
    return 'برعاية: $name';
  }

  @override
  String get live_auctions_title => 'مزادات حية';

  @override
  String get live_auctions_desc => 'مزايدة لحظية عبر البث الحي.';

  @override
  String get subtitle =>
      'هنا يمكنك متابعة أحدث التحديثات والرسائل الخاصة بإعلاناتك ومزاداتك.';

  @override
  String get all => 'الكل';

  @override
  String get home_properties_title => 'العقارات';

  @override
  String get properties_my_properties_title => 'عقاراتي';

  @override
  String get properties_filter_completed => 'مكتملة';

  @override
  String get properties_filter_active => 'نشطة';

  @override
  String get properties_total_count => 'عدد العقارات';

  @override
  String get properties_filter_accepted => 'مقبولة';

  @override
  String get properties_filter_pending => 'قيد الانتظار';

  @override
  String get properties_filter_draft => 'مسودة';

  @override
  String get property_card_status_accepted => 'مقبول';

  @override
  String get property_card_status_pending => 'قيد الانتظار';

  @override
  String get property_card_status_rejected => 'مرفوض';

  @override
  String get property_card_status_draft => 'مسودة';

  @override
  String get properties_total_value => 'إجمالي قيمة العقارات';

  @override
  String get properties_upcoming_returns => 'العوائد القادمة';

  @override
  String get properties_realized_returns => 'العوائد المحققة';

  @override
  String get properties_empty_title => 'لم تبدأ رحلة التملك بعد';

  @override
  String get properties_empty_message => 'ليس لديك أي عقارات حتى الآن، يمكنك\nاستعراض الفرص المتاحة وابدأ التملك بكل سهولة';

  @override
  String get properties_skeleton_apartment => 'شقة سكنية فاخرة';

  @override
  String get properties_skeleton_villa => 'فيلا سكنية راقية';

  @override
  String get properties_skeleton_floor => 'دور مستقل فاخر';

  @override
  String get home_welcome => 'أهلاً وسهلاً';

  @override
  String get home_search_title => 'هل تبحث عن عقار؟';

  @override
  String get home_search_subtitle => 'أي مكان، أي سعر، أي عقار';

  @override
  String home_welcome_user(Object name) {
    return 'أهلاً وسهلاً $name';
  }

  @override
  String get home_filter_all => 'الكل';

  @override
  String get home_filter_usufruct => 'حق الانتفاع';

  @override
  String get home_filter_covered => 'تمت التغطية';

  @override
  String get cityLabel => 'المدينة';

  @override
  String get loadMore => 'عرض المزيد';

  @override
  String get login_title => 'تسجيل الدخول';

  @override
  String get login_description =>
      'يرجى إدخال رقم الجوال الخاص بك واختيار الطريقة المناسبة لاستقبال رمز التحقق.';

  @override
  String get country_code_placeholder => '+966';

  @override
  String get via_sms => 'رسالة نصية';

  @override
  String get via_whatsapp => 'واتساب';

  @override
  String get otp_title => 'رمز التحقق';

  @override
  String get otp_sent_to => 'أرسلنا رمز التحقق إلى';

  @override
  String get otp_next => 'التالي';

  @override
  String get otp_resend => 'إعادة الإرسال';

  @override
  String get complete_profile_app_bar_title => 'إكمال الملف الشخصي';
  @override
  String get complete_profile_first_name_hint => 'ادخل الاسم الأول';
  @override
  String get complete_profile_last_name_hint => 'ادخل الاسم الأخير';
  @override
  String get complete_profile_email_hint => 'ادخل البريد الإلكتروني';
  @override
  String get complete_profile_email_verification_title => 'التحقق من البريد الإلكتروني';
  @override
  String complete_profile_email_verification_message(String email) => 'تم إرسال رمز التحقق إلى $email\nيرجى مراجعته وإدخال الرمز';
  @override
  String get complete_profile_resend_code_hint => 'يمكنك طلب رمز جديد خلال';
  @override
  String get complete_profile_resend_code => 'إعادة إرسال الرمز';
  @override
  String get complete_profile_error_title => 'خطأ';


  @override
  String get complete_profile_required_field => 'هذا الحقل مطلوب';
  @override
  String get complete_profile_name_min_length => 'يجب ألا يقل الاسم عن حرفين';
  @override
  String get complete_profile_invalid_name => 'يرجى إدخال اسم صحيح';
  @override
  String get complete_profile_email_required => 'البريد الإلكتروني مطلوب';
  @override
  String get complete_profile_invalid_email => 'يرجى إدخال بريد إلكتروني صحيح';
  @override
  String get complete_profile_otp_required => 'رمز التحقق مطلوب';
  @override
  String get complete_profile_invalid_otp => 'رمز التحقق يجب أن يتكون من 4 أرقام';

  @override
  String get complete_profile_title => 'يجب عليك إكمال البيانات الشخصية';

  @override
  String get first_name => 'الاسم الأول';

  @override
  String get last_name => 'الاسم الأخير';

  @override
  String get country => 'الدولة';

  @override
  String get city => 'المدينة';

  @override
  String get district => 'الحي';

  @override
  String get enter_valid_phone => '⚠️ الرجاء إدخال رقم جوال صحيح.';

  @override
  String get code_sent => '✅ تم إرسال رمز التحقق إلى رقمك.';

  @override
  String get send_failed => '❌ فشل إرسال الرمز، حاول مجددًا.';

  @override
  String get login_success => '🎉 تم تسجيل الدخول بنجاح !';

  @override
  String get invalid_code => 'رمز التحقق غير صحيح، حاول مجددًا.';

  @override
  String get verify_failed => '❌ فشل التحقق من الرمز.';

  @override
  String get resent_info => '🔁 تم إرسال الرمز مجددًا (اختبار فقط).';

  @override
  String get sending => 'جاري الإرسال';

  @override
  String get verifying => 'جاري التحقق';

  @override
  String get fill_all_fields => '⚠️ الرجاء تعبئة جميع الحقول.';

  @override
  String get profile_saved => '✅ تم حفظ البيانات بنجاح!';

  @override
  String get profile_save_error => '❌ فشل في حفظ البيانات، حاول مجددًا.';

  @override
  String get saving => 'جاري الحفظ';

  @override
  String get phone_number => 'رقم الجوال';

  @override
  String get login_required_title => 'تحتاج إلى تسجيل الدخول';

  @override
  String get login_required_message =>
      'للوصول إلى هذه الصفحة، يجب عليك تسجيل الدخول أولاً. الرجاء تسجيل الدخول بحسابك للمتابعة.';

  @override
  String get login_now => 'تسجيل الدخول الآن';

  @override
  String get back_home => 'العودة إلى الرئيسية';

  @override
  String get login_required_alt => 'رمز تسجيل الدخول';

  @override
  String get stable_name => 'اسم المزرعة';

  @override
  String get full_name => 'الاسم الكامل';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get signup_account_information => 'معلومات الحساب';

  @override
  String get signup_enter_full_name => 'يرجى إدخال الاسم الكامل';

  @override
  String get signup_nationality => 'الجنسية';

  @override
  String get signup_select_hint => 'يرجى الاختيار';

  @override
  String get signup_enter_email => 'يرجى إدخال البريد الإلكتروني';

  @override
  String get signup_saudi_arabia => 'المملكة العربية السعودية';

  @override
  String get signup_kuwait => 'الكويت';

  @override
  String get signup_saudi => 'سعودي';

  @override
  String get signup_kuwaiti => 'كويتي';

  @override
  String get gender => 'الجنس';

  @override
  String get male => 'ذكر';

  @override
  String get female => 'أنثى';

  @override
  String get country_code => 'رمز الدولة';

  @override
  String get profile_image => 'الصورة الشخصية';

  @override
  String get no_image => 'لا توجد صورة';

  @override
  String get default_alt => 'صورة';

  @override
  String get camel_title => 'إضافة إبل';

  @override
  String get horse_title => 'إضافة خيل';

  @override
  String get camel_offers => 'عروض الإبل';

  @override
  String get camel_auctions => 'مزاد الإبل';

  @override
  String get camel_offers_keyword => 'عروض';

  @override
  String get camel_auctions_keyword => 'مزاد';

  @override
  String get horse_offers => 'عروض الخيول';

  @override
  String get horse_auctions => 'مزاد الخيول';

  @override
  String get coming_soon => 'قريبًا';

  @override
  String get horse_badge => 'مزاد الخيل بإدارة أبو عبيد';

  @override
  String get camel_modal_title => 'منصة الإبل — قريبًا';

  @override
  String get camel_modal_body_1 => 'نعتذر، منصة الإبل قيد الإطلاق قريبًا.';

  @override
  String camel_modal_body_2(Object section) {
    return 'يمكنك متابعة التصفح الآن أو اختيار الانتقال إلى قسم $section.';
  }

  @override
  String get go_to_auctions => 'الانتقال إلى المزادات';

  @override
  String get go_to_offers => 'الانتقال إلى العروض';

  @override
  String get description =>
      'حدث خطأ غير متوقع في الخادم. يرجى المحاولة لاحقًا أو التواصل مع الدعم الفني.';

  @override
  String get appstore => 'App Store';

  @override
  String get googleplay => 'Google Play';

  @override
  String get alt => 'صورة توضيحية لخطأ في الخادم';

  @override
  String get hero_title => 'تواصل معنا';

  @override
  String get hero_description => 'نسعد بخدمتك والاستماع لملاحظاتك واستفساراتك.';

  @override
  String get breadcrumb_home => 'الرئيسية';

  @override
  String get breadcrumb_current => 'تواصل معنا';

  @override
  String get form_title => 'أرسل رسالة';

  @override
  String get form_description =>
      'املأ الحقول التالية وسنعاود التواصل خلال ساعات العمل.';

  @override
  String get form_success =>
      'تم إرسال رسالتك بنجاح، سنعاود التواصل معك قريبًا.';

  @override
  String get form_fullname => 'الاسم الكامل';

  @override
  String get form_fullname_placeholder => 'مثال: وائل الشمري';

  @override
  String get form_email => 'البريد الإلكتروني';

  @override
  String get form_email_placeholder => 'name@example.com';

  @override
  String get form_phone => 'رقم الجوال';

  @override
  String get form_topic => 'موضوع الرسالة';

  @override
  String get form_message => 'نص الرسالة';

  @override
  String get form_message_placeholder => 'اكتب رسالتك بالتفصيل...';

  @override
  String get form_file => 'مرفقات (اختياري)';

  @override
  String get form_captcha => 'رمز التحقق';

  @override
  String get form_captcha_placeholder => 'أدخل الرمز';

  @override
  String get form_terms => 'أوافق على';

  @override
  String get form_privacy => 'سياسة الخصوصية';

  @override
  String get form_terms_conditions => 'الشروط والأحكام';

  @override
  String get form_send => 'إرسال';

  @override
  String get form_clear => 'مسح';

  @override
  String get form_best_contact => 'أفضل طريقة للتواصل';

  @override
  String get choose => 'اختر موضوعًا…';

  @override
  String get general => 'استفسار عام';

  @override
  String get auction => 'مشكلة في المزاد';

  @override
  String get transport => 'طلب خدمة نقل';

  @override
  String get veterinary => 'خدمات بيطرية';

  @override
  String get payment => 'الدفع';

  @override
  String get suggestion => 'اقتراح تحسين';

  @override
  String get contact_info_title => 'معلومات التواصل';

  @override
  String get contact_info_phone => 'الهاتف';

  @override
  String get contact_info_whatsapp => 'واتساب';

  @override
  String get contact_info_email => 'البريد';

  @override
  String get contact_info_address =>
      'العنوان: الرياض، المملكة العربية السعودية';

  @override
  String get contact_info_hours => 'ساعات العمل: الأحد–الخميس 9 ص – 6 م';

  @override
  String get map_title => 'الموقع';

  @override
  String get map_subtitle => '(خريطة)';

  @override
  String get add_listing => 'إضافة إعلان / مزاد';

  @override
  String get my_auctions => 'مزاداتي';

  @override
  String get favorites => 'المفضلة';

  @override
  String get live_listings => 'العروض المباشرة';

  @override
  String get sales => 'عدد عمليات البيع';

  @override
  String get wallet => 'المحفظة';

  @override
  String get payment_methods_title => 'طرق الدفع';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get notifications_read_all => 'قراءة الكل';

  @override
  String get complaints => 'الشكاوى';

  @override
  String get reviews => 'التقييمات';

  @override
  String get howToRate => 'كيفية التقييم';

  @override
  String get ratingGuideMessage =>
      'حتى تقيّم بائع عليك شراء خيل أو ابل وعند اسكمال المبلغ واتمام الدفع وبعد تأكيد النقل تظهر لك واجهة التقييم لترك تقييمك مع رسالة';

  @override
  String get unableToLoadReviewsNow => 'لا يمكن تحميل التقييمات حالياً';

  @override
  String get noReviews => 'لا توجد تقييمات';

  @override
  String get loadMoreReviews => 'تحميل المزيد';

  @override
  String get viewReviews => 'عرض التقييمات';

  @override
  String get settings => 'إعدادات';

  @override
  String get language => 'اللغة';

  @override
  String get enable_biometrics => 'تفعيل البصمات الحيوية';

  @override
  String get biometric_lock_disabled => 'تم إيقاف قفل التطبيق بالبصمة';

  @override
  String get biometric_unavailable_message => 'الجهاز لا يدعم نافذة التحقق الحيوي أو يوجد خطأ في إعدادات البصمة';

  @override
  String get biometric_auth_reason => 'استخدم بصمة الإصبع لتفعيل قفل التطبيق';

  @override
  String get biometric_auth_failed => 'تعذر التحقق من البصمة، لم يتم تفعيل قفل التطبيق';

  @override
  String get biometric_activation_title => 'تفعيل السمات الحيوية';

  @override
  String get biometric_activation_description => 'استخدم بصمة الإصبع أو بصمة الوجه للدخول أسرع وأكثر أمانًا إلى حسابك';

  @override
  String get enable => 'تفعيل';

  @override
  String get later => 'لاحقًا';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get live_listings_count => 'عدد العروض المباشرة';

  @override
  String get auctions_count => 'عدد المزادات';

  @override
  String get total_due => 'إجمالي المبالغ المستحقة';

  @override
  String get pending_transfers => 'التحويلات المعلقة';

  @override
  String get image => 'صورة';

  @override
  String get type => 'له / عليه';

  @override
  String get start_date => 'تاريخ البدء';

  @override
  String get subscribers => 'المشتركين';

  @override
  String get status => 'الحالة';

  @override
  String get status_live => 'قائم';

  @override
  String get status_upcoming => 'قادم';

  @override
  String get status_finished => 'منتهي';

  @override
  String get enter_market => 'دخول السوق';

  @override
  String get delay_auction => 'تأجيل المزاد';

  @override
  String get delete_auction => 'حذف المزاد';

  @override
  String get confirm_delete => 'هل أنت متأكد من حذف المزاد؟';

  @override
  String market_alert(Object id) {
    return 'تم دخول السوق للمزاد رقم $id';
  }

  @override
  String delay_alert(Object id) {
    return 'تم تأجيل المزاد رقم $id';
  }

  @override
  String delete_alert(Object id) {
    return 'تم حذف المزاد رقم $id';
  }

  @override
  String get empty => 'لا توجد إعلانات مفضلة حاليًا ❤️';

  @override
  String get horse => 'خيل';

  @override
  String get camel => 'إبل';

  @override
  String get currency => 'ر.س';

  @override
  String get dash_placeholder => '—';

  @override
  String get official_documents => 'الوثائق الرسمية';

  @override
  String get medical_exam_certificate => 'شهادة فحص بيطري';

  @override
  String get owner_document => 'ملكية المالك';

  @override
  String get horse_certificate => 'شهادة الخيل';

  @override
  String get no_documents_available => 'لا توجد وثائق متاحة حالياً';

  @override
  String get download => 'تحميل';

  @override
  String get unavailable => 'غير متوفر';

  @override
  String get auction_title_placeholder => 'عنوان المزاد';

  @override
  String get auction_status => 'حالة المزاد';

  @override
  String get auction_type => 'نوع المزاد';

  @override
  String get auction_starting_price => 'إفتتاح المزاد';

  @override
  String get auction_start => 'بداية المزاد';

  @override
  String get auction_end => 'نهاية المزاد';

  @override
  String get auction_code => 'رمز المزاد';

  @override
  String get auction_final_price => 'السعر النهائي';

  @override
  String get auction_type_live => 'مباشر';

  @override
  String get auction_type_online => 'إلكتروني';

  @override
  String get name_label => 'الاسم';

  @override
  String get auction_result => 'نتيجة المزاد';

  @override
  String get last_bidder => 'آخر مزايد';

  @override
  String get final_bid_summary => 'ملخص المزايدة النهائية';

  @override
  String get number_of_subscribers => 'عدد المشتركين';

  @override
  String get animal_name_placeholder => 'اسم الحيوان';

  @override
  String get camels_count => 'عدد الإبل';

  @override
  String get animal_count_placeholder => 'عدد الحيوانات';

  @override
  String get animal_usage => 'التصنيف';

  @override
  String get animal_usage_placeholder => 'استخدام الحيوان';

  @override
  String get animal_color => 'اللون';

  @override
  String get animal_color_placeholder => 'لون الحيوان';

  @override
  String get animal_breed => 'السلالة';

  @override
  String get animal_breed_placeholder => 'سلالة الحيوان';

  @override
  String get father_name => 'اسم الأب';

  @override
  String get name_placeholder => 'الاسم';

  @override
  String get mother_name => 'اسم الأم';

  @override
  String get mother_name_placeholder => 'اسم الأم';

  @override
  String get maternal_grandfather_name => 'اسم أب الأم';

  @override
  String get mother_father_name_placeholder => 'اسم أب الأم';

  @override
  String get gender_placeholder => 'اختر الجنس';

  @override
  String get birth_date => 'تاريخ الميلاد';

  @override
  String get height => 'الارتفاع';

  @override
  String get animal_height_placeholder => 'ارتفاع الحيوان';

  @override
  String get pregnant_status => 'حامل';

  @override
  String get classification => 'التصنيف';

  @override
  String get breed_placeholder => 'السلالة';

  @override
  String get animal_type => 'النوع';

  @override
  String get animal_type_placeholder => 'نوع الحيوان';

  @override
  String get horse_info => 'معلومات الخيل';

  @override
  String get camel_info => 'معلومات الإبل';

  @override
  String get auction_info => 'معلومات المزاد';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get horse_owner_info => 'معلومات مالك الخيل';

  @override
  String get city_label => 'المدينة';

  @override
  String get auction_phase_one => 'مزاد 1';

  @override
  String get auction_phase_two => 'مزاد 2';

  @override
  String get auction_phase_three => 'مزاد 3';

  @override
  String get auction_withdrawn => 'تم سحب المزاد';

  @override
  String get auction_closed => 'تم إغلاق المزاد';

  @override
  String get auction_ended => 'انتهى المزاد';

  @override
  String get ends_in => 'ينتهي خلال';

  @override
  String get price_on_request => 'السعر عند الطلب';

  @override
  String get view_auction => 'عرض المزاد';

  @override
  String remove_alert(Object name) {
    return 'تم إزالة $name من المفضلة';
  }

  @override
  String get clear_all => 'مسح جميع الإشعارات';

  @override
  String get clear_all_alert => 'تم مسح جميع الإشعارات ✅';

  @override
  String get price => 'السعر';

  @override
  String get status_active => 'نشط';

  @override
  String get status_paused => 'متوقف';

  @override
  String get status_sold => 'تم البيع';

  @override
  String get modal_title => 'تم إرسال الشكوى';

  @override
  String get view_details => 'مشاهدة التفاصيل / تعديل';

  @override
  String get send_update_request => 'إرسال طلب تعديل';

  @override
  String get add_payment_submit_request => 'إرسال الطلب';

  @override
  String get add_payment_done_title => 'تم';

  @override
  String get add_payment_proof_sent_success => 'تم إرسال إثبات الدفع بنجاح.';

  @override
  String get mark_sold => 'تغيير الحالة: تم البيع';

  @override
  String get pause_listing => 'إيقاف مؤقت';

  @override
  String get delete_listing => 'حذف الإعلان';

  @override
  String get close => 'إغلاق';

  @override
  String get add_bank => 'إضافة حساب بنكي';

  @override
  String get link_stc => 'ربط STC Pay';

  @override
  String get current_balance => 'الرصيد الحالي';

  @override
  String get current_formula => 'إجمالي المحفظة = المتاح + المعلّق - المستحق.';

  @override
  String get available_balance => 'الرصيد المتاح';

  @override
  String get available_info => 'يمكن سحبه للحساب البنكي أو STC Pay.';

  @override
  String get hold_balance => 'الرصيد المعلّق';

  @override
  String get hold_info => 'مبيعات قيد التحقق أو نقل الملكية.';

  @override
  String get due_balance => 'المستحق عليك';

  @override
  String get due_info => 'مبالغ يجب سدادها (مزاد، عمولات...).';

  @override
  String get auction_sim => 'محاكاة نتيجة مزاد للمشتري';

  @override
  String get paddle_value => 'قيمة المضرب المدفوعة مقدمًا';

  @override
  String get hammer_value => 'قيمة رسوّ المزاد';

  @override
  String get fee_percentage => 'عمولة المشتري (%)';

  @override
  String get calc_note =>
      'عند فوزك: يتم خصم العمولة من قيمة الرسوم ثم خصم قيمة المضرب المسبقة وإظهار المتبقي للدفع.';

  @override
  String get calculate => 'احسب النتيجة';

  @override
  String get reset => 'تصفير';

  @override
  String get result_title => 'النتيجة';

  @override
  String get enter_values => 'أدخل القيم واضغط احسب.';

  @override
  String get auction_value => 'قيمة الرسوم';

  @override
  String get commission => 'العمولة';

  @override
  String get paddle_paid => 'المسدد مسبقًا (المضرب)';

  @override
  String get remaining_due => 'المتبقي للسداد عليك';

  @override
  String get commission_label => 'العمولة';

  @override
  String get remaining_label => 'المتبقي عليك';

  @override
  String get remaining => 'المتبقي';

  @override
  String get payment_method_wallet => 'المحفظة';

  @override
  String get payment_method_apple_pay => 'Apple Pay';

  @override
  String get payment_method_bank_transfer => 'تحويل بنكي';

  @override
  String get payment_method_network => 'شبكة';

  @override
  String get applicant_data => 'بيانات صاحب الطلب';

  @override
  String get order_number => 'رقم الطلب';

  @override
  String get order_status => 'حالة الطلب';

  @override
  String get shipping_date => 'تاريخ الشحن';

  @override
  String get payment_method => 'طريقة الدفع';

  @override
  String get transferred_amount => 'المبلغ المحول';

  @override
  String get bank_account_data => 'بيانات الحساب البنكي';

  @override
  String get account_holder_name => 'صاحب الحساب';

  @override
  String get account_number => 'رقم الحساب';

  @override
  String get iban_number => 'رقم الآيبان';

  @override
  String get transfer_attachments => 'مرفقات التحويل';

  @override
  String get no_attachments_available => 'لا توجد مرفقات متاحة لهذا الطلب.';

  @override
  String get account_type_label => 'نوع الحساب';

  @override
  String get amount_label => 'المبلغ';

  @override
  String get transaction_date_label => 'تاريخ العملية';

  @override
  String get details_label => 'التفاصيل';

  @override
  String get wallet_balance => 'رصيد المحفظة';

  @override
  String get pending_balance => 'الرصيد المعلق';

  @override
  String get amount_due => 'المبلغ المستحق';

  @override
  String get company_commission => 'عمولة الشركة';

  @override
  String get auto_update => 'تحديث تلقائي';

  @override
  String get submit_offer => 'تقديم عرض';

  @override
  String get participants_table => 'جدول المشاركين';

  @override
  String get your_paddle_number_is => 'رقم مضربك: ';

  @override
  String get participating_horses => 'الخيول المشاركة';

  @override
  String get participating_camels => 'الإبل المشاركة';

  @override
  String get not_specified => 'غير محدد';

  @override
  String get buy_paddle_now => 'شراء مضرب الآن';

  @override
  String get participate_in_auction_now => 'شارك بالمزاد الآن';

  @override
  String get public_auction => 'مزاد عام';

  @override
  String get private_auction => 'مزاد خاص';

  @override
  String get choose_best_bank => 'اختر البنك الأنسب لك';

  @override
  String get bank_details_instructions =>
      'راجع تفاصيل الحساب البنكي، وانسخ رقم الحساب أو الآيبان مباشرة لإتمام عملية التحويل بكل سهولة.';

  @override
  String get current_auction_on_platform_now => 'المزاد الحالي على المنصة الآن';

  @override
  String get support_via_whatsapp => 'دعم عبر واتساب';

  @override
  String get direct_contact_support =>
      'تواصل مباشر مع فريق الدعم — الرد عادة خلال دقائق';

  @override
  String get delete_account => 'حذف الحساب';

  @override
  String get delete_account_warning => 'عند حذف الحساب لا يمكنك التراجع عنه';

  @override
  String get logout_confirmation => 'هل أنت متأكد من رغبتك في تسجيل الخروج؟';

  @override
  String get back => 'رجوع';

  @override
  String get full_name_example => 'مثال: وائل الشمري';

  @override
  String get full_name_title => 'الاسم الكامل';

  @override
  String get email_hint => 'name@gmail.com';

  @override
  String get email_title => 'البريد الإلكتروني';

  @override
  String get phone_label => 'رقم الهاتف';

  @override
  String get message_subject_title => 'موضوع الرسالة';

  @override
  String get message_subject_hint => 'اختر موضوع الرسالة';

  @override
  String get inquiry_hint => 'اكتب استفسارك هنا...';

  @override
  String get inquiry_title => 'الاستفسار';

  @override
  String get choose_file_label => 'قم بإختيار ملف';

  @override
  String get agree_privacy_terms =>
      'أوافق على سياسة الخصوصية و الشروط والأحكام.';

  @override
  String get request_sent_success_title => 'تم إرسال الطلب بنجاح';

  @override
  String get request_sent_success_message => 'سيتم التواصل معك لاحقاً';

  @override
  String get error_occurred_title => 'حدث خطأ';

  @override
  String get submit_button => 'إرسال';

  @override
  String get best_way_to_communicate => 'أفضل طريقة للتواصل';

  @override
  String get whatsapp => 'واتساب';

  @override
  String get call => 'اتصال';

  @override
  String get service_card_price_label => 'السعر:';

  @override
  String get service_filter_painting => 'التشطيب';

  @override
  String get service_filter_engineering => 'مكاتب هندسية';

  @override
  String get service_filter_furniture => 'نقل العفش';

  @override
  String get service_painting_title => 'المحيا للتشطيب والديكور';

  @override
  String get service_painting_description => 'مكان مخصص لوصف الخدمة';

  @override
  String get service_painting_price => '50 د.ك - المدة: شهر';

  @override
  String get verified_offices_title => 'المكاتب الموثقة';

  @override
  String get verified_offices_description =>
      'استعرض المكاتب العقارية الموثقة والقريبة منك';

  @override
  String get verified_offices_preview_name => 'مكتب الإبداع العقاري';

  @override
  String get verified_offices_preview_location =>
      'دمشق - المزة - شارع البساتين';

  @override
  String get verified_offices_show_map => 'عرض خريطة';

  @override
  String get more_desc_services =>
      'استعرض خدمات التشطيب والمكاتب الهندسية ونقل العفش';

  @override
  String get delete_the_bid => 'حذف المزايدة';

  @override
  String get calculator_initial_result => 'أدخل القيم واضغط احسب النتيجة.';

  @override
  String calculator_fee_value(Object fee) {
    return 'قيمة الرسوم: $fee ر.س';
  }

  @override
  String calculator_commission(Object commission, Object commissionPercent) {
    return 'عمولة ($commissionPercent%): $commission ر.س';
  }

  @override
  String calculator_prepaid_tax(Object tax) {
    return 'المسدّد مسبقاً (الضريبة): -$tax ر.س';
  }

  @override
  String calculator_remaining(Object remaining) {
    return 'المتبقي للسداد عليك: $remaining ر.س';
  }

  @override
  String get calculator_title => 'محاكاة نتيجة مزاد للمشتري';

  @override
  String get calculator_tax_label => 'قيمة الضريبة المدفوعة مقدماً';

  @override
  String get calculator_price_label => 'قيمة رسوم المزاد';

  @override
  String get calculator_commission_label => 'عمولة المشتري';

  @override
  String get calculator_description =>
      'عند الفوز: يتم خصم العمولة من قيمة الرسوم ثم خصم الضريبة المسبقة وإظهار المتبقي للدفع.';

  @override
  String get calculator_calculate_btn => 'احسب النتيجة';

  @override
  String get calculator_clear_btn => 'تصفية';

  @override
  String get calculator_result_title => 'النتيجة';

  @override
  String get you_have_pending_request => 'لديك طلب قيد المعالجة';

  @override
  String get payment_method_gateway => 'بوابة الدفع';

  @override
  String get will_add_to_due => 'سيُضاف إلى المستحق';

  @override
  String get bank_account => 'حساب بنكي';

  @override
  String get linked => 'مرتبط';

  @override
  String get unlinked => 'غير مرتبط';

  @override
  String get transactions_title => 'سجل العمليات';

  @override
  String get date => 'التاريخ';

  @override
  String get operation => 'العملية';

  @override
  String get details => 'التفاصيل';

  @override
  String get amount => 'المبلغ';

  @override
  String get deposit_paddle => 'إيداع مضرب';

  @override
  String get deposit_details => 'شراء مضرب للمشاركة بالمزاد';

  @override
  String get on_you => 'عليه';

  @override
  String get for_you => 'له';

  @override
  String get completed => 'مكتمل';

  @override
  String get auction_win => 'رسوّ مزاد';

  @override
  String get awaiting_payment => 'بانتظار السداد';

  @override
  String get horse_sale => 'بيع خيل';

  @override
  String get pending_transfer => 'معلّق – انتظار نقل الملكية';

  @override
  String get transactions_note =>
      'ملاحظة: عند تأكيد الفحص ونقل الملكية يتحول رصيد البيع من معلّق إلى متاح ويمكن سحبه.';

  @override
  String get cancel => 'إلغاء';

  @override
  String get cancelled => 'ملغي';

  @override
  String get confirm => 'تأكيد';

  @override
  String get add_bank_modal => 'إضافة حساب بنكي';

  @override
  String get bank_linked => 'تم ربط الحساب البنكي ✅';

  @override
  String get save => 'حفظ';

  @override
  String get full_name_placeholder => 'الاسم الكامل';

  @override
  String get bank_name => 'اسم البنك';

  @override
  String get bank_name_placeholder => 'الراجحي / الأهلي ...';

  @override
  String get link_stc_modal => 'ربط STC Pay';

  @override
  String get stc_linked => 'تم ربط STC Pay ✅';

  @override
  String get stc_number => 'رقم STC Pay';

  @override
  String get tabs_label => 'أنواع الإشعارات';

  @override
  String get tab_all => 'الكل';

  @override
  String get tab_success => 'الناجحة';

  @override
  String get tab_warning => 'التحذيرات';

  @override
  String get tab_info => 'المعلومات';

  @override
  String get tab_error => 'الأخطاء';

  @override
  String get no_notifications => 'لا توجد إشعارات حاليًا 🎉';

  @override
  String get approved_title => 'تمت الموافقة على إعلانك';

  @override
  String get approved_message =>
      'إعلانك الخاص بالخيل تم مراجعته والموافقة عليه بنجاح.';

  @override
  String get auction_soon_title => 'باقي 24 ساعة على بدء المزاد';

  @override
  String get auction_soon_message =>
      'تأكد من جاهزية صور وموقع الإبل قبل بدء المزاد.';

  @override
  String get new_offer_title => 'تم استلام عرض جديد';

  @override
  String get new_offer_message =>
      'قام أحد المستخدمين بإرسال عرض على أحد مزاداتك.';

  @override
  String get rejected_title => 'تم رفض إعلان';

  @override
  String get rejected_message =>
      'إعلانك #215 لم يتم اعتماده لوجود نقص في المعلومات.';

  @override
  String get time_3h => 'منذ 3 ساعات';

  @override
  String get time_6h => 'منذ 6 ساعات';

  @override
  String get time_1d => 'قبل يوم';

  @override
  String get time_2d => 'منذ يومين';

  @override
  String get placeholder => 'اكتب الشكوى...';

  @override
  String get send => 'إرسال';

  @override
  String get exit => 'خروج';

  @override
  String get response_time => 'سيتم الرد خلال 24-48 ساعة.';

  @override
  String get empty_warning => 'الرجاء كتابة نص الشكوى قبل الإرسال';

  @override
  String get modal_message =>
      'تم استلام شكواك بنجاح ✅\nسيتم التواصل معك خلال 24–48 ساعة عبر لوحة التحكم أو البريد الإلكتروني.';

  @override
  String get fees => 'الرسوم';

  @override
  String get platform => 'المنصة';

  @override
  String get category => 'الفئة / نوع العرض';

  @override
  String get schedule => 'الجدولة (مزاد)';

  @override
  String get basic_info => 'بيانات أساسية';

  @override
  String get documents => 'وثائق';

  @override
  String get location => 'الرياض - المملكة العربية السعودية';

  @override
  String get media => 'الوسائط';

  @override
  String get review => 'المراجعة';

  @override
  String get next => 'متابعة';

  @override
  String get pay => 'دفع الرسوم';

  @override
  String get submit => 'إرسال للمراجعة';

  @override
  String get accept_terms => 'الرجاء الموافقة على الشروط';

  @override
  String get set_price => 'يرجى تحديد السعر للعرض المباشر';

  @override
  String get select_date_time => 'يرجى تحديد تاريخ ووقت البدء';

  @override
  String get date_too_soon => 'تاريخ البدء يجب أن يكون بعد 3 أيام على الأقل';

  @override
  String get submitted =>
      'تم الإرسال للمراجعة، وتم حفظ البيانات في LocalStorage';

  @override
  String get horse_desc => 'خيول سرعة • جمال • قفز حواجز';

  @override
  String get camel_desc => 'يمكن إنشاء مزاد جماعي لعدة جمال';

  @override
  String get horse_classification => 'تصنيف الخيل';

  @override
  String get horse_speed => 'خيل سرعة';

  @override
  String get horse_beauty => 'خيل جمال';

  @override
  String get horse_jump => 'خيل قفز حواجز';

  @override
  String get camel_offer_type => 'نوع العرض للإبل';

  @override
  String get camel_individual => 'فردي';

  @override
  String get camel_group => 'جماعي';

  @override
  String get camels_count_label => 'عدد الجمال';

  @override
  String get camels_count_placeholder => 'مثال: 5';

  @override
  String get extra_services => 'خدمات إضافية';

  @override
  String get fixed_sale => 'بيع مباشر';

  @override
  String get auction_sale => 'مزاد';

  @override
  String get price_label => 'السعر';

  @override
  String get price_placeholder => 'ريال سعودي';

  @override
  String get deposit_label => 'العربون للحجز';

  @override
  String get deposit_placeholder => 'اختياري';

  @override
  String get terms_text =>
      'أوافق على الشروط والأحكام ورسوم الخدمة غير مستردة عند الإلغاء.';

  @override
  String get start_time => 'وقت البدء';

  @override
  String get note =>
      'ملاحظة: في حال إلغاء المزاد أو البيع <bold>لا تُسترد الرسوم</bold>.';

  @override
  String get name => 'الاسم';

  @override
  String get breed => 'السلالة';

  @override
  String get age => 'العمر';

  @override
  String get color => 'اللون';

  @override
  String get short_desc => 'وصف مختصر';

  @override
  String get short_desc_placeholder => 'أدخل وصفًا موجزًا للحيوان';

  @override
  String get medical_cert => 'شهادة فحص طبي (اختياري)';

  @override
  String get animal_info_cert => 'شهادة معلومات الخيل / الإبل';

  @override
  String get other_docs => 'وثائق أخرى';

  @override
  String get main_image => 'صورة رئيسية';

  @override
  String get gallery => 'صور إضافية (أقل شيء 4 صور)';

  @override
  String get video_links => 'روابط الفيديو';

  @override
  String get video_placeholder => 'رابط يوتيوب أو مشغل آخر (اختياري)';

  @override
  String get add_video => '+ إضافة رابط فيديو';

  @override
  String get delete => 'حذف';

  @override
  String get fee_text => 'طريقة دفع الرسوم';

  @override
  String get card => 'فيزا / مدى';

  @override
  String get card_name => 'الاسم على البطاقة';

  @override
  String get card_number => 'رقم البطاقة';

  @override
  String get expiry => 'MM/YY';

  @override
  String get cvv => 'CVV';

  @override
  String get review_header => 'مراجعة نهائية';

  @override
  String get review_text =>
      'سيتم تحويل الطلب إلى إدارة عطايا للمراجعة قبل النشر.';

  @override
  String get support_title => 'الدعم والمساعدة';

  @override
  String get contact => 'تواصل معنا';

  @override
  String get faqs => 'الأسئلة الشائعة';

  @override
  String get privacy => 'سياسة الخصوصية';

  @override
  String get terms => 'الشروط والأحكام';

  @override
  String get important_links_title => 'روابط مهمة';

  @override
  String get horse_platform => 'منصة الخيول';

  @override
  String get camel_platform => 'منصة الإبل';

  @override
  String get follow_us => 'تابعنا';

  @override
  String get rights => 'جميع الحقوق محفوظة';

  @override
  String get horses => 'عدد الخيول المعروضة';

  @override
  String get buyers => 'عدد المشترين المسجلين';

  @override
  String get last_30_days => 'آخر 30 يوم';

  @override
  String get last_update => 'آخر تحديث: اليوم 12:00 ص';

  @override
  String get thousand => ' ألف';

  @override
  String get explore => 'استكشاف المزادات';

  @override
  String get or_try => 'أو جرّب';

  @override
  String get search => 'البحث';

  @override
  String get favorite => 'عن خيلك المفضل.';

  @override
  String get try_again => 'إعادة المحاولة';

  @override
  String get top_up_step_select_bank => 'اختيار البنك';

  @override
  String get top_up_step_transfer_details => 'بيانات التحويل';

  @override
  String get admin_panel_title => 'لوحة الإدارة';

  @override
  String get admin_panel_email => 'admin@mail.com';

  @override
  String get admin_panel_users => 'المستخدمون';

  @override
  String get admin_panel_groups => 'المجموعات';

  @override
  String get admin_panel_programs => 'البرامج';

  @override
  String get admin_panel_pro_programs => 'البرامج الاحترافية';

  @override
  String get admin_panel_events => 'الفعاليات';

  @override
  String get admin_panel_schedules => 'الجداول';

  @override
  String get enter_value_hint => 'أدخل القيمة';

  @override
  String get card_name_hint => 'أدخل الاسم على البطاقة';

  @override
  String get card_name_label => 'الاسم على البطاقة';

  @override
  String get card_number_hint => '1111 1111 1111 1114';

  @override
  String get card_number_label => 'رقم البطاقة';

  @override
  String get card_expiry_hint => '12/27';

  @override
  String get card_expiry_label => 'تاريخ الإنتهاء';

  @override
  String get card_cvv_hint => '124';

  @override
  String get card_cvv_label => 'CVV';

  @override
  String get search_hint => 'ما الذي تبحث عنه؟';

  @override
  String get payment_invoice_title => 'فاتورة الدفع';

  @override
  String get veterinary_services_title => 'خدمات بيطرية 🩺';

  @override
  String get veterinary_services_description => 'أطباء فحص وتشخيص.';

  @override
  String get transport_service_title => 'خدمة النقل 🚚';

  @override
  String get transport_service_description => 'مزودون نقل معتمدون.';

  @override
  String get stats_horses_listed => 'عدد الخيول المعروضة';

  @override
  String get stats_horses_listed_default => '875';

  @override
  String get stats_buyers_count => 'عدد المشترين';

  @override
  String get stats_buyers_count_default => '340';

  @override
  String get stats_sales_count => 'عمليات البيع';

  @override
  String get stats_sales_count_default => '120';

  @override
  String get default_camel_sponsor => 'قوافل الصحراء';

  @override
  String get default_horse_sponsor => 'مزاد أبو عبيد';

  @override
  String get camels_platform_description =>
      'تصفح المزادات والعروض المختصة بالإبل.';

  @override
  String get horses_platform_description =>
      'تصفح المزادات والعروض المختصة بالخيل.';

  @override
  String get success_partners_title => 'شركاء النجاح';

  @override
  String get live_viewers_title => 'مشاهدون الآن';

  @override
  String get live_viewers_value => '+1.2k';

  @override
  String get bids_count_title => 'عدد المزايدات';

  @override
  String get available_auctions_title => 'مزاد متاح';

  @override
  String get quick_facts_title => 'التفاصيل السريعة';

  @override
  String get quick_facts_subtitle => 'كل ما تحتاجه لاتخاذ قرار قبل المزايدة';

  @override
  String get quick_facts_location_title => 'الموقع';

  @override
  String get quick_facts_location_description =>
      'ميدان مزاد أبو عبيد • تجهيزات كاملة للبث المباشر';

  @override
  String get quick_facts_medical_title => 'الفحص الطبي';

  @override
  String get quick_facts_medical_description =>
      'تم فحص الخيل من قبل لجنة بيطرية معتمدة';

  @override
  String get quick_facts_guarantees_title => 'ضمانات المزايدة';

  @override
  String get quick_facts_guarantees_description =>
      'حجز المبلغ مؤقتًا لضمان الشفافية';

  @override
  String get management_notices_title => 'إشعارات الإدارة';

  @override
  String get management_notices_highlight_title =>
      'رسائل فورية من إدارة المزاد';

  @override
  String get management_notices_highlight_description =>
      'ابقَ متابعًا للتعليمات والتنبيهات المهمة.';

  @override
  String get bidders_title => 'المزايدون';

  @override
  String get active_now_label => 'نشط الآن';

  @override
  String get no_bids_yet => 'لم يتم تسجيل مزايدات بعد.';

  @override
  String bid_option_amount(Object amount) {
    return '+ $amount';
  }

  @override
  String get current_price_label => 'السعر الحالي';

  @override
  String get your_bids_label => 'مزايداتك الحالية';

  @override
  String get my_bids_title => 'سجل المزادات';

  @override
  String get my_bids_bid_label => 'مزايدة';

  @override
  String my_bids_bidder_number(Object number) {
    return 'المضرب #$number';
  }

  @override
  String my_bids_auction_number(Object number) {
    return 'المزاد #$number';
  }

  @override
  String get custom_amount_label => 'مبلغ مخصص';

  @override
  String get confirm_bid_label => 'تأكيد المزايدة';

  @override
  String get custom_bid_dialog_title => 'مبلغ مخصص';

  @override
  String bid_increment_label(Object amount) {
    return 'الحد الأدنى للمزايدة حالياً $amount ر.س';
  }

  @override
  String get cancel_label => 'إلغاء';

  @override
  String get confirm_label => 'تأكيد';

  @override
  String get bidder_fallback_name => 'مزايد';

  @override
  String get new_bid_toast_title => '🔥 مزايدة جديدة';

  @override
  String get announcement_toast_title => '📢 إشعار من الإدارة';

  @override
  String get bid_raised_to_label => 'رفع المزايدة إلى ';

  @override
  String get auction_details_title => 'تفاصيل المزاد';

  @override
  String get personal_info_first_name_label => 'الإسم الأول';

  @override
  String get personal_info_last_name_label => 'الإسم الاخير';

  @override
  String get personal_info_email_label => 'البريد الإلكتروني';

  @override
  String get personal_info_add_email_label => 'إضغط لإضافة البريد الإلكتروني';

  @override
  String get personal_info_phone_label => 'رقم الهاتف';

  @override
  String get personal_info_email_verified_message => 'تم تأكيد البريد الإلكتروني بنجاح';

  @override
  String get personal_info_add_email_title => 'إضافة البريد الإلكتروني';

  @override
  String get personal_info_edit_email_title => 'تعديل البريد الإلكتروني';

  @override
  String get personal_info_verify_email_title => 'تأكيد البريد الإلكتروني';

  @override
  String get personal_info_add_email_header => 'أضف بريدك الإلكتروني';

  @override
  String get personal_info_update_email_header => 'حدّث بريدك الإلكتروني';

  @override
  String get personal_info_email_otp_request_subtitle => 'سنرسل رمز تحقق للتأكد من ملكيتك للبريد الإلكتروني قبل حفظه في حسابك.';

  @override
  String get personal_info_send_verification_code => 'إرسال رمز التحقق';

  @override
  String get personal_info_email_required => 'يرجى إدخال البريد الإلكتروني';

  @override
  String get personal_info_invalid_email => 'يرجى إدخال بريد إلكتروني صحيح';

  @override
  String get personal_info_enter_otp_title => 'أدخل رمز التحقق';

  @override
  String get personal_info_otp_label => 'رمز التحقق';

  @override
  String get personal_info_confirm_email => 'تأكيد البريد الإلكتروني';

  @override
  String get personal_info_otp_required => 'يرجى إدخال رمز التحقق';

  @override
  String get personal_info_invalid_otp => 'رمز التحقق غير صحيح';

  @override
  String personal_info_email_otp_sent_subtitle(String email) {
    return 'تم إرسال رمز التحقق إلى $email. أدخله لإكمال تحديث البريد الإلكتروني.';
  }

  @override
  String get personal_info_title => 'المعلومات الشخصية';

  @override
  String get continue_label => 'متابعة';

  @override
  String get select_country_first => 'اختر الدولة أولاً';

  @override
  String get stable_name_optional => 'اسم المزرعة / الاسطبل (اختياري)';

  @override
  String get financial_management_title => 'الإدارة المالية';

  @override
  String get wallet_top_up_title => 'شحن المحفظة';

  @override
  String get available_balance_title => 'الرصيد المتاح';

  @override
  String get available_balance_description =>
      'يمكن سحبه للحساب البنكي أو STC Pay.';

  @override
  String get total_balance_title => 'الرصيد الإجمالي';

  @override
  String get total_balance_description =>
      'إجمالي المحفظة = المتاح + المعلّق - المستحق - عمولة الشركة';

  @override
  String get company_commission_title => 'عمولة الشركة';

  @override
  String get company_commission_description => 'عمولة الشركة';

  @override
  String get pending_balance_title => 'الرصيد المعلّق';

  @override
  String get pending_balance_description => 'مبيعات قيد التحقق أو نقل الملكية.';

  @override
  String get amount_due_title => 'المستحق عليك';

  @override
  String get amount_due_description => 'مبالغ يجب سدادها (مزاد، عمولات...).';

  @override
  String get wallet_label => 'المحفظة';

  @override
  String get system_label => 'النظام';

  @override
  String get bank_transfer_label => 'تحويل بنكي';

  @override
  String get payment_gateway_label => 'بوابة الدفع';

  @override
  String get transaction_history_title => 'سجل العمليات';

  @override
  String get filters_title => 'عوامل التصفية';

  @override
  String get date_placeholder => 'mm/dd/yyyy';

  @override
  String get start_date_title => 'تاريخ البداية';

  @override
  String get end_date_title => 'تاريخ النهاية';

  @override
  String get search_label => 'بحث';

  @override
  String get nav_home => 'الرئيسية';

  @override
  String get nav_offers => 'العروض';

  @override
  String get nav_auctions => 'المزادات';

  @override
  String get nav_mass_auctions => 'المزادات الجماعية';

  @override
  String get nav_more => 'المزيد';

  @override
  String get more_section_auction => 'المزاد';

  @override
  String get more_section_operations => 'العمليات';

  @override
  String get more_section_account => 'الحساب';

  @override
  String get my_offers => 'عروضي';

  @override
  String get participating_auctions => 'المزادات المشارك بها';

  @override
  String get my_mass_auctions => 'مزاداتي الجماعية';

  @override
  String get purchases => 'مشترياتي';

  @override
  String get my_sales => 'مبيعاتي';

  @override
  String get wallet_top_up_requests => 'طلبات شحن المحفظة';

  @override
  String get payment_history => 'سجل المدفوعات';

  @override
  String get payment_history_timeline_title => 'الخط الزمني للمدفوعات';

  @override
  String get payment_history_empty_state => 'لا توجد مدفوعات حتى الآن';

  @override
  String get payment_history_summary_title => 'نظرة سريعة';

  @override
  String payment_history_operations_count(int count) {
    return '$count عمليات';
  }

  @override
  String get payment_history_summary_description =>
      'تابع حركة المدفوعات مع إشارة واضحة للحالات والمصادر.';

  @override
  String get payment_history_status_approved => 'مقبول';

  @override
  String get payment_history_status_pending_review => 'قيد المراجعة';

  @override
  String get more_desc_add_listing => 'إضافة عرض أو مزاد جديد بسهولة';

  @override
  String get more_desc_participating_auctions =>
      'استعرض المزادات التي تشارك بها حالياً';

  @override
  String get more_desc_my_mass_auctions =>
      'تابع مزاداتك الجماعية الحالية والسابقة';

  @override
  String get more_desc_my_auctions => 'إدارة مزاداتك الحالية والمنتهية';

  @override
  String get more_desc_incoming_requests => 'طلبات الشراء الواردة على مزاداتك';

  @override
  String get more_desc_sent_requests => 'طلبات الشراء التي قمت بإرسالها';

  @override
  String get more_desc_my_offers => 'عروضك المقدمة في المزادات المختلفة';

  @override
  String get more_desc_purchases => 'طلبات الشراء والعروض التي دخلت بها';

  @override
  String get more_desc_sales => 'عروضك ومبيعاتك الحالية والسابقة';

  @override
  String get more_desc_wallet => 'الرصيد والحركات المالية داخل المحفظة';

  @override
  String get more_desc_wallet_top_up_requests =>
      'طلباتك الحالية والسابقة لشحن الرصيد';

  @override
  String get more_desc_transaction_history =>
      'كل الحركات والإجراءات التي تمت على حسابك';

  @override
  String get more_desc_payment_history =>
      'كل المدفوعات والفواتير التي تمت عبر المنصة';

  @override
  String get more_desc_profile => 'عرض وتعديل معلومات حسابك الشخصي';

  @override
  String get more_desc_notifications => 'عرض التنبيهات والإشعارات الجديدة';

  @override
  String get more_desc_favorites => 'كل العناصر التي أضفتها إلى المفضلة';

  @override
  String get more_desc_privacy => 'الاطلاع على سياسة الخصوصية الخاصة بالمنصة';

  @override
  String get more_desc_terms => 'مراجعة الشروط والأحكام المعتمدة';

  @override
  String get more_desc_contact_us => 'تواصل معنا للاستفسارات والدعم';

  @override
  String get more_desc_faqs => 'إجابات سريعة على الأسئلة الأكثر شيوعاً';

  @override
  String get more_desc_logout => 'تسجيل الخروج من حسابك الحالي';

  @override
  String get sent_requests => 'طلبات المرسلة';

  @override
  String get incoming_requests => 'طلبات الواردة';

  @override
  String get paddle_type_normal => 'عادي';

  @override
  String get paddle_type_premium => 'مميز';

  @override
  String get confirm_inspection_remaining_amount_message =>
      'بتأكيد على الفحص يجب عليك استكمال المبلغ المتبقي';

  @override
  String get paddle_type_vip => 'VIP';

  @override
  String get confirm_transfer_and_receipt => 'تاكيد النقل والاستلام';

  @override
  String get confirm_inspection => 'تأكيد الفحص';

  @override
  String get cancel_purchase_confirmation =>
      'هل أنت متأكد من إلغاء عملية الشراء؟';

  @override
  String get cancel_purchase_title => 'إلغاء الشراء';

  @override
  String get total_price_label => 'إجمالي السعر';

  @override
  String get confirm_transfer_message => 'يرجى تأكيد عملية النقل.';

  @override
  String complete_remaining_amount_message(Object remainingAmount) {
    return 'بتأكيد على الفحص يجب عليك استكمال المبلغ المتبقي $remainingAmount ';
  }

  @override
  String get paddle_type_label => 'نوع المضرب';

  @override
  String get share_app_title => 'شارك تطبيق عطايا';

  @override
  String get share_app_description =>
      'ادعُ من تحب لتجربة عطايا واستمتعوا معًا بالمزادات والخدمات المميزة.';

  @override
  String get share_tag_friends => 'شارك مع الأصدقاء';

  @override
  String get share_tag_discover => 'تعرف على مزادات جديدة';

  @override
  String get share_now => 'شارك الآن';

  @override
  String get share_message_no_link =>
      'جرّب تطبيق عطايا وشارك مزاداتنا المميزة مع من تحب.';

  @override
  String share_message_with_link(Object url) {
    return '$url';
  }

  @override
  String get add_ad_created_success => 'تم إنشاء الإعلان بنجاح';

  @override
  String get add_ad_payment_url_error => 'تعذر فتح رابط الدفع';

  @override
  String get add_ad_payment_declined => 'تم رفض عملية الدفع';

  @override
  String get add_ad_payment_cancelled => 'تم إلغاء عملية الدفع';

  @override
  String get payment_success => 'تمت عملية الدفع بنجاح';

  @override
  String get payment_complete_amount_title => 'استكمال المبلغ';

  @override
  String get payment_buy_paddle_title => 'شراء مضرب';

  @override
  String get payment_complete_purchase_title => 'إتمام عملية الشراء';

  @override
  String get payment_paddle_value_label => 'قيمة المضرب';

  @override
  String get payment_required_amount_label => 'المبلغ المطلوب';

  @override
  String get payment_purpose_enter_amount => 'يرجى إدخال المبلغ';

  @override
  String get payment_inspection_note =>
      'ملاحظة: في حال تأكيد الفحص يتم دفع عمولة عطايا بالإضافة للضريبة';

  @override
  String get annual_auction_card_fallback_title => 'اسم المزاد';

  @override
  String get annual_auction_card_type_label => 'نوع المزاد';

  @override
  String get annual_auction_card_type_public => 'سنوي';

  @override
  String get annual_auction_card_type_private => 'خاص';

  @override
  String get annual_auction_card_sponsor_label => 'برعاية';

  @override
  String get annual_auction_card_sponsor_fallback => 'الراعي';

  @override
  String get annual_auction_card_participants_label => 'عدد المشاركين';

  @override
  String get annual_auction_card_classification_label => 'التصنيف';

  @override
  String get annual_auction_card_classification_fallback => 'التصنيف';

  @override
  String get annual_auction_card_start_date_label => 'تاريخ بدء المزاد';

  @override
  String get annual_auction_card_start_date_fallback =>
      'سوف يتم تحديد التاريخ لاحقاً';

  @override
  String get annual_auction_card_state_label => 'حالة المزاد';

  @override
  String get annual_auction_card_state_sellers => 'متاح لتسجيل البائعين';

  @override
  String get annual_auction_card_state_buyers => 'متاح لتسجيل المشترين';

  @override
  String get annual_auction_card_location_label => 'موقع المزاد';

  @override
  String get annual_auction_card_location_country_fallback => 'الدولة';

  @override
  String get annual_auction_card_location_state_fallback => 'المدينة';

  @override
  String get annual_auction_card_button_unavailable => 'غير متاح';

  @override
  String get annual_auction_card_button_show_details => 'عرض التفاصيل';

  @override
  String get annual_auction_card_button_register_sellers => 'تسجيل البائعين';

  @override
  String get annual_auction_card_button_register_buyers => 'تسجيل المشترين';

  @override
  String get annual_auction_card_button_enter_auction => 'دخول المزاد';

  @override
  String get annual_auction_card_button_show_results => 'عرض النتائج';

  @override
  String get annual_auction_card_status_upcoming => 'قادم';

  @override
  String get annual_auction_card_status_live_now => 'مباشر الآن';

  @override
  String get annual_auction_card_status_ended => 'منتهي';

  @override
  String get annual_auction_card_countdown_start_sellers =>
      'العد التنازلي لبدء تسجيل البائعين';

  @override
  String get annual_auction_card_countdown_end_sellers =>
      'العد التنازلي لانتهاء تسجيل البائعين';

  @override
  String get annual_auction_card_countdown_start_auction =>
      'العد التنازلي لبدء المزاد';

  @override
  String get annual_auction_card_countdown_end_auction =>
      'العد التنازلي لانتهاء المزاد';

  @override
  String get ad_card_fallback_title => 'العنوان';

  @override
  String get ad_card_fallback_unique_id => '0000000';

  @override
  String get ad_card_fallback_price => 'السعر';

  @override
  String get ad_card_last_price_label => 'آخر سعر:';

  @override
  String get ad_card_auction_type_electronic => 'إلكتروني';

  @override
  String get ad_card_status_pending => 'قيد الإنتظار';

  @override
  String get ad_card_status_accepted => 'نشط';

  @override
  String get ad_card_status_rejected => 'مرفوض';

  @override
  String get ad_card_status_withdrawn => 'مسحوب';

  @override
  String get ad_card_status_sold => 'مباع';

  @override
  String get ad_card_status_unsold => 'غير مباع';

  @override
  String get ad_card_status_active => 'نشط';

  @override
  String get ad_card_status_ended => 'منتهي';

  @override
  String get ad_card_status_live => 'مباشر';

  @override
  String get ad_card_status_skipped => 'تم التخطي';

  @override
  String get transport_card_company_name => 'اسم الشركة';

  @override
  String get transport_card_category_fallback => 'فئة النقل';

  @override
  String get transport_card_horse_transport => '🐎 نقل خيل';

  @override
  String get transport_card_camel_transport => '🐪 نقل إبل';

  @override
  String get transport_card_type_all_ksa => '📍 جميع مناطق المملكة';

  @override
  String get transport_card_type_outside_ksa => '📍 خارج المملكة';

  @override
  String get transport_card_location_fallback => 'المدينة - الدولة';

  @override
  String get transport_card_listed => 'معروض';

  @override
  String get transport_card_call => 'اتصال';

  @override
  String get transport_card_transport_external => 'نقل خارجي';

  @override
  String get transport_card_transport_internal => 'نقل داخلي';

  @override
  String get transport_card_transport_internal_external => 'نقل داخلي وخارجي';

  @override
  String get auctions_screen_camel_title => 'مزادات الإبل';

  @override
  String get auctions_screen_horse_title => 'مزادات الخيل';

  @override
  String get auctions_screen_header_subtitle => 'اختر نوع المزاد للمتابعة.';

  @override
  String get auctions_screen_individual_title => 'مزاد فردي';

  @override
  String get auctions_screen_individual_subtitle =>
      'بيع مباشر - عرض واحد كامل التفاصيل.';

  @override
  String get auctions_screen_individual_badge => 'فردي';

  @override
  String get auctions_screen_group_title => 'مزاد جماعي / سنوي';

  @override
  String get auctions_screen_group_subtitle =>
      ' مزاد هجين - مشاركات متعددة - مزاد كبير بجدول مواسم.';

  @override
  String get auctions_screen_group_badge => 'جماعي';

  @override
  String get partners_title => 'شركاء النجاح';

  @override
  String get partners_subtitle => 'علامات تجارية نتعاون معها لنوفر أفضل تجربة';

  @override
  String get partner_interstitial_skip => 'تخطي';

  @override
  String partner_interstitial_auto_skip(Object seconds) {
    return 'سيتم تخطي الإعلان خلال $seconds ث';
  }

  @override
  String developed_by(Object company) {
    return 'تم التطوير بواسطة $company';
  }

  @override
  String app_version(Object version) {
    return 'الإصدار $version';
  }

  @override
  String get stay_logged_in => 'البقاء مسجلاً الدخول';

  @override
  String get error => 'خطأ';

  @override
  String get success => 'نجاح';

  @override
  String get continue_as_guest => 'المتابعة كزائر';

  @override
  String get withdrawn_label => 'منسحب';

  @override
  String get no_auctions_available => 'لا توجد مزادات متاحة حالياً';

  @override
  String get no_participating_auctions => 'لا توجد مزادات مشاركة حالياً';

  @override
  String get highest_price_label => 'أعلى سعر';

  @override
  String get participants_label => 'المشاركون';

  @override
  String get bidder_number_label => 'رقم المضرب';

  @override
  String get no_offers_available => 'لا توجد عروض متاحة حالياً';

  @override
  String get ad_deleted_success => 'تم حذف الإعلان بنجاح';

  @override
  String get warning_label => 'تحذير';

  @override
  String get delete_ad_not_active => 'يمكن حذف الإعلان فقط إذا كان نشطًا.';

  @override
  String get group_auction_label => 'مزاد جماعي';

  @override
  String get select_country_label => 'اختر الدولة';

  @override
  String get select_city_label => 'اختر المدينة';

  @override
  String get select_type_label => 'اختر النوع';

  @override
  String get training_usage_label => 'التدريب/الاستخدام';

  @override
  String get select_training_usage_label => 'اختر التدريب/الاستخدام';

  @override
  String get from_birth_date_label => 'من تاريخ الميلاد';

  @override
  String get to_birth_date_label => 'إلى تاريخ الميلاد';

  @override
  String get height_cm_label => 'الارتفاع (سم)';

  @override
  String get height_cm_placeholder => 'أدخل الارتفاع (سم)';

  @override
  String get main_image_label => 'الصورة الرئيسية';

  @override
  String get add_main_image_help => 'قم بإضافة صورة الإعلان الأساسية';

  @override
  String get main_video_label => 'الفيديو الرئيسي';

  @override
  String get add_main_video_help => 'قم بإضافة فيديو الإعلان الأساسي';

  @override
  String get additional_images_label => 'صور إضافية';

  @override
  String get additional_images_required_help => 'مطلوب أربع صور على الاقل';

  @override
  String get current_additional_images_label => 'صور إضافية حالية';

  @override
  String get no_additional_images_available =>
      'لا توجد صور إضافية متاحة حالياً';

  @override
  String get owner_name_label => 'اسم المالك';

  @override
  String get owner_name_placeholder => 'أدخل اسم المالك';

  @override
  String get owner_phone_label => 'رقم المالك';

  @override
  String get owner_phone_placeholder => 'أدخل رقم المالك';

  @override
  String get edit_success_message => 'تم تعديل بنجاح';

  @override
  String get birth_date_select_label => 'اختر تاريخ الميلاد';

  @override
  String get description_label => 'الوصف';

  @override
  String get no_data_available => 'لا توجد بيانات متاحة';

  @override
  String get sale_terms_title => 'شروط البيع';

  @override
  String get auction_terms_title => 'شروط المزاد';

  @override
  String get sale_term_payment =>
      'الدفع يتم عبر المحفظة أو طرق الدفع المتاحة في النظام.';

  @override
  String get sale_term_deposit =>
      'بعد دفع العربون، يجب استكمال الإجراءات خلال 3 أيام.';

  @override
  String get sale_term_shipping =>
      'المشتري يتحمل تكاليف النقل والفحص البيطري إن وجد.';

  @override
  String get sale_term_bidder_fee =>
      'لايمكن استرداد قيمة المضرب بعد ارساء المزاد عليك.';

  @override
  String get min_count_label => 'العدد الأدنى';

  @override
  String get min_count_placeholder => 'أدخل العدد الأدنى';

  @override
  String get max_count_label => 'العدد الأعلى';

  @override
  String get max_count_placeholder => 'أدخل العدد الأعلى';

  @override
  String get select_color_label => 'اختر اللون';

  @override
  String get profile_update_success_message => 'تم تعديل الملف الشخصي بنجاح';

  @override
  String get high_bid_notification_label => 'تنبيه عند تلقي مزايدة أعلى';

  @override
  String get offer_details_owner_name_label => 'اسم المالك';

  @override
  String get offer_details_owner_stable_label => 'اسم المزرعة/الاسطبل';

  @override
  String get offer_details_owner_contact_label => 'رقم التواصل';

  @override
  String get offer_details_owner_name_placeholder => 'اسم المستخدم';

  @override
  String get offer_details_owner_stable_placeholder => 'اسم الإسطبل أو المزرعة';

  @override
  String get offer_details_owner_phone_placeholder => '+0000000000000';

  @override
  String get offer_details_animal_name_label => 'الاسم';

  @override
  String get offer_details_animal_name_placeholder => 'العنوان أو الاسم';

  @override
  String get offer_details_father_name_label => 'اسم الأب';

  @override
  String get offer_details_father_name_placeholder => 'اسم الأب';

  @override
  String get offer_details_mother_name_label => 'اسم الأم';

  @override
  String get offer_details_mother_name_placeholder => 'اسم الأم';

  @override
  String get offer_details_mother_father_name_label => 'اسم أب الأم';

  @override
  String get offer_details_mother_father_name_placeholder => 'اسم أب الأم';

  @override
  String get offer_details_birth_date_label => 'تاريخ الميلاد';

  @override
  String get offer_details_height_label => 'الطول';

  @override
  String get offer_details_height_placeholder => 'الطول';

  @override
  String get offer_details_gender_label => 'الجنس';

  @override
  String get offer_details_gender_placeholder => 'الجنس (ذكر/أنثى)';

  @override
  String get offer_details_color_label => 'اللون';

  @override
  String get offer_details_color_placeholder => 'لون الحيوان';

  @override
  String get offer_details_usage_label => 'استخدام الحيوانات';

  @override
  String get offer_details_usage_placeholder => 'استخدام الحيوانات';

  @override
  String get offer_details_count_label => 'العدد';

  @override
  String get offer_details_group_count_placeholder => 'عدد الأعضاء في المجموعة';

  @override
  String get offer_details_state_fallback => 'المنطقة';

  @override
  String get offer_details_country_fallback => 'الدولة';

  @override
  String get offer_details_owner_info_title => 'معلومات المالك';

  @override
  String get offer_details_offer_info_title => 'معلومات العرض';

  @override
  String get offer_details_verified_badge => 'تم التحقق';

  @override
  String get offer_details_photos_title => 'الصور';

  @override
  String get offer_details_video_title => 'الفيديو';

  @override
  String get offer_details_videos_title => 'الفيديوهات';

  @override
  String get offer_details_description_title => 'وصف العرض';

  @override
  String get offer_details_photo_gallery_title => 'معرض الصور';

  @override
  String get offer_details_price_label => 'السعر: ';

  @override
  String get offer_details_deposit_label => 'العربون: ';

  @override
  String get offer_details_buy_now => 'الشراء الآن';

  @override
  String get auction_state_upcoming => 'قادم';

  @override
  String get auction_state_active => 'نشط';

  @override
  String get auction_state_ended => 'منتهي';

  @override
  String get auction_state_live => 'مباشر';

  @override
  String get auction_state_closed => 'مغلق';

  @override
  String get add_ad_untitled => 'إعلان بدون عنوان';

  @override
  String get add_ad_location_not_set => 'الموقع غير محدد';

  @override
  String add_ad_city_number(int stateId) {
    return 'المدينة رقم $stateId';
  }

  @override
  String get add_ad_offer_type => 'نوع العرض';

  @override
  String get count => 'العدد';

  @override
  String get camels => 'جمال';

  @override
  String get not_available => 'غير متاح';

  @override
  String get saudi_arabia => 'المملكة العربية السعودية';

  @override
  String get cm_unit => 'سم';

  @override
  String get total => 'الإجمالي';

  @override
  String get no_results_available => 'لا توجد نتائج متاحة حالياً';

  @override
  String add_ad_video_link(int index) {
    return 'رابط $index';
  }

  @override
  String get add_ad_main_image_hint =>
      'أضف الصورة الأساسية للإعلان — الحجم المسموح حتى 10 ميجابايت.';

  @override
  String get add_ad_main_video_hint =>
      'قم بإضافة فيديو الإعلان الأساسي (بحد أقصى 10 ميجابايت).';

  @override
  String get add_ad_extra_images_title => 'صور إضافية';

  @override
  String get add_ad_extra_images_hint =>
      'مطلوب أربع صور على الاقل, على ألا يتجاوز حجمها 2 ميجابايت.';

  @override
  String get add_ad_intro_title => 'أخبرنا عن إعلانك';

  @override
  String get add_ad_intro_subtitle =>
      '🐪🐎 أضف إعلانك الآن بسهولة!\nقم بملء تفاصيل الإعلان بدقة لتصل إلى أكبر عدد من المهتمين.\n';

  @override
  String get add_ad_add_camels => 'إضافة إبل';

  @override
  String get add_ad_add_horses => 'إضافة خيل';

  @override
  String get add_ad_platform_camel_web_desc =>
      'يمكن إنشاء مزاد جماعي لعدة جمال مع إعدادات تناسب بيع الإبل بشكل منظم.';

  @override
  String get add_ad_platform_horse_web_desc =>
      'خيول سرعة، جمال، قفز حواجز وغيرها مع تجهيز الخطوات اللاحقة حسب نوع الخيل.';

  @override
  String get add_ad_platform_camel_web_badge => 'فردي / جماعي';

  @override
  String get add_ad_platform_horse_web_badge => 'مزاد / عرض فردي';

  @override
  String get add_ad_wallet_deduction => 'سيتم الخصم من المحفظة';

  @override
  String get add_ad_card_required_amount => 'المبلغ المطلوب للدفع بالبطاقة';

  @override
  String get add_ad_apple_pay_required_amount => 'المبلغ المطلوب عبر Apple Pay';

  @override
  String get add_ad_auction_fee => 'رسوم المزاد';

  @override
  String get add_ad_offer_fee => 'رسوم العرض';

  @override
  String get add_ad_pay_before_publish => 'يُسدد قبل نشر الإعلان';

  @override
  String get add_ad_note_no_refund =>
      'عند دفع رسوم الإعلان والموافقة عليه لا يمكن استرداد المبلغ.';

  @override
  String get add_ad_note_duration =>
      'مدة الإعلان 30 يومًا، وفي حال التجديد يجب دفع الرسوم مرة أخرى لتنشيط الإعلان.';

  @override
  String get add_ad_pay_and_continue => 'الدفع والاستمرار';

  @override
  String get add_ad_select_country_first => 'الرجاء اختيار الدولة أولاً';

  @override
  String get add_ad_select_city => 'اختر المدينة';

  @override
  String get add_ad_select_age => 'اختر العمر';

  @override
  String get add_ad_title_hint => 'أدخل عنوان الإعلان';

  @override
  String get add_ad_title_label => 'عنوان الإعلان';

  @override
  String get add_ad_name_hint => 'أدخل الاسم';

  @override
  String get add_ad_father_name_hint => 'أدخل اسم الأب';

  @override
  String get add_ad_mother_name_hint => 'أدخل اسم الأم';

  @override
  String get add_ad_mother_father_name_hint => 'أدخل اسم أب الأم';

  @override
  String get add_ad_breed_hint => 'أدخل السلالة';

  @override
  String get add_ad_select_type => 'اختر النوع';

  @override
  String get add_ad_height_hint => 'أدخل الطول';

  @override
  String get add_ad_select_color => 'اختر اللون';

  @override
  String get add_ad_pregnant_label => 'لاقح';

  @override
  String get add_ad_pregnancy_status_pregnant => 'لاقح';

  @override
  String get add_ad_pregnancy_status_not_pregnant => 'غير لاقح';

  @override
  String get add_ad_pregnancy_status_unsure => 'غير مؤكد';

  @override
  String get add_ad_pregnancy_status_hint => 'اختر الحالة';

  @override
  String get add_ad_male_type => 'فحل';

  @override
  String get add_ad_castrated_type => 'خصي';

  @override
  String get add_ad_foal_male_type => 'مهر';

  @override
  String get add_ad_foal_female_type => 'مهرة';

  @override
  String get add_ad_camel_breeding_female => 'ناقة إنتاج';

  @override
  String get add_ad_horse_breeding_female => 'رمكة إنتاج';

  @override
  String get add_ad_camel_non_breeding_female => 'ناقة';

  @override
  String get add_ad_horse_non_breeding_female => 'فرس';

  @override
  String get add_ad_camel_group => 'مجموعة جمال';

  @override
  String get add_ad_champions => 'أبطال';

  @override
  String get add_ad_select_start_date_first =>
      'الرجاء اختيار تاريخ البداية أولاً';

  @override
  String get add_ad_time_unavailable =>
      'هذا الوقت غير متاح، يرجى اختيار وقت آخر';

  @override
  String get add_ad_start_date => 'تاريخ البداية';

  @override
  String get add_ad_end_date => 'تاريخ النهاية';

  @override
  String get add_ad_auction_start_time => 'وقت بدء المزاد';

  @override
  String get add_ad_auction_end_time => 'وقت انتهاء المزاد';

  @override
  String get add_ad_unavailable_times => 'الأوقات غير المتاحة';

  @override
  String get add_ad_unavailable_times_desc =>
      'نعرض لك فترات الحجز لتختار موعدًا لا يتعارض مع بث مباشر آخر.';

  @override
  String get add_ad_unavailable_times_error =>
      'تعذر تحميل الأوقات غير المتاحة، حاول مرة أخرى لاحقًا.';

  @override
  String get add_ad_no_unavailable_times_today =>
      'لا توجد أوقات محجوزة في هذا اليوم، يمكنك اختيار الوقت المناسب لك.';

  @override
  String get add_ad_select_live_auction_date =>
      'حدد تاريخ المزاد المباشر للاطلاع على الأوقات المحجوزة.';

  @override
  String get add_ad_choose_start_date_for_slots =>
      'اختر تاريخ البداية لعرض الأوقات غير المتاحة.';

  @override
  String get add_ad_end_time_after_start =>
      'يجب أن يكون وقت نهاية المزاد لاحقاً لوقت البداية';

  @override
  String get add_ad_slot_duration => 'مدة 15 دقيقة';

  @override
  String get add_ad_auction_opening_price => 'سعر فتح المزاد';

  @override
  String get add_ad_auction_starts_from_price =>
      'سيبدأ المزاد من السعر المبدئي الذي تحدده.';

  @override
  String get add_ad_electronic_only => 'الكتروني فقط';

  @override
  String get add_ad_entry_price => 'سعر الدخول';

  @override
  String get add_ad_exit_confirm => 'هل أنت متأكد من الخروج ؟';

  @override
  String get add_ad_live_electronic => 'الكتروني مباشر';

  @override
  String get add_ad_market_entry_price => 'سعر الدخول للسوق';

  @override
  String get add_ad_no_additional_services =>
      'لا توجد خدمات إضافية متاحة حالياً.';

  @override
  String get add_ad_no_usages_available => 'لا توجد استخدامات متاحة حالياً.';

  @override
  String get add_ad_select_birth_date => 'اختر تاريخ الميلاد';

  @override
  String get add_ad_select_country => 'اختر الدولة';

  @override
  String get add_ad_select_payment_method => 'الرجاء اختيار طريقة الدفع';

  @override
  String get add_ad_set_starting_price => 'حدد سعر البداية';

  @override
  String get add_ad_title => 'إضافة عرض مباشر / مزاد';

  @override
  String get add_ad_wallet_empty => 'رصيد المحفظة منتهي';

  @override
  String get offer => 'عرض';

  @override
  String get annual_auction_participation_title =>
      'التقديم للمشاركة في المزاد السنوي';

  @override
  String get annual_auction_participation_description =>
      'دع مزادك يتألق أمام المهتمين – ارسل بياناتك بخطوات بسيطة لتحجز مكانك هذا العام.';

  @override
  String get annual_auction_owner_participation_fee_title =>
      'رسوم المشاركة للمالك';

  @override
  String get annual_auction_owner_participation_fee_subtitle =>
      'يتم تفعيل طلبك فور تأكيد السداد.';

  @override
  String get annual_auction_premium_paddle_price_title => 'سعر المضرب المميز';

  @override
  String get annual_auction_normal_paddle_price_title => 'سعر المضرب العادي';

  @override
  String get annual_auction_paddle_price_subtitle =>
      'سيتم إصداره بعد السداد مباشرة.';

  @override
  String get annual_auction_code_title => 'كود المزاد';

  @override
  String get annual_auction_code_subtitle => 'رمز فريد خاص بمشاركتك في المزاد.';

  @override
  String get annual_auction_terms_note =>
      'يشترط الاطلاع والموافقة على الشروط قبل إتمام التسجيل.';

  @override
  String get sold_group_mobile_card_group_number => 'رقم المجموعة';

  @override
  String get sold_group_mobile_card_group_name => 'اسم المجموعة';

  @override
  String get sold_group_mobile_card_camels_count => 'عدد الإبل';

  @override
  String get sold_group_mobile_card_sale_status => 'حالة البيع';

  @override
  String get sold_group_mobile_card_seller_name => 'اسم البائع';

  @override
  String get sold_group_mobile_card_seller_phone => 'جوال البائع';

  @override
  String get sold_group_mobile_card_buyer_name => 'اسم المشتري';

  @override
  String get sold_group_mobile_card_purchase_date => 'تاريخ الشراء';

  @override
  String get sold_group_mobile_card_purchase_date_placeholder => '---';

  @override
  String get sold_group_mobile_card_group_info_title => 'معلومات المجموعة';

  @override
  String get sold_group_mobile_card_group_info_subtitle =>
      'عرض سريع لبيانات المجموعة بعد البيع';

  @override
  String get sold_group_mobile_card_final_price_note =>
      'تم اعتماد السعر وإغلاق المزاد.';

  @override
  String get account_archived_title => 'حسابك مغلق';

  @override
  String get account_archived_description =>
      'لضمان الأمان، تم إيقاف الوصول لهذا الحساب حالياً. يمكنك تسجيل الدخول بحساب آخر أو التواصل مع الدعم لمراجعة الحالة.';

  @override
  String get account_archived_contact_support => 'التواصل مع الدعم';

  @override
  String get account_archived_support_unavailable =>
      'رقم الدعم غير متاح حالياً';

  @override
  String get account_archived_support_message => 'مرحباً، لدي استفسار.';

  @override
  String annual_results_day_label(Object day) {
    return 'اليوم $day';
  }

  @override
  String no_video_for_day(Object dayNumber) {
    return 'لا يوجد فيديو لليوم $dayNumber حالياً';
  }

  @override
  String get winner_label => 'الفائز';

  @override
  String get purchase_details_seller_info => 'بيانات البائع';

  @override
  String get purchase_details_buyer_info => 'بيانات الشاري';

  @override
  String get purchase_details_payment_details => 'تفاصيل الدفع';

  @override
  String get purchase_details_basic_amount => 'المبلغ الأساسي';

  @override
  String get purchase_details_commission_label => 'العمولة';

  @override
  String get purchase_details_tax_label => 'الضريبة';

  @override
  String get purchase_details_paid_amount => 'المبلغ المدفوع';

  @override
  String get purchase_details_remaining_amount => 'المبلغ المتبقي';

  @override
  String get purchase_details_final_total => 'الإجمالي النهائي';

  @override
  String get purchase_details_note =>
      'ملاحظة: لا تصبح عمولة الشركة والضريبة مستحقة ولا تُحتسب ضمن المبلغ النهائي إلا بعد تأكيد الفحص.';

  @override
  String get purchase_details_pending_inspection => 'بإنتظار الفحص';

  @override
  String get purchase_details_pending_transfer => 'بانتظار النقل والإستلام';

  @override
  String get purchase_details_full_payment => 'مبلغ كامل';

  @override
  String get purchase_details_paddle_price => 'سعر المضرب';

  @override
  String get seller_due_amount => 'مستحقات البائع';

  @override
  String get delete_account_screen_title => 'حذف الحساب';

  @override
  String get delete_account_warning_title => 'تحذير قبل حذف الحساب';

  @override
  String get delete_account_warning_message =>
      'عزيزي المستخدم، عند حذف حسابك، سيتم حذف بياناتك، ولن يمكنك استعادتها إلا من خلال التواصل مع فريق الدعم.';

  @override
  String get delete_account_now => 'حذف الحساب الآن';

  @override
  String get delete_account_confirm_message =>
      'هل أنت متأكد من رغبتك في حذف الحساب؟';

  @override
  String get delete_account_cancel_action => 'رجوع';

  @override
  String get delete_account_confirm_action => 'تأكيد';

  @override
  String get delete_account_changed_mind => 'لقد غيرت رأيي';

  @override
  String get home_dialog_camels_title => 'مزادات الإبل';

  @override
  String get home_dialog_horses_title => 'مزادات الخيل';

  @override
  String get home_dialog_subtitle => 'اختر نوع المزاد للمتابعة.';

  @override
  String get home_dialog_option_single_title => 'مزاد فردي';

  @override
  String get home_dialog_option_single_subtitle =>
      'بيع مباشر بعرض واحد واضح وكامل التفاصيل.';

  @override
  String get home_dialog_option_single_badge => 'فردي';

  @override
  String get home_dialog_option_group_title => 'مزاد جماعي / سنوي';

  @override
  String get home_dialog_option_group_subtitle =>
      'مشاركات متعددة ضمن مزاد موسمي كبير.';

  @override
  String get home_dialog_option_group_badge => 'جماعي';

  @override
  String get add_ad_live_electronic_subtitle => 'خيار مختلط';

  @override
  String get add_ad_electronic_only_subtitle => 'بدون مباشر';

  @override
  String get add_ad_show_auction_opening_price_hint =>
      'فعّل هذا الخيار لإظهار سعر بداية المزاد للمشترين.';

  @override
  String get add_ad_market_entry_price_visibility_hint =>
      'إظهار أو إخفاء رسوم دخول السوق ضمن العرض.';

  @override
  String get auction_sold_label => 'التي تم بيعها';

  @override
  String get auction_unsold_label => 'التي لم تباع';

  @override
  String get auction_participating_label => 'المشاركة';

  @override
  String get auction_withdrawn_label => 'المنسحبة';

  @override
  String get auction_paddles_count_label => 'عدد المضارب';
  @override
  String get property_details_title => 'تفاصيل العقار';

  @override
  String get property_contact_advertiser => 'تواصل مع المعلن';

  @override
  String get property_choose_contact_method => 'اختر طريقة التواصل المفضلة';

  @override
  String get property_phone_call => 'اتصال هاتفي';

  @override
  String get property_no_data => 'لا توجد بيانات للعقار';

  @override
  String get property_skeleton_title => 'شقة سكنية فاخرة بموقع مميز';

  @override
  String get property_skeleton_description => 'نبذة مختصرة عن العقار تظهر أثناء تحميل تفاصيل العقار من الخادم';

  @override
  String get property_about => 'نبذة عن العقار';

  @override
  String get property_ad_details => 'تفاصيل الاعلان';

  @override
  String get property_coverage_details => 'تفاصيل التغطية';

  @override
  String get property_price => 'سعر العقار';

  @override
  String get property_ownable_amount => 'القابلة للتملك';

  @override
  String get property_covered_amount => 'تمت تغطيته';

  @override
  String get property_remaining_amount => 'المتبقي';

  @override
  String get property_completed => 'مكتملة';

  @override
  String get property_documents => 'مستندات العقار';

  @override
  String get property_document_title_deed => 'صك الملكية';

  @override
  String get property_document_valuation_report => 'تقرير التقييم';

  @override
  String get property_document_financial_study => 'الدراسة المالية';

  @override
  String get property_document_investment_contract => 'عقد الاستثمار';

  @override
  String get property_download => 'تحميل';

  @override
  String get property_no_documents => 'لا توجد مستندات متاحة';

  @override
  String get property_sale_terms => 'شروط البيع';

  @override
  String get property_more => 'المزيد';

  @override
  String get property_no_sale_terms => 'لا توجد شروط بيع متاحة';

  @override
  String get property_value => 'قيمة العقار';

  @override
  String get property_specifications => 'مواصفات العقار';

  @override
  String get property_age => 'عمر العقار';

  @override
  String get property_face => 'واجهة العقار';

  @override
  String get property_street_width => 'عرض الشارع';

  @override
  String get property_title_deed_type => 'نوع الصك';

  @override
  String get property_usages => 'الاستخدامات';

  @override
  String get property_utilities => 'الخدمات';

  @override
  String get property_location_data => 'بيانات الموقع';

  @override
  String get property_region => 'المنطقة';

  @override
  String get property_city => 'المدينة';

  @override
  String get property_district => 'الحي';

  @override
  String get property_street => 'الشارع';

  @override
  String get property_building_number => 'رقم المبنى';

  @override
  String get property_additional_number => 'الرقم الإضافي';

  @override
  String get property_latitude => 'خط العرض';

  @override
  String get property_longitude => 'خط الطول';

  @override
  String get property_advertiser_data => 'بيانات المعلن';

  @override
  String get property_advertiser_name => 'اسم المعلن';

  @override
  String get advertiser_profile_title => 'ملف المعلن';
  @override
  String get advertiser_unknown => 'معلن';
  @override
  String get advertiser_info_tab => 'المعلومات';
  @override
  String get advertiser_ads_tab => 'الإعلانات';
  @override
  String get advertiser_reviews_tab => 'التقييمات';

  @override
  String get my_reviews => 'تقييماتي';

  @override
  String get more_desc_my_reviews => 'عرض التقييمات التي حصلت عليها';
  @override
  String get advertiser_information => 'معلومات المعلن';
  @override
  String get advertiser_full_name => 'الاسم الكامل';
  @override
  String get advertiser_phone => 'رقم الهاتف';
  @override
  String get advertiser_email => 'البريد الإلكتروني';
  @override
  String get advertiser_no_reviews => 'لا توجد تقييمات حتى الآن';
  @override
  String get advertiser_rate => 'تقييم';
  @override
  String get advertiser_rate_title => 'قيّم المعلن';
  @override
  String get advertiser_rating_description => 'الوصف';
  @override
  String get advertiser_rating_description_hint => 'ادخل الوصف';
  @override
  String get advertiser_choose_rating => 'اختر تقييمك';
  @override
  String get advertiser_send_rating => 'ارسال';
  @override
  String advertiser_reviews_count(int count) => 'تقييم ($count)';
  @override
  String get advertiser_reviews_label => 'تقييماً';
  @override
  String get advertiser_star_rating => 'التقييم بالنجوم';
  @override
  String advertiser_membership_duration(int count) => '$count شهر\nفي تملك';
  @override
  String get advertiser_preview_reviewer_name => 'محمد سعيد';
  @override
  String get advertiser_preview_review_comment =>
      'هذا المكان مخصص لوضع نص التقييم هذا المكان مخصص لوضع نص التقييم هذا المكان مخصص لوضع نص التقييم';

  @override
  String get property_mobile_number => 'رقم الجوال';

  @override
  String get property_brokerage_license => 'رخصة الوساطة';

  @override
  String get property_employee_name => 'اسم الموظف';

  @override
  String get property_employee_mobile => 'جوال الموظف';

  @override
  String get property_license_data => 'بيانات الرخصة';

  @override
  String get property_end_date => 'تاريخ الانتهاء';

  @override
  String get property_ad_channels => 'قنوات الإعلان';

  @override
  String get property_ad_license_link => 'رابط ترخيص الإعلان';

  @override
  String get property_attributes => 'خصائص العقار';

  @override
  String get property_no_data_available => 'لا توجد بيانات متاحة';

  @override
  String get property_meter_unit => 'م';

  @override
  String get property_details_summary => 'تفاصيل العقار';

  @override
  String get property_area => 'المساحة';

  @override
  String get property_type => 'نوع العقار';

  @override
  String get property_ad_license_number => 'رقم ترخيص الاعلان';

  @override
  String get property_available_ownership_percentage => 'النسبة المتاحة للتملك';

  @override
  String get property_ownership_details => 'تفاصيل الملكية';

  @override
  String get property_ownership_percentage => 'نسبة الملكية';

  @override
  String get property_total_investment => 'إجمالي الاستثمار';

  @override
  String get property_timeline => 'الجدول الزمني';

  @override
  String get property_ownership_registration => 'تسجيل الملكية';

  @override
  String get property_partial_purchase => 'شراء جزء';

  @override
  String get property_opportunity_listed => 'تم إدراج الفرصة';

  @override
  String get property_opportunity_listed_desc => 'تم إدراج الفرصة وهي متاحة الان للتملك الجزئي';

  @override
  String get property_opportunity_opened => 'تم فتح الفرص';

  @override
  String get property_opportunity_opened_desc => 'الفرصة مفتوحة الان للتملك';

  @override
  String get property_funding_completed => 'اكتمال التمويل';

  @override
  String get property_funding_completed_desc => 'اكتمال الفرصة الى 100 % تمويل';

  @override
  String get property_opportunity_closed => 'إغلاق الفرصة';

  @override
  String get property_opportunity_closed_desc => 'تم إغلاق الفرصة واصدار شهادات التملك';

  @override
  String get property_purchased_prefix => 'تم شراء ';

  @override
  String get property_purchased_amount_connector => ' بقيمة ';

  @override
  String get property_riyal => 'ريال';

  @override
  String get property_registered_prefix => 'تم تسجيل ملكية ';

  @override
  String get property_registered_suffix => ' من العقار';

  @override
  String get property_list_separator => '، ';



  @override
  String get add_property_title => 'إعلان جديد';

  @override
  String add_property_step(int current, int total) => 'الخطوة $current من $total';

  @override
  String get add_property_listing_title => 'اختر نوع الإعلان';

  @override
  String get add_property_listing_subtitle => 'حدّد الغرض من الإعلان ونوع العقار للبدء.';

  @override
  String get add_property_listing_type => 'غرض الإعلان';

  @override
  String get add_property_operation_type => 'نوع العملية';

  @override
  String get add_property_for_sale => 'للبيع';

  @override
  String get add_property_for_rent => 'للإيجار';

  @override
  String get add_property_property_type => 'نوع العقار';

  @override
  String get add_property_apartment => 'شقة';

  @override
  String get add_property_villa => 'فيلا';

  @override
  String get add_property_arabic_house => 'منزل عربي';

  @override
  String get add_property_building => 'بناء';

  @override
  String get add_property_chalet => 'شاليه';

  @override
  String get add_property_land => 'أرض';

  @override
  String get add_property_office => 'مكتب';

  @override
  String get add_property_commercial_shop => 'محل تجاري';

  @override
  String get add_property_farm => 'مزرعة';

  @override
  String get add_property_warehouse => 'مستودع';

  @override
  String get add_property_advertiser_type => 'نوع المعلن';

  @override
  String get add_property_advertiser_owner => 'مالك';

  @override
  String get add_property_advertiser_agent => 'وسيط عقاري';

  @override
  String get add_property_select_hint => 'يرجى الاختيار';

  @override
  String get add_property_governorate => 'المحافظة';

  @override
  String get add_property_district_hint => 'يرجى إدخال الحي';

  @override
  String get add_property_map_location => 'الموقع';

  @override
  String get add_property_riyadh_province => 'منطقة الرياض';

  @override
  String get add_property_makkah_province => 'منطقة مكة المكرمة';

  @override
  String get add_property_eastern_province => 'المنطقة الشرقية';

  @override
  String get add_property_riyadh_city => 'الرياض';

  @override
  String get add_property_jeddah_city => 'جدة';

  @override
  String get add_property_dammam_city => 'الدمام';

  @override
  String get add_property_location_title => 'أين يقع العقار؟';

  @override
  String get add_property_location_subtitle => 'أدخل بيانات الموقع الأساسية للعقار.';

  @override
  String get add_property_city => 'المدينة';

  @override
  String get add_property_district => 'الحي';

  @override
  String get add_property_details_title => 'تفاصيل العقار';

  @override
  String get add_property_details_subtitle => 'أضف المعلومات التي تساعد المهتمين على معرفة عقارك.';

  @override
  String get add_property_ad_title => 'عنوان الإعلان';

  @override
  String get add_property_description => 'وصف العقار';

  @override
  String get add_property_area => 'المساحة (م²)';

  @override
  String get add_property_price => 'السعر (ر.س)';

  @override
  String get add_property_review_title => 'راجع إعلانك';

  @override
  String get add_property_review_subtitle => 'تأكد من صحة البيانات قبل نشر العقار.';

  @override
  String get add_property_required => 'هذا الحقل مطلوب';

  @override
  String get add_property_positive_number => 'أدخل رقمًا أكبر من صفر';

  @override
  String get add_property_previous => 'السابق';

  @override
  String get add_property_continue => 'متابعة';

  @override
  String get add_property_publish => 'نشر العقار';

  @override
  String get add_property_success => 'تم إرسال العقار بنجاح';

  @override
  String get add_property_discard_title => 'تجاهل الإعلان؟';

  @override
  String get add_property_discard_message => 'ستفقد البيانات التي أدخلتها في هذه الجلسة.';

  @override
  String get add_property_keep_editing => 'متابعة التحرير';

  @override
  String get add_property_discard => 'تجاهل';


  @override
  String get add_property_bedrooms => 'غرف النوم';

  @override
  String get add_property_bathrooms => 'دورات المياه';

  @override
  String get add_property_features_title => 'مميزات العقار';

  @override
  String get add_property_features_subtitle => 'اختر المميزات المتوفرة في العقار.';

  @override
  String get add_property_feature_parking => 'موقف سيارة';

  @override
  String get add_property_feature_elevator => 'مصعد';

  @override
  String get add_property_feature_pool => 'مسبح';

  @override
  String get add_property_feature_garden => 'حديقة';

  @override
  String get add_property_feature_security => 'حراسة';

  @override
  String get add_property_feature_furnished => 'مفروش';

  @override
  String get add_property_media_title => 'صور العقار';

  @override
  String get add_property_media_subtitle => 'أضف صورًا واضحة تساعد في إبراز العقار.';

  @override
  String get add_property_add_photos => 'إضافة صور';

  @override
  String get add_property_remove_photo => 'حذف الصورة';

  @override
  @override
  String get add_property_price_label => 'السعر';

  @override
  String get add_property_currency_sar => 'ر.س';

  @override
  String get add_property_price_hint => 'يرجى إدخال السعر';

  @override
  String get add_property_ad_title_hint => 'مثال: شقة جديدة للبيع';

  @override
  String get add_property_description_hint => 'أدخل الوصف';

  @override
  String get add_property_price_info_note => 'ملاحظة: استخدم عنوان واضح وجذاب، ووصف شامل للمميزات المهمة لزيادة فرص جذب المهتمين بإعلانك.';

  @override
  String get add_property_conditions_title => 'شروط الإعلان (اختياري)';

  @override
  String get add_property_conditions_subtitle => 'أضف شروط يجب على المشتري / المستأجر معرفتها';

  @override
  String get add_property_condition_as_is => 'حالة العقار فقط';

  @override
  String get add_property_condition_bank_transfer => 'الدفع بواسطة تحويل';

  @override
  String get add_property_condition_viewing => 'المعاينة';

  @override
  String get add_property_condition_hint => 'اكتب الشرط';

  @override
  String get add_property_add_condition => 'إضافة';

  String get add_property_price_title => 'حدّد السعر';

  @override
  String get add_property_price_subtitle => 'أدخل السعر المطلوب للعقار.';


  @override
  String get add_property_location_progress => 'الموقع';

  @override
  String get add_property_address_progress => 'العنوان';

  @override
  String get add_property_details_progress => 'التفاصيل';

  @override
  String get add_property_features_progress => 'المميزات';

  @override
  String get add_property_media_progress => 'الصور';

  @override
  String get add_property_price_progress => 'السعر';

  @override
  String get add_property_review_progress => 'المراجعة';

  @override
  String get property_owner_pending_title => 'قيد الانتظار';

  @override
  String get property_owner_pending_description => 'تم إرسال إعلانك للمراجعة، سنخبرك بعد الموافقة عليه';

  @override
  String get property_owner_rejected_title => 'تم رفض الإعلان';

  @override
  String get property_owner_rejected_description => 'نعتذر، لم يتم اعتماد إعلانك لوجود ملاحظات عليه';

  @override
  String get property_owner_draft_title => 'مسودة';

  @override
  String get property_owner_draft_description => 'لم يتم نشر الإعلان بعد، يمكنك إكمال الخطوات ونشر الإعلان';

  @override
  String property_owner_rejection_reason(Object reason) => 'سبب الرفض: $reason';

  @override
  String get property_gallery_view_video => 'مشاهدة الفيديو';

  @override
  String get customerServiceTitle => 'خدمة العملاء';

  @override
  String get customerServiceContactVia => 'تواصل عن طريق';

  @override
  String get customerServiceWhatsapp => 'واتساب';

  @override
  String get customerServiceCall => 'إتصال';

  @override
  String get customerServiceSocialHint => 'أو يمكنك التواصل معنا من خلال';

  @override
  String get account_verification_title => 'توثيق الحساب';

  @override
  String get account_verification_id_front => 'صورة الهوية - الوجه الأمامي';

  @override
  String get account_verification_id_front_hint => 'يرجى إضافة صورة الوجه الأمامي للهوية';

  @override
  String get account_verification_id_back => 'صورة الهوية - الوجه الخلفي';

  @override
  String get account_verification_id_back_hint => 'يرجى إضافة صورة الوجه الخلفي للهوية';

  @override
  String get account_verification_commercial_record => 'السجل التجاري';

  @override
  String get account_verification_commercial_record_hint => 'يرجى إضافة صورة واضحة للسجل التجاري ساري المفعول';

  @override
  String get account_verification_add_image => 'أضف صورة';

  @override
  String get account_verification_registration_number => 'رقم السجل التجاري';

  @override
  String get account_verification_registration_number_hint => 'ادخل رقم السجل التجاري';

  @override
  String get account_verification_upload_note => 'يجب أن تكون الصور واضحة وملونة والصيغة المسموحة (PNG - JPG)\nالحد الأقصى لحجم الصورة 5MB';

  @override
  String get account_verification_submit => 'إرسال الطلب';

  @override
  String get account_verification_request_sent => 'تم إرسال طلب التوثيق';

  @override
  String get account_verification_success_title => 'تم ارسال طلب التوثيق';

  @override
  String get account_verification_success_message => 'طلبك الآن قيد المراجعة وسنخبرك بالنتيجة في أقرب وقت';

  @override
  String get account_verification_back_home => 'العودة للرئيسية';

  @override
  String get account_verification_verified_title => 'حسابك موثق';

  @override
  String get account_verification_verified_description => 'تهانينا! لقد تم توثيق حسابك وستظهر شارة التوثيق في ملفاتك الشخصية.';

  @override
  String get account_verification_under_review_title => 'قيد المراجعة';

  @override
  String get account_verification_under_review_description => 'تم استلام طلب التوثيق ويقوم الفريق بمراجعة المستندات.';

  @override
  String get account_verification_rejected_title => 'تم رفض طلب التوثيق';

  @override
  String get account_verification_rejected_description => 'عذراً، لم نتمكن من توثيق حسابك بسبب وجود مشكلة في المستندات المرفوعة.';

  @override
  String get account_verification_rejection_reason => 'سبب الرفض: استخدم صوراً بجودة وشكل جيد.';

  @override
  String get account_verification_submission_date => 'تاريخ الطلب';

  @override
  String get account_verification_approval_date => 'تاريخ الموافقة';

  @override
  String get account_verification_rejection_date => 'تاريخ الرفض';

  @override
  String get account_verification_resubmit => 'إعادة تقديم الطلب';

  @override
  String get order_details => 'تفاصيل الطلب';

  @override
  String get order_summary => 'ملخص الطلب';

  @override
  String get order_submitter => 'مقدم الطلب';

  @override
  String get order_date => 'تاريخ الطلب';

  @override
  String get order_service => 'الخدمة';

  @override
  String get order_service_type => 'نوع الخدمة';

  @override
  String get order_fees => 'الرسوم';

  @override
  String get order_submitter_abroad => 'مغترب / خارج سوريا';

  @override
  String get order_business_establishment => 'تأسيس الأعمال';

  @override
  String get order_fees_after_review => 'تحدد بعد المراجعة';

  @override
  String get order_stages => 'مراحل الطلب';

  @override
  String get order_documents => 'مستندات الطلب';

  @override
  String get order_required_action => 'إجراء مطلوب';

  @override
  String get order_required_documents_message => 'يرجى إرفاق المستندات المطلوبة لاستكمال الطلب';

  @override
  String get order_complete_requirements => 'استكمال المتطلبات';

  @override
  String get complete_requirements_notice =>
      'المستندات التالية مطلوبة لاستكمال مراجعة طلبك\nبعد رفع جميع المستندات سيتم مراجعتها من قبل فريق فرسان';

  @override
  String get complete_requirements_documents_title => 'المستندات المطلوبة';

  @override
  String get complete_requirements_conviction_certificate => 'شهادة غير محكوم';

  @override
  String get complete_requirements_upload => 'اضغط للرفع';

  @override
  String get complete_requirements_upload_hint =>
      'الحد الأقصى لحجم الملف 5 ميغا بايت (PNG-JPG-PDF)';


  @override
  String get complete_requirements_confirm => 'تأكيد';

  @override
  String get order_contact_consultant => 'التواصل مع مستشار فرسان';


  @override
  String get order_attached_documents => 'المستندات المرفقة';

  @override
  String get order_price_quote => 'عرض السعر';


  @override
  String get order_approve_and_pay => 'الاعتماد والدفع';


  @override
  String get order_document_passport => 'جواز السفر';

  @override
  String get order_document_commercial_record => 'السجل التجاري';

  @override
  String get order_document_identity => 'الهوية';

  @override
  String get order_document_company_address => 'مستند مقر الشركة';

  @override
  String get order_document_status_approved => 'معتمد';

  @override
  String get order_document_status_rejected => 'مرفوض';

  @override
  String get order_document_status_under_review => 'قيد المراجعة';

  @override
  String get order_document_status_required => 'مطلوب';

  @override
  String get order_document_status_not_required => 'غير مطلوب حالياً';

  @override
  String get order_stage_received_title => 'استلام الطلب';

  @override
  String get order_stage_received_description => 'تم استلام ملف المعاملة وإرسال البيانات لفريق خدمات تأسيس الأعمال.';

  @override
  String get order_stage_review_title => 'مراجعة الطلب';

  @override
  String get order_stage_review_description => 'تمت مراجعة الطلب والبيانات الأساسية وتعيين مستشار للطلب.';

  @override
  String get order_stage_documents_title => 'المستندات';

  @override
  String get order_stage_documents_description => 'سيتم مراجعة المستندات وفي حال وجود أي نقص سيقوم الفريق بإرسال طلب لك لاستكمال المستندات.';

  @override
  String get order_stage_quote_title => 'إعداد عرض السعر والخطة';

  @override
  String get order_stage_quote_description => 'بعد اكتمال المستندات سيظهر عرض الخدمة شاملاً الرسوم والمدة وخطوات التنفيذ بالاعتماد.';

  @override
  String get order_stage_payment_title => 'اعتماد العرض والدفع';

  @override
  String get order_stage_payment_description => 'يمكنك اعتماد العرض واختيار طريقة الدفع وتحميل الفاتورة والإيصال من لوحة التحكم.';

  @override
  String get order_stage_execution_title => 'التنفيذ والمتابعة';

  @override
  String get order_stage_execution_description => 'يتولى فريق فرسان إجراءات المعاملة مع تحديثك بكل خطوة أو متطلب جديد.';

  @override
  String get order_stage_completion_title => 'الإنجاز والتسليم';

  @override
  String get order_stage_completion_description => 'عند اكتمال الخدمة سيتم رفع المستندات النهائية وإغلاق الطلب مع إمكانية تقييم الخدمة.';

  @override
  String get order_stage_sample_date => '26 يناير 2026';

  @override
  String get create_order_title => 'إنشاء طلب';

  @override
  String get create_order_choose_service => 'اختر نوع الخدمة';

  @override
  String get create_order_licensing => 'التراخيص';

  @override
  String get create_order_business_setup => 'تأسيس الأعمال';

  @override
  String get create_order_company_management => 'إدارة الشركات';

  @override
  String get create_order_property => 'الملكية والعقارات';

  @override
  String get create_order_investment => 'الاستثمار (قريباً)';

  @override
  String get create_order_expatriate_services => 'خدمات المغتربين';

  @override
  String get create_order_help_title => 'تحتاج مساعدة؟';

  @override
  String get create_order_help_description =>
      'فريقنا متاح لمساعدتك في اختيار نوع الخدمة المناسبة';
  @override
  String get new_order_title => 'طلب جديد';

  @override
  String get new_order_step_establishment => 'نوع التأسيس';

  @override
  String get new_order_step_applicant => 'مقدم الطلب';

  @override
  String get new_order_step_company_info => 'بيانات الشركة';

  @override
  String get new_order_establishment_title => 'حدد نوع التأسيس';

  @override
  String get new_order_establishment_description => 'اختر الشكل الأقرب لحالتك. إذا لم تكن متأكدًا يمكنك طلب مساعدة فريق فرسان.';

  @override
  String get new_order_new_company => 'تأسيس شركة جديدة';

  @override
  String get new_order_company_branch => 'فتح فرع لشركة قائمة';

  @override
  String get new_order_contact_identity_title => 'بيانات التواصل والهوية';

  @override
  String get new_order_contact_identity_description =>
      'سنستخدم هذه المعلومات لمراجعة الطلب والتواصل معك بشأن النواقص والخطوات التالية.';

  @override
  String get new_order_full_name => 'الاسم الكامل';

  @override
  String get new_order_full_name_hint => 'مثال : محمد خطيب';

  @override
  String get new_order_father_name => 'اسم الأب';
  @override
  String get new_order_father_name_hint => 'ادخل اسم الأب';
  @override
  String get new_order_nationality => 'الجنسية';
  @override
  String get new_order_select_hint => 'يرجى الاختيار';
  @override
  String get new_order_male => 'ذكر';
  @override
  String get new_order_female => 'أنثى';
  @override
  String get new_order_syrian_nationality => 'سورية';
  @override
  String get new_order_non_syrian_nationality => 'غير سورية';
  @override
  String get new_order_passport_number_optional => 'رقم جواز السفر (اختياري)';
  @override
  String get new_order_passport_number_hint => 'ادخل رقم جواز السفر';
  @override
  String get new_order_national_id => 'الرقم الوطني / رقم الهوية';
  @override
  String get new_order_national_id_hint => 'ادخل الرقم الوطني / رقم الهوية';
  @override
  String get new_order_mobile_number => 'رقم الجوال';
  @override
  String get new_order_mobile_number_hint => '000 000 000';
  @override
  String get new_order_whatsapp_number => 'رقم واتساب';
  @override
  String get new_order_whatsapp_number_hint => 'اتركه فارغاً إذا كان نفس رقم الجوال';
  @override
  String get new_order_email => 'البريد الإلكتروني';
  @override
  String get new_order_email_hint => 'ادخل البريد الإلكتروني';

  @override
  String get new_order_delegation_in_syria => 'التفويض داخل سوريا';
  @override
  String get new_order_delegation_in_syria_description => 'حدد ما اذا كان لديك شخص مفوض أو وكيل داخل سوريا';
  @override
  String get new_order_has_representative_in_syria => 'لدي شخص مفوض أو وكيل داخل سوريا';
  @override
  String get new_order_representative_details_description => 'يمكن إضافة بياناته والوكالة ضمن المستندات لاحقاً.';

  @override
  String get new_order_next => 'التالي';

  @override
  String get new_order_submit => 'إرسال الطلب';

  @override
  String get new_order_proposed_company_info_title => 'معلومات الشركة المقترحة';

  @override
  String get new_order_proposed_company_info_description =>
      'أدخل المعلومات الأولية للشركة التي ترغب بتأسيسها.';

  @override
  String get new_order_proposed_company_name => 'اسم الشركة المقترح';

  @override
  String get new_order_proposed_company_name_hint => 'أدخل اسم الشركة المقترح';

  @override
  String get new_order_company_activity => 'نشاط الشركة';

  @override
  String get new_order_company_activity_hint => 'أدخل النشاط الرئيسي للشركة';

  @override
  String get new_order_company_headquarters => 'مقر الشركة المقترح';

  @override
  String get new_order_company_headquarters_hint => 'أدخل المدينة أو المحافظة';

  @override
  String get new_order_company_capital => 'رأس المال المقترح';

  @override
  String get new_order_company_capital_hint => 'أدخل رأس المال المتوقع';

  @override
  String get new_order_one_person_company => 'تأسيس شركة لشخص واحد';

  @override
  String get new_order_one_person_company_description => 'مالك واحد يدير ويمتلك الشركة.';

  @override
  String get new_order_limited_liability_company => 'شركة ذات مسؤولية محدودة';

  @override
  String get new_order_limited_liability_company_description => 'شركة بين شريكين أو أكثر.';

  @override
  String get new_order_foreign_partner_company => 'شركة مع شريك خارجي';

  @override
  String get new_order_foreign_partner_company_description => 'أحد الشركاء خارج سوريا أو أجنبي.';

  @override
  String get new_order_individual_establishment => 'مؤسسة فردية';

  @override
  String get new_order_individual_establishment_description => 'نشاط فردي باسم المالك.';

  @override
  String get new_order_joint_stock_company => 'شركة تضامنية';

  @override
  String get new_order_joint_stock_company_description => 'شراكة وفق الشكل القانوني المناسب.';

  @override
  String get new_order_applicant_role_title => 'صفة مقدم الطلب';

  @override
  String get new_order_applicant_role_description => 'حدد الصفة التي تتقدم بها لهذا الطلب.';

  @override
  String get new_order_syrian_citizen => 'مواطن سوري';

  @override
  String get new_order_syrian_citizen_description => 'أتقدم بالطلب بصفتي الشخصية.';

  @override
  String get new_order_expatriate => 'مغترب / خارج سوريا';

  @override
  String get new_order_expatriate_description => 'أتقدم بالطلب من خارج سوريا.';

  @override
  String get new_order_foreign_investor => 'مستثمر أجنبي';

  @override
  String get new_order_foreign_investor_description => 'غير سوري وأرغب بتأسيس نشاط.';

  @override
  String get new_order_company_representative => 'ممثل عن شركة';

  @override
  String get new_order_company_representative_description => 'أتقدم بالطلب نيابة عن جهة.';

}
