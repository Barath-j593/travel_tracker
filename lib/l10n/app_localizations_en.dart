// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Travel Tracker';

  @override
  String get appSubtitle => 'Track your journeys, earn eco-points';

  @override
  String get gpsConsentTitle => 'GPS Location Usage Consent';

  @override
  String get gpsConsentDescription => 'Travel Tracker uses your GPS location to enable trip tracking and family safety features. Your location data is securely stored using industry-standard encryption to protect your privacy. We are committed to safeguarding your information and will not share it without your consent.';

  @override
  String get gpsConsentCheckbox => 'I agree to allow Travel Tracker to use my GPS location for trip tracking and family safety features.';

  @override
  String get gpsConsentRequired => 'Please agree to GPS location usage to proceed.';

  @override
  String get ok => 'OK';

  @override
  String get loginFailed => 'Login failed. Please try again.';

  @override
  String get createAccount => 'Create Account';

  @override
  String get email => 'Email';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get aadhaarNumber => 'Aadhaar Number';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get enterEmail => 'Please enter your email';

  @override
  String get invalidEmail => 'Please enter a valid email';

  @override
  String get enterPhone => 'Please enter a phone number';

  @override
  String get invalidPhone => 'Please enter a valid phone number';

  @override
  String get enterAadhaar => 'Please enter your Aadhaar number';

  @override
  String get invalidAadhaar => 'Aadhaar must be 12 digits';

  @override
  String get enterPassword => 'Please enter a password';

  @override
  String get passwordLength => 'Password must be at least 6 characters';

  @override
  String get confirmPasswordText => 'Please confirm your password';

  @override
  String get passwordMismatch => 'Passwords do not match';

  @override
  String get registrationSuccess => 'Registration successful! Please login.';

  @override
  String get alreadyHaveAccount => 'Already have an account? Login';

  @override
  String get register => 'Register';

  @override
  String get login => 'Login';

  @override
  String get demoCredentials => 'Demo Credentials:';

  @override
  String get admin => 'Admin';

  @override
  String get adminDashboard => 'Admin Dashboard';

  @override
  String get searchPlace => 'Search for a place...';

  @override
  String statisticsFor(Object place) {
    return 'Statistics for: $place';
  }

  @override
  String get totalUsers => 'Total Users';

  @override
  String get totalTrips => 'Total Trips';

  @override
  String get avgTripsUser => 'Avg. Trips/User';

  @override
  String get activeToday => 'Active Today';

  @override
  String transportModeShare(Object place) {
    return 'Transport Mode Share - $place';
  }

  @override
  String weeklyTripCount(Object place) {
    return 'Weekly Trip Count - $place';
  }

  @override
  String get usersByPlace => 'Users by Place';

  @override
  String tripsPoints(Object points, Object trips) {
    return '$trips trips • $points points';
  }

  @override
  String get autoTripDetection => 'Automatic Trip Detection';

  @override
  String get detectionActive => 'AUTOMATIC DETECTION ACTIVE';

  @override
  String get detectionPaused => 'DETECTION PAUSED';

  @override
  String get monitoringMovements => 'Monitoring your movements...';

  @override
  String get detectionPausedText => 'Detection paused';

  @override
  String get tripInProgress => 'TRIP IN PROGRESS';

  @override
  String get duration => 'Duration';

  @override
  String get distance => 'Distance';

  @override
  String get mode => 'Mode';

  @override
  String get detectedAutomatically => 'Detected automatically based on your movement patterns';

  @override
  String get tripDetectionActive => 'Trip Detection Active';

  @override
  String get monitoringMovement => 'Monitoring Movement';

  @override
  String get trackingJourney => 'Tracking your journey automatically';

  @override
  String get waitingMovement => 'Waiting for significant movement...';

  @override
  String get endTripNow => 'End Trip Now';

  @override
  String get howDetectionWorks => 'How automatic detection works:';

  @override
  String get howDetectionPoints => '• Detects movement patterns using GPS and sensors\n• Automatically identifies transport mode\n• Starts tracking when significant movement is detected\n• Respects privacy settings and battery optimization';

  @override
  String get tripCompleted => 'Trip Completed';

  @override
  String get autoTripDetectionTitle => 'Automatic Trip Detection';

  @override
  String get detectionInfo => 'How automatic detection works:';

  @override
  String get travelCompanions => 'Travel Companions';

  @override
  String get addNewCompanion => 'Add New Companion';

  @override
  String get name => 'Name';

  @override
  String get enterName => 'Please enter a name';

  @override
  String get addCompanion => 'Add Companion';

  @override
  String get yourCompanions => 'Your Companions';

  @override
  String get noCompanions => 'No companions added yet';

  @override
  String get companionAdded => 'Companion added successfully';

  @override
  String get companionRemoved => 'Companion removed';

  @override
  String get ecoPointsTitle => 'Eco Points & Rewards';

  @override
  String get pointsTab => 'Points';

  @override
  String get rewardsTab => 'Rewards';

  @override
  String get totalEcoPoints => 'TOTAL ECO POINTS';

  @override
  String pointsToNextLevel(Object points) {
    return '$points points to next level';
  }

  @override
  String levelLabel(Object level) {
    return 'Level $level • Eco Warrior';
  }

  @override
  String get achievementsBadges => 'ACHIEVEMENTS & BADGES';

  @override
  String get availableRewards => 'Available Rewards';

  @override
  String rewardsCount(Object count) {
    return '$count rewards';
  }

  @override
  String get redeemedRewards => 'Redeemed Rewards';

  @override
  String itemsCount(Object count) {
    return '$count items';
  }

  @override
  String get noRedeemedRewards => 'No redeemed rewards yet';

  @override
  String get redeem => 'Redeem';

  @override
  String needMorePoints(Object points) {
    return 'Need $points more';
  }

  @override
  String get redeemRewardTitle => 'Redeem Reward?';

  @override
  String redeemRewardDescription(Object points, Object rewardName) {
    return 'Redeem $rewardName for $points eco points?';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get redeemConfirm => 'Redeem';

  @override
  String redeemSuccess(Object rewardName) {
    return '$rewardName redeemed successfully!';
  }

  @override
  String get ecoStarter => 'Eco Starter';

  @override
  String get busCommuter => 'Bus Commuter';

  @override
  String get bikeEnthusiast => 'Bike Enthusiast';

  @override
  String get weeklyGoal => 'Weekly Goal';

  @override
  String get monthlyGoal => 'Monthly Goal';

  @override
  String get carbonSaver => 'Carbon Saver';

  @override
  String get familyLocationTitle => 'Family Location';

  @override
  String get locationsUpdated => 'Locations updated';

  @override
  String get familySafetyTitle => 'Family Safety';

  @override
  String get familySafetySubtitle => 'Real-time location sharing with consent';

  @override
  String get familyMapViewTitle => 'Family Map View';

  @override
  String familyMapViewSubtitle(Object memberCount) {
    return '$memberCount family members visible';
  }

  @override
  String get familyMembersHeader => 'FAMILY MEMBERS';

  @override
  String get onlineLabel => 'Online';

  @override
  String get offlineLabel => 'Offline';

  @override
  String get relationWife => 'Wife';

  @override
  String get relationSon => 'Son';

  @override
  String get relationDaughter => 'Daughter';

  @override
  String get relationFather => 'Father';

  @override
  String get travelTrackerTitle => 'Travel Tracker';

  @override
  String get dashboardLabel => 'DASHBOARD';

  @override
  String get welcomeSubtitle => 'Automatic trip detection • Eco points • Family safety';

  @override
  String get menuAutoTripDetection => 'Auto Trip Detection';

  @override
  String get menuTripHistory => 'Trip History';

  @override
  String get menuEcoPoints => 'Eco Points';

  @override
  String get menuFamilyLocation => 'Family Location';

  @override
  String get menuCompanions => 'Companions';

  @override
  String get menuMonthlySummary => 'Monthly Summary';

  @override
  String get menuAdminDashboard => 'Admin Dashboard';

  @override
  String get profileTooltip => 'Profile';

  @override
  String get monthlySummaryTitle => 'Monthly Summary';

  @override
  String get distanceByTransportMode => 'Distance by Transport Mode';

  @override
  String get co2Saved => 'CO2 Saved (kg)';

  @override
  String get monthlyStats => 'Monthly Stats';

  @override
  String get totalDistance => 'Total Distance';

  @override
  String get co2SavedStat => 'CO2 Saved';

  @override
  String get tripsTaken => 'Trips Taken';

  @override
  String get ecoPoints => 'Eco Points';

  @override
  String get car => 'Car';

  @override
  String get bus => 'Bus';

  @override
  String get bike => 'Bike';

  @override
  String get walk => 'Walk';

  @override
  String get jan => 'Jan';

  @override
  String get feb => 'Feb';

  @override
  String get mar => 'Mar';

  @override
  String get apr => 'Apr';

  @override
  String get may => 'May';

  @override
  String get jun => 'Jun';

  @override
  String get profile => 'Profile';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirmation => 'Are you sure you want to logout?';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get deleteAccountConfirmation => 'This action cannot be undone. All your data will be permanently deleted.';

  @override
  String get delete => 'Delete';

  @override
  String get user => 'User';

  @override
  String get travelStatistics => 'Travel Statistics';

  @override
  String get frequentMode => 'Frequent Mode';

  @override
  String get privacySettings => 'Privacy Settings';

  @override
  String get pauseTracking => 'Pause Tracking';

  @override
  String get pauseTrackingSubtitle => 'Temporarily stop collecting travel data';

  @override
  String get updateConsent => 'Update Consent';

  @override
  String get updateConsentSubtitle => 'Review and update data collection consent';

  @override
  String get dataCollectionConsent => 'Data Collection Consent';

  @override
  String get dataCollectionConsentDescription => 'We collect anonymous travel data to improve urban planning and promote sustainable transportation. Your data is anonymized and secure.';

  @override
  String get iUnderstand => 'I Understand';

  @override
  String get deleteAccountSubtitle => 'Permanently delete your account and all data';

  @override
  String get openAdminDashboard => 'Open Admin Dashboard';

  @override
  String get tripHistory => 'Trip History';

  @override
  String get noTrips => 'No trips recorded yet';

  @override
  String get tripsWillAppearHere => 'Your trips will appear here automatically';

  @override
  String get tripDetails => 'Trip Details';

  @override
  String get startLocation => 'Start Location';

  @override
  String get endLocation => 'End Location';

  @override
  String get transportMode => 'Transport Mode';

  @override
  String get route => 'Route';

  @override
  String get ongoing => 'Ongoing';

  @override
  String get transportModeUpdated => 'Transport mode updated to';

  @override
  String get bicycle => 'Bicycle';

  @override
  String get train => 'Train';

  @override
  String get cityCenter => 'City Center';

  @override
  String get downtown => 'Downtown';

  @override
  String get suburbanArea => 'Suburban Area';

  @override
  String get residentialArea => 'Residential Area';

  @override
  String get recordTrip => 'Record Trip';

  @override
  String get liveGPSTracking => 'Live GPS Tracking Active';

  @override
  String get simulatingTrip => 'Simulating trip recording...';

  @override
  String get startTrip => 'Start Trip';

  @override
  String get stopTrip => 'Stop Trip';

  @override
  String get recordingTrip => 'Recording your trip...';
}
