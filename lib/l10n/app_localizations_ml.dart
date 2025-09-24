// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'ട്രാവൽ ട്രാക്കർ';

  @override
  String get appSubtitle => 'നിങ്ങളുടെ യാത്രകൾ ട്രാക്ക് ചെയ്യുക, ഇക്കോ പോയിന്റ് നേടുക';

  @override
  String get gpsConsentTitle => 'ജിപിഎസ് സ്ഥാനം ഉപയോഗിക്കുന്നതിന് അംഗീകാരം';

  @override
  String get gpsConsentDescription => 'ട്രാവൽ ട്രാക്കർ നിങ്ങളുടെ യാത്രാ ട്രാക്കിംഗിനും കുടുംബ സുരക്ഷാ സവിശേഷതകൾക്കും നിങ്ങളുടെ ജിപിഎസ് സ്ഥാനം ഉപയോഗിക്കുന്നു. നിങ്ങളുടെ സ്ഥിതി വിവരങ്ങൾ സുരക്ഷിതമായി സൂക്ഷിക്കപ്പെടുന്നു, സുരക്ഷിത എൻക്രിപ്ഷൻ ഉപയോഗിച്ച് സംരക്ഷിക്കുന്നു. നിങ്ങളുടെ സമ്മതം ഇല്ലാതെ ഞങ്ങൾ പങ്കിടുകയില്ല.';

  @override
  String get gpsConsentCheckbox => 'യാത്രാ ട്രാക്കിംഗിനും കുടുംബ സുരക്ഷയ്ക്കും എന്റെ ജിപിഎസ് സ്ഥാനം ഉപയോഗിക്കാൻ Travel Tracker അനുവദിക്കുന്നതിന് ഞാൻ സമ്മതിക്കുന്നു.';

  @override
  String get gpsConsentRequired => 'തുടരാൻ ജിപിഎസ് സ്ഥാനം ഉപയോഗത്തിന് സമ്മതിക്കുക.';

  @override
  String get ok => 'ശരി';

  @override
  String get loginFailed => 'ലോഗിൻ പരാജയപ്പെട്ടു. ദയവായി വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get createAccount => 'അക്കൗണ്ട് സൃഷ്ടിക്കുക';

  @override
  String get email => 'ഇമെയിൽ';

  @override
  String get phoneNumber => 'ഫോൺ നമ്പർ';

  @override
  String get aadhaarNumber => 'ആധാർ നമ്പർ';

  @override
  String get password => 'പാസ്‌വേഡ്';

  @override
  String get confirmPassword => 'പാസ്‌വേഡ് സ്ഥിരീകരിക്കുക';

  @override
  String get enterEmail => 'ദയവായി നിങ്ങളുടെ ഇമെയിൽ നൽകുക';

  @override
  String get invalidEmail => 'ദയവായി സാധുവായ ഇമെയിൽ നൽകുക';

  @override
  String get enterPhone => 'ദയവായി ഫോൺ നമ്പർ നൽകുക';

  @override
  String get invalidPhone => 'ദയവായി ശരിയായ ഫോൺ നമ്പർ നൽകുക';

  @override
  String get enterAadhaar => 'ദയവായി നിങ്ങളുടെ ആധാർ നമ്പർ നൽകുക';

  @override
  String get invalidAadhaar => 'ആധാർ 12 അക്കങ്ങൾ ഉണ്ടായിരിക്കണം';

  @override
  String get enterPassword => 'ദയവായി പാസ്‌വേഡ് നൽകുക';

  @override
  String get passwordLength => 'പാസ്‌വേഡ് കുറഞ്ഞത് 6 അക്കങ്ങൾ വേണം';

  @override
  String get confirmPasswordText => 'ദയവായി പാസ്‌വേഡ് സ്ഥിരീകരിക്കുക';

  @override
  String get passwordMismatch => 'പാസ്‌വേഡുകൾ പൊരുത്തപ്പെടുന്നില്ല';

  @override
  String get registrationSuccess => 'രജിസ്ട്രേഷൻ വിജയിച്ചു! ദയവായി ലോഗിൻ ചെയ്യുക.';

  @override
  String get alreadyHaveAccount => 'ഇപ്പോൾ അക്കൗണ്ട് ഉണ്ടോ? ലോഗിൻ ചെയ്യുക';

  @override
  String get register => 'രജിസ്ട്രർ ചെയ്യുക';

  @override
  String get login => 'ലോഗിൻ';

  @override
  String get demoCredentials => 'ഡെമോ ക്രെഡൻഷ്യൽസ്:';

  @override
  String get admin => 'അഡ്മിൻ';

  @override
  String get adminDashboard => 'അഡ്മിൻ ഡാഷ്ബോർഡ്';

  @override
  String get searchPlace => 'സ്ഥലം തിരയുക...';

  @override
  String statisticsFor(Object place) {
    return '$placeയുടെ സ്ഥിതിവിവരക്കണക്കുകൾ';
  }

  @override
  String get totalUsers => 'ആകെ ഉപയോക്താക്കൾ';

  @override
  String get totalTrips => 'മൊത്തം യാത്രകൾ';

  @override
  String get avgTripsUser => 'ശരാശരി യാത്രകൾ/ഉപയോക്താവ്';

  @override
  String get activeToday => 'ഇന്ന് സജീവം';

  @override
  String transportModeShare(Object place) {
    return 'ഗതാഗത രീതിയുടെ പങ്ക് - $place';
  }

  @override
  String weeklyTripCount(Object place) {
    return 'ആഴ്ചയിലെ യാത്രാ കണക്ക് - $place';
  }

  @override
  String get usersByPlace => 'സ്ഥലംപ്രകാരം ഉപയോക്താക്കൾ';

  @override
  String tripsPoints(Object points, Object trips) {
    return '$trips യാത്രകൾ • $points പോയിന്റുകൾ';
  }

  @override
  String get autoTripDetection => 'ഓട്ടോമാറ്റിക് യാത്ര കണ്ടെത്തൽ';

  @override
  String get detectionActive => 'ഓട്ടോമാറ്റിക് കണ്ടെത്തൽ പ്രവർത്തിക്കുന്നു';

  @override
  String get detectionPaused => 'കണ്ടെത്തൽ നിർത്തി';

  @override
  String get monitoringMovements => 'നിങ്ങളുടെ ചലനങ്ങൾ നിരീക്ഷിക്കുന്നു...';

  @override
  String get detectionPausedText => 'കണ്ടെത്തൽ നിർത്തി';

  @override
  String get tripInProgress => 'യാത്ര പുരോഗമിക്കുന്നു';

  @override
  String get duration => 'കാലാവധി';

  @override
  String get distance => 'ദൂരം';

  @override
  String get mode => 'മോഡ്';

  @override
  String get detectedAutomatically => 'നിങ്ങളുടെ ചലന പാറ്റേണുകൾ അടിസ്ഥാനമാക്കി സ്വയം കണ്ടെത്തി';

  @override
  String get tripDetectionActive => 'യാത്ര കണ്ടെത്തൽ സജീവമാണ്';

  @override
  String get monitoringMovement => 'ചലനം നിരീക്ഷിക്കുന്നു';

  @override
  String get trackingJourney => 'നിങ്ങളുടെ യാത്ര സ്വയം പിന്തുടരുന്നു';

  @override
  String get waitingMovement => 'പ്രധാനപ്പെട്ട ചലനത്തിനായി കാത്തിരിക്കുന്നു...';

  @override
  String get endTripNow => 'യാത്ര അവസാനിപ്പിക്കുക';

  @override
  String get howDetectionWorks => 'ഓട്ടോമാറ്റിക് കണ്ടെത്തൽ എങ്ങനെ പ്രവർത്തിക്കുന്നു:';

  @override
  String get howDetectionPoints => '• GPS, സെൻസറുകൾ ഉപയോഗിച്ച് ചലനങ്ങൾ കണ്ടെത്തുന്നു\n• ഗതാഗത മോഡ് സ്വയം തിരിച്ചറിയുന്നു\n• പ്രധാനപ്പെട്ട ചലനം കണ്ടെത്തുമ്പോൾ ട്രാക്കിംഗ് ആരംഭിക്കുന്നു\n• സ്വകാര്യതയും ബാറ്ററി ഒപ്റ്റിമൈസേഷനും മാനിക്കുന്നു';

  @override
  String get tripCompleted => 'യാത്ര പൂർത്തിയായി';

  @override
  String get autoTripDetectionTitle => 'സ്വയം യാത്ര കണ്ടെത്തൽ';

  @override
  String get detectionInfo => 'സ്വയം കണ്ടെത്തൽ എങ്ങനെ പ്രവർത്തിക്കുന്നു:';

  @override
  String get travelCompanions => 'യാത്രാസുഹൃത്തുകൾ';

  @override
  String get addNewCompanion => 'പുതിയ യാത്രാസുഹൃത്ത് ചേർക്കുക';

  @override
  String get name => 'പേര്';

  @override
  String get enterName => 'ദയവായി പേര് നൽകുക';

  @override
  String get addCompanion => 'യാത്രാസുഹൃത്ത് ചേർക്കുക';

  @override
  String get yourCompanions => 'നിങ്ങളുടെ യാത്രാസുഹൃത്തുകൾ';

  @override
  String get noCompanions => 'ഇനിയും സുഹൃത്തുക്കൾ ചേർത്തിട്ടില്ല';

  @override
  String get companionAdded => 'യാത്രാസുഹൃത്ത് വിജയകരമായി ചേർത്തു';

  @override
  String get companionRemoved => 'യാത്രാസുഹൃത്ത് നീക്കം ചെയ്തു';

  @override
  String get ecoPointsTitle => 'ഇക്കോ പോയിന്റ്സ് & റിവാർഡുകൾ';

  @override
  String get pointsTab => 'പോയിന്റ്സ്';

  @override
  String get rewardsTab => 'റിവാർഡുകൾ';

  @override
  String get totalEcoPoints => 'മൊത്തം ഇക്കോ പോയിന്റ്സ്';

  @override
  String pointsToNextLevel(Object points) {
    return '$points പോയിന്റ്സ് അടുത്ത ലെവലിന്';
  }

  @override
  String levelLabel(Object level) {
    return 'ലെവൽ $level • ഇക്കോ വാരിയർ';
  }

  @override
  String get achievementsBadges => 'സാധ്യമായ നേട്ടങ്ങളും ബാഡ്ജുകളും';

  @override
  String get availableRewards => 'ലഭ്യമായ റിവാർഡുകൾ';

  @override
  String rewardsCount(Object count) {
    return '$count റിവാർഡുകൾ';
  }

  @override
  String get redeemedRewards => 'റിഡീം ചെയ്ത റിവാർഡുകൾ';

  @override
  String itemsCount(Object count) {
    return '$count ഐറ്റങ്ങൾ';
  }

  @override
  String get noRedeemedRewards => 'എന്നിവിടെ റിഡീം ചെയ്ത റിവാർഡുകൾ ഒന്നുമില്ല';

  @override
  String get redeem => 'റിഡീം ചെയ്യുക';

  @override
  String needMorePoints(Object points) {
    return '$points കൂടുതൽ പോയിന്റ്സ് ആവശ്യമാണ്';
  }

  @override
  String get redeemRewardTitle => 'റിവാർഡ് റിഡീം ചെയ്യണോ?';

  @override
  String redeemRewardDescription(Object points, Object rewardName) {
    return '$rewardName റിഡീം ചെയ്യാൻ $points ഇക്കോ പോയിന്റ്സ് ഉപയോക്താക്കുക?';
  }

  @override
  String get cancel => 'റദ്ദാക്കുക';

  @override
  String get redeemConfirm => 'റിഡീം ചെയ്യുക';

  @override
  String redeemSuccess(Object rewardName) {
    return '$rewardName വിജയകരമായി റിഡീം ചെയ്തു!';
  }

  @override
  String get ecoStarter => 'ഇക്കോ സ്റ്റാർട്ടർ';

  @override
  String get busCommuter => 'ബസ് യാത്രികൻ';

  @override
  String get bikeEnthusiast => 'ബൈക്ക് ആസ്വാദകൻ';

  @override
  String get weeklyGoal => 'വാരാന്ത്യ ലക്ഷ്യം';

  @override
  String get monthlyGoal => 'മാസാന്ത്യ ലക്ഷ്യം';

  @override
  String get carbonSaver => 'കാർബൺ സേവർ';

  @override
  String get familyLocationTitle => 'കുടുംബ സ്ഥലം';

  @override
  String get locationsUpdated => 'സ്ഥലങ്ങൾ അപ്‌ഡേറ്റ് ചെയ്തു';

  @override
  String get familySafetyTitle => 'കുടുംബ സുരക്ഷ';

  @override
  String get familySafetySubtitle => 'അനുമതിയോടെ സതതസ്ഥല പങ്കിടൽ';

  @override
  String get familyMapViewTitle => 'കുടുംബ മാപ്പ് കാഴ്ച';

  @override
  String familyMapViewSubtitle(Object memberCount) {
    return '$memberCount കുടുംബാംഗങ്ങൾ കാണുന്നു';
  }

  @override
  String get familyMembersHeader => 'കുടുംബാംഗങ്ങൾ';

  @override
  String get onlineLabel => 'ഓൺലൈൻ';

  @override
  String get offlineLabel => 'ഓഫ്ലൈൻ';

  @override
  String get relationWife => 'ഭാര്യ';

  @override
  String get relationSon => 'മകന്‍';

  @override
  String get relationDaughter => 'മകൾ';

  @override
  String get relationFather => 'പിതാവ്';

  @override
  String get travelTrackerTitle => 'യാത്രാ ട്രാക്കർ';

  @override
  String get dashboardLabel => 'ഡാഷ്ബോർഡ്';

  @override
  String get welcomeSubtitle => 'സ്വയം ട്രിപ്പ് കണ്ടെത്തൽ • ഇക്കോ പോയിന്റ് • കുടുംബ സുരക്ഷ';

  @override
  String get menuAutoTripDetection => 'സ്വയം ട്രിപ്പ് കണ്ടെത്തൽ';

  @override
  String get menuTripHistory => 'ട്രിപ്പ് ചരിത്രം';

  @override
  String get menuEcoPoints => 'ഇക്കോ പോയിന്റ്';

  @override
  String get menuFamilyLocation => 'കുടുംബ സ്ഥലം';

  @override
  String get menuCompanions => 'കമ്പാനിയൻസ്';

  @override
  String get menuMonthlySummary => 'മാസാന്ത സംഗ്രഹം';

  @override
  String get menuAdminDashboard => 'അഡ്മിൻ ഡാഷ്ബോർഡ്';

  @override
  String get profileTooltip => 'പ്രൊഫൈൽ';

  @override
  String get monthlySummaryTitle => 'മാസാന്ത്യ സമാരി';

  @override
  String get distanceByTransportMode => 'ഗതാഗത മാർഗ്ഗപ്രകാരം ദൂരം';

  @override
  String get co2Saved => 'CO2 ലാഭിച്ചിരിക്കുന്നു (കീ.ജീ.)';

  @override
  String get monthlyStats => 'മാസാന്ത്യ സ്ഥിതിവിവരങ്ങൾ';

  @override
  String get totalDistance => 'മൊത്തം ദൂരം';

  @override
  String get co2SavedStat => 'CO2 ലാഭിച്ചിരിക്കുന്നു';

  @override
  String get tripsTaken => 'യാത്രകളുടെ എണ്ണം';

  @override
  String get ecoPoints => 'ഇക്കോ പോയിന്റ്സ്';

  @override
  String get car => 'കാർ';

  @override
  String get bus => 'ബസ്';

  @override
  String get bike => 'ബൈക്ക്';

  @override
  String get walk => 'നടപ്പ്';

  @override
  String get jan => 'ജനു';

  @override
  String get feb => 'ഫെബ്രു';

  @override
  String get mar => 'മാർച്ച്';

  @override
  String get apr => 'ഏപ്രിൽ';

  @override
  String get may => 'മേയ്';

  @override
  String get jun => 'ജൂൺ';

  @override
  String get profile => 'പ്രൊഫൈൽ';

  @override
  String get logout => 'ലോഗൗട്ട്';

  @override
  String get logoutConfirmation => 'നിങ്ങൾ യാഥാർത്ഥത്തിൽ ലോഗൗട്ട് ചെയ്യാൻ ആഗ്രഹിക്കുന്നുവോ?';

  @override
  String get deleteAccount => 'അക്കൗണ്ട് മായ്ച്ചു കളയുക';

  @override
  String get deleteAccountConfirmation => 'ഈ പ്രവർത്തനം റദ്ദാക്കാനാകില്ല. നിങ്ങളുടെ എല്ലാ ഡാറ്റയും സ്ഥിരമായി നീക്കം ചെയ്യപ്പെടും.';

  @override
  String get delete => 'മായ്ക്കുക';

  @override
  String get user => 'ഉപയോക്താവ്';

  @override
  String get travelStatistics => 'പ്രവാസ സ്ഥിതിവിവരക്കണക്കുകൾ';

  @override
  String get frequentMode => 'സാധാരണ ഗതാഗത മാർഗം';

  @override
  String get privacySettings => 'സ്വകാര്യതാ ക്രമീകരണങ്ങൾ';

  @override
  String get pauseTracking => 'ട്രാക്കിംഗ് താൽക്കാലികമായി നിർത്തുക';

  @override
  String get pauseTrackingSubtitle => 'യാത്രാ ഡാറ്റ ശേഖരണം താൽക്കാലികമായി നിർത്തുക';

  @override
  String get updateConsent => 'അനുമതി അപ്ഡേറ്റ് ചെയ്യുക';

  @override
  String get updateConsentSubtitle => 'ഡാറ്റാ ശേഖരണാനുമതി പരിശോധിക്കുക';

  @override
  String get dataCollectionConsent => 'ഡാറ്റാ ശേഖരണ അനുമതി';

  @override
  String get dataCollectionConsentDescription => 'നഗര പദ്ധതിയെ മെച്ചപ്പെടുത്താനും സുസ്ഥിര ഗതാഗതം പ്രോത്സാഹിപ്പിക്കാനും ഞങ്ങൾ അനാമിക യാത്രാ ഡാറ്റ ശേഖരിക്കുന്നു. നിങ്ങളുടെ ഡാറ്റ അാനനിമൈസ് ചെയ്യപ്പെട്ടതും സുരക്ഷിതവുമാണ്.';

  @override
  String get iUnderstand => 'എനിക്ക് മനസിലായി';

  @override
  String get deleteAccountSubtitle => 'നിങ്ങളുടെ അക്കൗണ്ടും എല്ലാ ഡാറ്റയും സ്ഥിരമായി നീക്കം ചെയ്യുക';

  @override
  String get openAdminDashboard => 'അഡ്മിൻ ഡാഷ്ബോർഡ് തുറക്കുക';

  @override
  String get tripHistory => 'യാത്രാ ചരിത്രം';

  @override
  String get noTrips => 'ഇതുവരെ യാത്രകൾ രേഖപ്പെടുത്തിയിട്ടില്ല';

  @override
  String get tripsWillAppearHere => 'നിങ്ങളുടെ യാത്രകൾ സ്വയമേവ ഇവിടെ പ്രത്യക്ഷപ്പെടും';

  @override
  String get tripDetails => 'യാത്ര വിശദാംശങ്ങൾ';

  @override
  String get startLocation => 'ആരംഭ സ്ഥലം';

  @override
  String get endLocation => 'അവസാന സ്ഥലം';

  @override
  String get transportMode => 'ഗതാഗത മാർഗം';

  @override
  String get route => 'റൂട്ട്';

  @override
  String get ongoing => 'നടന്ന് വരുന്നു';

  @override
  String get transportModeUpdated => 'ഗതാഗത മാർഗം അപ്ഡേറ്റ് ചെയ്‌തു';

  @override
  String get bicycle => 'സൈക്കിള്‍';

  @override
  String get train => 'ട്രെയിൻ';

  @override
  String get cityCenter => 'സിറ്റി സെന്റർ';

  @override
  String get downtown => 'ഡൗൺടൗൺ';

  @override
  String get suburbanArea => 'ഉപനഗര മേഖല';

  @override
  String get residentialArea => 'റസിഡൻഷ്യൽ മേഖല';

  @override
  String get recordTrip => 'യാത്ര രേഖപ്പെടുത്തുക';

  @override
  String get liveGPSTracking => 'ലൈവ് GPS ട്രാക്കിംഗ് സജീവമാണ്';

  @override
  String get simulatingTrip => 'യാത്ര രേഖപ്പെടുത്തുന്നത് സിമുലേറ്റ് ചെയ്യുന്നു...';

  @override
  String get startTrip => 'യാത്ര ആരംഭിക്കുക';

  @override
  String get stopTrip => 'യാത്ര നിർത്തുക';

  @override
  String get recordingTrip => 'നിങ്ങളുടെ യാത്ര രേഖപ്പെടുത്തുന്നു...';
}
