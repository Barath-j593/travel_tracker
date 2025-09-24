import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ml.dart';

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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ml')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Travel Tracker'**
  String get appTitle;

  /// No description provided for @appSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track your journeys, earn eco-points'**
  String get appSubtitle;

  /// No description provided for @gpsConsentTitle.
  ///
  /// In en, this message translates to:
  /// **'GPS Location Usage Consent'**
  String get gpsConsentTitle;

  /// No description provided for @gpsConsentDescription.
  ///
  /// In en, this message translates to:
  /// **'Travel Tracker uses your GPS location to enable trip tracking and family safety features. Your location data is securely stored using industry-standard encryption to protect your privacy. We are committed to safeguarding your information and will not share it without your consent.'**
  String get gpsConsentDescription;

  /// No description provided for @gpsConsentCheckbox.
  ///
  /// In en, this message translates to:
  /// **'I agree to allow Travel Tracker to use my GPS location for trip tracking and family safety features.'**
  String get gpsConsentCheckbox;

  /// No description provided for @gpsConsentRequired.
  ///
  /// In en, this message translates to:
  /// **'Please agree to GPS location usage to proceed.'**
  String get gpsConsentRequired;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please try again.'**
  String get loginFailed;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @aadhaarNumber.
  ///
  /// In en, this message translates to:
  /// **'Aadhaar Number'**
  String get aadhaarNumber;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get enterEmail;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get invalidEmail;

  /// No description provided for @enterPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a phone number'**
  String get enterPhone;

  /// No description provided for @invalidPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get invalidPhone;

  /// No description provided for @enterAadhaar.
  ///
  /// In en, this message translates to:
  /// **'Please enter your Aadhaar number'**
  String get enterAadhaar;

  /// No description provided for @invalidAadhaar.
  ///
  /// In en, this message translates to:
  /// **'Aadhaar must be 12 digits'**
  String get invalidAadhaar;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get enterPassword;

  /// No description provided for @passwordLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordLength;

  /// No description provided for @confirmPasswordText.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get confirmPasswordText;

  /// No description provided for @passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordMismatch;

  /// No description provided for @registrationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Registration successful! Please login.'**
  String get registrationSuccess;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Login'**
  String get alreadyHaveAccount;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @demoCredentials.
  ///
  /// In en, this message translates to:
  /// **'Demo Credentials:'**
  String get demoCredentials;

  /// No description provided for @admin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get admin;

  /// No description provided for @adminDashboard.
  ///
  /// In en, this message translates to:
  /// **'Admin Dashboard'**
  String get adminDashboard;

  /// No description provided for @searchPlace.
  ///
  /// In en, this message translates to:
  /// **'Search for a place...'**
  String get searchPlace;

  /// No description provided for @statisticsFor.
  ///
  /// In en, this message translates to:
  /// **'Statistics for: {place}'**
  String statisticsFor(Object place);

  /// No description provided for @totalUsers.
  ///
  /// In en, this message translates to:
  /// **'Total Users'**
  String get totalUsers;

  /// No description provided for @totalTrips.
  ///
  /// In en, this message translates to:
  /// **'Total Trips'**
  String get totalTrips;

  /// No description provided for @avgTripsUser.
  ///
  /// In en, this message translates to:
  /// **'Avg. Trips/User'**
  String get avgTripsUser;

  /// No description provided for @activeToday.
  ///
  /// In en, this message translates to:
  /// **'Active Today'**
  String get activeToday;

  /// No description provided for @transportModeShare.
  ///
  /// In en, this message translates to:
  /// **'Transport Mode Share - {place}'**
  String transportModeShare(Object place);

  /// No description provided for @weeklyTripCount.
  ///
  /// In en, this message translates to:
  /// **'Weekly Trip Count - {place}'**
  String weeklyTripCount(Object place);

  /// No description provided for @usersByPlace.
  ///
  /// In en, this message translates to:
  /// **'Users by Place'**
  String get usersByPlace;

  /// No description provided for @tripsPoints.
  ///
  /// In en, this message translates to:
  /// **'{trips} trips • {points} points'**
  String tripsPoints(Object points, Object trips);

  /// No description provided for @autoTripDetection.
  ///
  /// In en, this message translates to:
  /// **'Automatic Trip Detection'**
  String get autoTripDetection;

  /// No description provided for @detectionActive.
  ///
  /// In en, this message translates to:
  /// **'AUTOMATIC DETECTION ACTIVE'**
  String get detectionActive;

  /// No description provided for @detectionPaused.
  ///
  /// In en, this message translates to:
  /// **'DETECTION PAUSED'**
  String get detectionPaused;

  /// No description provided for @monitoringMovements.
  ///
  /// In en, this message translates to:
  /// **'Monitoring your movements...'**
  String get monitoringMovements;

  /// No description provided for @detectionPausedText.
  ///
  /// In en, this message translates to:
  /// **'Detection paused'**
  String get detectionPausedText;

  /// No description provided for @tripInProgress.
  ///
  /// In en, this message translates to:
  /// **'TRIP IN PROGRESS'**
  String get tripInProgress;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @distance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get distance;

  /// No description provided for @mode.
  ///
  /// In en, this message translates to:
  /// **'Mode'**
  String get mode;

  /// No description provided for @detectedAutomatically.
  ///
  /// In en, this message translates to:
  /// **'Detected automatically based on your movement patterns'**
  String get detectedAutomatically;

  /// No description provided for @tripDetectionActive.
  ///
  /// In en, this message translates to:
  /// **'Trip Detection Active'**
  String get tripDetectionActive;

  /// No description provided for @monitoringMovement.
  ///
  /// In en, this message translates to:
  /// **'Monitoring Movement'**
  String get monitoringMovement;

  /// No description provided for @trackingJourney.
  ///
  /// In en, this message translates to:
  /// **'Tracking your journey automatically'**
  String get trackingJourney;

  /// No description provided for @waitingMovement.
  ///
  /// In en, this message translates to:
  /// **'Waiting for significant movement...'**
  String get waitingMovement;

  /// No description provided for @endTripNow.
  ///
  /// In en, this message translates to:
  /// **'End Trip Now'**
  String get endTripNow;

  /// No description provided for @howDetectionWorks.
  ///
  /// In en, this message translates to:
  /// **'How automatic detection works:'**
  String get howDetectionWorks;

  /// No description provided for @howDetectionPoints.
  ///
  /// In en, this message translates to:
  /// **'• Detects movement patterns using GPS and sensors\n• Automatically identifies transport mode\n• Starts tracking when significant movement is detected\n• Respects privacy settings and battery optimization'**
  String get howDetectionPoints;

  /// No description provided for @tripCompleted.
  ///
  /// In en, this message translates to:
  /// **'Trip Completed'**
  String get tripCompleted;

  /// Title for the automatic trip detection screen
  ///
  /// In en, this message translates to:
  /// **'Automatic Trip Detection'**
  String get autoTripDetectionTitle;

  /// Section heading for automatic detection explanation
  ///
  /// In en, this message translates to:
  /// **'How automatic detection works:'**
  String get detectionInfo;

  /// No description provided for @travelCompanions.
  ///
  /// In en, this message translates to:
  /// **'Travel Companions'**
  String get travelCompanions;

  /// No description provided for @addNewCompanion.
  ///
  /// In en, this message translates to:
  /// **'Add New Companion'**
  String get addNewCompanion;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter a name'**
  String get enterName;

  /// No description provided for @addCompanion.
  ///
  /// In en, this message translates to:
  /// **'Add Companion'**
  String get addCompanion;

  /// No description provided for @yourCompanions.
  ///
  /// In en, this message translates to:
  /// **'Your Companions'**
  String get yourCompanions;

  /// No description provided for @noCompanions.
  ///
  /// In en, this message translates to:
  /// **'No companions added yet'**
  String get noCompanions;

  /// No description provided for @companionAdded.
  ///
  /// In en, this message translates to:
  /// **'Companion added successfully'**
  String get companionAdded;

  /// No description provided for @companionRemoved.
  ///
  /// In en, this message translates to:
  /// **'Companion removed'**
  String get companionRemoved;

  /// No description provided for @ecoPointsTitle.
  ///
  /// In en, this message translates to:
  /// **'Eco Points & Rewards'**
  String get ecoPointsTitle;

  /// No description provided for @pointsTab.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get pointsTab;

  /// No description provided for @rewardsTab.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get rewardsTab;

  /// No description provided for @totalEcoPoints.
  ///
  /// In en, this message translates to:
  /// **'TOTAL ECO POINTS'**
  String get totalEcoPoints;

  /// No description provided for @pointsToNextLevel.
  ///
  /// In en, this message translates to:
  /// **'{points} points to next level'**
  String pointsToNextLevel(Object points);

  /// No description provided for @levelLabel.
  ///
  /// In en, this message translates to:
  /// **'Level {level} • Eco Warrior'**
  String levelLabel(Object level);

  /// No description provided for @achievementsBadges.
  ///
  /// In en, this message translates to:
  /// **'ACHIEVEMENTS & BADGES'**
  String get achievementsBadges;

  /// No description provided for @availableRewards.
  ///
  /// In en, this message translates to:
  /// **'Available Rewards'**
  String get availableRewards;

  /// No description provided for @rewardsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} rewards'**
  String rewardsCount(Object count);

  /// No description provided for @redeemedRewards.
  ///
  /// In en, this message translates to:
  /// **'Redeemed Rewards'**
  String get redeemedRewards;

  /// No description provided for @itemsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String itemsCount(Object count);

  /// No description provided for @noRedeemedRewards.
  ///
  /// In en, this message translates to:
  /// **'No redeemed rewards yet'**
  String get noRedeemedRewards;

  /// No description provided for @redeem.
  ///
  /// In en, this message translates to:
  /// **'Redeem'**
  String get redeem;

  /// No description provided for @needMorePoints.
  ///
  /// In en, this message translates to:
  /// **'Need {points} more'**
  String needMorePoints(Object points);

  /// No description provided for @redeemRewardTitle.
  ///
  /// In en, this message translates to:
  /// **'Redeem Reward?'**
  String get redeemRewardTitle;

  /// No description provided for @redeemRewardDescription.
  ///
  /// In en, this message translates to:
  /// **'Redeem {rewardName} for {points} eco points?'**
  String redeemRewardDescription(Object points, Object rewardName);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @redeemConfirm.
  ///
  /// In en, this message translates to:
  /// **'Redeem'**
  String get redeemConfirm;

  /// No description provided for @redeemSuccess.
  ///
  /// In en, this message translates to:
  /// **'{rewardName} redeemed successfully!'**
  String redeemSuccess(Object rewardName);

  /// No description provided for @ecoStarter.
  ///
  /// In en, this message translates to:
  /// **'Eco Starter'**
  String get ecoStarter;

  /// No description provided for @busCommuter.
  ///
  /// In en, this message translates to:
  /// **'Bus Commuter'**
  String get busCommuter;

  /// No description provided for @bikeEnthusiast.
  ///
  /// In en, this message translates to:
  /// **'Bike Enthusiast'**
  String get bikeEnthusiast;

  /// No description provided for @weeklyGoal.
  ///
  /// In en, this message translates to:
  /// **'Weekly Goal'**
  String get weeklyGoal;

  /// No description provided for @monthlyGoal.
  ///
  /// In en, this message translates to:
  /// **'Monthly Goal'**
  String get monthlyGoal;

  /// No description provided for @carbonSaver.
  ///
  /// In en, this message translates to:
  /// **'Carbon Saver'**
  String get carbonSaver;

  /// No description provided for @familyLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Family Location'**
  String get familyLocationTitle;

  /// No description provided for @locationsUpdated.
  ///
  /// In en, this message translates to:
  /// **'Locations updated'**
  String get locationsUpdated;

  /// No description provided for @familySafetyTitle.
  ///
  /// In en, this message translates to:
  /// **'Family Safety'**
  String get familySafetyTitle;

  /// No description provided for @familySafetySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Real-time location sharing with consent'**
  String get familySafetySubtitle;

  /// No description provided for @familyMapViewTitle.
  ///
  /// In en, this message translates to:
  /// **'Family Map View'**
  String get familyMapViewTitle;

  /// No description provided for @familyMapViewSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{memberCount} family members visible'**
  String familyMapViewSubtitle(Object memberCount);

  /// No description provided for @familyMembersHeader.
  ///
  /// In en, this message translates to:
  /// **'FAMILY MEMBERS'**
  String get familyMembersHeader;

  /// No description provided for @onlineLabel.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get onlineLabel;

  /// No description provided for @offlineLabel.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offlineLabel;

  /// No description provided for @relationWife.
  ///
  /// In en, this message translates to:
  /// **'Wife'**
  String get relationWife;

  /// No description provided for @relationSon.
  ///
  /// In en, this message translates to:
  /// **'Son'**
  String get relationSon;

  /// No description provided for @relationDaughter.
  ///
  /// In en, this message translates to:
  /// **'Daughter'**
  String get relationDaughter;

  /// No description provided for @relationFather.
  ///
  /// In en, this message translates to:
  /// **'Father'**
  String get relationFather;

  /// No description provided for @travelTrackerTitle.
  ///
  /// In en, this message translates to:
  /// **'Travel Tracker'**
  String get travelTrackerTitle;

  /// No description provided for @dashboardLabel.
  ///
  /// In en, this message translates to:
  /// **'DASHBOARD'**
  String get dashboardLabel;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Automatic trip detection • Eco points • Family safety'**
  String get welcomeSubtitle;

  /// No description provided for @menuAutoTripDetection.
  ///
  /// In en, this message translates to:
  /// **'Auto Trip Detection'**
  String get menuAutoTripDetection;

  /// No description provided for @menuTripHistory.
  ///
  /// In en, this message translates to:
  /// **'Trip History'**
  String get menuTripHistory;

  /// No description provided for @menuEcoPoints.
  ///
  /// In en, this message translates to:
  /// **'Eco Points'**
  String get menuEcoPoints;

  /// No description provided for @menuFamilyLocation.
  ///
  /// In en, this message translates to:
  /// **'Family Location'**
  String get menuFamilyLocation;

  /// No description provided for @menuCompanions.
  ///
  /// In en, this message translates to:
  /// **'Companions'**
  String get menuCompanions;

  /// No description provided for @menuMonthlySummary.
  ///
  /// In en, this message translates to:
  /// **'Monthly Summary'**
  String get menuMonthlySummary;

  /// No description provided for @menuAdminDashboard.
  ///
  /// In en, this message translates to:
  /// **'Admin Dashboard'**
  String get menuAdminDashboard;

  /// No description provided for @profileTooltip.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTooltip;

  /// No description provided for @monthlySummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Monthly Summary'**
  String get monthlySummaryTitle;

  /// No description provided for @distanceByTransportMode.
  ///
  /// In en, this message translates to:
  /// **'Distance by Transport Mode'**
  String get distanceByTransportMode;

  /// No description provided for @co2Saved.
  ///
  /// In en, this message translates to:
  /// **'CO2 Saved (kg)'**
  String get co2Saved;

  /// No description provided for @monthlyStats.
  ///
  /// In en, this message translates to:
  /// **'Monthly Stats'**
  String get monthlyStats;

  /// No description provided for @totalDistance.
  ///
  /// In en, this message translates to:
  /// **'Total Distance'**
  String get totalDistance;

  /// No description provided for @co2SavedStat.
  ///
  /// In en, this message translates to:
  /// **'CO2 Saved'**
  String get co2SavedStat;

  /// No description provided for @tripsTaken.
  ///
  /// In en, this message translates to:
  /// **'Trips Taken'**
  String get tripsTaken;

  /// No description provided for @ecoPoints.
  ///
  /// In en, this message translates to:
  /// **'Eco Points'**
  String get ecoPoints;

  /// No description provided for @car.
  ///
  /// In en, this message translates to:
  /// **'Car'**
  String get car;

  /// No description provided for @bus.
  ///
  /// In en, this message translates to:
  /// **'Bus'**
  String get bus;

  /// No description provided for @bike.
  ///
  /// In en, this message translates to:
  /// **'Bike'**
  String get bike;

  /// No description provided for @walk.
  ///
  /// In en, this message translates to:
  /// **'Walk'**
  String get walk;

  /// No description provided for @jan.
  ///
  /// In en, this message translates to:
  /// **'Jan'**
  String get jan;

  /// No description provided for @feb.
  ///
  /// In en, this message translates to:
  /// **'Feb'**
  String get feb;

  /// No description provided for @mar.
  ///
  /// In en, this message translates to:
  /// **'Mar'**
  String get mar;

  /// No description provided for @apr.
  ///
  /// In en, this message translates to:
  /// **'Apr'**
  String get apr;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @jun.
  ///
  /// In en, this message translates to:
  /// **'Jun'**
  String get jun;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirmation;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @deleteAccountConfirmation.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone. All your data will be permanently deleted.'**
  String get deleteAccountConfirmation;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @travelStatistics.
  ///
  /// In en, this message translates to:
  /// **'Travel Statistics'**
  String get travelStatistics;

  /// No description provided for @frequentMode.
  ///
  /// In en, this message translates to:
  /// **'Frequent Mode'**
  String get frequentMode;

  /// No description provided for @privacySettings.
  ///
  /// In en, this message translates to:
  /// **'Privacy Settings'**
  String get privacySettings;

  /// No description provided for @pauseTracking.
  ///
  /// In en, this message translates to:
  /// **'Pause Tracking'**
  String get pauseTracking;

  /// No description provided for @pauseTrackingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Temporarily stop collecting travel data'**
  String get pauseTrackingSubtitle;

  /// No description provided for @updateConsent.
  ///
  /// In en, this message translates to:
  /// **'Update Consent'**
  String get updateConsent;

  /// No description provided for @updateConsentSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Review and update data collection consent'**
  String get updateConsentSubtitle;

  /// No description provided for @dataCollectionConsent.
  ///
  /// In en, this message translates to:
  /// **'Data Collection Consent'**
  String get dataCollectionConsent;

  /// No description provided for @dataCollectionConsentDescription.
  ///
  /// In en, this message translates to:
  /// **'We collect anonymous travel data to improve urban planning and promote sustainable transportation. Your data is anonymized and secure.'**
  String get dataCollectionConsentDescription;

  /// No description provided for @iUnderstand.
  ///
  /// In en, this message translates to:
  /// **'I Understand'**
  String get iUnderstand;

  /// No description provided for @deleteAccountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Permanently delete your account and all data'**
  String get deleteAccountSubtitle;

  /// No description provided for @openAdminDashboard.
  ///
  /// In en, this message translates to:
  /// **'Open Admin Dashboard'**
  String get openAdminDashboard;

  /// No description provided for @tripHistory.
  ///
  /// In en, this message translates to:
  /// **'Trip History'**
  String get tripHistory;

  /// No description provided for @noTrips.
  ///
  /// In en, this message translates to:
  /// **'No trips recorded yet'**
  String get noTrips;

  /// No description provided for @tripsWillAppearHere.
  ///
  /// In en, this message translates to:
  /// **'Your trips will appear here automatically'**
  String get tripsWillAppearHere;

  /// No description provided for @tripDetails.
  ///
  /// In en, this message translates to:
  /// **'Trip Details'**
  String get tripDetails;

  /// No description provided for @startLocation.
  ///
  /// In en, this message translates to:
  /// **'Start Location'**
  String get startLocation;

  /// No description provided for @endLocation.
  ///
  /// In en, this message translates to:
  /// **'End Location'**
  String get endLocation;

  /// No description provided for @transportMode.
  ///
  /// In en, this message translates to:
  /// **'Transport Mode'**
  String get transportMode;

  /// No description provided for @route.
  ///
  /// In en, this message translates to:
  /// **'Route'**
  String get route;

  /// No description provided for @ongoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get ongoing;

  /// No description provided for @transportModeUpdated.
  ///
  /// In en, this message translates to:
  /// **'Transport mode updated to'**
  String get transportModeUpdated;

  /// No description provided for @bicycle.
  ///
  /// In en, this message translates to:
  /// **'Bicycle'**
  String get bicycle;

  /// No description provided for @train.
  ///
  /// In en, this message translates to:
  /// **'Train'**
  String get train;

  /// No description provided for @cityCenter.
  ///
  /// In en, this message translates to:
  /// **'City Center'**
  String get cityCenter;

  /// No description provided for @downtown.
  ///
  /// In en, this message translates to:
  /// **'Downtown'**
  String get downtown;

  /// No description provided for @suburbanArea.
  ///
  /// In en, this message translates to:
  /// **'Suburban Area'**
  String get suburbanArea;

  /// No description provided for @residentialArea.
  ///
  /// In en, this message translates to:
  /// **'Residential Area'**
  String get residentialArea;

  /// No description provided for @recordTrip.
  ///
  /// In en, this message translates to:
  /// **'Record Trip'**
  String get recordTrip;

  /// No description provided for @liveGPSTracking.
  ///
  /// In en, this message translates to:
  /// **'Live GPS Tracking Active'**
  String get liveGPSTracking;

  /// No description provided for @simulatingTrip.
  ///
  /// In en, this message translates to:
  /// **'Simulating trip recording...'**
  String get simulatingTrip;

  /// No description provided for @startTrip.
  ///
  /// In en, this message translates to:
  /// **'Start Trip'**
  String get startTrip;

  /// No description provided for @stopTrip.
  ///
  /// In en, this message translates to:
  /// **'Stop Trip'**
  String get stopTrip;

  /// No description provided for @recordingTrip.
  ///
  /// In en, this message translates to:
  /// **'Recording your trip...'**
  String get recordingTrip;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ml'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ml': return AppLocalizationsMl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
