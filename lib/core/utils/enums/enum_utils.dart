enum PageAnimation { slide, fade, none }

enum UserType { male, female }

enum MediaModelType { user, Auction, WalletTopUpRequest, SingleAuction, ContactUs, PaymentTransaction }

enum MediaType { profile, attachments,payment_proof }

enum CategoryBanner { transport_services, home, medical_services, products }




enum PregnancyStatus { vaccinated, unvaccinated, unsure }

/// Country values accepted by the API for both `country` and `nationality`.
enum CountryCode {
  sy('SY', 'Syria', 'سوريا'),
  lb('LB', 'Lebanon', 'لبنان'),
  jo('JO', 'Jordan', 'الأردن'),
  iq('IQ', 'Iraq', 'العراق'),
  ps('PS', 'Palestine', 'فلسطين'),
  sa('SA', 'Saudi Arabia', 'المملكة العربية السعودية'),
  ae('AE', 'United Arab Emirates', 'الإمارات العربية المتحدة'),
  kw('KW', 'Kuwait', 'الكويت'),
  qa('QA', 'Qatar', 'قطر'),
  bh('BH', 'Bahrain', 'البحرين'),
  om('OM', 'Oman', 'عُمان'),
  ye('YE', 'Yemen', 'اليمن'),
  eg('EG', 'Egypt', 'مصر'),
  ly('LY', 'Libya', 'ليبيا'),
  tn('TN', 'Tunisia', 'تونس'),
  dz('DZ', 'Algeria', 'الجزائر'),
  ma('MA', 'Morocco', 'المغرب'),
  sd('SD', 'Sudan', 'السودان'),
  mr('MR', 'Mauritania', 'موريتانيا'),
  so('SO', 'Somalia', 'الصومال'),
  dj('DJ', 'Djibouti', 'جيبوتي'),
  km('KM', 'Comoros', 'جزر القمر'),
  tr('TR', 'Türkiye', 'تركيا'),
  ir('IR', 'Iran', 'إيران'),
  cy('CY', 'Cyprus', 'قبرص'),
  de('DE', 'Germany', 'ألمانيا'),
  se('SE', 'Sweden', 'السويد'),
  nl('NL', 'Netherlands', 'هولندا'),
  at('AT', 'Austria', 'النمسا'),
  dk('DK', 'Denmark', 'الدنمارك'),
  no('NO', 'Norway', 'النرويج'),
  be('BE', 'Belgium', 'بلجيكا'),
  fr('FR', 'France', 'فرنسا'),
  gb('GB', 'United Kingdom', 'المملكة المتحدة'),
  ch('CH', 'Switzerland', 'سويسرا'),
  it('IT', 'Italy', 'إيطاليا'),
  es('ES', 'Spain', 'إسبانيا'),
  gr('GR', 'Greece', 'اليونان'),
  fi('FI', 'Finland', 'فنلندا'),
  ie('IE', 'Ireland', 'أيرلندا'),
  pl('PL', 'Poland', 'بولندا'),
  ro('RO', 'Romania', 'رومانيا'),
  bg('BG', 'Bulgaria', 'بلغاريا'),
  ru('RU', 'Russia', 'روسيا'),
  ua('UA', 'Ukraine', 'أوكرانيا'),
  us('US', 'United States', 'الولايات المتحدة'),
  ca('CA', 'Canada', 'كندا'),
  br('BR', 'Brazil', 'البرازيل'),
  ar('AR', 'Argentina', 'الأرجنتين'),
  ve('VE', 'Venezuela', 'فنزويلا'),
  mx('MX', 'Mexico', 'المكسيك'),
  au('AU', 'Australia', 'أستراليا'),
  nz('NZ', 'New Zealand', 'نيوزيلندا'),
  cn('CN', 'China', 'الصين'),
  inCountry('IN', 'India', 'الهند'),
  pk('PK', 'Pakistan', 'باكستان'),
  my('MY', 'Malaysia', 'ماليزيا'),
  id('ID', 'Indonesia', 'إندونيسيا'),
  jp('JP', 'Japan', 'اليابان'),
  kr('KR', 'South Korea', 'كوريا الجنوبية'),
  am('AM', 'Armenia', 'أرمينيا'),
  az('AZ', 'Azerbaijan', 'أذربيجان'),
  ge('GE', 'Georgia', 'جورجيا'),
  kz('KZ', 'Kazakhstan', 'كازاخستان'),
  za('ZA', 'South Africa', 'جنوب أفريقيا'),
  ng('NG', 'Nigeria', 'نيجيريا'),
  other('OTHER', 'Other', 'أخرى');

  const CountryCode(this.apiValue, this.englishName, this.arabicName);

  final String apiValue;
  final String englishName;
  final String arabicName;

  String displayName({required bool isArabic}) =>
      isArabic ? arabicName : englishName;
}
