import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
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
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Kasir Baik'**
  String get appName;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'POS'**
  String get appTitle;

  /// No description provided for @appSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Point of Sale System'**
  String get appSubtitle;

  /// No description provided for @common_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get common_save;

  /// No description provided for @common_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get common_cancel;

  /// No description provided for @common_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get common_continue;

  /// No description provided for @common_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get common_delete;

  /// No description provided for @common_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get common_edit;

  /// No description provided for @common_add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get common_add;

  /// No description provided for @common_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get common_close;

  /// No description provided for @common_contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get common_contactUs;

  /// No description provided for @common_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get common_confirm;

  /// No description provided for @common_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get common_yes;

  /// No description provided for @common_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get common_no;

  /// No description provided for @common_ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get common_ok;

  /// No description provided for @common_done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get common_done;

  /// No description provided for @common_apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get common_apply;

  /// No description provided for @common_reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get common_reset;

  /// No description provided for @common_search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get common_search;

  /// No description provided for @common_filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get common_filter;

  /// No description provided for @common_sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get common_sort;

  /// No description provided for @common_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get common_all;

  /// No description provided for @common_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get common_loading;

  /// No description provided for @common_error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get common_error;

  /// No description provided for @common_success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get common_success;

  /// No description provided for @common_warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get common_warning;

  /// No description provided for @common_info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get common_info;

  /// No description provided for @common_share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get common_share;

  /// No description provided for @common_back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get common_back;

  /// No description provided for @common_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get common_next;

  /// No description provided for @common_previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get common_previous;

  /// No description provided for @common_select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get common_select;

  /// No description provided for @common_permission.
  ///
  /// In en, this message translates to:
  /// **'Permission Required'**
  String get common_permission;

  /// No description provided for @common_openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get common_openSettings;

  /// No description provided for @common_later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get common_later;

  /// No description provided for @common_today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get common_today;

  /// No description provided for @common_yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get common_yesterday;

  /// No description provided for @common_thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get common_thisWeek;

  /// No description provided for @common_lastWeek.
  ///
  /// In en, this message translates to:
  /// **'Last Week'**
  String get common_lastWeek;

  /// No description provided for @common_thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get common_thisMonth;

  /// No description provided for @common_lastMonth.
  ///
  /// In en, this message translates to:
  /// **'Last Month'**
  String get common_lastMonth;

  /// No description provided for @common_customRange.
  ///
  /// In en, this message translates to:
  /// **'Custom Range'**
  String get common_customRange;

  /// No description provided for @common_custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get common_custom;

  /// No description provided for @common_selectCustomRange.
  ///
  /// In en, this message translates to:
  /// **'Select custom date range'**
  String get common_selectCustomRange;

  /// No description provided for @common_dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get common_dateRange;

  /// No description provided for @common_noData.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get common_noData;

  /// No description provided for @common_unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get common_unknown;

  /// No description provided for @common_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get common_active;

  /// No description provided for @common_inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get common_inactive;

  /// No description provided for @common_confirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this item?'**
  String get common_confirmDelete;

  /// No description provided for @common_copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get common_copy;

  /// No description provided for @common_retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get common_retry;

  /// No description provided for @common_refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get common_refresh;

  /// No description provided for @common_download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get common_download;

  /// No description provided for @common_print.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get common_print;

  /// No description provided for @common_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview'**
  String get common_printPreview;

  /// No description provided for @common_thermalPrint.
  ///
  /// In en, this message translates to:
  /// **'Thermal Print'**
  String get common_thermalPrint;

  /// No description provided for @common_pdfPrint.
  ///
  /// In en, this message translates to:
  /// **'PDF Print'**
  String get common_pdfPrint;

  /// No description provided for @common_orders.
  ///
  /// In en, this message translates to:
  /// **'orders'**
  String get common_orders;

  /// No description provided for @common_printSuccess.
  ///
  /// In en, this message translates to:
  /// **'Print successful'**
  String get common_printSuccess;

  /// No description provided for @common_printFailed.
  ///
  /// In en, this message translates to:
  /// **'Print failed'**
  String get common_printFailed;

  /// No description provided for @common_generatedOn.
  ///
  /// In en, this message translates to:
  /// **'Generated on'**
  String get common_generatedOn;

  /// No description provided for @common_applyFilter.
  ///
  /// In en, this message translates to:
  /// **'Apply Filter'**
  String get common_applyFilter;

  /// No description provided for @common_deleting.
  ///
  /// In en, this message translates to:
  /// **'Deleting...'**
  String get common_deleting;

  /// No description provided for @common_deletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Deleted successfully'**
  String get common_deletedSuccessfully;

  /// No description provided for @common_filterAndSort.
  ///
  /// In en, this message translates to:
  /// **'Filter & Sort'**
  String get common_filterAndSort;

  /// No description provided for @common_sortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get common_sortBy;

  /// No description provided for @common_payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get common_payment;

  /// No description provided for @common_processing.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get common_processing;

  /// No description provided for @common_saved.
  ///
  /// In en, this message translates to:
  /// **'Saved successfully'**
  String get common_saved;

  /// No description provided for @common_nameAsc.
  ///
  /// In en, this message translates to:
  /// **'Name A-Z'**
  String get common_nameAsc;

  /// No description provided for @common_nameDesc.
  ///
  /// In en, this message translates to:
  /// **'Name Z-A'**
  String get common_nameDesc;

  /// No description provided for @common_stock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get common_stock;

  /// No description provided for @common_quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get common_quantity;

  /// No description provided for @common_price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get common_price;

  /// No description provided for @common_max.
  ///
  /// In en, this message translates to:
  /// **'Max'**
  String get common_max;

  /// No description provided for @common_min.
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get common_min;

  /// No description provided for @common_range.
  ///
  /// In en, this message translates to:
  /// **'Range'**
  String get common_range;

  /// No description provided for @common_enterValidNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number'**
  String get common_enterValidNumber;

  /// No description provided for @common_maxValueExceeded.
  ///
  /// In en, this message translates to:
  /// **'Value cannot exceed {max}'**
  String common_maxValueExceeded(String max);

  /// No description provided for @common_minValueRequired.
  ///
  /// In en, this message translates to:
  /// **'Value must be at least {min}'**
  String common_minValueRequired(String min);

  /// No description provided for @common_searchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get common_searchProducts;

  /// No description provided for @common_noProductsFound.
  ///
  /// In en, this message translates to:
  /// **'No products found'**
  String get common_noProductsFound;

  /// No description provided for @common_selectSortHint.
  ///
  /// In en, this message translates to:
  /// **'Select sort...'**
  String get common_selectSortHint;

  /// No description provided for @common_searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get common_searchHint;

  /// No description provided for @common_noName.
  ///
  /// In en, this message translates to:
  /// **'No Name'**
  String get common_noName;

  /// No description provided for @common_viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get common_viewAll;

  /// No description provided for @common_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get common_total;

  /// No description provided for @common_totalOrders.
  ///
  /// In en, this message translates to:
  /// **'Total Orders'**
  String get common_totalOrders;

  /// No description provided for @common_product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get common_product;

  /// No description provided for @common_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get common_type;

  /// No description provided for @common_qty.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get common_qty;

  /// No description provided for @common_units.
  ///
  /// In en, this message translates to:
  /// **'units'**
  String get common_units;

  /// No description provided for @news_title.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news_title;

  /// No description provided for @news_category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get news_category;

  /// No description provided for @news_allCategories.
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get news_allCategories;

  /// No description provided for @news_searchNews.
  ///
  /// In en, this message translates to:
  /// **'Search news...'**
  String get news_searchNews;

  /// No description provided for @news_noNews.
  ///
  /// In en, this message translates to:
  /// **'No news found'**
  String get news_noNews;

  /// No description provided for @login_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get login_title;

  /// No description provided for @login_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue'**
  String get login_subtitle;

  /// No description provided for @login_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get login_email;

  /// No description provided for @login_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get login_password;

  /// No description provided for @login_rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get login_rememberMe;

  /// No description provided for @login_signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get login_signIn;

  /// No description provided for @login_loggingIn.
  ///
  /// In en, this message translates to:
  /// **'Logging in...'**
  String get login_loggingIn;

  /// No description provided for @login_checkingData.
  ///
  /// In en, this message translates to:
  /// **'Checking data...'**
  String get login_checkingData;

  /// No description provided for @login_creatingAdmin.
  ///
  /// In en, this message translates to:
  /// **'Creating default admin...'**
  String get login_creatingAdmin;

  /// No description provided for @login_failed.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get login_failed;

  /// No description provided for @login_emulatorDetected.
  ///
  /// In en, this message translates to:
  /// **'Emulator Detected'**
  String get login_emulatorDetected;

  /// No description provided for @login_emulatorWarning.
  ///
  /// In en, this message translates to:
  /// **'This app cannot run on an emulator or simulator. Please use a real device to continue.'**
  String get login_emulatorWarning;

  /// No description provided for @login_welcomeSampleData.
  ///
  /// In en, this message translates to:
  /// **'Welcome! Sample data has been generated.'**
  String get login_welcomeSampleData;

  /// No description provided for @login_factoryResetTitle.
  ///
  /// In en, this message translates to:
  /// **'Factory Reset'**
  String get login_factoryResetTitle;

  /// No description provided for @login_factoryResetMessage.
  ///
  /// In en, this message translates to:
  /// **'WARNING: This will sign out from Firebase and DELETE ALL local data including:\n\n• All products and categories\n• All customers and suppliers\n• All orders and transactions\n• All users\n• All settings\n\nThe app will return to fresh install state.'**
  String get login_factoryResetMessage;

  /// No description provided for @login_factoryResetConfirm2Title.
  ///
  /// In en, this message translates to:
  /// **'Are You Sure?'**
  String get login_factoryResetConfirm2Title;

  /// No description provided for @login_factoryResetConfirm2Message.
  ///
  /// In en, this message translates to:
  /// **'This operation is IRREVERSIBLE.\n\nAll your data will be permanently lost and the app will reset as if freshly installed.\n\nAre you absolutely sure?'**
  String get login_factoryResetConfirm2Message;

  /// No description provided for @login_factoryResetConfirm3Title.
  ///
  /// In en, this message translates to:
  /// **'Final Warning'**
  String get login_factoryResetConfirm3Title;

  /// No description provided for @login_factoryResetConfirm3Message.
  ///
  /// In en, this message translates to:
  /// **'This is your LAST chance to cancel.\n\nAfter this, ALL DATA will be permanently deleted and Firebase will be signed out.\n\nThere is NO way to recover.'**
  String get login_factoryResetConfirm3Message;

  /// No description provided for @login_factoryResetNow.
  ///
  /// In en, this message translates to:
  /// **'RESET NOW'**
  String get login_factoryResetNow;

  /// No description provided for @login_factoryResetting.
  ///
  /// In en, this message translates to:
  /// **'Resetting all data...'**
  String get login_factoryResetting;

  /// No description provided for @login_factoryResetDone.
  ///
  /// In en, this message translates to:
  /// **'All data has been reset. Please restart the app.'**
  String get login_factoryResetDone;

  /// No description provided for @home_todaySales.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Sales'**
  String get home_todaySales;

  /// No description provided for @home_todayOrders.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Orders'**
  String get home_todayOrders;

  /// No description provided for @home_todayExpenses.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Expenses'**
  String get home_todayExpenses;

  /// No description provided for @home_outstandingCredits.
  ///
  /// In en, this message translates to:
  /// **'Outstanding Credits'**
  String get home_outstandingCredits;

  /// No description provided for @home_outstandingDebts.
  ///
  /// In en, this message translates to:
  /// **'Outstanding Debts'**
  String get home_outstandingDebts;

  /// No description provided for @home_todayProfit.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Profit'**
  String get home_todayProfit;

  /// No description provided for @home_unpaidPO.
  ///
  /// In en, this message translates to:
  /// **'Unpaid PO'**
  String get home_unpaidPO;

  /// No description provided for @home_activeCashiers.
  ///
  /// In en, this message translates to:
  /// **'Active Cashiers'**
  String get home_activeCashiers;

  /// No description provided for @home_stockAlert.
  ///
  /// In en, this message translates to:
  /// **'Stock Alert'**
  String get home_stockAlert;

  /// No description provided for @home_allStockFulfilled.
  ///
  /// In en, this message translates to:
  /// **'All product stock is fulfilled'**
  String get home_allStockFulfilled;

  /// No description provided for @home_autoRestockPO.
  ///
  /// In en, this message translates to:
  /// **'Auto Restock (PO)'**
  String get home_autoRestockPO;

  /// No description provided for @home_autoRestockSA.
  ///
  /// In en, this message translates to:
  /// **'Auto Restock (SA)'**
  String get home_autoRestockSA;

  /// No description provided for @home_outOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get home_outOfStock;

  /// No description provided for @home_lowStockInfo.
  ///
  /// In en, this message translates to:
  /// **'Stock: {current} (min: {minimum})'**
  String home_lowStockInfo(String current, String minimum);

  /// No description provided for @home_freeMode.
  ///
  /// In en, this message translates to:
  /// **'Free Mode'**
  String get home_freeMode;

  /// No description provided for @home_trialMode.
  ///
  /// In en, this message translates to:
  /// **'Trial Mode'**
  String get home_trialMode;

  /// No description provided for @home_premiumMode.
  ///
  /// In en, this message translates to:
  /// **'Premium Mode'**
  String get home_premiumMode;

  /// No description provided for @home_upgradeToPremium.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Premium'**
  String get home_upgradeToPremium;

  /// No description provided for @home_watchAdForPremium.
  ///
  /// In en, this message translates to:
  /// **'Watch Ad for Premium'**
  String get home_watchAdForPremium;

  /// No description provided for @home_premiumActiveUntil.
  ///
  /// In en, this message translates to:
  /// **'Active until {date}'**
  String home_premiumActiveUntil(String date);

  /// No description provided for @home_quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get home_quickActions;

  /// No description provided for @home_pos.
  ///
  /// In en, this message translates to:
  /// **'POS'**
  String get home_pos;

  /// No description provided for @home_sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get home_sales;

  /// No description provided for @home_tables.
  ///
  /// In en, this message translates to:
  /// **'Tables'**
  String get home_tables;

  /// No description provided for @home_newPurchaseOrder.
  ///
  /// In en, this message translates to:
  /// **'New PO'**
  String get home_newPurchaseOrder;

  /// No description provided for @home_purchaseOrders.
  ///
  /// In en, this message translates to:
  /// **'Purchase Orders'**
  String get home_purchaseOrders;

  /// No description provided for @home_stockAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Stock Adj'**
  String get home_stockAdjustment;

  /// No description provided for @home_customers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get home_customers;

  /// No description provided for @home_products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get home_products;

  /// No description provided for @home_categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get home_categories;

  /// No description provided for @home_variants.
  ///
  /// In en, this message translates to:
  /// **'Variants'**
  String get home_variants;

  /// No description provided for @home_vouchers.
  ///
  /// In en, this message translates to:
  /// **'Vouchers'**
  String get home_vouchers;

  /// No description provided for @home_suppliers.
  ///
  /// In en, this message translates to:
  /// **'Suppliers'**
  String get home_suppliers;

  /// No description provided for @home_expenseTypes.
  ///
  /// In en, this message translates to:
  /// **'Expense Types'**
  String get home_expenseTypes;

  /// No description provided for @home_credits.
  ///
  /// In en, this message translates to:
  /// **'Credits'**
  String get home_credits;

  /// No description provided for @home_debts.
  ///
  /// In en, this message translates to:
  /// **'Debts'**
  String get home_debts;

  /// No description provided for @home_expenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get home_expenses;

  /// No description provided for @home_paymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get home_paymentMethods;

  /// No description provided for @home_users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get home_users;

  /// No description provided for @home_printer.
  ///
  /// In en, this message translates to:
  /// **'Printer'**
  String get home_printer;

  /// No description provided for @home_salesReport.
  ///
  /// In en, this message translates to:
  /// **'Sales Report'**
  String get home_salesReport;

  /// No description provided for @home_taxReport.
  ///
  /// In en, this message translates to:
  /// **'Tax Report'**
  String get home_taxReport;

  /// No description provided for @home_cashflowReport.
  ///
  /// In en, this message translates to:
  /// **'Cash Flow'**
  String get home_cashflowReport;

  /// No description provided for @home_capitalReport.
  ///
  /// In en, this message translates to:
  /// **'Capital Report'**
  String get home_capitalReport;

  /// No description provided for @home_cashDrawer.
  ///
  /// In en, this message translates to:
  /// **'Cash Drawer'**
  String get home_cashDrawer;

  /// No description provided for @home_cashDrawerReport.
  ///
  /// In en, this message translates to:
  /// **'Cash Drawer Report'**
  String get home_cashDrawerReport;

  /// No description provided for @home_cashReasons.
  ///
  /// In en, this message translates to:
  /// **'Cash Reasons'**
  String get home_cashReasons;

  /// No description provided for @home_purchaseReport.
  ///
  /// In en, this message translates to:
  /// **'Purchase Report'**
  String get home_purchaseReport;

  /// No description provided for @home_inventoryReport.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get home_inventoryReport;

  /// No description provided for @home_stockHistory.
  ///
  /// In en, this message translates to:
  /// **'Stock History'**
  String get home_stockHistory;

  /// No description provided for @home_stockAdjustmentReport.
  ///
  /// In en, this message translates to:
  /// **'Stock Adj Report'**
  String get home_stockAdjustmentReport;

  /// No description provided for @home_creditReport.
  ///
  /// In en, this message translates to:
  /// **'Credit Report'**
  String get home_creditReport;

  /// No description provided for @home_debtReport.
  ///
  /// In en, this message translates to:
  /// **'Debt Report'**
  String get home_debtReport;

  /// No description provided for @home_expenseReport.
  ///
  /// In en, this message translates to:
  /// **'Expense Report'**
  String get home_expenseReport;

  /// No description provided for @home_customerReport.
  ///
  /// In en, this message translates to:
  /// **'Customer Report'**
  String get home_customerReport;

  /// No description provided for @home_supplierReport.
  ///
  /// In en, this message translates to:
  /// **'Supplier Report'**
  String get home_supplierReport;

  /// No description provided for @home_paymentMethodReport.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get home_paymentMethodReport;

  /// No description provided for @home_staffReport.
  ///
  /// In en, this message translates to:
  /// **'Staff Report'**
  String get home_staffReport;

  /// No description provided for @home_productPerformance.
  ///
  /// In en, this message translates to:
  /// **'Product Performance'**
  String get home_productPerformance;

  /// No description provided for @home_hourlySales.
  ///
  /// In en, this message translates to:
  /// **'Hourly Sales'**
  String get home_hourlySales;

  /// No description provided for @home_productSalesProfit.
  ///
  /// In en, this message translates to:
  /// **'Product Sales & Profit'**
  String get home_productSalesProfit;

  /// No description provided for @home_profitAndLoss.
  ///
  /// In en, this message translates to:
  /// **'Profit & Loss'**
  String get home_profitAndLoss;

  /// No description provided for @home_developerTools.
  ///
  /// In en, this message translates to:
  /// **'Developer Tools'**
  String get home_developerTools;

  /// No description provided for @home_developerUI.
  ///
  /// In en, this message translates to:
  /// **'Developer UI'**
  String get home_developerUI;

  /// No description provided for @home_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get home_settings;

  /// No description provided for @home_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get home_logout;

  /// No description provided for @home_logoutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get home_logoutConfirmTitle;

  /// No description provided for @home_logoutConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get home_logoutConfirmMessage;

  /// No description provided for @home_masterData.
  ///
  /// In en, this message translates to:
  /// **'Master Data'**
  String get home_masterData;

  /// No description provided for @home_reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get home_reports;

  /// No description provided for @home_transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get home_transactions;

  /// No description provided for @home_management.
  ///
  /// In en, this message translates to:
  /// **'Management'**
  String get home_management;

  /// No description provided for @home_development.
  ///
  /// In en, this message translates to:
  /// **'Development'**
  String get home_development;

  /// No description provided for @home_tableManagement.
  ///
  /// In en, this message translates to:
  /// **'Tables'**
  String get home_tableManagement;

  /// No description provided for @home_orderStatuses.
  ///
  /// In en, this message translates to:
  /// **'Order Statuses'**
  String get home_orderStatuses;

  /// No description provided for @pos_title.
  ///
  /// In en, this message translates to:
  /// **'Point of Sale'**
  String get pos_title;

  /// No description provided for @pos_searchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get pos_searchProducts;

  /// No description provided for @pos_allCategories.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get pos_allCategories;

  /// No description provided for @pos_cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get pos_cart;

  /// No description provided for @pos_emptyCart.
  ///
  /// In en, this message translates to:
  /// **'Cart is empty'**
  String get pos_emptyCart;

  /// No description provided for @pos_addItems.
  ///
  /// In en, this message translates to:
  /// **'Add items to get started'**
  String get pos_addItems;

  /// No description provided for @pos_selectTable.
  ///
  /// In en, this message translates to:
  /// **'Select Table'**
  String get pos_selectTable;

  /// No description provided for @pos_selectCustomer.
  ///
  /// In en, this message translates to:
  /// **'Select Customer'**
  String get pos_selectCustomer;

  /// No description provided for @pos_noTable.
  ///
  /// In en, this message translates to:
  /// **'No Table'**
  String get pos_noTable;

  /// No description provided for @pos_takeaway.
  ///
  /// In en, this message translates to:
  /// **'Takeaway'**
  String get pos_takeaway;

  /// No description provided for @pos_takeawayDescription.
  ///
  /// In en, this message translates to:
  /// **'Order without table (to-go)'**
  String get pos_takeawayDescription;

  /// No description provided for @pos_orTakeaway.
  ///
  /// In en, this message translates to:
  /// **'or order without table'**
  String get pos_orTakeaway;

  /// No description provided for @pos_orderType.
  ///
  /// In en, this message translates to:
  /// **'Order Type'**
  String get pos_orderType;

  /// No description provided for @pos_dineIn.
  ///
  /// In en, this message translates to:
  /// **'Dine In'**
  String get pos_dineIn;

  /// No description provided for @pos_noCustomer.
  ///
  /// In en, this message translates to:
  /// **'No Customer'**
  String get pos_noCustomer;

  /// No description provided for @pos_items.
  ///
  /// In en, this message translates to:
  /// **'items'**
  String get pos_items;

  /// No description provided for @pos_itemsLabel.
  ///
  /// In en, this message translates to:
  /// **'Items:'**
  String get pos_itemsLabel;

  /// No description provided for @pos_itemsBatchLabel.
  ///
  /// In en, this message translates to:
  /// **'Items Batch {number}:'**
  String pos_itemsBatchLabel(int number);

  /// No description provided for @pos_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get pos_total;

  /// No description provided for @pos_checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get pos_checkout;

  /// No description provided for @pos_proceedToPayment.
  ///
  /// In en, this message translates to:
  /// **'Proceed to Payment'**
  String get pos_proceedToPayment;

  /// No description provided for @pos_noItemsInCart.
  ///
  /// In en, this message translates to:
  /// **'No items in cart'**
  String get pos_noItemsInCart;

  /// No description provided for @pos_outOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get pos_outOfStock;

  /// No description provided for @pos_lowStock.
  ///
  /// In en, this message translates to:
  /// **'Low Stock'**
  String get pos_lowStock;

  /// No description provided for @pos_inStock.
  ///
  /// In en, this message translates to:
  /// **'In Stock'**
  String get pos_inStock;

  /// No description provided for @pos_addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get pos_addToCart;

  /// No description provided for @pos_updateCart.
  ///
  /// In en, this message translates to:
  /// **'Update Cart'**
  String get pos_updateCart;

  /// No description provided for @pos_removeFromCart.
  ///
  /// In en, this message translates to:
  /// **'Remove from Cart'**
  String get pos_removeFromCart;

  /// No description provided for @pos_quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get pos_quantity;

  /// No description provided for @pos_unit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get pos_unit;

  /// No description provided for @pos_note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get pos_note;

  /// No description provided for @pos_addNote.
  ///
  /// In en, this message translates to:
  /// **'Add note...'**
  String get pos_addNote;

  /// No description provided for @pos_variants.
  ///
  /// In en, this message translates to:
  /// **'Variants'**
  String get pos_variants;

  /// No description provided for @pos_price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get pos_price;

  /// No description provided for @pos_subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get pos_subtotal;

  /// No description provided for @pos_discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get pos_discount;

  /// No description provided for @pos_tax.
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get pos_tax;

  /// No description provided for @pos_grandTotal.
  ///
  /// In en, this message translates to:
  /// **'Grand Total'**
  String get pos_grandTotal;

  /// No description provided for @pos_cashReceived.
  ///
  /// In en, this message translates to:
  /// **'Cash Received'**
  String get pos_cashReceived;

  /// No description provided for @pos_change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get pos_change;

  /// No description provided for @pos_payNow.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get pos_payNow;

  /// No description provided for @pos_paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get pos_paymentMethod;

  /// No description provided for @pos_cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get pos_cash;

  /// No description provided for @pos_qris.
  ///
  /// In en, this message translates to:
  /// **'QRIS'**
  String get pos_qris;

  /// No description provided for @pos_bankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get pos_bankTransfer;

  /// No description provided for @pos_credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get pos_credit;

  /// No description provided for @pos_paymentSuccess.
  ///
  /// In en, this message translates to:
  /// **'Payment Success'**
  String get pos_paymentSuccess;

  /// No description provided for @pos_printReceipt.
  ///
  /// In en, this message translates to:
  /// **'Print Receipt'**
  String get pos_printReceipt;

  /// No description provided for @pos_newOrder.
  ///
  /// In en, this message translates to:
  /// **'New Order'**
  String get pos_newOrder;

  /// No description provided for @pos_orderNumber.
  ///
  /// In en, this message translates to:
  /// **'Order #'**
  String get pos_orderNumber;

  /// No description provided for @pos_tableNumber.
  ///
  /// In en, this message translates to:
  /// **'Table'**
  String get pos_tableNumber;

  /// No description provided for @pos_customerName.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get pos_customerName;

  /// No description provided for @pos_viewOrder.
  ///
  /// In en, this message translates to:
  /// **'View Order'**
  String get pos_viewOrder;

  /// No description provided for @pos_cancelOrder.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order'**
  String get pos_cancelOrder;

  /// No description provided for @pos_orderCancelled.
  ///
  /// In en, this message translates to:
  /// **'Order cancelled'**
  String get pos_orderCancelled;

  /// No description provided for @pos_confirmCancel.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel this order?'**
  String get pos_confirmCancel;

  /// No description provided for @pos_customerOptional.
  ///
  /// In en, this message translates to:
  /// **'Customer (Optional)'**
  String get pos_customerOptional;

  /// No description provided for @pos_walkInCustomer.
  ///
  /// In en, this message translates to:
  /// **'Walk-in Customer'**
  String get pos_walkInCustomer;

  /// No description provided for @pos_searchCustomerHint.
  ///
  /// In en, this message translates to:
  /// **'Search customer name or phone...'**
  String get pos_searchCustomerHint;

  /// No description provided for @pos_payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get pos_payment;

  /// No description provided for @pos_qtyExceedsStock.
  ///
  /// In en, this message translates to:
  /// **'Quantity exceeds available stock'**
  String get pos_qtyExceedsStock;

  /// No description provided for @pos_editItem.
  ///
  /// In en, this message translates to:
  /// **'Edit Item'**
  String get pos_editItem;

  /// No description provided for @pos_addItem.
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get pos_addItem;

  /// No description provided for @pos_unlimitedStock.
  ///
  /// In en, this message translates to:
  /// **'Unlimited stock'**
  String get pos_unlimitedStock;

  /// No description provided for @pos_stockInfo.
  ///
  /// In en, this message translates to:
  /// **'Stock: {qty} {unit}'**
  String pos_stockInfo(String qty, String unit);

  /// No description provided for @pos_quantityWithUnit.
  ///
  /// In en, this message translates to:
  /// **'Quantity ({unit})'**
  String pos_quantityWithUnit(String unit);

  /// No description provided for @pos_options.
  ///
  /// In en, this message translates to:
  /// **'Options'**
  String get pos_options;

  /// No description provided for @pos_notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get pos_notes;

  /// No description provided for @pos_addSpecialInstructions.
  ///
  /// In en, this message translates to:
  /// **'Add special instructions...'**
  String get pos_addSpecialInstructions;

  /// No description provided for @pos_update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get pos_update;

  /// No description provided for @pos_qtyMustBeGreater.
  ///
  /// In en, this message translates to:
  /// **'Quantity must be greater than 0'**
  String get pos_qtyMustBeGreater;

  /// No description provided for @pos_noDecimalQty.
  ///
  /// In en, this message translates to:
  /// **'This product does not allow decimal quantities'**
  String get pos_noDecimalQty;

  /// No description provided for @pos_totalQtyExceedsStock.
  ///
  /// In en, this message translates to:
  /// **'Total quantity ({total} PCS) exceeds available stock ({stock} PCS)'**
  String pos_totalQtyExceedsStock(String total, String stock);

  /// No description provided for @pos_processingOrder.
  ///
  /// In en, this message translates to:
  /// **'Processing order...'**
  String get pos_processingOrder;

  /// No description provided for @pos_orderCreated.
  ///
  /// In en, this message translates to:
  /// **'Order Created'**
  String get pos_orderCreated;

  /// No description provided for @pos_itemsAddedPrint.
  ///
  /// In en, this message translates to:
  /// **'Items added to existing order. Print order ticket?'**
  String get pos_itemsAddedPrint;

  /// No description provided for @pos_orderCreatedPrint.
  ///
  /// In en, this message translates to:
  /// **'Order created successfully. Print order ticket?'**
  String get pos_orderCreatedPrint;

  /// No description provided for @pos_orderFailed.
  ///
  /// In en, this message translates to:
  /// **'Order failed: {error}'**
  String pos_orderFailed(String error);

  /// No description provided for @pos_selectOrderType.
  ///
  /// In en, this message translates to:
  /// **'Select Order Type'**
  String get pos_selectOrderType;

  /// No description provided for @pos_nonTableOrder.
  ///
  /// In en, this message translates to:
  /// **'Non-Table Order'**
  String get pos_nonTableOrder;

  /// No description provided for @common_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get common_skip;

  /// No description provided for @posCategories_title.
  ///
  /// In en, this message translates to:
  /// **'Order Categories'**
  String get posCategories_title;

  /// No description provided for @posCategories_name.
  ///
  /// In en, this message translates to:
  /// **'Category Name'**
  String get posCategories_name;

  /// No description provided for @posCategories_icon.
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get posCategories_icon;

  /// No description provided for @posCategories_color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get posCategories_color;

  /// No description provided for @posCategories_sortOrder.
  ///
  /// In en, this message translates to:
  /// **'Sort Order'**
  String get posCategories_sortOrder;

  /// No description provided for @posCategories_nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Category name is required'**
  String get posCategories_nameRequired;

  /// No description provided for @posCategories_updated.
  ///
  /// In en, this message translates to:
  /// **'Category updated'**
  String get posCategories_updated;

  /// No description provided for @posCategories_added.
  ///
  /// In en, this message translates to:
  /// **'Category added'**
  String get posCategories_added;

  /// No description provided for @posCategories_deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete category \"{name}\"?'**
  String posCategories_deleteConfirm(String name);

  /// No description provided for @posCategories_generateDefaults.
  ///
  /// In en, this message translates to:
  /// **'Generate Defaults'**
  String get posCategories_generateDefaults;

  /// No description provided for @posCategories_generateDefaultsConfirm.
  ///
  /// In en, this message translates to:
  /// **'This will add default categories (Takeaway, Gofood, Shopefood). Continue?'**
  String get posCategories_generateDefaultsConfirm;

  /// No description provided for @posCategories_defaultsGenerated.
  ///
  /// In en, this message translates to:
  /// **'Default categories generated'**
  String get posCategories_defaultsGenerated;

  /// No description provided for @posCategories_noCategories.
  ///
  /// In en, this message translates to:
  /// **'No categories found'**
  String get posCategories_noCategories;

  /// No description provided for @paymentDetail_title.
  ///
  /// In en, this message translates to:
  /// **'Payment Receipt'**
  String get paymentDetail_title;

  /// No description provided for @paymentDetail_printerSettings.
  ///
  /// In en, this message translates to:
  /// **'Printer Settings'**
  String get paymentDetail_printerSettings;

  /// No description provided for @paymentDetail_paymentSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Payment Successful!'**
  String get paymentDetail_paymentSuccessful;

  /// No description provided for @paymentDetail_printing.
  ///
  /// In en, this message translates to:
  /// **'Printing...'**
  String get paymentDetail_printing;

  /// No description provided for @paymentDetail_print.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get paymentDetail_print;

  /// No description provided for @paymentDetail_orderItems.
  ///
  /// In en, this message translates to:
  /// **'ORDER ITEMS'**
  String get paymentDetail_orderItems;

  /// No description provided for @paymentDetail_voucher.
  ///
  /// In en, this message translates to:
  /// **'Voucher'**
  String get paymentDetail_voucher;

  /// No description provided for @paymentDetail_paymentDetails.
  ///
  /// In en, this message translates to:
  /// **'PAYMENT DETAILS'**
  String get paymentDetail_paymentDetails;

  /// No description provided for @paymentDetail_amountPaid.
  ///
  /// In en, this message translates to:
  /// **'Amount Paid'**
  String get paymentDetail_amountPaid;

  /// No description provided for @paymentDetail_thankYou.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your order!'**
  String get paymentDetail_thankYou;

  /// No description provided for @paymentDetail_comeAgain.
  ///
  /// In en, this message translates to:
  /// **'Please come again'**
  String get paymentDetail_comeAgain;

  /// No description provided for @printPreview_title.
  ///
  /// In en, this message translates to:
  /// **'Print Preview'**
  String get printPreview_title;

  /// No description provided for @printPreview_cashier.
  ///
  /// In en, this message translates to:
  /// **'Cashier'**
  String get printPreview_cashier;

  /// No description provided for @printPreview_kitchen.
  ///
  /// In en, this message translates to:
  /// **'Kitchen'**
  String get printPreview_kitchen;

  /// No description provided for @printPreview_waiter.
  ///
  /// In en, this message translates to:
  /// **'Waiter'**
  String get printPreview_waiter;

  /// No description provided for @printPreview_kitchenOrder.
  ///
  /// In en, this message translates to:
  /// **'Kitchen Order'**
  String get printPreview_kitchenOrder;

  /// No description provided for @printPreview_waiterOrder.
  ///
  /// In en, this message translates to:
  /// **'Waiter Order'**
  String get printPreview_waiterOrder;

  /// No description provided for @products_title.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products_title;

  /// No description provided for @products_addProduct.
  ///
  /// In en, this message translates to:
  /// **'Add Product'**
  String get products_addProduct;

  /// No description provided for @products_editProduct.
  ///
  /// In en, this message translates to:
  /// **'Edit Product'**
  String get products_editProduct;

  /// No description provided for @products_deleteProduct.
  ///
  /// In en, this message translates to:
  /// **'Delete Product'**
  String get products_deleteProduct;

  /// No description provided for @products_deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this product?'**
  String get products_deleteConfirm;

  /// No description provided for @products_name.
  ///
  /// In en, this message translates to:
  /// **'Product Name'**
  String get products_name;

  /// No description provided for @products_price.
  ///
  /// In en, this message translates to:
  /// **'Selling Price'**
  String get products_price;

  /// No description provided for @products_purchasePrice.
  ///
  /// In en, this message translates to:
  /// **'Purchase Price'**
  String get products_purchasePrice;

  /// No description provided for @products_stock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get products_stock;

  /// No description provided for @products_minStock.
  ///
  /// In en, this message translates to:
  /// **'Minimum Stock'**
  String get products_minStock;

  /// No description provided for @products_category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get products_category;

  /// No description provided for @products_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get products_description;

  /// No description provided for @products_photo.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get products_photo;

  /// No description provided for @products_barcode.
  ///
  /// In en, this message translates to:
  /// **'Barcode'**
  String get products_barcode;

  /// No description provided for @products_isService.
  ///
  /// In en, this message translates to:
  /// **'Is Service'**
  String get products_isService;

  /// No description provided for @products_stockMode.
  ///
  /// In en, this message translates to:
  /// **'Stock Tracking'**
  String get products_stockMode;

  /// No description provided for @products_allowComma.
  ///
  /// In en, this message translates to:
  /// **'Allow Decimal Quantity'**
  String get products_allowComma;

  /// No description provided for @products_units.
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get products_units;

  /// No description provided for @products_searchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get products_searchProducts;

  /// No description provided for @products_allCategories.
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get products_allCategories;

  /// No description provided for @products_noProducts.
  ///
  /// In en, this message translates to:
  /// **'No products found'**
  String get products_noProducts;

  /// No description provided for @products_addFirst.
  ///
  /// In en, this message translates to:
  /// **'Add your first product'**
  String get products_addFirst;

  /// No description provided for @products_productSaved.
  ///
  /// In en, this message translates to:
  /// **'Product saved successfully'**
  String get products_productSaved;

  /// No description provided for @products_productDeleted.
  ///
  /// In en, this message translates to:
  /// **'Product deleted'**
  String get products_productDeleted;

  /// No description provided for @products_scanBarcode.
  ///
  /// In en, this message translates to:
  /// **'Scan Barcode'**
  String get products_scanBarcode;

  /// No description provided for @productForm_productPhoto.
  ///
  /// In en, this message translates to:
  /// **'Product Photo'**
  String get productForm_productPhoto;

  /// No description provided for @productForm_addUnit.
  ///
  /// In en, this message translates to:
  /// **'Add Unit'**
  String get productForm_addUnit;

  /// No description provided for @productForm_unitName.
  ///
  /// In en, this message translates to:
  /// **'Unit Name (max 3 chars)'**
  String get productForm_unitName;

  /// No description provided for @productForm_unitNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., PCS, BOX, KG'**
  String get productForm_unitNameHint;

  /// No description provided for @productForm_conversionFactor.
  ///
  /// In en, this message translates to:
  /// **'Conversion Factor'**
  String get productForm_conversionFactor;

  /// No description provided for @productForm_conversionFactorHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., 12 (1 Pack = 12 PCS)'**
  String get productForm_conversionFactorHint;

  /// No description provided for @productForm_conversionFactorHelp.
  ///
  /// In en, this message translates to:
  /// **'How many base units (PCS) in one of this unit?'**
  String get productForm_conversionFactorHelp;

  /// No description provided for @productForm_unitNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Unit name is required'**
  String get productForm_unitNameRequired;

  /// No description provided for @productForm_unitNameMax3.
  ///
  /// In en, this message translates to:
  /// **'Unit name max 3 characters'**
  String get productForm_unitNameMax3;

  /// No description provided for @productForm_validConversionFactor.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid conversion factor'**
  String get productForm_validConversionFactor;

  /// No description provided for @productForm_unitAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Unit \"{name}\" already exists'**
  String productForm_unitAlreadyExists(String name);

  /// No description provided for @productForm_productNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Product name is required'**
  String get productForm_productNameRequired;

  /// No description provided for @productForm_savingProduct.
  ///
  /// In en, this message translates to:
  /// **'Saving product...'**
  String get productForm_savingProduct;

  /// No description provided for @productForm_productUpdated.
  ///
  /// In en, this message translates to:
  /// **'Product updated successfully'**
  String get productForm_productUpdated;

  /// No description provided for @productForm_productAdded.
  ///
  /// In en, this message translates to:
  /// **'Product added successfully'**
  String get productForm_productAdded;

  /// No description provided for @productForm_enterPurchasePrice.
  ///
  /// In en, this message translates to:
  /// **'Enter purchase price'**
  String get productForm_enterPurchasePrice;

  /// No description provided for @productForm_setViaPO.
  ///
  /// In en, this message translates to:
  /// **'Set via Purchase Order'**
  String get productForm_setViaPO;

  /// No description provided for @productForm_alertWhenBelowThis.
  ///
  /// In en, this message translates to:
  /// **'Alert when stock below this'**
  String get productForm_alertWhenBelowThis;

  /// No description provided for @productForm_orderRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Order Recommendation'**
  String get productForm_orderRecommendation;

  /// No description provided for @productForm_orderRecommendationHint.
  ///
  /// In en, this message translates to:
  /// **'Recommended quantity to reorder'**
  String get productForm_orderRecommendationHint;

  /// No description provided for @productForm_noCategory.
  ///
  /// In en, this message translates to:
  /// **'No Category'**
  String get productForm_noCategory;

  /// No description provided for @productForm_scanOrEnterManually.
  ///
  /// In en, this message translates to:
  /// **'Scan or enter manually'**
  String get productForm_scanOrEnterManually;

  /// No description provided for @productForm_productVariants.
  ///
  /// In en, this message translates to:
  /// **'Product Variants'**
  String get productForm_productVariants;

  /// No description provided for @productForm_selectVariants.
  ///
  /// In en, this message translates to:
  /// **'Select variants that apply to this product'**
  String get productForm_selectVariants;

  /// No description provided for @productForm_productUnits.
  ///
  /// In en, this message translates to:
  /// **'Product Units'**
  String get productForm_productUnits;

  /// No description provided for @productForm_defineUnitsHelp.
  ///
  /// In en, this message translates to:
  /// **'Define units for this product (e.g., PCS, Pack, Box)'**
  String get productForm_defineUnitsHelp;

  /// No description provided for @productForm_unitsPricing.
  ///
  /// In en, this message translates to:
  /// **'Units & Pricing'**
  String get productForm_unitsPricing;

  /// No description provided for @productForm_unitsPricingHelp.
  ///
  /// In en, this message translates to:
  /// **'Define units and set selling price per unit'**
  String get productForm_unitsPricingHelp;

  /// No description provided for @productForm_baseUnit.
  ///
  /// In en, this message translates to:
  /// **'Base Unit'**
  String get productForm_baseUnit;

  /// No description provided for @productForm_mainPrice.
  ///
  /// In en, this message translates to:
  /// **'Main Price'**
  String get productForm_mainPrice;

  /// No description provided for @productForm_setAbove.
  ///
  /// In en, this message translates to:
  /// **'Set price above'**
  String get productForm_setAbove;

  /// No description provided for @productForm_autoPrice.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get productForm_autoPrice;

  /// No description provided for @productForm_customPrice.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get productForm_customPrice;

  /// No description provided for @productForm_customUnitPrice.
  ///
  /// In en, this message translates to:
  /// **'Custom unit price'**
  String get productForm_customUnitPrice;

  /// No description provided for @productForm_customPriceEnabled.
  ///
  /// In en, this message translates to:
  /// **'Set a custom selling price for this unit'**
  String get productForm_customPriceEnabled;

  /// No description provided for @productForm_autoCalculatePrice.
  ///
  /// In en, this message translates to:
  /// **'Price auto-calculated from base price × conversion'**
  String get productForm_autoCalculatePrice;

  /// No description provided for @productForm_editUnitPrice.
  ///
  /// In en, this message translates to:
  /// **'Edit Unit Price'**
  String get productForm_editUnitPrice;

  /// No description provided for @productForm_unitPrice.
  ///
  /// In en, this message translates to:
  /// **'Unit Price'**
  String get productForm_unitPrice;

  /// No description provided for @productForm_validUnitPrice.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid unit price'**
  String get productForm_validUnitPrice;

  /// No description provided for @productForm_autoCalcExplanation.
  ///
  /// In en, this message translates to:
  /// **'Auto-calculated: {price} (base price × {factor})'**
  String productForm_autoCalcExplanation(String price, String factor);

  /// No description provided for @productForm_noUnitsWarning.
  ///
  /// In en, this message translates to:
  /// **'No units defined. Default PCS unit will be used.'**
  String get productForm_noUnitsWarning;

  /// No description provided for @productForm_isService.
  ///
  /// In en, this message translates to:
  /// **'This product is a service'**
  String get productForm_isService;

  /// No description provided for @productForm_stockNotTracked.
  ///
  /// In en, this message translates to:
  /// **'Stock will not be tracked'**
  String get productForm_stockNotTracked;

  /// No description provided for @productForm_tapToMarkAsService.
  ///
  /// In en, this message translates to:
  /// **'Tap to mark as service'**
  String get productForm_tapToMarkAsService;

  /// No description provided for @productForm_trackStock.
  ///
  /// In en, this message translates to:
  /// **'Track stock'**
  String get productForm_trackStock;

  /// No description provided for @productForm_stockWillBeTracked.
  ///
  /// In en, this message translates to:
  /// **'Stock will be tracked'**
  String get productForm_stockWillBeTracked;

  /// No description provided for @productForm_canSellUnlimited.
  ///
  /// In en, this message translates to:
  /// **'Can sell unlimited quantity'**
  String get productForm_canSellUnlimited;

  /// No description provided for @productForm_allowDecimalQty.
  ///
  /// In en, this message translates to:
  /// **'Allow decimal quantity'**
  String get productForm_allowDecimalQty;

  /// No description provided for @productForm_decimalExample.
  ///
  /// In en, this message translates to:
  /// **'e.g. 2.5 kg, 1.5 liter'**
  String get productForm_decimalExample;

  /// No description provided for @productForm_wholeNumbersOnly.
  ///
  /// In en, this message translates to:
  /// **'Only whole numbers allowed'**
  String get productForm_wholeNumbersOnly;

  /// No description provided for @productForm_quickMarkup.
  ///
  /// In en, this message translates to:
  /// **'Quick markup:'**
  String get productForm_quickMarkup;

  /// No description provided for @productForm_enterPurchasePriceFirst.
  ///
  /// In en, this message translates to:
  /// **'Enter purchase price first'**
  String get productForm_enterPurchasePriceFirst;

  /// No description provided for @productForm_priceEqualWarning.
  ///
  /// In en, this message translates to:
  /// **'Selling price is the same as purchase price. You will have no profit margin. Are you sure you want to continue?'**
  String get productForm_priceEqualWarning;

  /// No description provided for @categories_title.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories_title;

  /// No description provided for @categories_addCategory.
  ///
  /// In en, this message translates to:
  /// **'Add Category'**
  String get categories_addCategory;

  /// No description provided for @categories_editCategory.
  ///
  /// In en, this message translates to:
  /// **'Edit Category'**
  String get categories_editCategory;

  /// No description provided for @categories_deleteCategory.
  ///
  /// In en, this message translates to:
  /// **'Delete Category'**
  String get categories_deleteCategory;

  /// No description provided for @categories_deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this category?'**
  String get categories_deleteConfirm;

  /// No description provided for @categories_name.
  ///
  /// In en, this message translates to:
  /// **'Category Name'**
  String get categories_name;

  /// No description provided for @categories_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get categories_description;

  /// No description provided for @categories_photo.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get categories_photo;

  /// No description provided for @categories_noCategories.
  ///
  /// In en, this message translates to:
  /// **'No categories found'**
  String get categories_noCategories;

  /// No description provided for @categories_addFirst.
  ///
  /// In en, this message translates to:
  /// **'Add your first category'**
  String get categories_addFirst;

  /// No description provided for @categories_categorySaved.
  ///
  /// In en, this message translates to:
  /// **'Category saved successfully'**
  String get categories_categorySaved;

  /// No description provided for @categories_categoryDeleted.
  ///
  /// In en, this message translates to:
  /// **'Category deleted'**
  String get categories_categoryDeleted;

  /// No description provided for @categories_nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Category name is required'**
  String get categories_nameRequired;

  /// No description provided for @categories_saving.
  ///
  /// In en, this message translates to:
  /// **'Saving category...'**
  String get categories_saving;

  /// No description provided for @categories_categoryUpdated.
  ///
  /// In en, this message translates to:
  /// **'Category updated successfully'**
  String get categories_categoryUpdated;

  /// No description provided for @categories_categoryAdded.
  ///
  /// In en, this message translates to:
  /// **'Category added successfully'**
  String get categories_categoryAdded;

  /// No description provided for @categories_visibilitySettings.
  ///
  /// In en, this message translates to:
  /// **'Visibility Settings'**
  String get categories_visibilitySettings;

  /// No description provided for @categories_visibleOnPos.
  ///
  /// In en, this message translates to:
  /// **'Visible on POS'**
  String get categories_visibleOnPos;

  /// No description provided for @categories_visibleOnPosHint.
  ///
  /// In en, this message translates to:
  /// **'Show products from this category in POS'**
  String get categories_visibleOnPosHint;

  /// No description provided for @categories_visibleOnStockAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Visible on Stock Adjustment'**
  String get categories_visibleOnStockAdjustment;

  /// No description provided for @categories_visibleOnStockAdjustmentHint.
  ///
  /// In en, this message translates to:
  /// **'Show products from this category in Stock Adjustment'**
  String get categories_visibleOnStockAdjustmentHint;

  /// No description provided for @categories_visibleOnPurchaseOrder.
  ///
  /// In en, this message translates to:
  /// **'Visible on Purchase Order'**
  String get categories_visibleOnPurchaseOrder;

  /// No description provided for @categories_visibleOnPurchaseOrderHint.
  ///
  /// In en, this message translates to:
  /// **'Show products from this category in Purchase Order'**
  String get categories_visibleOnPurchaseOrderHint;

  /// No description provided for @customers_title.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customers_title;

  /// No description provided for @customers_addCustomer.
  ///
  /// In en, this message translates to:
  /// **'Add Customer'**
  String get customers_addCustomer;

  /// No description provided for @customers_editCustomer.
  ///
  /// In en, this message translates to:
  /// **'Edit Customer'**
  String get customers_editCustomer;

  /// No description provided for @customers_deleteCustomer.
  ///
  /// In en, this message translates to:
  /// **'Delete Customer'**
  String get customers_deleteCustomer;

  /// No description provided for @customers_deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this customer?'**
  String get customers_deleteConfirm;

  /// No description provided for @customers_name.
  ///
  /// In en, this message translates to:
  /// **'Customer Name'**
  String get customers_name;

  /// No description provided for @customers_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get customers_phone;

  /// No description provided for @customers_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get customers_email;

  /// No description provided for @customers_address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get customers_address;

  /// No description provided for @customers_searchCustomers.
  ///
  /// In en, this message translates to:
  /// **'Search customers...'**
  String get customers_searchCustomers;

  /// No description provided for @customers_noCustomers.
  ///
  /// In en, this message translates to:
  /// **'No customers found'**
  String get customers_noCustomers;

  /// No description provided for @customers_addFirst.
  ///
  /// In en, this message translates to:
  /// **'Add your first customer'**
  String get customers_addFirst;

  /// No description provided for @customers_customerSaved.
  ///
  /// In en, this message translates to:
  /// **'Customer saved successfully'**
  String get customers_customerSaved;

  /// No description provided for @customers_customerDeleted.
  ///
  /// In en, this message translates to:
  /// **'Customer deleted'**
  String get customers_customerDeleted;

  /// No description provided for @customers_nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Customer name is required'**
  String get customers_nameRequired;

  /// No description provided for @customers_savingCustomer.
  ///
  /// In en, this message translates to:
  /// **'Saving customer...'**
  String get customers_savingCustomer;

  /// No description provided for @customers_customerAdded.
  ///
  /// In en, this message translates to:
  /// **'Customer added successfully'**
  String get customers_customerAdded;

  /// No description provided for @customers_customerUpdated.
  ///
  /// In en, this message translates to:
  /// **'Customer updated successfully'**
  String get customers_customerUpdated;

  /// No description provided for @customers_viewOnly.
  ///
  /// In en, this message translates to:
  /// **'View Only'**
  String get customers_viewOnly;

  /// No description provided for @customers_cannotEditAsStaff.
  ///
  /// In en, this message translates to:
  /// **'Only admin can edit or delete customers.'**
  String get customers_cannotEditAsStaff;

  /// No description provided for @customer_name.
  ///
  /// In en, this message translates to:
  /// **'Customer Name'**
  String get customer_name;

  /// No description provided for @suppliers_title.
  ///
  /// In en, this message translates to:
  /// **'Suppliers'**
  String get suppliers_title;

  /// No description provided for @suppliers_addSupplier.
  ///
  /// In en, this message translates to:
  /// **'Add Supplier'**
  String get suppliers_addSupplier;

  /// No description provided for @suppliers_editSupplier.
  ///
  /// In en, this message translates to:
  /// **'Edit Supplier'**
  String get suppliers_editSupplier;

  /// No description provided for @suppliers_deleteSupplier.
  ///
  /// In en, this message translates to:
  /// **'Delete Supplier'**
  String get suppliers_deleteSupplier;

  /// No description provided for @suppliers_deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this supplier?'**
  String get suppliers_deleteConfirm;

  /// No description provided for @suppliers_name.
  ///
  /// In en, this message translates to:
  /// **'Supplier Name'**
  String get suppliers_name;

  /// No description provided for @suppliers_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get suppliers_phone;

  /// No description provided for @suppliers_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get suppliers_email;

  /// No description provided for @suppliers_address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get suppliers_address;

  /// No description provided for @suppliers_notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get suppliers_notes;

  /// No description provided for @suppliers_searchSuppliers.
  ///
  /// In en, this message translates to:
  /// **'Search suppliers...'**
  String get suppliers_searchSuppliers;

  /// No description provided for @suppliers_noSuppliers.
  ///
  /// In en, this message translates to:
  /// **'No suppliers found'**
  String get suppliers_noSuppliers;

  /// No description provided for @suppliers_noSuppliersFound.
  ///
  /// In en, this message translates to:
  /// **'No suppliers found'**
  String get suppliers_noSuppliersFound;

  /// No description provided for @suppliers_addFirst.
  ///
  /// In en, this message translates to:
  /// **'Add your first supplier'**
  String get suppliers_addFirst;

  /// No description provided for @suppliers_supplierSaved.
  ///
  /// In en, this message translates to:
  /// **'Supplier saved successfully'**
  String get suppliers_supplierSaved;

  /// No description provided for @suppliers_supplierDeleted.
  ///
  /// In en, this message translates to:
  /// **'Supplier deleted'**
  String get suppliers_supplierDeleted;

  /// No description provided for @suppliers_nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Supplier name is required'**
  String get suppliers_nameRequired;

  /// No description provided for @suppliers_saving.
  ///
  /// In en, this message translates to:
  /// **'Saving supplier...'**
  String get suppliers_saving;

  /// No description provided for @suppliers_updated.
  ///
  /// In en, this message translates to:
  /// **'Supplier updated successfully'**
  String get suppliers_updated;

  /// No description provided for @suppliers_added.
  ///
  /// In en, this message translates to:
  /// **'Supplier added successfully'**
  String get suppliers_added;

  /// No description provided for @suppliers_bankInfo.
  ///
  /// In en, this message translates to:
  /// **'Bank Information'**
  String get suppliers_bankInfo;

  /// No description provided for @suppliers_bankName.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get suppliers_bankName;

  /// No description provided for @suppliers_bankAccountNumber.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get suppliers_bankAccountNumber;

  /// No description provided for @suppliers_bankAccountName.
  ///
  /// In en, this message translates to:
  /// **'Account Holder Name'**
  String get suppliers_bankAccountName;

  /// No description provided for @tables_title.
  ///
  /// In en, this message translates to:
  /// **'Tables'**
  String get tables_title;

  /// No description provided for @tables_searchTables.
  ///
  /// In en, this message translates to:
  /// **'Search tables...'**
  String get tables_searchTables;

  /// No description provided for @tables_addTable.
  ///
  /// In en, this message translates to:
  /// **'Add Table'**
  String get tables_addTable;

  /// No description provided for @tables_editTable.
  ///
  /// In en, this message translates to:
  /// **'Edit Table'**
  String get tables_editTable;

  /// No description provided for @tables_deleteTable.
  ///
  /// In en, this message translates to:
  /// **'Delete Table'**
  String get tables_deleteTable;

  /// No description provided for @tables_deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this table?'**
  String get tables_deleteConfirm;

  /// No description provided for @tables_number.
  ///
  /// In en, this message translates to:
  /// **'Table Number'**
  String get tables_number;

  /// No description provided for @tables_capacity.
  ///
  /// In en, this message translates to:
  /// **'Capacity'**
  String get tables_capacity;

  /// No description provided for @tables_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get tables_status;

  /// No description provided for @tables_available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get tables_available;

  /// No description provided for @tables_occupied.
  ///
  /// In en, this message translates to:
  /// **'Occupied'**
  String get tables_occupied;

  /// No description provided for @tables_maintenance.
  ///
  /// In en, this message translates to:
  /// **'Maintenance'**
  String get tables_maintenance;

  /// No description provided for @tables_noTables.
  ///
  /// In en, this message translates to:
  /// **'No tables found'**
  String get tables_noTables;

  /// No description provided for @tables_addFirst.
  ///
  /// In en, this message translates to:
  /// **'Add your first table'**
  String get tables_addFirst;

  /// No description provided for @tables_tableSaved.
  ///
  /// In en, this message translates to:
  /// **'Table saved successfully'**
  String get tables_tableSaved;

  /// No description provided for @tables_tableDeleted.
  ///
  /// In en, this message translates to:
  /// **'Table deleted'**
  String get tables_tableDeleted;

  /// No description provided for @tables_generateTables.
  ///
  /// In en, this message translates to:
  /// **'Generate Tables'**
  String get tables_generateTables;

  /// No description provided for @tables_liveView.
  ///
  /// In en, this message translates to:
  /// **'Live View'**
  String get tables_liveView;

  /// No description provided for @tables_invalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid table number'**
  String get tables_invalidNumber;

  /// No description provided for @tables_updated.
  ///
  /// In en, this message translates to:
  /// **'Table updated successfully'**
  String get tables_updated;

  /// No description provided for @tables_added.
  ///
  /// In en, this message translates to:
  /// **'Table added successfully'**
  String get tables_added;

  /// No description provided for @tables_numberOfTables.
  ///
  /// In en, this message translates to:
  /// **'Number of Tables'**
  String get tables_numberOfTables;

  /// No description provided for @tables_startFromNumber.
  ///
  /// In en, this message translates to:
  /// **'Start From Number'**
  String get tables_startFromNumber;

  /// No description provided for @tables_capacityPerTable.
  ///
  /// In en, this message translates to:
  /// **'Capacity per Table'**
  String get tables_capacityPerTable;

  /// No description provided for @tables_invalidCount.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number of tables (1-100)'**
  String get tables_invalidCount;

  /// No description provided for @tables_generatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'{count} tables generated successfully!'**
  String tables_generatedSuccess(int count);

  /// No description provided for @tables_generate.
  ///
  /// In en, this message translates to:
  /// **'Generate'**
  String get tables_generate;

  /// No description provided for @users_title.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users_title;

  /// No description provided for @users_addUser.
  ///
  /// In en, this message translates to:
  /// **'Add User'**
  String get users_addUser;

  /// No description provided for @users_editUser.
  ///
  /// In en, this message translates to:
  /// **'Edit User'**
  String get users_editUser;

  /// No description provided for @users_deleteUser.
  ///
  /// In en, this message translates to:
  /// **'Delete User'**
  String get users_deleteUser;

  /// No description provided for @users_deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this user?'**
  String get users_deleteConfirm;

  /// No description provided for @users_deleteUserConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete user \"{name}\"?'**
  String users_deleteUserConfirm(String name);

  /// No description provided for @users_deleteUserFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete user'**
  String get users_deleteUserFailed;

  /// No description provided for @users_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get users_name;

  /// No description provided for @users_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get users_email;

  /// No description provided for @users_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get users_password;

  /// No description provided for @users_role.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get users_role;

  /// No description provided for @users_admin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get users_admin;

  /// No description provided for @users_cashier.
  ///
  /// In en, this message translates to:
  /// **'Cashier'**
  String get users_cashier;

  /// No description provided for @users_roleAdmin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get users_roleAdmin;

  /// No description provided for @users_roleCashier.
  ///
  /// In en, this message translates to:
  /// **'Cashier'**
  String get users_roleCashier;

  /// No description provided for @users_allRoles.
  ///
  /// In en, this message translates to:
  /// **'All Roles'**
  String get users_allRoles;

  /// No description provided for @users_searchUsers.
  ///
  /// In en, this message translates to:
  /// **'Search users...'**
  String get users_searchUsers;

  /// No description provided for @users_noUsers.
  ///
  /// In en, this message translates to:
  /// **'No users found'**
  String get users_noUsers;

  /// No description provided for @users_noUsersFound.
  ///
  /// In en, this message translates to:
  /// **'No users found'**
  String get users_noUsersFound;

  /// No description provided for @users_noMatchingUsers.
  ///
  /// In en, this message translates to:
  /// **'No matching users'**
  String get users_noMatchingUsers;

  /// No description provided for @users_tapToAdd.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add a new user'**
  String get users_tapToAdd;

  /// No description provided for @users_addFirst.
  ///
  /// In en, this message translates to:
  /// **'Add your first user'**
  String get users_addFirst;

  /// No description provided for @users_userSaved.
  ///
  /// In en, this message translates to:
  /// **'User saved successfully'**
  String get users_userSaved;

  /// No description provided for @users_userDeleted.
  ///
  /// In en, this message translates to:
  /// **'User deleted'**
  String get users_userDeleted;

  /// No description provided for @users_user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get users_user;

  /// No description provided for @users_you.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get users_you;

  /// No description provided for @users_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get users_status;

  /// No description provided for @users_statusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get users_statusActive;

  /// No description provided for @users_statusInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get users_statusInactive;

  /// No description provided for @users_allStatus.
  ///
  /// In en, this message translates to:
  /// **'All Status'**
  String get users_allStatus;

  /// No description provided for @users_activeFirst.
  ///
  /// In en, this message translates to:
  /// **'Active First'**
  String get users_activeFirst;

  /// No description provided for @users_inactiveFirst.
  ///
  /// In en, this message translates to:
  /// **'Inactive First'**
  String get users_inactiveFirst;

  /// No description provided for @users_cannotDeleteSelf.
  ///
  /// In en, this message translates to:
  /// **'Cannot delete your own account'**
  String get users_cannotDeleteSelf;

  /// No description provided for @users_cannotDeactivateSelf.
  ///
  /// In en, this message translates to:
  /// **'Cannot deactivate your own account'**
  String get users_cannotDeactivateSelf;

  /// No description provided for @users_activating.
  ///
  /// In en, this message translates to:
  /// **'Activating user...'**
  String get users_activating;

  /// No description provided for @users_deactivating.
  ///
  /// In en, this message translates to:
  /// **'Deactivating user...'**
  String get users_deactivating;

  /// No description provided for @users_activated.
  ///
  /// In en, this message translates to:
  /// **'User activated'**
  String get users_activated;

  /// No description provided for @users_deactivated.
  ///
  /// In en, this message translates to:
  /// **'User deactivated'**
  String get users_deactivated;

  /// No description provided for @users_statusChangeFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to change status'**
  String get users_statusChangeFailed;

  /// No description provided for @users_activate.
  ///
  /// In en, this message translates to:
  /// **'Activate'**
  String get users_activate;

  /// No description provided for @users_deactivate.
  ///
  /// In en, this message translates to:
  /// **'Deactivate'**
  String get users_deactivate;

  /// No description provided for @users_nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get users_nameRequired;

  /// No description provided for @users_emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get users_emailRequired;

  /// No description provided for @users_fullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get users_fullNameHint;

  /// No description provided for @users_emailHint.
  ///
  /// In en, this message translates to:
  /// **'email@demo.com'**
  String get users_emailHint;

  /// No description provided for @users_newPasswordOptional.
  ///
  /// In en, this message translates to:
  /// **'New Password (optional)'**
  String get users_newPasswordOptional;

  /// No description provided for @users_leaveEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Leave empty if not changing'**
  String get users_leaveEmptyHint;

  /// No description provided for @users_minCharactersHint.
  ///
  /// In en, this message translates to:
  /// **'Minimum 6 characters'**
  String get users_minCharactersHint;

  /// No description provided for @users_updatingUser.
  ///
  /// In en, this message translates to:
  /// **'Updating user...'**
  String get users_updatingUser;

  /// No description provided for @users_addingUser.
  ///
  /// In en, this message translates to:
  /// **'Adding user...'**
  String get users_addingUser;

  /// No description provided for @users_userUpdated.
  ///
  /// In en, this message translates to:
  /// **'User updated successfully'**
  String get users_userUpdated;

  /// No description provided for @users_userAdded.
  ///
  /// In en, this message translates to:
  /// **'User added successfully'**
  String get users_userAdded;

  /// No description provided for @users_updateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update user'**
  String get users_updateFailed;

  /// No description provided for @users_addFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to add user'**
  String get users_addFailed;

  /// No description provided for @variants_title.
  ///
  /// In en, this message translates to:
  /// **'Variants'**
  String get variants_title;

  /// No description provided for @variants_addVariant.
  ///
  /// In en, this message translates to:
  /// **'Add Variant'**
  String get variants_addVariant;

  /// No description provided for @variants_editVariant.
  ///
  /// In en, this message translates to:
  /// **'Edit Variant'**
  String get variants_editVariant;

  /// No description provided for @variants_deleteVariant.
  ///
  /// In en, this message translates to:
  /// **'Delete Variant'**
  String get variants_deleteVariant;

  /// No description provided for @variants_deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this variant?'**
  String get variants_deleteConfirm;

  /// No description provided for @variants_deleteConfirmWithName.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\"?'**
  String variants_deleteConfirmWithName(String name);

  /// No description provided for @variants_name.
  ///
  /// In en, this message translates to:
  /// **'Variant Name'**
  String get variants_name;

  /// No description provided for @variants_nameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Size, Temperature'**
  String get variants_nameHint;

  /// No description provided for @variants_options.
  ///
  /// In en, this message translates to:
  /// **'Options'**
  String get variants_options;

  /// No description provided for @variants_optionsCommaSeparated.
  ///
  /// In en, this message translates to:
  /// **'Options (comma separated)'**
  String get variants_optionsCommaSeparated;

  /// No description provided for @variants_optionsHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., S, M, L, XL'**
  String get variants_optionsHint;

  /// No description provided for @variants_separateWithComma.
  ///
  /// In en, this message translates to:
  /// **'Separate each option with a comma'**
  String get variants_separateWithComma;

  /// No description provided for @variants_addOption.
  ///
  /// In en, this message translates to:
  /// **'Add Option'**
  String get variants_addOption;

  /// No description provided for @variants_noVariants.
  ///
  /// In en, this message translates to:
  /// **'No variants found'**
  String get variants_noVariants;

  /// No description provided for @variants_addFirst.
  ///
  /// In en, this message translates to:
  /// **'Add your first variant'**
  String get variants_addFirst;

  /// No description provided for @variants_tapToAddFirst.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add your first variant'**
  String get variants_tapToAddFirst;

  /// No description provided for @variants_searchVariants.
  ///
  /// In en, this message translates to:
  /// **'Search variants...'**
  String get variants_searchVariants;

  /// No description provided for @variants_variantSaved.
  ///
  /// In en, this message translates to:
  /// **'Variant saved successfully'**
  String get variants_variantSaved;

  /// No description provided for @variants_variantAdded.
  ///
  /// In en, this message translates to:
  /// **'Variant added'**
  String get variants_variantAdded;

  /// No description provided for @variants_variantUpdated.
  ///
  /// In en, this message translates to:
  /// **'Variant updated'**
  String get variants_variantUpdated;

  /// No description provided for @variants_variantDeleted.
  ///
  /// In en, this message translates to:
  /// **'Variant deleted successfully'**
  String get variants_variantDeleted;

  /// No description provided for @variants_enterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter variant name'**
  String get variants_enterName;

  /// No description provided for @variants_enterOption.
  ///
  /// In en, this message translates to:
  /// **'Please enter at least one option'**
  String get variants_enterOption;

  /// No description provided for @variants_enterValidOptions.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid options'**
  String get variants_enterValidOptions;

  /// No description provided for @variants_updating.
  ///
  /// In en, this message translates to:
  /// **'Updating...'**
  String get variants_updating;

  /// No description provided for @variants_saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get variants_saving;

  /// No description provided for @variants_deleting.
  ///
  /// In en, this message translates to:
  /// **'Deleting...'**
  String get variants_deleting;

  /// No description provided for @variants_sortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get variants_sortBy;

  /// No description provided for @variants_nameAZ.
  ///
  /// In en, this message translates to:
  /// **'Name A-Z'**
  String get variants_nameAZ;

  /// No description provided for @variants_nameZA.
  ///
  /// In en, this message translates to:
  /// **'Name Z-A'**
  String get variants_nameZA;

  /// No description provided for @variants_optionsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} options'**
  String variants_optionsCount(int count);

  /// No description provided for @variants_moreOptions.
  ///
  /// In en, this message translates to:
  /// **'+{count} more'**
  String variants_moreOptions(int count);

  /// No description provided for @vouchers_title.
  ///
  /// In en, this message translates to:
  /// **'Vouchers'**
  String get vouchers_title;

  /// No description provided for @vouchers_addVoucher.
  ///
  /// In en, this message translates to:
  /// **'Add Voucher'**
  String get vouchers_addVoucher;

  /// No description provided for @vouchers_editVoucher.
  ///
  /// In en, this message translates to:
  /// **'Edit Voucher'**
  String get vouchers_editVoucher;

  /// No description provided for @vouchers_deleteVoucher.
  ///
  /// In en, this message translates to:
  /// **'Delete Voucher'**
  String get vouchers_deleteVoucher;

  /// No description provided for @vouchers_deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this voucher?'**
  String get vouchers_deleteConfirm;

  /// No description provided for @vouchers_code.
  ///
  /// In en, this message translates to:
  /// **'Voucher Code'**
  String get vouchers_code;

  /// No description provided for @vouchers_name.
  ///
  /// In en, this message translates to:
  /// **'Voucher Name'**
  String get vouchers_name;

  /// No description provided for @vouchers_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get vouchers_type;

  /// No description provided for @vouchers_value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get vouchers_value;

  /// No description provided for @vouchers_nominal.
  ///
  /// In en, this message translates to:
  /// **'Nominal'**
  String get vouchers_nominal;

  /// No description provided for @vouchers_percent.
  ///
  /// In en, this message translates to:
  /// **'Percent'**
  String get vouchers_percent;

  /// No description provided for @vouchers_minTransaction.
  ///
  /// In en, this message translates to:
  /// **'Minimum Transaction'**
  String get vouchers_minTransaction;

  /// No description provided for @vouchers_usageLimit.
  ///
  /// In en, this message translates to:
  /// **'Usage Limit'**
  String get vouchers_usageLimit;

  /// No description provided for @vouchers_usedCount.
  ///
  /// In en, this message translates to:
  /// **'Used Count'**
  String get vouchers_usedCount;

  /// No description provided for @vouchers_startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get vouchers_startDate;

  /// No description provided for @vouchers_endDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get vouchers_endDate;

  /// No description provided for @vouchers_isActive.
  ///
  /// In en, this message translates to:
  /// **'Is Active'**
  String get vouchers_isActive;

  /// No description provided for @vouchers_noVouchers.
  ///
  /// In en, this message translates to:
  /// **'No vouchers found'**
  String get vouchers_noVouchers;

  /// No description provided for @vouchers_noVouchersFound.
  ///
  /// In en, this message translates to:
  /// **'No vouchers found'**
  String get vouchers_noVouchersFound;

  /// No description provided for @vouchers_searchVouchers.
  ///
  /// In en, this message translates to:
  /// **'Search vouchers...'**
  String get vouchers_searchVouchers;

  /// No description provided for @vouchers_addFirst.
  ///
  /// In en, this message translates to:
  /// **'Add your first voucher'**
  String get vouchers_addFirst;

  /// No description provided for @vouchers_voucherSaved.
  ///
  /// In en, this message translates to:
  /// **'Voucher saved successfully'**
  String get vouchers_voucherSaved;

  /// No description provided for @vouchers_voucherDeleted.
  ///
  /// In en, this message translates to:
  /// **'Voucher deleted'**
  String get vouchers_voucherDeleted;

  /// No description provided for @voucherForm_codeHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., DISCOUNT10'**
  String get voucherForm_codeHint;

  /// No description provided for @voucherForm_nameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., New Year Discount'**
  String get voucherForm_nameHint;

  /// No description provided for @voucherForm_nominalRp.
  ///
  /// In en, this message translates to:
  /// **'Nominal (Rp)'**
  String get voucherForm_nominalRp;

  /// No description provided for @voucherForm_percentSymbol.
  ///
  /// In en, this message translates to:
  /// **'Percent (%)'**
  String get voucherForm_percentSymbol;

  /// No description provided for @voucherForm_discountAmountRp.
  ///
  /// In en, this message translates to:
  /// **'Discount Amount (Rp)'**
  String get voucherForm_discountAmountRp;

  /// No description provided for @voucherForm_discountPercent.
  ///
  /// In en, this message translates to:
  /// **'Discount Percent (%)'**
  String get voucherForm_discountPercent;

  /// No description provided for @voucherForm_valueHintNominal.
  ///
  /// In en, this message translates to:
  /// **'e.g., 10000'**
  String get voucherForm_valueHintNominal;

  /// No description provided for @voucherForm_valueHintPercent.
  ///
  /// In en, this message translates to:
  /// **'e.g., 10'**
  String get voucherForm_valueHintPercent;

  /// No description provided for @voucherForm_minTransactionRp.
  ///
  /// In en, this message translates to:
  /// **'Min. Transaction (Rp)'**
  String get voucherForm_minTransactionRp;

  /// No description provided for @voucherForm_minTransactionHint.
  ///
  /// In en, this message translates to:
  /// **'0 for no minimum'**
  String get voucherForm_minTransactionHint;

  /// No description provided for @voucherForm_usageLimitOptional.
  ///
  /// In en, this message translates to:
  /// **'Usage Limit (optional)'**
  String get voucherForm_usageLimitOptional;

  /// No description provided for @voucherForm_usageLimitHint.
  ///
  /// In en, this message translates to:
  /// **'Leave empty for unlimited'**
  String get voucherForm_usageLimitHint;

  /// No description provided for @voucherForm_subscriptionEndDate.
  ///
  /// In en, this message translates to:
  /// **'Subscription End Date'**
  String get voucherForm_subscriptionEndDate;

  /// No description provided for @voucherForm_selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select date...'**
  String get voucherForm_selectDate;

  /// No description provided for @voucherForm_validPeriodOptional.
  ///
  /// In en, this message translates to:
  /// **'Valid Period (optional)'**
  String get voucherForm_validPeriodOptional;

  /// No description provided for @voucherForm_codeRequired.
  ///
  /// In en, this message translates to:
  /// **'Voucher code is required'**
  String get voucherForm_codeRequired;

  /// No description provided for @voucherForm_valueRequired.
  ///
  /// In en, this message translates to:
  /// **'Discount value is required'**
  String get voucherForm_valueRequired;

  /// No description provided for @voucherForm_invalidValue.
  ///
  /// In en, this message translates to:
  /// **'Invalid discount value'**
  String get voucherForm_invalidValue;

  /// No description provided for @voucherForm_percentMax100.
  ///
  /// In en, this message translates to:
  /// **'Percent cannot be more than 100'**
  String get voucherForm_percentMax100;

  /// No description provided for @voucherForm_savingVoucher.
  ///
  /// In en, this message translates to:
  /// **'Saving voucher...'**
  String get voucherForm_savingVoucher;

  /// No description provided for @voucherForm_voucherUpdated.
  ///
  /// In en, this message translates to:
  /// **'Voucher updated successfully'**
  String get voucherForm_voucherUpdated;

  /// No description provided for @voucherForm_voucherAdded.
  ///
  /// In en, this message translates to:
  /// **'Voucher added successfully'**
  String get voucherForm_voucherAdded;

  /// No description provided for @expenses_title.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expenses_title;

  /// No description provided for @expenses_addExpense.
  ///
  /// In en, this message translates to:
  /// **'Add Expense'**
  String get expenses_addExpense;

  /// No description provided for @expenses_editExpense.
  ///
  /// In en, this message translates to:
  /// **'Edit Expense'**
  String get expenses_editExpense;

  /// No description provided for @expenses_deleteExpense.
  ///
  /// In en, this message translates to:
  /// **'Delete Expense'**
  String get expenses_deleteExpense;

  /// No description provided for @expenses_deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this expense?'**
  String get expenses_deleteConfirm;

  /// No description provided for @expenses_type.
  ///
  /// In en, this message translates to:
  /// **'Expense Type'**
  String get expenses_type;

  /// No description provided for @expenses_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get expenses_amount;

  /// No description provided for @expenses_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get expenses_description;

  /// No description provided for @expenses_date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get expenses_date;

  /// No description provided for @expenses_noExpenses.
  ///
  /// In en, this message translates to:
  /// **'No expenses found'**
  String get expenses_noExpenses;

  /// No description provided for @expenses_searchExpenses.
  ///
  /// In en, this message translates to:
  /// **'Search expenses...'**
  String get expenses_searchExpenses;

  /// No description provided for @expenses_addFirst.
  ///
  /// In en, this message translates to:
  /// **'Add your first expense'**
  String get expenses_addFirst;

  /// No description provided for @expenses_expenseSaved.
  ///
  /// In en, this message translates to:
  /// **'Expense saved successfully'**
  String get expenses_expenseSaved;

  /// No description provided for @expenses_expenseDeleted.
  ///
  /// In en, this message translates to:
  /// **'Expense deleted'**
  String get expenses_expenseDeleted;

  /// No description provided for @expenses_fromStockAdjustment.
  ///
  /// In en, this message translates to:
  /// **'From Stock Adjustment'**
  String get expenses_fromStockAdjustment;

  /// No description provided for @expenses_cannotEditStockAdjustment.
  ///
  /// In en, this message translates to:
  /// **'This expense was auto-created from Stock Adjustment and cannot be edited or deleted.'**
  String get expenses_cannotEditStockAdjustment;

  /// No description provided for @expenses_fromCashDrawer.
  ///
  /// In en, this message translates to:
  /// **'From Cash Drawer'**
  String get expenses_fromCashDrawer;

  /// No description provided for @expenses_cannotEditCashDrawer.
  ///
  /// In en, this message translates to:
  /// **'This expense was auto-created from Cash Drawer shortage and cannot be edited or deleted.'**
  String get expenses_cannotEditCashDrawer;

  /// No description provided for @expenses_viewOnly.
  ///
  /// In en, this message translates to:
  /// **'View Only'**
  String get expenses_viewOnly;

  /// No description provided for @expenses_cannotEditAsStaff.
  ///
  /// In en, this message translates to:
  /// **'Only admin can edit or delete expenses.'**
  String get expenses_cannotEditAsStaff;

  /// No description provided for @expenseForm_selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get expenseForm_selectCategory;

  /// No description provided for @expenseForm_searchCategory.
  ///
  /// In en, this message translates to:
  /// **'Search category...'**
  String get expenseForm_searchCategory;

  /// No description provided for @expenseForm_pleaseEnterAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter amount'**
  String get expenseForm_pleaseEnterAmount;

  /// No description provided for @expenseForm_pleaseEnterValidAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid amount'**
  String get expenseForm_pleaseEnterValidAmount;

  /// No description provided for @expenseForm_pleaseSelectCategory.
  ///
  /// In en, this message translates to:
  /// **'Please select a category'**
  String get expenseForm_pleaseSelectCategory;

  /// No description provided for @expenseForm_savingExpense.
  ///
  /// In en, this message translates to:
  /// **'Saving expense...'**
  String get expenseForm_savingExpense;

  /// No description provided for @expenseForm_expenseUpdated.
  ///
  /// In en, this message translates to:
  /// **'Expense updated successfully'**
  String get expenseForm_expenseUpdated;

  /// No description provided for @expenseForm_expenseAdded.
  ///
  /// In en, this message translates to:
  /// **'Expense added successfully'**
  String get expenseForm_expenseAdded;

  /// No description provided for @expenseForm_notesOptional.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get expenseForm_notesOptional;

  /// No description provided for @expenseTypes_title.
  ///
  /// In en, this message translates to:
  /// **'Expense Types'**
  String get expenseTypes_title;

  /// No description provided for @expenseTypes_addType.
  ///
  /// In en, this message translates to:
  /// **'Add Expense Type'**
  String get expenseTypes_addType;

  /// No description provided for @expenseTypes_editType.
  ///
  /// In en, this message translates to:
  /// **'Edit Expense Type'**
  String get expenseTypes_editType;

  /// No description provided for @expenseTypes_deleteType.
  ///
  /// In en, this message translates to:
  /// **'Delete Expense Type'**
  String get expenseTypes_deleteType;

  /// No description provided for @expenseTypes_deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this expense type?'**
  String get expenseTypes_deleteConfirm;

  /// No description provided for @expenseTypes_name.
  ///
  /// In en, this message translates to:
  /// **'Type Name'**
  String get expenseTypes_name;

  /// No description provided for @expenseTypes_icon.
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get expenseTypes_icon;

  /// No description provided for @expenseTypes_color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get expenseTypes_color;

  /// No description provided for @expenseTypes_noTypes.
  ///
  /// In en, this message translates to:
  /// **'No expense types found'**
  String get expenseTypes_noTypes;

  /// No description provided for @expenseTypes_addFirst.
  ///
  /// In en, this message translates to:
  /// **'Add your first expense type'**
  String get expenseTypes_addFirst;

  /// No description provided for @expenseTypes_typeSaved.
  ///
  /// In en, this message translates to:
  /// **'Expense type saved successfully'**
  String get expenseTypes_typeSaved;

  /// No description provided for @expenseTypes_typeDeleted.
  ///
  /// In en, this message translates to:
  /// **'Expense type deleted'**
  String get expenseTypes_typeDeleted;

  /// No description provided for @expenseTypes_nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Type name is required'**
  String get expenseTypes_nameRequired;

  /// No description provided for @expenseTypes_selectIcon.
  ///
  /// In en, this message translates to:
  /// **'Select Icon'**
  String get expenseTypes_selectIcon;

  /// No description provided for @expenseTypes_selectColor.
  ///
  /// In en, this message translates to:
  /// **'Select Color'**
  String get expenseTypes_selectColor;

  /// No description provided for @expenseTypes_preview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get expenseTypes_preview;

  /// No description provided for @expenseTypes_descriptionOptional.
  ///
  /// In en, this message translates to:
  /// **'Description (Optional)'**
  String get expenseTypes_descriptionOptional;

  /// No description provided for @expenseTypes_savingType.
  ///
  /// In en, this message translates to:
  /// **'Saving expense type...'**
  String get expenseTypes_savingType;

  /// No description provided for @expenseTypes_typeUpdated.
  ///
  /// In en, this message translates to:
  /// **'Expense type updated successfully'**
  String get expenseTypes_typeUpdated;

  /// No description provided for @expenseTypes_typeAdded.
  ///
  /// In en, this message translates to:
  /// **'Expense type added successfully'**
  String get expenseTypes_typeAdded;

  /// No description provided for @orderStatuses_title.
  ///
  /// In en, this message translates to:
  /// **'Order Statuses'**
  String get orderStatuses_title;

  /// No description provided for @orderStatuses_addStatus.
  ///
  /// In en, this message translates to:
  /// **'Add Order Status'**
  String get orderStatuses_addStatus;

  /// No description provided for @orderStatuses_editStatus.
  ///
  /// In en, this message translates to:
  /// **'Edit Order Status'**
  String get orderStatuses_editStatus;

  /// No description provided for @orderStatuses_deleteStatus.
  ///
  /// In en, this message translates to:
  /// **'Delete Order Status'**
  String get orderStatuses_deleteStatus;

  /// No description provided for @orderStatuses_deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this order status?'**
  String get orderStatuses_deleteConfirm;

  /// No description provided for @orderStatuses_name.
  ///
  /// In en, this message translates to:
  /// **'Status Name'**
  String get orderStatuses_name;

  /// No description provided for @orderStatuses_noStatuses.
  ///
  /// In en, this message translates to:
  /// **'No order statuses found'**
  String get orderStatuses_noStatuses;

  /// No description provided for @orderStatuses_addFirst.
  ///
  /// In en, this message translates to:
  /// **'Add your first order status'**
  String get orderStatuses_addFirst;

  /// No description provided for @orderStatuses_statusSaved.
  ///
  /// In en, this message translates to:
  /// **'Order status saved successfully'**
  String get orderStatuses_statusSaved;

  /// No description provided for @orderStatuses_statusDeleted.
  ///
  /// In en, this message translates to:
  /// **'Order status deleted'**
  String get orderStatuses_statusDeleted;

  /// No description provided for @orderStatuses_nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Status name is required'**
  String get orderStatuses_nameRequired;

  /// No description provided for @orderStatuses_selectIcon.
  ///
  /// In en, this message translates to:
  /// **'Select Icon'**
  String get orderStatuses_selectIcon;

  /// No description provided for @orderStatuses_selectColor.
  ///
  /// In en, this message translates to:
  /// **'Select Color'**
  String get orderStatuses_selectColor;

  /// No description provided for @orderStatuses_preview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get orderStatuses_preview;

  /// No description provided for @orderStatuses_descriptionOptional.
  ///
  /// In en, this message translates to:
  /// **'Description (Optional)'**
  String get orderStatuses_descriptionOptional;

  /// No description provided for @orderStatuses_savingStatus.
  ///
  /// In en, this message translates to:
  /// **'Saving order status...'**
  String get orderStatuses_savingStatus;

  /// No description provided for @orderStatuses_statusUpdated.
  ///
  /// In en, this message translates to:
  /// **'Order status updated successfully'**
  String get orderStatuses_statusUpdated;

  /// No description provided for @orderStatuses_statusAdded.
  ///
  /// In en, this message translates to:
  /// **'Order status added successfully'**
  String get orderStatuses_statusAdded;

  /// No description provided for @orderStatuses_sortOrder.
  ///
  /// In en, this message translates to:
  /// **'Sort Order'**
  String get orderStatuses_sortOrder;

  /// No description provided for @orderStatuses_sortOrderAsc.
  ///
  /// In en, this message translates to:
  /// **'Sort Order (Ascending)'**
  String get orderStatuses_sortOrderAsc;

  /// No description provided for @orderStatuses_sortOrderDesc.
  ///
  /// In en, this message translates to:
  /// **'Sort Order (Descending)'**
  String get orderStatuses_sortOrderDesc;

  /// No description provided for @orderStatuses_allStatuses.
  ///
  /// In en, this message translates to:
  /// **'All Statuses'**
  String get orderStatuses_allStatuses;

  /// No description provided for @orderStatuses_filterByStatus.
  ///
  /// In en, this message translates to:
  /// **'Order Status'**
  String get orderStatuses_filterByStatus;

  /// No description provided for @orderStatuses_updateStatus.
  ///
  /// In en, this message translates to:
  /// **'Update Status'**
  String get orderStatuses_updateStatus;

  /// No description provided for @orderStatuses_selectStatus.
  ///
  /// In en, this message translates to:
  /// **'Select order status...'**
  String get orderStatuses_selectStatus;

  /// No description provided for @orderStatuses_searchStatus.
  ///
  /// In en, this message translates to:
  /// **'Search status...'**
  String get orderStatuses_searchStatus;

  /// No description provided for @orderStatuses_noStatus.
  ///
  /// In en, this message translates to:
  /// **'No Status'**
  String get orderStatuses_noStatus;

  /// No description provided for @paymentMethods_title.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get paymentMethods_title;

  /// No description provided for @paymentMethods_addMethod.
  ///
  /// In en, this message translates to:
  /// **'Add Payment Method'**
  String get paymentMethods_addMethod;

  /// No description provided for @paymentMethods_editMethod.
  ///
  /// In en, this message translates to:
  /// **'Edit Payment Method'**
  String get paymentMethods_editMethod;

  /// No description provided for @paymentMethods_deleteMethod.
  ///
  /// In en, this message translates to:
  /// **'Delete Payment Method'**
  String get paymentMethods_deleteMethod;

  /// No description provided for @paymentMethods_deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this payment method?'**
  String get paymentMethods_deleteConfirm;

  /// No description provided for @paymentMethods_name.
  ///
  /// In en, this message translates to:
  /// **'Method Name'**
  String get paymentMethods_name;

  /// No description provided for @paymentMethods_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get paymentMethods_type;

  /// No description provided for @paymentMethods_bankName.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get paymentMethods_bankName;

  /// No description provided for @paymentMethods_accountNumber.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get paymentMethods_accountNumber;

  /// No description provided for @paymentMethods_accountName.
  ///
  /// In en, this message translates to:
  /// **'Account Name'**
  String get paymentMethods_accountName;

  /// No description provided for @paymentMethods_qrImage.
  ///
  /// In en, this message translates to:
  /// **'QR Image'**
  String get paymentMethods_qrImage;

  /// No description provided for @paymentMethods_noMethods.
  ///
  /// In en, this message translates to:
  /// **'No payment methods found'**
  String get paymentMethods_noMethods;

  /// No description provided for @paymentMethods_addFirst.
  ///
  /// In en, this message translates to:
  /// **'Add your first payment method'**
  String get paymentMethods_addFirst;

  /// No description provided for @paymentMethods_methodSaved.
  ///
  /// In en, this message translates to:
  /// **'Payment method saved successfully'**
  String get paymentMethods_methodSaved;

  /// No description provided for @paymentMethods_methodDeleted.
  ///
  /// In en, this message translates to:
  /// **'Payment method deleted'**
  String get paymentMethods_methodDeleted;

  /// No description provided for @paymentMethods_qrisSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add QR code payment (DANA, OVO, GoPay, etc)'**
  String get paymentMethods_qrisSubtitle;

  /// No description provided for @paymentMethods_bankTransferSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add bank account for transfer'**
  String get paymentMethods_bankTransferSubtitle;

  /// No description provided for @paymentMethods_qrisPayments.
  ///
  /// In en, this message translates to:
  /// **'QRIS Payments'**
  String get paymentMethods_qrisPayments;

  /// No description provided for @paymentMethods_bankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get paymentMethods_bankTransfer;

  /// No description provided for @paymentMethods_cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get paymentMethods_cash;

  /// No description provided for @paymentMethods_alwaysAvailable.
  ///
  /// In en, this message translates to:
  /// **'Always available'**
  String get paymentMethods_alwaysAvailable;

  /// No description provided for @paymentMethods_noMethodsYet.
  ///
  /// In en, this message translates to:
  /// **'No payment methods yet'**
  String get paymentMethods_noMethodsYet;

  /// No description provided for @paymentMethods_tapToAdd.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add QRIS or Bank Transfer'**
  String get paymentMethods_tapToAdd;

  /// No description provided for @paymentMethods_methodCount.
  ///
  /// In en, this message translates to:
  /// **'{count} method(s)'**
  String paymentMethods_methodCount(int count);

  /// No description provided for @paymentMethods_accountNumberCopied.
  ///
  /// In en, this message translates to:
  /// **'Account number copied'**
  String get paymentMethods_accountNumberCopied;

  /// No description provided for @paymentMethods_deleteConfirmName.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\"?'**
  String paymentMethods_deleteConfirmName(String name);

  /// No description provided for @paymentMethods_editQris.
  ///
  /// In en, this message translates to:
  /// **'Edit QRIS Payment'**
  String get paymentMethods_editQris;

  /// No description provided for @paymentMethods_addQris.
  ///
  /// In en, this message translates to:
  /// **'Add QRIS Payment'**
  String get paymentMethods_addQris;

  /// No description provided for @paymentMethods_editBankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Edit Bank Transfer'**
  String get paymentMethods_editBankTransfer;

  /// No description provided for @paymentMethods_addBankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Add Bank Transfer'**
  String get paymentMethods_addBankTransfer;

  /// No description provided for @paymentMethods_paymentName.
  ///
  /// In en, this message translates to:
  /// **'Payment Name'**
  String get paymentMethods_paymentName;

  /// No description provided for @paymentMethods_paymentNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., DANA, OVO, GoPay'**
  String get paymentMethods_paymentNameHint;

  /// No description provided for @paymentMethods_accountNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., John Doe'**
  String get paymentMethods_accountNameHint;

  /// No description provided for @paymentMethods_qrCodeImage.
  ///
  /// In en, this message translates to:
  /// **'QR Code Image'**
  String get paymentMethods_qrCodeImage;

  /// No description provided for @paymentMethods_bankNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., BCA, Mandiri, BNI'**
  String get paymentMethods_bankNameHint;

  /// No description provided for @paymentMethods_accountNumberHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., 1234567890'**
  String get paymentMethods_accountNumberHint;

  /// No description provided for @paymentMethods_accountHolderName.
  ///
  /// In en, this message translates to:
  /// **'Account Holder Name'**
  String get paymentMethods_accountHolderName;

  /// No description provided for @paymentMethods_enterPaymentName.
  ///
  /// In en, this message translates to:
  /// **'Please enter payment name'**
  String get paymentMethods_enterPaymentName;

  /// No description provided for @paymentMethods_uploadQrCode.
  ///
  /// In en, this message translates to:
  /// **'Please upload QR code image'**
  String get paymentMethods_uploadQrCode;

  /// No description provided for @paymentMethods_enterBankName.
  ///
  /// In en, this message translates to:
  /// **'Please enter bank name'**
  String get paymentMethods_enterBankName;

  /// No description provided for @paymentMethods_enterAccountNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter account number'**
  String get paymentMethods_enterAccountNumber;

  /// No description provided for @paymentMethods_enterAccountHolder.
  ///
  /// In en, this message translates to:
  /// **'Please enter account holder name'**
  String get paymentMethods_enterAccountHolder;

  /// No description provided for @paymentMethods_saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get paymentMethods_saving;

  /// No description provided for @credits_title.
  ///
  /// In en, this message translates to:
  /// **'Credits'**
  String get credits_title;

  /// No description provided for @credits_management.
  ///
  /// In en, this message translates to:
  /// **'Credit Management'**
  String get credits_management;

  /// No description provided for @credits_addCredit.
  ///
  /// In en, this message translates to:
  /// **'Add Credit'**
  String get credits_addCredit;

  /// No description provided for @credits_addManualCredit.
  ///
  /// In en, this message translates to:
  /// **'Add Manual Credit'**
  String get credits_addManualCredit;

  /// No description provided for @credits_addPayment.
  ///
  /// In en, this message translates to:
  /// **'Add Payment'**
  String get credits_addPayment;

  /// No description provided for @credits_totalOutstanding.
  ///
  /// In en, this message translates to:
  /// **'Total Outstanding'**
  String get credits_totalOutstanding;

  /// No description provided for @credits_totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get credits_totalAmount;

  /// No description provided for @credits_paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get credits_paid;

  /// No description provided for @credits_partial.
  ///
  /// In en, this message translates to:
  /// **'Partial'**
  String get credits_partial;

  /// No description provided for @credits_unpaid.
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get credits_unpaid;

  /// No description provided for @credits_remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get credits_remaining;

  /// No description provided for @credits_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get credits_amount;

  /// No description provided for @credits_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get credits_description;

  /// No description provided for @credits_notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get credits_notes;

  /// No description provided for @credits_notesOptional.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get credits_notesOptional;

  /// No description provided for @credits_created.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get credits_created;

  /// No description provided for @credits_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get credits_status;

  /// No description provided for @credits_allStatus.
  ///
  /// In en, this message translates to:
  /// **'All Status'**
  String get credits_allStatus;

  /// No description provided for @credits_allCustomers.
  ///
  /// In en, this message translates to:
  /// **'All Customers'**
  String get credits_allCustomers;

  /// No description provided for @credits_selectCustomer.
  ///
  /// In en, this message translates to:
  /// **'Select customer...'**
  String get credits_selectCustomer;

  /// No description provided for @credits_paymentHistory.
  ///
  /// In en, this message translates to:
  /// **'Payment History'**
  String get credits_paymentHistory;

  /// No description provided for @credits_noCredits.
  ///
  /// In en, this message translates to:
  /// **'No credits found'**
  String get credits_noCredits;

  /// No description provided for @credits_noCreditsYet.
  ///
  /// In en, this message translates to:
  /// **'No credits yet'**
  String get credits_noCreditsYet;

  /// No description provided for @credits_noPaymentsYet.
  ///
  /// In en, this message translates to:
  /// **'No payments yet'**
  String get credits_noPaymentsYet;

  /// No description provided for @credits_creditSaved.
  ///
  /// In en, this message translates to:
  /// **'Credit saved successfully'**
  String get credits_creditSaved;

  /// No description provided for @credits_paymentSaved.
  ///
  /// In en, this message translates to:
  /// **'Payment saved successfully'**
  String get credits_paymentSaved;

  /// No description provided for @credits_addingCredit.
  ///
  /// In en, this message translates to:
  /// **'Adding credit...'**
  String get credits_addingCredit;

  /// No description provided for @credits_manualCreditEntry.
  ///
  /// In en, this message translates to:
  /// **'Manual credit entry'**
  String get credits_manualCreditEntry;

  /// No description provided for @credits_pleaseSelectCustomer.
  ///
  /// In en, this message translates to:
  /// **'Please select a customer'**
  String get credits_pleaseSelectCustomer;

  /// No description provided for @credits_pleaseEnterValidAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount'**
  String get credits_pleaseEnterValidAmount;

  /// No description provided for @credits_deleteCredit.
  ///
  /// In en, this message translates to:
  /// **'Delete Credit'**
  String get credits_deleteCredit;

  /// No description provided for @credits_deleteCreditConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this credit record for {customerName}?'**
  String credits_deleteCreditConfirm(String customerName);

  /// No description provided for @credits_deletingCredit.
  ///
  /// In en, this message translates to:
  /// **'Deleting credit...'**
  String get credits_deletingCredit;

  /// No description provided for @credits_creditDeleted.
  ///
  /// In en, this message translates to:
  /// **'Credit deleted'**
  String get credits_creditDeleted;

  /// No description provided for @debts_title.
  ///
  /// In en, this message translates to:
  /// **'Debt Management'**
  String get debts_title;

  /// No description provided for @debts_addDebt.
  ///
  /// In en, this message translates to:
  /// **'Add Debt'**
  String get debts_addDebt;

  /// No description provided for @debts_addPayment.
  ///
  /// In en, this message translates to:
  /// **'Add Payment'**
  String get debts_addPayment;

  /// No description provided for @debts_addManualDebt.
  ///
  /// In en, this message translates to:
  /// **'Add Manual Debt'**
  String get debts_addManualDebt;

  /// No description provided for @debts_totalOutstanding.
  ///
  /// In en, this message translates to:
  /// **'Total Outstanding'**
  String get debts_totalOutstanding;

  /// No description provided for @debts_totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get debts_totalAmount;

  /// No description provided for @debts_paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get debts_paid;

  /// No description provided for @debts_partial.
  ///
  /// In en, this message translates to:
  /// **'Partial'**
  String get debts_partial;

  /// No description provided for @debts_unpaid.
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get debts_unpaid;

  /// No description provided for @debts_remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get debts_remaining;

  /// No description provided for @debts_paymentHistory.
  ///
  /// In en, this message translates to:
  /// **'Payment History'**
  String get debts_paymentHistory;

  /// No description provided for @debts_noDebts.
  ///
  /// In en, this message translates to:
  /// **'No debts found'**
  String get debts_noDebts;

  /// No description provided for @debts_noDebtsYet.
  ///
  /// In en, this message translates to:
  /// **'No debts yet'**
  String get debts_noDebtsYet;

  /// No description provided for @debts_noPaymentsYet.
  ///
  /// In en, this message translates to:
  /// **'No payments yet'**
  String get debts_noPaymentsYet;

  /// No description provided for @debts_debtSaved.
  ///
  /// In en, this message translates to:
  /// **'Debt saved successfully'**
  String get debts_debtSaved;

  /// No description provided for @debts_paymentSaved.
  ///
  /// In en, this message translates to:
  /// **'Payment saved successfully'**
  String get debts_paymentSaved;

  /// No description provided for @debts_debtAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Debt added successfully'**
  String get debts_debtAddedSuccessfully;

  /// No description provided for @debts_debtDeleted.
  ///
  /// In en, this message translates to:
  /// **'Debt deleted'**
  String get debts_debtDeleted;

  /// No description provided for @debts_deletingDebt.
  ///
  /// In en, this message translates to:
  /// **'Deleting debt...'**
  String get debts_deletingDebt;

  /// No description provided for @debts_addingDebt.
  ///
  /// In en, this message translates to:
  /// **'Adding debt...'**
  String get debts_addingDebt;

  /// No description provided for @debts_deleteDebt.
  ///
  /// In en, this message translates to:
  /// **'Delete Debt'**
  String get debts_deleteDebt;

  /// No description provided for @debts_deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this debt record for {supplierName}?'**
  String debts_deleteConfirm(String supplierName);

  /// No description provided for @debts_selectSupplier.
  ///
  /// In en, this message translates to:
  /// **'Select supplier...'**
  String get debts_selectSupplier;

  /// No description provided for @debts_allSuppliers.
  ///
  /// In en, this message translates to:
  /// **'All Suppliers'**
  String get debts_allSuppliers;

  /// No description provided for @debts_allStatus.
  ///
  /// In en, this message translates to:
  /// **'All Status'**
  String get debts_allStatus;

  /// No description provided for @debts_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get debts_status;

  /// No description provided for @debts_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get debts_amount;

  /// No description provided for @debts_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get debts_description;

  /// No description provided for @debts_notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get debts_notes;

  /// No description provided for @debts_notesOptional.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get debts_notesOptional;

  /// No description provided for @debts_created.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get debts_created;

  /// No description provided for @debts_manualDebtEntry.
  ///
  /// In en, this message translates to:
  /// **'Manual debt entry'**
  String get debts_manualDebtEntry;

  /// No description provided for @debts_pleaseSelectSupplier.
  ///
  /// In en, this message translates to:
  /// **'Please select a supplier'**
  String get debts_pleaseSelectSupplier;

  /// No description provided for @debts_pleaseEnterValidAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount'**
  String get debts_pleaseEnterValidAmount;

  /// No description provided for @debts_payDebt.
  ///
  /// In en, this message translates to:
  /// **'Pay Debt'**
  String get debts_payDebt;

  /// No description provided for @debts_paidInFull.
  ///
  /// In en, this message translates to:
  /// **'Paid in Full'**
  String get debts_paidInFull;

  /// No description provided for @debtPayment_title.
  ///
  /// In en, this message translates to:
  /// **'Pay Debt'**
  String get debtPayment_title;

  /// No description provided for @debtPayment_selectPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get debtPayment_selectPaymentMethod;

  /// No description provided for @debtPayment_payWithCash.
  ///
  /// In en, this message translates to:
  /// **'Pay with cash'**
  String get debtPayment_payWithCash;

  /// No description provided for @debtPayment_scanQrisToPay.
  ///
  /// In en, this message translates to:
  /// **'Scan QRIS to pay'**
  String get debtPayment_scanQrisToPay;

  /// No description provided for @debtPayment_enterValidAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount'**
  String get debtPayment_enterValidAmount;

  /// No description provided for @debtPayment_amountExceedsRemaining.
  ///
  /// In en, this message translates to:
  /// **'Amount exceeds remaining balance'**
  String get debtPayment_amountExceedsRemaining;

  /// No description provided for @debtPayment_processingPayment.
  ///
  /// In en, this message translates to:
  /// **'Processing payment...'**
  String get debtPayment_processingPayment;

  /// No description provided for @debtPayment_paymentRecordedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Payment recorded successfully'**
  String get debtPayment_paymentRecordedSuccess;

  /// No description provided for @debtPayment_paymentFailed.
  ///
  /// In en, this message translates to:
  /// **'Payment failed: {error}'**
  String debtPayment_paymentFailed(String error);

  /// No description provided for @debtPayment_paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get debtPayment_paymentMethod;

  /// No description provided for @debtPayment_unknownSupplier.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get debtPayment_unknownSupplier;

  /// No description provided for @debtPayment_totalDebt.
  ///
  /// In en, this message translates to:
  /// **'Total Debt'**
  String get debtPayment_totalDebt;

  /// No description provided for @debtPayment_paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get debtPayment_paid;

  /// No description provided for @debtPayment_remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get debtPayment_remaining;

  /// No description provided for @debtPayment_paymentAmount.
  ///
  /// In en, this message translates to:
  /// **'Payment Amount'**
  String get debtPayment_paymentAmount;

  /// No description provided for @debtPayment_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get debtPayment_amount;

  /// No description provided for @debtPayment_fullAmount.
  ///
  /// In en, this message translates to:
  /// **'Full Amount'**
  String get debtPayment_fullAmount;

  /// No description provided for @debtPayment_notesOptional.
  ///
  /// In en, this message translates to:
  /// **'Notes (Optional)'**
  String get debtPayment_notesOptional;

  /// No description provided for @debtPayment_paymentNotes.
  ///
  /// In en, this message translates to:
  /// **'Payment notes'**
  String get debtPayment_paymentNotes;

  /// No description provided for @debtPayment_processing.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get debtPayment_processing;

  /// No description provided for @debtPayment_submitPayment.
  ///
  /// In en, this message translates to:
  /// **'Submit Payment'**
  String get debtPayment_submitPayment;

  /// No description provided for @debtPayment_ivePaid.
  ///
  /// In en, this message translates to:
  /// **'I\'ve Paid'**
  String get debtPayment_ivePaid;

  /// No description provided for @debtPayment_iveTransferred.
  ///
  /// In en, this message translates to:
  /// **'I\'ve Transferred'**
  String get debtPayment_iveTransferred;

  /// No description provided for @debtPayment_scanQrCode.
  ///
  /// In en, this message translates to:
  /// **'Scan QR code above using your e-wallet app'**
  String get debtPayment_scanQrCode;

  /// No description provided for @debtPayment_accountNumber.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get debtPayment_accountNumber;

  /// No description provided for @debtPayment_accountHolder.
  ///
  /// In en, this message translates to:
  /// **'Account Holder'**
  String get debtPayment_accountHolder;

  /// No description provided for @debtPayment_total.
  ///
  /// In en, this message translates to:
  /// **'Total:'**
  String get debtPayment_total;

  /// No description provided for @debtPayment_transferToAccount.
  ///
  /// In en, this message translates to:
  /// **'Transfer the amount above to the account'**
  String get debtPayment_transferToAccount;

  /// No description provided for @debtPayment_accountNumberCopied.
  ///
  /// In en, this message translates to:
  /// **'Account number copied'**
  String get debtPayment_accountNumberCopied;

  /// No description provided for @debtPayment_qris.
  ///
  /// In en, this message translates to:
  /// **'QRIS'**
  String get debtPayment_qris;

  /// No description provided for @debtPayment_bankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get debtPayment_bankTransfer;

  /// No description provided for @debtPayment_cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get debtPayment_cash;

  /// No description provided for @debtPayment_nonCash.
  ///
  /// In en, this message translates to:
  /// **'Non-Cash'**
  String get debtPayment_nonCash;

  /// No description provided for @debtPayment_payWithNonCash.
  ///
  /// In en, this message translates to:
  /// **'Pay via bank transfer'**
  String get debtPayment_payWithNonCash;

  /// No description provided for @debtPayment_supplierBankInfo.
  ///
  /// In en, this message translates to:
  /// **'Supplier Bank Information'**
  String get debtPayment_supplierBankInfo;

  /// No description provided for @debtPayment_noBankInfo.
  ///
  /// In en, this message translates to:
  /// **'No bank information available for this supplier'**
  String get debtPayment_noBankInfo;

  /// No description provided for @purchaseOrder_title.
  ///
  /// In en, this message translates to:
  /// **'Purchase Orders'**
  String get purchaseOrder_title;

  /// No description provided for @purchaseOrder_new.
  ///
  /// In en, this message translates to:
  /// **'New Purchase Order'**
  String get purchaseOrder_new;

  /// No description provided for @purchaseOrder_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit Purchase Order'**
  String get purchaseOrder_edit;

  /// No description provided for @purchaseOrder_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete Purchase Order'**
  String get purchaseOrder_delete;

  /// No description provided for @purchaseOrder_deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this purchase order?'**
  String get purchaseOrder_deleteConfirm;

  /// No description provided for @purchaseOrder_supplier.
  ///
  /// In en, this message translates to:
  /// **'Supplier'**
  String get purchaseOrder_supplier;

  /// No description provided for @purchaseOrder_date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get purchaseOrder_date;

  /// No description provided for @purchaseOrder_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get purchaseOrder_status;

  /// No description provided for @purchaseOrder_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get purchaseOrder_pending;

  /// No description provided for @purchaseOrder_received.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get purchaseOrder_received;

  /// No description provided for @purchaseOrder_cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get purchaseOrder_cancelled;

  /// No description provided for @purchaseOrder_items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get purchaseOrder_items;

  /// No description provided for @purchaseOrder_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get purchaseOrder_total;

  /// No description provided for @purchaseOrder_noPurchaseOrders.
  ///
  /// In en, this message translates to:
  /// **'No purchase orders found'**
  String get purchaseOrder_noPurchaseOrders;

  /// No description provided for @purchaseOrder_addFirst.
  ///
  /// In en, this message translates to:
  /// **'Create your first purchase order'**
  String get purchaseOrder_addFirst;

  /// No description provided for @purchaseOrder_orderSaved.
  ///
  /// In en, this message translates to:
  /// **'Purchase order saved successfully'**
  String get purchaseOrder_orderSaved;

  /// No description provided for @purchaseOrder_orderDeleted.
  ///
  /// In en, this message translates to:
  /// **'Purchase order deleted'**
  String get purchaseOrder_orderDeleted;

  /// No description provided for @purchaseOrder_markReceived.
  ///
  /// In en, this message translates to:
  /// **'Mark as Received'**
  String get purchaseOrder_markReceived;

  /// No description provided for @purchaseOrder_receivedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Purchase order marked as received'**
  String get purchaseOrder_receivedSuccess;

  /// No description provided for @purchaseOrder_serviceCannotBePurchased.
  ///
  /// In en, this message translates to:
  /// **'Service products cannot be purchased'**
  String get purchaseOrder_serviceCannotBePurchased;

  /// No description provided for @purchaseOrder_productNotFoundSearching.
  ///
  /// In en, this message translates to:
  /// **'Product not found, searching: {code}'**
  String purchaseOrder_productNotFoundSearching(String code);

  /// No description provided for @purchaseOrder_scanBarcodeToAdd.
  ///
  /// In en, this message translates to:
  /// **'Scan barcode to add product'**
  String get purchaseOrder_scanBarcodeToAdd;

  /// No description provided for @purchaseOrder_paymentTitle.
  ///
  /// In en, this message translates to:
  /// **'Purchase Order Payment'**
  String get purchaseOrder_paymentTitle;

  /// No description provided for @purchaseOrder_confirmCashPayment.
  ///
  /// In en, this message translates to:
  /// **'Confirm Cash Payment'**
  String get purchaseOrder_confirmCashPayment;

  /// No description provided for @purchaseOrder_confirmCreditPayment.
  ///
  /// In en, this message translates to:
  /// **'Confirm Credit Payment'**
  String get purchaseOrder_confirmCreditPayment;

  /// No description provided for @purchaseOrder_confirmPayment.
  ///
  /// In en, this message translates to:
  /// **'Confirm Payment'**
  String get purchaseOrder_confirmPayment;

  /// No description provided for @purchaseOrder_confirmCredit.
  ///
  /// In en, this message translates to:
  /// **'Confirm Credit'**
  String get purchaseOrder_confirmCredit;

  /// No description provided for @purchaseOrder_stockWillBeUpdated.
  ///
  /// In en, this message translates to:
  /// **'Stock will be updated immediately'**
  String get purchaseOrder_stockWillBeUpdated;

  /// No description provided for @purchaseOrder_debtWillBeCreated.
  ///
  /// In en, this message translates to:
  /// **'A debt record will be created for this supplier'**
  String get purchaseOrder_debtWillBeCreated;

  /// No description provided for @purchaseOrder_selectSupplier.
  ///
  /// In en, this message translates to:
  /// **'Select Supplier'**
  String get purchaseOrder_selectSupplier;

  /// No description provided for @purchaseOrder_searchSupplier.
  ///
  /// In en, this message translates to:
  /// **'Search supplier name...'**
  String get purchaseOrder_searchSupplier;

  /// No description provided for @purchaseOrder_orderItems.
  ///
  /// In en, this message translates to:
  /// **'Order Items'**
  String get purchaseOrder_orderItems;

  /// No description provided for @purchaseOrder_itemsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String purchaseOrder_itemsCount(int count);

  /// No description provided for @purchaseOrder_confirmAndReceiveStock.
  ///
  /// In en, this message translates to:
  /// **'Confirm & Receive Stock'**
  String get purchaseOrder_confirmAndReceiveStock;

  /// No description provided for @purchaseOrder_confirmPurchaseOrder.
  ///
  /// In en, this message translates to:
  /// **'Confirm Purchase Order'**
  String get purchaseOrder_confirmPurchaseOrder;

  /// No description provided for @purchaseOrder_stockUpdatedAfterConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Stock will be updated immediately after confirmation'**
  String get purchaseOrder_stockUpdatedAfterConfirmation;

  /// No description provided for @purchaseOrder_cartEmpty.
  ///
  /// In en, this message translates to:
  /// **'Cart is empty'**
  String get purchaseOrder_cartEmpty;

  /// No description provided for @purchaseOrder_pleaseSelectSupplier.
  ///
  /// In en, this message translates to:
  /// **'Please select a supplier'**
  String get purchaseOrder_pleaseSelectSupplier;

  /// No description provided for @purchaseOrder_creatingAndReceiving.
  ///
  /// In en, this message translates to:
  /// **'Creating and receiving purchase order...'**
  String get purchaseOrder_creatingAndReceiving;

  /// No description provided for @purchaseOrder_creatingOrder.
  ///
  /// In en, this message translates to:
  /// **'Creating purchase order...'**
  String get purchaseOrder_creatingOrder;

  /// No description provided for @purchaseOrder_failedPrefix.
  ///
  /// In en, this message translates to:
  /// **'Failed: {error}'**
  String purchaseOrder_failedPrefix(String error);

  /// No description provided for @purchaseOrder_debtFromPO.
  ///
  /// In en, this message translates to:
  /// **'Debt from Purchase Order'**
  String get purchaseOrder_debtFromPO;

  /// No description provided for @purchaseOrder_createdButFailedToReceive.
  ///
  /// In en, this message translates to:
  /// **'PO created but failed to receive: {error}'**
  String purchaseOrder_createdButFailedToReceive(String error);

  /// No description provided for @purchaseOrder_payNowInCash.
  ///
  /// In en, this message translates to:
  /// **'Pay now in cash'**
  String get purchaseOrder_payNowInCash;

  /// No description provided for @purchaseOrder_payLaterCreatesDebt.
  ///
  /// In en, this message translates to:
  /// **'Pay later, creates debt record'**
  String get purchaseOrder_payLaterCreatesDebt;

  /// No description provided for @purchaseOrder_confirmPaymentCashMessage.
  ///
  /// In en, this message translates to:
  /// **'You will pay {amount} in cash. This action cannot be changed. The amount will be recorded as cash outcome.'**
  String purchaseOrder_confirmPaymentCashMessage(String amount);

  /// No description provided for @purchaseOrder_confirmPaymentCreditMessage.
  ///
  /// In en, this message translates to:
  /// **'You will pay {amount} on credit. This action cannot be changed. A debt record will be created for this purchase.'**
  String purchaseOrder_confirmPaymentCreditMessage(String amount);

  /// No description provided for @purchaseOrder_creditDebt.
  ///
  /// In en, this message translates to:
  /// **'Credit (Debt)'**
  String get purchaseOrder_creditDebt;

  /// No description provided for @purchaseOrder_cart.
  ///
  /// In en, this message translates to:
  /// **'Purchase Order Cart'**
  String get purchaseOrder_cart;

  /// No description provided for @purchaseOrder_clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get purchaseOrder_clearAll;

  /// No description provided for @purchaseOrder_purchasePriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Purchase Price: {name}'**
  String purchaseOrder_purchasePriceLabel(String name);

  /// No description provided for @purchaseOrder_priceRp.
  ///
  /// In en, this message translates to:
  /// **'Price (Rp)'**
  String get purchaseOrder_priceRp;

  /// No description provided for @purchaseOrder_invalidPrice.
  ///
  /// In en, this message translates to:
  /// **'Invalid price'**
  String get purchaseOrder_invalidPrice;

  /// No description provided for @purchaseOrder_yourCartEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get purchaseOrder_yourCartEmpty;

  /// No description provided for @purchaseOrder_createdAndReceived.
  ///
  /// In en, this message translates to:
  /// **'Purchase Order Created & Received'**
  String get purchaseOrder_createdAndReceived;

  /// No description provided for @purchaseOrder_createdAndReceivedMessage.
  ///
  /// In en, this message translates to:
  /// **'Purchase order has been created and stock updated successfully!'**
  String get purchaseOrder_createdAndReceivedMessage;

  /// No description provided for @purchaseOrder_createdTitle.
  ///
  /// In en, this message translates to:
  /// **'Purchase Order Created'**
  String get purchaseOrder_createdTitle;

  /// No description provided for @purchaseOrder_createdMessage.
  ///
  /// In en, this message translates to:
  /// **'Purchase order created successfully! You can receive the items later from PO list.'**
  String get purchaseOrder_createdMessage;

  /// No description provided for @purchaseOrder_debtCreatedSuffix.
  ///
  /// In en, this message translates to:
  /// **' A debt record has been created for this purchase.'**
  String get purchaseOrder_debtCreatedSuffix;

  /// No description provided for @purchaseOrder_createPO.
  ///
  /// In en, this message translates to:
  /// **'Create PO'**
  String get purchaseOrder_createPO;

  /// No description provided for @purchaseOrder_createAndReceive.
  ///
  /// In en, this message translates to:
  /// **'Create & Receive'**
  String get purchaseOrder_createAndReceive;

  /// No description provided for @purchaseOrder_createAndReceiveNote.
  ///
  /// In en, this message translates to:
  /// **'\"Create & Receive\" will update stock immediately'**
  String get purchaseOrder_createAndReceiveNote;

  /// No description provided for @purchaseOrder_pleaseSelectSupplierFirst.
  ///
  /// In en, this message translates to:
  /// **'Please select a supplier first'**
  String get purchaseOrder_pleaseSelectSupplierFirst;

  /// No description provided for @purchaseOrder_printPO.
  ///
  /// In en, this message translates to:
  /// **'Print PO'**
  String get purchaseOrder_printPO;

  /// No description provided for @purchaseOrder_paymentType.
  ///
  /// In en, this message translates to:
  /// **'Payment Type'**
  String get purchaseOrder_paymentType;

  /// No description provided for @purchaseOrder_cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get purchaseOrder_cash;

  /// No description provided for @purchaseOrder_credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get purchaseOrder_credit;

  /// No description provided for @purchaseOrder_unpaid.
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get purchaseOrder_unpaid;

  /// No description provided for @purchaseOrder_paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get purchaseOrder_paid;

  /// No description provided for @purchaseOrder_ordered.
  ///
  /// In en, this message translates to:
  /// **'Ordered'**
  String get purchaseOrder_ordered;

  /// No description provided for @paymentMethod_title.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod_title;

  /// No description provided for @purchaseOrderDetail_receipt.
  ///
  /// In en, this message translates to:
  /// **'Purchase Order Receipt'**
  String get purchaseOrderDetail_receipt;

  /// No description provided for @purchaseOrderDetail_backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get purchaseOrderDetail_backToHome;

  /// No description provided for @purchaseOrderDetail_completed.
  ///
  /// In en, this message translates to:
  /// **'Purchase Order Completed!'**
  String get purchaseOrderDetail_completed;

  /// No description provided for @purchaseOrderDetail_stockUpdated.
  ///
  /// In en, this message translates to:
  /// **'Stock Updated'**
  String get purchaseOrderDetail_stockUpdated;

  /// No description provided for @purchaseOrderDetail_debtRecorded.
  ///
  /// In en, this message translates to:
  /// **'Debt Recorded'**
  String get purchaseOrderDetail_debtRecorded;

  /// No description provided for @purchaseOrderDetail_orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get purchaseOrderDetail_orderDetails;

  /// No description provided for @purchaseOrderDetail_totalItems.
  ///
  /// In en, this message translates to:
  /// **'Total Items'**
  String get purchaseOrderDetail_totalItems;

  /// No description provided for @purchaseOrderDetail_productsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} products'**
  String purchaseOrderDetail_productsCount(int count);

  /// No description provided for @purchaseOrderDetail_itemsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String purchaseOrderDetail_itemsCount(int count);

  /// No description provided for @purchaseOrderDetail_totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get purchaseOrderDetail_totalAmount;

  /// No description provided for @stockAdjustment_title.
  ///
  /// In en, this message translates to:
  /// **'Stock Adjustment'**
  String get stockAdjustment_title;

  /// No description provided for @stockAdjustment_addAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Add Adjustment'**
  String get stockAdjustment_addAdjustment;

  /// No description provided for @stockAdjustment_product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get stockAdjustment_product;

  /// No description provided for @stockAdjustment_currentStock.
  ///
  /// In en, this message translates to:
  /// **'Current Stock'**
  String get stockAdjustment_currentStock;

  /// No description provided for @stockAdjustment_newStock.
  ///
  /// In en, this message translates to:
  /// **'New Stock'**
  String get stockAdjustment_newStock;

  /// No description provided for @stockAdjustment_change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get stockAdjustment_change;

  /// No description provided for @stockAdjustment_reason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get stockAdjustment_reason;

  /// No description provided for @stockAdjustment_date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get stockAdjustment_date;

  /// No description provided for @stockAdjustment_noAdjustments.
  ///
  /// In en, this message translates to:
  /// **'No adjustments found'**
  String get stockAdjustment_noAdjustments;

  /// No description provided for @stockAdjustment_adjustment.
  ///
  /// In en, this message translates to:
  /// **'Adjustment'**
  String get stockAdjustment_adjustment;

  /// No description provided for @stockAdjustment_adjustmentSaved.
  ///
  /// In en, this message translates to:
  /// **'Stock adjustment saved successfully'**
  String get stockAdjustment_adjustmentSaved;

  /// No description provided for @stockAdjustment_history.
  ///
  /// In en, this message translates to:
  /// **'Adjustment History'**
  String get stockAdjustment_history;

  /// No description provided for @stockAdjustment_searchAdjustments.
  ///
  /// In en, this message translates to:
  /// **'Search adjustments...'**
  String get stockAdjustment_searchAdjustments;

  /// No description provided for @stockAdjustment_noAdjustmentsYet.
  ///
  /// In en, this message translates to:
  /// **'No stock adjustments yet'**
  String get stockAdjustment_noAdjustmentsYet;

  /// No description provided for @stockAdjustment_deleteAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Delete Adjustment'**
  String get stockAdjustment_deleteAdjustment;

  /// No description provided for @stockAdjustment_deleteConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this adjustment record?\n\nNote: This will not reverse the stock or expense.'**
  String get stockAdjustment_deleteConfirmMessage;

  /// No description provided for @stockAdjustment_adjustmentDeleted.
  ///
  /// In en, this message translates to:
  /// **'Adjustment deleted'**
  String get stockAdjustment_adjustmentDeleted;

  /// No description provided for @stockAdjustment_totalRecords.
  ///
  /// In en, this message translates to:
  /// **'Total Records'**
  String get stockAdjustment_totalRecords;

  /// No description provided for @stockAdjustment_totalQty.
  ///
  /// In en, this message translates to:
  /// **'Total Qty'**
  String get stockAdjustment_totalQty;

  /// No description provided for @stockAdjustment_totalLoss.
  ///
  /// In en, this message translates to:
  /// **'Total Loss'**
  String get stockAdjustment_totalLoss;

  /// No description provided for @stockAdjustment_unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get stockAdjustment_unknown;

  /// No description provided for @stockAdjustment_allReasons.
  ///
  /// In en, this message translates to:
  /// **'All Reasons'**
  String get stockAdjustment_allReasons;

  /// No description provided for @stockAdjustment_searchReason.
  ///
  /// In en, this message translates to:
  /// **'Search reason...'**
  String get stockAdjustment_searchReason;

  /// No description provided for @stockAdjustment_newestFirst.
  ///
  /// In en, this message translates to:
  /// **'Newest First'**
  String get stockAdjustment_newestFirst;

  /// No description provided for @stockAdjustment_oldestFirst.
  ///
  /// In en, this message translates to:
  /// **'Oldest First'**
  String get stockAdjustment_oldestFirst;

  /// No description provided for @stockAdjustment_productAZ.
  ///
  /// In en, this message translates to:
  /// **'Product A-Z'**
  String get stockAdjustment_productAZ;

  /// No description provided for @stockAdjustment_productZA.
  ///
  /// In en, this message translates to:
  /// **'Product Z-A'**
  String get stockAdjustment_productZA;

  /// No description provided for @stockAdjustment_highestValue.
  ///
  /// In en, this message translates to:
  /// **'Highest Value'**
  String get stockAdjustment_highestValue;

  /// No description provided for @stockAdjustment_lowestValue.
  ///
  /// In en, this message translates to:
  /// **'Lowest Value'**
  String get stockAdjustment_lowestValue;

  /// No description provided for @stockAdjustment_pcs.
  ///
  /// In en, this message translates to:
  /// **'pcs'**
  String get stockAdjustment_pcs;

  /// No description provided for @stockAdjustment_searchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get stockAdjustment_searchProducts;

  /// No description provided for @stockAdjustment_noProductsWithStock.
  ///
  /// In en, this message translates to:
  /// **'No products with stock available'**
  String get stockAdjustment_noProductsWithStock;

  /// No description provided for @stockAdjustment_noStockAvailable.
  ///
  /// In en, this message translates to:
  /// **'No stock available for adjustment'**
  String get stockAdjustment_noStockAvailable;

  /// No description provided for @stockAdjustment_qtyExceedsStock.
  ///
  /// In en, this message translates to:
  /// **'Quantity cannot exceed current stock ({stock})'**
  String stockAdjustment_qtyExceedsStock(String stock);

  /// No description provided for @stockAdjustment_serviceCannotBeAdjusted.
  ///
  /// In en, this message translates to:
  /// **'Service products cannot be adjusted'**
  String get stockAdjustment_serviceCannotBeAdjusted;

  /// No description provided for @stockAdjustment_noStockForProduct.
  ///
  /// In en, this message translates to:
  /// **'No stock available for this product'**
  String get stockAdjustment_noStockForProduct;

  /// No description provided for @stockAdjustment_productNotFoundSearching.
  ///
  /// In en, this message translates to:
  /// **'Product not found, searching: {code}'**
  String stockAdjustment_productNotFoundSearching(String code);

  /// No description provided for @stockAdjustment_scanBarcodeToAdd.
  ///
  /// In en, this message translates to:
  /// **'Scan barcode to add product'**
  String get stockAdjustment_scanBarcodeToAdd;

  /// No description provided for @stockAdjustment_setQuantity.
  ///
  /// In en, this message translates to:
  /// **'Set Quantity'**
  String get stockAdjustment_setQuantity;

  /// No description provided for @stockAdjustment_quantityToAdjust.
  ///
  /// In en, this message translates to:
  /// **'Quantity to Adjust'**
  String get stockAdjustment_quantityToAdjust;

  /// No description provided for @stockAdjustment_exampleQty.
  ///
  /// In en, this message translates to:
  /// **'e.g. 3'**
  String get stockAdjustment_exampleQty;

  /// No description provided for @stockAdjustment_maxQty.
  ///
  /// In en, this message translates to:
  /// **'Max: {stock}'**
  String stockAdjustment_maxQty(String stock);

  /// No description provided for @stockAdjustment_enterValidQty.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid quantity'**
  String get stockAdjustment_enterValidQty;

  /// No description provided for @stockAdjustment_stockLabel.
  ///
  /// In en, this message translates to:
  /// **'Stock: {stock}'**
  String stockAdjustment_stockLabel(String stock);

  /// No description provided for @stockAdjustment_addedProduct.
  ///
  /// In en, this message translates to:
  /// **'Added: {name}'**
  String stockAdjustment_addedProduct(String name);

  /// No description provided for @stockAdjustment_editLossValue.
  ///
  /// In en, this message translates to:
  /// **'Edit Loss Value'**
  String get stockAdjustment_editLossValue;

  /// No description provided for @stockAdjustment_lossValue.
  ///
  /// In en, this message translates to:
  /// **'Loss Value'**
  String get stockAdjustment_lossValue;

  /// No description provided for @stockAdjustment_quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get stockAdjustment_quantity;

  /// No description provided for @stockAdjustment_purchasePrice.
  ///
  /// In en, this message translates to:
  /// **'Purchase Price'**
  String get stockAdjustment_purchasePrice;

  /// No description provided for @stockAdjustment_loss.
  ///
  /// In en, this message translates to:
  /// **'Loss'**
  String get stockAdjustment_loss;

  /// No description provided for @stockAdjustmentForm_title.
  ///
  /// In en, this message translates to:
  /// **'Stock Adjustment'**
  String get stockAdjustmentForm_title;

  /// No description provided for @stockAdjustmentForm_scanProductBarcode.
  ///
  /// In en, this message translates to:
  /// **'Scan product barcode'**
  String get stockAdjustmentForm_scanProductBarcode;

  /// No description provided for @stockAdjustmentForm_selectProduct.
  ///
  /// In en, this message translates to:
  /// **'Select product...'**
  String get stockAdjustmentForm_selectProduct;

  /// No description provided for @stockAdjustmentForm_searchProduct.
  ///
  /// In en, this message translates to:
  /// **'Search product...'**
  String get stockAdjustmentForm_searchProduct;

  /// No description provided for @stockAdjustmentForm_pleaseSelectProduct.
  ///
  /// In en, this message translates to:
  /// **'Please select a product'**
  String get stockAdjustmentForm_pleaseSelectProduct;

  /// No description provided for @stockAdjustmentForm_qtyMustBeGreaterThanZero.
  ///
  /// In en, this message translates to:
  /// **'Quantity must be greater than 0'**
  String get stockAdjustmentForm_qtyMustBeGreaterThanZero;

  /// No description provided for @stockAdjustmentForm_productFound.
  ///
  /// In en, this message translates to:
  /// **'Product found: {name}'**
  String stockAdjustmentForm_productFound(String name);

  /// No description provided for @stockAdjustmentForm_productNotFound.
  ///
  /// In en, this message translates to:
  /// **'Product with barcode \"{code}\" not found'**
  String stockAdjustmentForm_productNotFound(String code);

  /// No description provided for @stockAdjustmentForm_selectReason.
  ///
  /// In en, this message translates to:
  /// **'Select reason...'**
  String get stockAdjustmentForm_selectReason;

  /// No description provided for @stockAdjustmentForm_searchReason.
  ///
  /// In en, this message translates to:
  /// **'Search reason...'**
  String get stockAdjustmentForm_searchReason;

  /// No description provided for @stockAdjustmentForm_lossValue.
  ///
  /// In en, this message translates to:
  /// **'Loss Value ({symbol})'**
  String stockAdjustmentForm_lossValue(String symbol);

  /// No description provided for @stockAdjustmentForm_lossValueHint.
  ///
  /// In en, this message translates to:
  /// **'Set to 0 if no financial loss'**
  String get stockAdjustmentForm_lossValueHint;

  /// No description provided for @stockAdjustmentForm_notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get stockAdjustmentForm_notes;

  /// No description provided for @stockAdjustmentForm_notesHint.
  ///
  /// In en, this message translates to:
  /// **'Optional notes about this adjustment...'**
  String get stockAdjustmentForm_notesHint;

  /// No description provided for @stockAdjustmentForm_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get stockAdjustmentForm_summary;

  /// No description provided for @stockAdjustmentForm_stockBefore.
  ///
  /// In en, this message translates to:
  /// **'Stock Before'**
  String get stockAdjustmentForm_stockBefore;

  /// No description provided for @stockAdjustmentForm_adjustment.
  ///
  /// In en, this message translates to:
  /// **'Adjustment'**
  String get stockAdjustmentForm_adjustment;

  /// No description provided for @stockAdjustmentForm_stockAfter.
  ///
  /// In en, this message translates to:
  /// **'Stock After'**
  String get stockAdjustmentForm_stockAfter;

  /// No description provided for @stockAdjustmentForm_expenseWillBeRecorded.
  ///
  /// In en, this message translates to:
  /// **'An expense of {symbol} {amount} will be recorded under \"{category}\"'**
  String stockAdjustmentForm_expenseWillBeRecorded(
    String symbol,
    String amount,
    String category,
  );

  /// No description provided for @stockAdjustmentForm_saveAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Save Adjustment'**
  String get stockAdjustmentForm_saveAdjustment;

  /// No description provided for @stockAdjustmentForm_processingAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Processing adjustment...'**
  String get stockAdjustmentForm_processingAdjustment;

  /// No description provided for @stockAdjustmentReport_title.
  ///
  /// In en, this message translates to:
  /// **'Stock Adjustment Report'**
  String get stockAdjustmentReport_title;

  /// No description provided for @stockAdjustmentReport_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Stock Adjustment'**
  String get stockAdjustmentReport_printPreview;

  /// No description provided for @stockAdjustmentReport_lossValue.
  ///
  /// In en, this message translates to:
  /// **'Loss Value'**
  String get stockAdjustmentReport_lossValue;

  /// No description provided for @stockAdjustmentReport_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get stockAdjustmentReport_summary;

  /// No description provided for @stockAdjustmentReport_transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get stockAdjustmentReport_transactions;

  /// No description provided for @stockAdjustmentReport_totalAdjustments.
  ///
  /// In en, this message translates to:
  /// **'Total Adjustments'**
  String get stockAdjustmentReport_totalAdjustments;

  /// No description provided for @stockAdjustmentReport_totalQty.
  ///
  /// In en, this message translates to:
  /// **'Total Qty'**
  String get stockAdjustmentReport_totalQty;

  /// No description provided for @stockAdjustmentReport_totalLoss.
  ///
  /// In en, this message translates to:
  /// **'Total Loss'**
  String get stockAdjustmentReport_totalLoss;

  /// No description provided for @stockAdjustmentReport_avgLossPerAdj.
  ///
  /// In en, this message translates to:
  /// **'Avg Loss/Adj'**
  String get stockAdjustmentReport_avgLossPerAdj;

  /// No description provided for @stockAdjustmentReport_breakdownByReason.
  ///
  /// In en, this message translates to:
  /// **'Breakdown by Reason'**
  String get stockAdjustmentReport_breakdownByReason;

  /// No description provided for @stockAdjustmentReport_topProductsByLoss.
  ///
  /// In en, this message translates to:
  /// **'Top 5 Products by Loss Value'**
  String get stockAdjustmentReport_topProductsByLoss;

  /// No description provided for @stockAdjustmentReport_adjustmentsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} adjustments'**
  String stockAdjustmentReport_adjustmentsCount(int count);

  /// No description provided for @stockAdjustmentReport_recordsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} records'**
  String stockAdjustmentReport_recordsCount(int count);

  /// No description provided for @stockAdjustmentReport_dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get stockAdjustmentReport_dateRange;

  /// No description provided for @stockAdjustmentReport_selectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select date range...'**
  String get stockAdjustmentReport_selectDateRange;

  /// No description provided for @stockAdjustmentReport_searchDateRange.
  ///
  /// In en, this message translates to:
  /// **'Search date range...'**
  String get stockAdjustmentReport_searchDateRange;

  /// No description provided for @stockAdjustmentReport_selectCustomDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select custom date range'**
  String get stockAdjustmentReport_selectCustomDateRange;

  /// No description provided for @stockAdjustmentReport_allReasons.
  ///
  /// In en, this message translates to:
  /// **'All Reasons'**
  String get stockAdjustmentReport_allReasons;

  /// No description provided for @stockAdjustmentReport_searchReason.
  ///
  /// In en, this message translates to:
  /// **'Search reason...'**
  String get stockAdjustmentReport_searchReason;

  /// No description provided for @stockAdjustmentReport_unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get stockAdjustmentReport_unknown;

  /// No description provided for @stockAdjustmentReport_pcs.
  ///
  /// In en, this message translates to:
  /// **'pcs'**
  String get stockAdjustmentReport_pcs;

  /// No description provided for @stockAdjustmentReport_previousStock.
  ///
  /// In en, this message translates to:
  /// **'Previous Stock'**
  String get stockAdjustmentReport_previousStock;

  /// No description provided for @stockAdjustmentReport_notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get stockAdjustmentReport_notes;

  /// No description provided for @stockAdjustmentReport_quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get stockAdjustmentReport_quantity;

  /// No description provided for @stockAdjustmentReport_detail.
  ///
  /// In en, this message translates to:
  /// **'Adjustment Detail'**
  String get stockAdjustmentReport_detail;

  /// No description provided for @stockAdjustmentReport_items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get stockAdjustmentReport_items;

  /// No description provided for @stockAdjustmentReport_stockChange.
  ///
  /// In en, this message translates to:
  /// **'Stock Change'**
  String get stockAdjustmentReport_stockChange;

  /// No description provided for @stockAdjustmentReport_prevStock.
  ///
  /// In en, this message translates to:
  /// **'Prev: {qty}'**
  String stockAdjustmentReport_prevStock(String qty);

  /// No description provided for @stockAdjustmentCart_title.
  ///
  /// In en, this message translates to:
  /// **'Adjustment Cart'**
  String get stockAdjustmentCart_title;

  /// No description provided for @stockAdjustmentCart_totalItems.
  ///
  /// In en, this message translates to:
  /// **'Total Items'**
  String get stockAdjustmentCart_totalItems;

  /// No description provided for @stockAdjustmentCart_productUnits.
  ///
  /// In en, this message translates to:
  /// **'{products} products ({units} units)'**
  String stockAdjustmentCart_productUnits(int products, String units);

  /// No description provided for @stockAdjustmentCart_totalLossValue.
  ///
  /// In en, this message translates to:
  /// **'Total Loss Value'**
  String get stockAdjustmentCart_totalLossValue;

  /// No description provided for @stockAdjustmentCart_noItemsToAdjust.
  ///
  /// In en, this message translates to:
  /// **'No items to adjust'**
  String get stockAdjustmentCart_noItemsToAdjust;

  /// No description provided for @stockAdjustmentCart_qty.
  ///
  /// In en, this message translates to:
  /// **'Qty:'**
  String get stockAdjustmentCart_qty;

  /// No description provided for @stockAdjustmentCart_lossValue.
  ///
  /// In en, this message translates to:
  /// **'Loss Value'**
  String get stockAdjustmentCart_lossValue;

  /// No description provided for @stockAdjustmentCart_selectReason.
  ///
  /// In en, this message translates to:
  /// **'Select reason...'**
  String get stockAdjustmentCart_selectReason;

  /// No description provided for @stockAdjustmentCart_searchReason.
  ///
  /// In en, this message translates to:
  /// **'Search reason...'**
  String get stockAdjustmentCart_searchReason;

  /// No description provided for @stockAdjustmentCart_notesOptional.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get stockAdjustmentCart_notesOptional;

  /// No description provided for @stockAdjustmentCart_addNotes.
  ///
  /// In en, this message translates to:
  /// **'Add notes...'**
  String get stockAdjustmentCart_addNotes;

  /// No description provided for @stockAdjustmentCart_totalLoss.
  ///
  /// In en, this message translates to:
  /// **'Total Loss'**
  String get stockAdjustmentCart_totalLoss;

  /// No description provided for @stockAdjustmentCart_processAdjustments.
  ///
  /// In en, this message translates to:
  /// **'Process Adjustments'**
  String get stockAdjustmentCart_processAdjustments;

  /// No description provided for @stockAdjustmentCart_processingAdjustments.
  ///
  /// In en, this message translates to:
  /// **'Processing adjustments...'**
  String get stockAdjustmentCart_processingAdjustments;

  /// No description provided for @stockAdjustmentCart_noItemsWarning.
  ///
  /// In en, this message translates to:
  /// **'No items to adjust'**
  String get stockAdjustmentCart_noItemsWarning;

  /// No description provided for @stockAdjustmentCart_processedSuccess.
  ///
  /// In en, this message translates to:
  /// **'{count} adjustment(s) processed successfully'**
  String stockAdjustmentCart_processedSuccess(int count);

  /// No description provided for @stockAdjustmentCart_qtyExceedsStock.
  ///
  /// In en, this message translates to:
  /// **'Quantity cannot exceed current stock ({stock})'**
  String stockAdjustmentCart_qtyExceedsStock(String stock);

  /// No description provided for @stockAdjustmentCart_stockLabel.
  ///
  /// In en, this message translates to:
  /// **'Stock: {stock}'**
  String stockAdjustmentCart_stockLabel(String stock);

  /// No description provided for @stockAdjustmentCart_costLabel.
  ///
  /// In en, this message translates to:
  /// **'Cost: {symbol} {amount}'**
  String stockAdjustmentCart_costLabel(String symbol, String amount);

  /// No description provided for @stockAdjustmentCart_reason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get stockAdjustmentCart_reason;

  /// No description provided for @stockAdjustmentCart_confirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Stock Adjustment'**
  String get stockAdjustmentCart_confirmTitle;

  /// No description provided for @stockAdjustmentCart_confirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to process {count} stock adjustment(s)? This action cannot be undone.'**
  String stockAdjustmentCart_confirmMessage(int count);

  /// No description provided for @printer_title.
  ///
  /// In en, this message translates to:
  /// **'Printer'**
  String get printer_title;

  /// No description provided for @printer_settings.
  ///
  /// In en, this message translates to:
  /// **'Printer Settings'**
  String get printer_settings;

  /// No description provided for @printer_connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get printer_connect;

  /// No description provided for @printer_disconnect.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get printer_disconnect;

  /// No description provided for @printer_testPrint.
  ///
  /// In en, this message translates to:
  /// **'Test Print'**
  String get printer_testPrint;

  /// No description provided for @printer_scanDevices.
  ///
  /// In en, this message translates to:
  /// **'Scan Devices'**
  String get printer_scanDevices;

  /// No description provided for @printer_noDevices.
  ///
  /// In en, this message translates to:
  /// **'No devices found'**
  String get printer_noDevices;

  /// No description provided for @printer_connected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get printer_connected;

  /// No description provided for @printer_disconnected.
  ///
  /// In en, this message translates to:
  /// **'Disconnected'**
  String get printer_disconnected;

  /// No description provided for @printer_connecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting...'**
  String get printer_connecting;

  /// No description provided for @printer_printSuccess.
  ///
  /// In en, this message translates to:
  /// **'Print successful'**
  String get printer_printSuccess;

  /// No description provided for @printer_printFailed.
  ///
  /// In en, this message translates to:
  /// **'Print failed'**
  String get printer_printFailed;

  /// No description provided for @printer_refreshDevices.
  ///
  /// In en, this message translates to:
  /// **'Refresh Devices'**
  String get printer_refreshDevices;

  /// No description provided for @printer_initializing.
  ///
  /// In en, this message translates to:
  /// **'Initializing...'**
  String get printer_initializing;

  /// No description provided for @printer_foundDevices.
  ///
  /// In en, this message translates to:
  /// **'Found {count} device(s)'**
  String printer_foundDevices(int count);

  /// No description provided for @printer_connectedTo.
  ///
  /// In en, this message translates to:
  /// **'Connected to {name}'**
  String printer_connectedTo(String name);

  /// No description provided for @printer_failedToConnect.
  ///
  /// In en, this message translates to:
  /// **'Failed to connect to {name}'**
  String printer_failedToConnect(String name);

  /// No description provided for @printer_reconnected.
  ///
  /// In en, this message translates to:
  /// **'Reconnected to {name}'**
  String printer_reconnected(String name);

  /// No description provided for @printer_failedToReconnect.
  ///
  /// In en, this message translates to:
  /// **'Failed to reconnect'**
  String get printer_failedToReconnect;

  /// No description provided for @printer_selectPaperSize.
  ///
  /// In en, this message translates to:
  /// **'Select Paper Size'**
  String get printer_selectPaperSize;

  /// No description provided for @printer_paperSizePrompt.
  ///
  /// In en, this message translates to:
  /// **'Choose the paper size of your thermal printer:'**
  String get printer_paperSizePrompt;

  /// No description provided for @printer_58mm.
  ///
  /// In en, this message translates to:
  /// **'58mm'**
  String get printer_58mm;

  /// No description provided for @printer_80mm.
  ///
  /// In en, this message translates to:
  /// **'80mm'**
  String get printer_80mm;

  /// No description provided for @printer_smallReceipt.
  ///
  /// In en, this message translates to:
  /// **'Small receipt printer'**
  String get printer_smallReceipt;

  /// No description provided for @printer_standardReceipt.
  ///
  /// In en, this message translates to:
  /// **'Standard receipt printer'**
  String get printer_standardReceipt;

  /// No description provided for @printer_printingTest.
  ///
  /// In en, this message translates to:
  /// **'Printing test receipt...'**
  String get printer_printingTest;

  /// No description provided for @printer_testPrinted.
  ///
  /// In en, this message translates to:
  /// **'Test receipt printed!'**
  String get printer_testPrinted;

  /// No description provided for @printer_paperSizeChanged.
  ///
  /// In en, this message translates to:
  /// **'Paper size changed to {size}'**
  String printer_paperSizeChanged(String size);

  /// No description provided for @printer_forgetPrinter.
  ///
  /// In en, this message translates to:
  /// **'Forget Printer'**
  String get printer_forgetPrinter;

  /// No description provided for @printer_forgetMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to forget this printer? You will need to reconnect it later.'**
  String get printer_forgetMessage;

  /// No description provided for @printer_forget.
  ///
  /// In en, this message translates to:
  /// **'Forget'**
  String get printer_forget;

  /// No description provided for @printer_removingPrinter.
  ///
  /// In en, this message translates to:
  /// **'Removing printer...'**
  String get printer_removingPrinter;

  /// No description provided for @printer_removed.
  ///
  /// In en, this message translates to:
  /// **'Printer removed'**
  String get printer_removed;

  /// No description provided for @printer_connectToDevice.
  ///
  /// In en, this message translates to:
  /// **'Connect to this printer'**
  String get printer_connectToDevice;

  /// No description provided for @printer_printTestReceipt.
  ///
  /// In en, this message translates to:
  /// **'Print a test receipt'**
  String get printer_printTestReceipt;

  /// No description provided for @printer_disconnectFromDevice.
  ///
  /// In en, this message translates to:
  /// **'Disconnect from this printer'**
  String get printer_disconnectFromDevice;

  /// No description provided for @printer_changePaperSize.
  ///
  /// In en, this message translates to:
  /// **'Change Paper Size'**
  String get printer_changePaperSize;

  /// No description provided for @printer_currentPaperSize.
  ///
  /// In en, this message translates to:
  /// **'Current: {size}'**
  String printer_currentPaperSize(String size);

  /// No description provided for @printer_removeFromSaved.
  ///
  /// In en, this message translates to:
  /// **'Remove from saved devices'**
  String get printer_removeFromSaved;

  /// No description provided for @printer_bluetoothDisabled.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth Disabled'**
  String get printer_bluetoothDisabled;

  /// No description provided for @printer_enableBluetooth.
  ///
  /// In en, this message translates to:
  /// **'Please enable Bluetooth to connect'**
  String get printer_enableBluetooth;

  /// No description provided for @printer_printerConnected.
  ///
  /// In en, this message translates to:
  /// **'Printer Connected'**
  String get printer_printerConnected;

  /// No description provided for @printer_readyToPrint.
  ///
  /// In en, this message translates to:
  /// **'Ready to print'**
  String get printer_readyToPrint;

  /// No description provided for @printer_online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get printer_online;

  /// No description provided for @printer_noPrinterConnected.
  ///
  /// In en, this message translates to:
  /// **'No Printer Connected'**
  String get printer_noPrinterConnected;

  /// No description provided for @printer_selectDeviceBelow.
  ///
  /// In en, this message translates to:
  /// **'Select a device below to connect'**
  String get printer_selectDeviceBelow;

  /// No description provided for @printer_systemStatus.
  ///
  /// In en, this message translates to:
  /// **'System Status'**
  String get printer_systemStatus;

  /// No description provided for @printer_bluetooth.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth'**
  String get printer_bluetooth;

  /// No description provided for @printer_enabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get printer_enabled;

  /// No description provided for @printer_disabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get printer_disabled;

  /// No description provided for @printer_permission.
  ///
  /// In en, this message translates to:
  /// **'Permission'**
  String get printer_permission;

  /// No description provided for @printer_granted.
  ///
  /// In en, this message translates to:
  /// **'Granted'**
  String get printer_granted;

  /// No description provided for @printer_notGranted.
  ///
  /// In en, this message translates to:
  /// **'Not Granted'**
  String get printer_notGranted;

  /// No description provided for @printer_printer.
  ///
  /// In en, this message translates to:
  /// **'Printer'**
  String get printer_printer;

  /// No description provided for @printer_defaultPrinter.
  ///
  /// In en, this message translates to:
  /// **'Default Printer'**
  String get printer_defaultPrinter;

  /// No description provided for @printer_remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get printer_remove;

  /// No description provided for @printer_availableDevices.
  ///
  /// In en, this message translates to:
  /// **'Available Devices'**
  String get printer_availableDevices;

  /// No description provided for @printer_scanning.
  ///
  /// In en, this message translates to:
  /// **'Scanning...'**
  String get printer_scanning;

  /// No description provided for @printer_refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get printer_refresh;

  /// No description provided for @printer_bluetoothOff.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth is Off'**
  String get printer_bluetoothOff;

  /// No description provided for @printer_enableBluetoothSettings.
  ///
  /// In en, this message translates to:
  /// **'Enable Bluetooth in your device settings to discover printers'**
  String get printer_enableBluetoothSettings;

  /// No description provided for @printer_noDevicesFound.
  ///
  /// In en, this message translates to:
  /// **'No Devices Found'**
  String get printer_noDevicesFound;

  /// No description provided for @printer_pairInSettings.
  ///
  /// In en, this message translates to:
  /// **'Pair your Bluetooth printer in system settings first, then tap Refresh'**
  String get printer_pairInSettings;

  /// No description provided for @printer_printTestReceiptButton.
  ///
  /// In en, this message translates to:
  /// **'Print Test Receipt'**
  String get printer_printTestReceiptButton;

  /// No description provided for @printer_tips.
  ///
  /// In en, this message translates to:
  /// **'Tips'**
  String get printer_tips;

  /// No description provided for @printer_tipsContent.
  ///
  /// In en, this message translates to:
  /// **'• Tap on a device to see options\n• Long press for quick actions\n• Make sure printer is turned on and paired via system Bluetooth settings'**
  String get printer_tipsContent;

  /// No description provided for @printer_initializeFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to initialize: {error}'**
  String printer_initializeFailed(String error);

  /// No description provided for @printer_refreshFailed.
  ///
  /// In en, this message translates to:
  /// **'Refresh failed: {error}'**
  String printer_refreshFailed(String error);

  /// No description provided for @printer_connectionError.
  ///
  /// In en, this message translates to:
  /// **'Connection error: {error}'**
  String printer_connectionError(String error);

  /// No description provided for @printer_reconnectError.
  ///
  /// In en, this message translates to:
  /// **'Reconnect error: {error}'**
  String printer_reconnectError(String error);

  /// No description provided for @printer_printError.
  ///
  /// In en, this message translates to:
  /// **'Print error: {error}'**
  String printer_printError(String error);

  /// No description provided for @salesReport_title.
  ///
  /// In en, this message translates to:
  /// **'Sales Report'**
  String get salesReport_title;

  /// No description provided for @salesReport_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get salesReport_summary;

  /// No description provided for @salesReport_transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get salesReport_transactions;

  /// No description provided for @salesReport_totalSales.
  ///
  /// In en, this message translates to:
  /// **'Total Sales'**
  String get salesReport_totalSales;

  /// No description provided for @salesReport_totalOrders.
  ///
  /// In en, this message translates to:
  /// **'Total Orders'**
  String get salesReport_totalOrders;

  /// No description provided for @salesReport_averageOrder.
  ///
  /// In en, this message translates to:
  /// **'Average Order'**
  String get salesReport_averageOrder;

  /// No description provided for @salesReport_grossProfit.
  ///
  /// In en, this message translates to:
  /// **'Gross Profit'**
  String get salesReport_grossProfit;

  /// No description provided for @salesReport_salesTrend.
  ///
  /// In en, this message translates to:
  /// **'Sales Trend'**
  String get salesReport_salesTrend;

  /// No description provided for @salesReport_topProducts.
  ///
  /// In en, this message translates to:
  /// **'Top 5 Best Sellers'**
  String get salesReport_topProducts;

  /// No description provided for @salesReport_dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get salesReport_dateRange;

  /// No description provided for @salesReport_cashier.
  ///
  /// In en, this message translates to:
  /// **'Cashier'**
  String get salesReport_cashier;

  /// No description provided for @salesReport_allCashiers.
  ///
  /// In en, this message translates to:
  /// **'All Cashiers'**
  String get salesReport_allCashiers;

  /// No description provided for @salesReport_paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get salesReport_paymentMethod;

  /// No description provided for @salesReport_allPaymentMethods.
  ///
  /// In en, this message translates to:
  /// **'All Payment Methods'**
  String get salesReport_allPaymentMethods;

  /// No description provided for @salesReport_noTransactions.
  ///
  /// In en, this message translates to:
  /// **'No transactions found'**
  String get salesReport_noTransactions;

  /// No description provided for @salesReport_orders.
  ///
  /// In en, this message translates to:
  /// **'orders'**
  String get salesReport_orders;

  /// No description provided for @salesReport_cancelled.
  ///
  /// In en, this message translates to:
  /// **'CANCELLED'**
  String get salesReport_cancelled;

  /// No description provided for @salesReport_cancelledOrders.
  ///
  /// In en, this message translates to:
  /// **'Cancelled Orders'**
  String get salesReport_cancelledOrders;

  /// No description provided for @salesReport_cancelledAmount.
  ///
  /// In en, this message translates to:
  /// **'Cancelled Amount'**
  String get salesReport_cancelledAmount;

  /// No description provided for @salesReport_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Sales Report'**
  String get salesReport_printPreview;

  /// No description provided for @salesReport_grandTotal.
  ///
  /// In en, this message translates to:
  /// **'Grand Total'**
  String get salesReport_grandTotal;

  /// No description provided for @salesReport_averageOrderValue.
  ///
  /// In en, this message translates to:
  /// **'Average Order Value'**
  String get salesReport_averageOrderValue;

  /// No description provided for @salesReport_totalTransactions.
  ///
  /// In en, this message translates to:
  /// **'Total Transactions'**
  String get salesReport_totalTransactions;

  /// No description provided for @salesReport_averageTransaction.
  ///
  /// In en, this message translates to:
  /// **'Average Transaction'**
  String get salesReport_averageTransaction;

  /// No description provided for @salesReport_itemCount.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String salesReport_itemCount(int count);

  /// No description provided for @salesReport_subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get salesReport_subtotal;

  /// No description provided for @salesReport_tax.
  ///
  /// In en, this message translates to:
  /// **'Tax ({rate}%)'**
  String salesReport_tax(String rate);

  /// No description provided for @salesReport_amountPaid.
  ///
  /// In en, this message translates to:
  /// **'Amount Paid'**
  String get salesReport_amountPaid;

  /// No description provided for @salesReport_change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get salesReport_change;

  /// No description provided for @salesReport_reprintReceipt.
  ///
  /// In en, this message translates to:
  /// **'Reprint Receipt'**
  String get salesReport_reprintReceipt;

  /// No description provided for @salesReport_voucherDiscount.
  ///
  /// In en, this message translates to:
  /// **'Voucher ({code})'**
  String salesReport_voucherDiscount(String code);

  /// No description provided for @salesReport_cashierLabel.
  ///
  /// In en, this message translates to:
  /// **'Cashier: {name}'**
  String salesReport_cashierLabel(String name);

  /// No description provided for @taxReport_title.
  ///
  /// In en, this message translates to:
  /// **'Tax Report'**
  String get taxReport_title;

  /// No description provided for @taxReport_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get taxReport_summary;

  /// No description provided for @taxReport_transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get taxReport_transactions;

  /// No description provided for @taxReport_totalTax.
  ///
  /// In en, this message translates to:
  /// **'Total Tax'**
  String get taxReport_totalTax;

  /// No description provided for @taxReport_orderCount.
  ///
  /// In en, this message translates to:
  /// **'Order Count'**
  String get taxReport_orderCount;

  /// No description provided for @taxReport_salesBeforeTax.
  ///
  /// In en, this message translates to:
  /// **'Sales Before Tax'**
  String get taxReport_salesBeforeTax;

  /// No description provided for @taxReport_averageTax.
  ///
  /// In en, this message translates to:
  /// **'Average Tax'**
  String get taxReport_averageTax;

  /// No description provided for @taxReport_breakdown.
  ///
  /// In en, this message translates to:
  /// **'Tax Breakdown'**
  String get taxReport_breakdown;

  /// No description provided for @taxReport_taxCollected.
  ///
  /// In en, this message translates to:
  /// **'Tax Collected'**
  String get taxReport_taxCollected;

  /// No description provided for @taxReport_totalWithTax.
  ///
  /// In en, this message translates to:
  /// **'Total with Tax'**
  String get taxReport_totalWithTax;

  /// No description provided for @taxReport_byPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Tax by Payment Method'**
  String get taxReport_byPaymentMethod;

  /// No description provided for @taxReport_trend.
  ///
  /// In en, this message translates to:
  /// **'Tax Trend'**
  String get taxReport_trend;

  /// No description provided for @taxReport_tax.
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get taxReport_tax;

  /// No description provided for @taxReport_noTransactions.
  ///
  /// In en, this message translates to:
  /// **'No transactions found'**
  String get taxReport_noTransactions;

  /// No description provided for @taxReport_orders.
  ///
  /// In en, this message translates to:
  /// **'orders'**
  String get taxReport_orders;

  /// No description provided for @taxReport_walkIn.
  ///
  /// In en, this message translates to:
  /// **'Walk-in Customer'**
  String get taxReport_walkIn;

  /// No description provided for @taxReport_orderId.
  ///
  /// In en, this message translates to:
  /// **'Order ID'**
  String get taxReport_orderId;

  /// No description provided for @taxReport_taxAmount.
  ///
  /// In en, this message translates to:
  /// **'Tax Amount'**
  String get taxReport_taxAmount;

  /// No description provided for @taxReport_paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get taxReport_paymentMethod;

  /// No description provided for @taxReport_cashier.
  ///
  /// In en, this message translates to:
  /// **'Cashier'**
  String get taxReport_cashier;

  /// No description provided for @taxReport_allCashiers.
  ///
  /// In en, this message translates to:
  /// **'All Cashiers'**
  String get taxReport_allCashiers;

  /// No description provided for @taxReport_taxRateInfo.
  ///
  /// In en, this message translates to:
  /// **'Current tax rate: {rate}%'**
  String taxReport_taxRateInfo(String rate);

  /// No description provided for @taxReport_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Tax Report'**
  String get taxReport_printPreview;

  /// No description provided for @expenseReport_title.
  ///
  /// In en, this message translates to:
  /// **'Expense Report'**
  String get expenseReport_title;

  /// No description provided for @expenseReport_totalExpenses.
  ///
  /// In en, this message translates to:
  /// **'Total Expenses'**
  String get expenseReport_totalExpenses;

  /// No description provided for @expenseReport_totalItems.
  ///
  /// In en, this message translates to:
  /// **'Total Items'**
  String get expenseReport_totalItems;

  /// No description provided for @expenseReport_category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get expenseReport_category;

  /// No description provided for @expenseReport_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get expenseReport_description;

  /// No description provided for @expenseReport_transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get expenseReport_transactions;

  /// No description provided for @expenseReport_expensesByCategory.
  ///
  /// In en, this message translates to:
  /// **'Expenses by Category'**
  String get expenseReport_expensesByCategory;

  /// No description provided for @expenseReport_byType.
  ///
  /// In en, this message translates to:
  /// **'By Type'**
  String get expenseReport_byType;

  /// No description provided for @expenseReport_trend.
  ///
  /// In en, this message translates to:
  /// **'Expense Trend'**
  String get expenseReport_trend;

  /// No description provided for @expenseReport_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Expense Report'**
  String get expenseReport_printPreview;

  /// No description provided for @creditReport_title.
  ///
  /// In en, this message translates to:
  /// **'Credit Report'**
  String get creditReport_title;

  /// No description provided for @creditReport_totalCredits.
  ///
  /// In en, this message translates to:
  /// **'Total Credits'**
  String get creditReport_totalCredits;

  /// No description provided for @creditReport_totalCredit.
  ///
  /// In en, this message translates to:
  /// **'Total Credit'**
  String get creditReport_totalCredit;

  /// No description provided for @creditReport_totalPaid.
  ///
  /// In en, this message translates to:
  /// **'Total Paid'**
  String get creditReport_totalPaid;

  /// No description provided for @creditReport_totalOutstanding.
  ///
  /// In en, this message translates to:
  /// **'Total Outstanding'**
  String get creditReport_totalOutstanding;

  /// No description provided for @creditReport_totalRemaining.
  ///
  /// In en, this message translates to:
  /// **'Total Remaining'**
  String get creditReport_totalRemaining;

  /// No description provided for @creditReport_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get creditReport_amount;

  /// No description provided for @creditReport_paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get creditReport_paid;

  /// No description provided for @creditReport_remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get creditReport_remaining;

  /// No description provided for @creditReport_transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get creditReport_transactions;

  /// No description provided for @creditReport_customerSummary.
  ///
  /// In en, this message translates to:
  /// **'Customer Summary'**
  String get creditReport_customerSummary;

  /// No description provided for @creditReport_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Credit Report'**
  String get creditReport_printPreview;

  /// No description provided for @debtReport_title.
  ///
  /// In en, this message translates to:
  /// **'Debt Report'**
  String get debtReport_title;

  /// No description provided for @debtReport_totalDebts.
  ///
  /// In en, this message translates to:
  /// **'Total Debts'**
  String get debtReport_totalDebts;

  /// No description provided for @debtReport_totalPaid.
  ///
  /// In en, this message translates to:
  /// **'Total Paid'**
  String get debtReport_totalPaid;

  /// No description provided for @debtReport_totalOutstanding.
  ///
  /// In en, this message translates to:
  /// **'Total Outstanding'**
  String get debtReport_totalOutstanding;

  /// No description provided for @debtReport_totalSuppliers.
  ///
  /// In en, this message translates to:
  /// **'Total Suppliers'**
  String get debtReport_totalSuppliers;

  /// No description provided for @debtReport_suppliersWithDebt.
  ///
  /// In en, this message translates to:
  /// **'Suppliers with Debt'**
  String get debtReport_suppliersWithDebt;

  /// No description provided for @debtReport_supplierSummary.
  ///
  /// In en, this message translates to:
  /// **'Supplier Summary'**
  String get debtReport_supplierSummary;

  /// No description provided for @debtReport_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Debt Report'**
  String get debtReport_printPreview;

  /// No description provided for @cashflowReport_title.
  ///
  /// In en, this message translates to:
  /// **'Cash Flow Report'**
  String get cashflowReport_title;

  /// No description provided for @cashflowReport_income.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get cashflowReport_income;

  /// No description provided for @cashflowReport_expense.
  ///
  /// In en, this message translates to:
  /// **'Expense'**
  String get cashflowReport_expense;

  /// No description provided for @cashflowReport_netCashflow.
  ///
  /// In en, this message translates to:
  /// **'Net Cash Flow'**
  String get cashflowReport_netCashflow;

  /// No description provided for @cashflowReport_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get cashflowReport_summary;

  /// No description provided for @cashflowReport_transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get cashflowReport_transactions;

  /// No description provided for @cashflowReport_cashIn.
  ///
  /// In en, this message translates to:
  /// **'Cash In'**
  String get cashflowReport_cashIn;

  /// No description provided for @cashflowReport_cashOut.
  ///
  /// In en, this message translates to:
  /// **'Cash Out'**
  String get cashflowReport_cashOut;

  /// No description provided for @cashflowReport_breakdownByType.
  ///
  /// In en, this message translates to:
  /// **'Breakdown by Type'**
  String get cashflowReport_breakdownByType;

  /// No description provided for @cashflowReport_salesIncome.
  ///
  /// In en, this message translates to:
  /// **'Sales Income'**
  String get cashflowReport_salesIncome;

  /// No description provided for @cashflowReport_creditPayments.
  ///
  /// In en, this message translates to:
  /// **'Credit Payments'**
  String get cashflowReport_creditPayments;

  /// No description provided for @cashflowReport_debtPayments.
  ///
  /// In en, this message translates to:
  /// **'Debt Payments'**
  String get cashflowReport_debtPayments;

  /// No description provided for @cashflowReport_expenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get cashflowReport_expenses;

  /// No description provided for @cashflowReport_noTransactionsInPeriod.
  ///
  /// In en, this message translates to:
  /// **'No transactions in this period'**
  String get cashflowReport_noTransactionsInPeriod;

  /// No description provided for @cashflowReport_noTransactionsFound.
  ///
  /// In en, this message translates to:
  /// **'No transactions found'**
  String get cashflowReport_noTransactionsFound;

  /// No description provided for @cashflowReport_itemsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String cashflowReport_itemsCount(int count);

  /// No description provided for @cashflowReport_dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get cashflowReport_dateRange;

  /// No description provided for @cashflowReport_selectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select date range...'**
  String get cashflowReport_selectDateRange;

  /// No description provided for @cashflowReport_searchDateRange.
  ///
  /// In en, this message translates to:
  /// **'Search date range...'**
  String get cashflowReport_searchDateRange;

  /// No description provided for @cashflowReport_selectCustomDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select custom date range'**
  String get cashflowReport_selectCustomDateRange;

  /// No description provided for @cashflowReport_sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get cashflowReport_sales;

  /// No description provided for @cashflowReport_creditPaymentLabel.
  ///
  /// In en, this message translates to:
  /// **'Credit Payment'**
  String get cashflowReport_creditPaymentLabel;

  /// No description provided for @cashflowReport_debtPaymentLabel.
  ///
  /// In en, this message translates to:
  /// **'Debt Payment'**
  String get cashflowReport_debtPaymentLabel;

  /// No description provided for @cashflowReport_expenseLabel.
  ///
  /// In en, this message translates to:
  /// **'Expense'**
  String get cashflowReport_expenseLabel;

  /// No description provided for @cashflowReport_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Cashflow?'**
  String get cashflowReport_helpTitle;

  /// No description provided for @cashflowReport_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Cashflow shows the actual movement of cash in and out of your business - when money actually changes hands.'**
  String get cashflowReport_helpDescription;

  /// No description provided for @cashflowReport_helpCashSales.
  ///
  /// In en, this message translates to:
  /// **'Cash sales (paid immediately)'**
  String get cashflowReport_helpCashSales;

  /// No description provided for @cashflowReport_helpCreditPayments.
  ///
  /// In en, this message translates to:
  /// **'Credit payments from customers'**
  String get cashflowReport_helpCreditPayments;

  /// No description provided for @cashflowReport_helpCashOverage.
  ///
  /// In en, this message translates to:
  /// **'Cash overage'**
  String get cashflowReport_helpCashOverage;

  /// No description provided for @cashflowReport_helpOwnerDeposit.
  ///
  /// In en, this message translates to:
  /// **'Owner deposits / cash in'**
  String get cashflowReport_helpOwnerDeposit;

  /// No description provided for @cashflowReport_helpCashPurchases.
  ///
  /// In en, this message translates to:
  /// **'Cash purchases (PO paid in cash)'**
  String get cashflowReport_helpCashPurchases;

  /// No description provided for @cashflowReport_helpDebtPayments.
  ///
  /// In en, this message translates to:
  /// **'Debt payments to suppliers'**
  String get cashflowReport_helpDebtPayments;

  /// No description provided for @cashflowReport_helpExpenses.
  ///
  /// In en, this message translates to:
  /// **'Business expenses'**
  String get cashflowReport_helpExpenses;

  /// No description provided for @cashflowReport_helpCashShortage.
  ///
  /// In en, this message translates to:
  /// **'Cash shortage'**
  String get cashflowReport_helpCashShortage;

  /// No description provided for @cashflowReport_helpNotIncluded.
  ///
  /// In en, this message translates to:
  /// **'Not Included'**
  String get cashflowReport_helpNotIncluded;

  /// No description provided for @cashflowReport_helpOpeningBalance.
  ///
  /// In en, this message translates to:
  /// **'Opening balance (not a transaction)'**
  String get cashflowReport_helpOpeningBalance;

  /// No description provided for @cashflowReport_helpCreditSales.
  ///
  /// In en, this message translates to:
  /// **'Credit sales (no cash yet)'**
  String get cashflowReport_helpCreditSales;

  /// No description provided for @cashflowReport_helpCreditPurchases.
  ///
  /// In en, this message translates to:
  /// **'Credit purchases (no cash out yet)'**
  String get cashflowReport_helpCreditPurchases;

  /// No description provided for @cashflowReport_otherCashIn.
  ///
  /// In en, this message translates to:
  /// **'Other Cash In'**
  String get cashflowReport_otherCashIn;

  /// No description provided for @cashflowReport_otherCashOut.
  ///
  /// In en, this message translates to:
  /// **'Other Cash Out'**
  String get cashflowReport_otherCashOut;

  /// No description provided for @cashflowReport_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Cash Flow'**
  String get cashflowReport_printPreview;

  /// No description provided for @cashflowReport_totalCashIn.
  ///
  /// In en, this message translates to:
  /// **'Total Cash In'**
  String get cashflowReport_totalCashIn;

  /// No description provided for @cashflowReport_totalCashOut.
  ///
  /// In en, this message translates to:
  /// **'Total Cash Out'**
  String get cashflowReport_totalCashOut;

  /// No description provided for @cashflowReport_negativeFlow.
  ///
  /// In en, this message translates to:
  /// **'Negative Cash Flow'**
  String get cashflowReport_negativeFlow;

  /// No description provided for @capitalReport_title.
  ///
  /// In en, this message translates to:
  /// **'Capital Report'**
  String get capitalReport_title;

  /// No description provided for @capitalReport_openingBalance.
  ///
  /// In en, this message translates to:
  /// **'Opening Balance'**
  String get capitalReport_openingBalance;

  /// No description provided for @capitalReport_additionalCapital.
  ///
  /// In en, this message translates to:
  /// **'Additional Capital'**
  String get capitalReport_additionalCapital;

  /// No description provided for @capitalReport_cashOverage.
  ///
  /// In en, this message translates to:
  /// **'Cash Overage'**
  String get capitalReport_cashOverage;

  /// No description provided for @capitalReport_totalCapital.
  ///
  /// In en, this message translates to:
  /// **'Total Capital'**
  String get capitalReport_totalCapital;

  /// No description provided for @capitalReport_composition.
  ///
  /// In en, this message translates to:
  /// **'Capital Composition'**
  String get capitalReport_composition;

  /// No description provided for @capitalReport_sessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get capitalReport_sessions;

  /// No description provided for @capitalReport_totalSessions.
  ///
  /// In en, this message translates to:
  /// **'Total Sessions'**
  String get capitalReport_totalSessions;

  /// No description provided for @capitalReport_noSessions.
  ///
  /// In en, this message translates to:
  /// **'No sessions found in this period'**
  String get capitalReport_noSessions;

  /// No description provided for @capitalReport_openedBy.
  ///
  /// In en, this message translates to:
  /// **'Opened by'**
  String get capitalReport_openedBy;

  /// No description provided for @capitalReport_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Capital Report'**
  String get capitalReport_printPreview;

  /// No description provided for @capitalReport_cashIn.
  ///
  /// In en, this message translates to:
  /// **'Cash In'**
  String get capitalReport_cashIn;

  /// No description provided for @capitalReport_capitalBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Capital Breakdown'**
  String get capitalReport_capitalBreakdown;

  /// No description provided for @paymentMethodReport_title.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get paymentMethodReport_title;

  /// No description provided for @paymentMethodReport_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get paymentMethodReport_summary;

  /// No description provided for @paymentMethodReport_transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get paymentMethodReport_transactions;

  /// No description provided for @paymentMethodReport_totalRevenue.
  ///
  /// In en, this message translates to:
  /// **'Total Revenue'**
  String get paymentMethodReport_totalRevenue;

  /// No description provided for @paymentMethodReport_avgValue.
  ///
  /// In en, this message translates to:
  /// **'Avg Value'**
  String get paymentMethodReport_avgValue;

  /// No description provided for @paymentMethodReport_methodsUsed.
  ///
  /// In en, this message translates to:
  /// **'Methods Used'**
  String get paymentMethodReport_methodsUsed;

  /// No description provided for @paymentMethodReport_paymentDistribution.
  ///
  /// In en, this message translates to:
  /// **'Payment Distribution'**
  String get paymentMethodReport_paymentDistribution;

  /// No description provided for @paymentMethodReport_paymentDetails.
  ///
  /// In en, this message translates to:
  /// **'Payment Details'**
  String get paymentMethodReport_paymentDetails;

  /// No description provided for @paymentMethodReport_noPaymentData.
  ///
  /// In en, this message translates to:
  /// **'No payment data for this period'**
  String get paymentMethodReport_noPaymentData;

  /// No description provided for @paymentMethodReport_noTransactions.
  ///
  /// In en, this message translates to:
  /// **'No transactions for this period'**
  String get paymentMethodReport_noTransactions;

  /// No description provided for @paymentMethodReport_transactionsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} orders'**
  String paymentMethodReport_transactionsCount(int count);

  /// No description provided for @paymentMethodReport_paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethodReport_paymentMethod;

  /// No description provided for @paymentMethodReport_allMethods.
  ///
  /// In en, this message translates to:
  /// **'All Methods'**
  String get paymentMethodReport_allMethods;

  /// No description provided for @paymentMethodReport_searchPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Search payment method...'**
  String get paymentMethodReport_searchPaymentMethod;

  /// No description provided for @paymentMethodReport_orderId.
  ///
  /// In en, this message translates to:
  /// **'Order ID'**
  String get paymentMethodReport_orderId;

  /// No description provided for @paymentMethodReport_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get paymentMethodReport_total;

  /// No description provided for @paymentMethodReport_customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get paymentMethodReport_customer;

  /// No description provided for @paymentMethodReport_cashier.
  ///
  /// In en, this message translates to:
  /// **'Cashier'**
  String get paymentMethodReport_cashier;

  /// No description provided for @paymentMethodReport_cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get paymentMethodReport_cash;

  /// No description provided for @paymentMethodReport_qris.
  ///
  /// In en, this message translates to:
  /// **'QRIS'**
  String get paymentMethodReport_qris;

  /// No description provided for @paymentMethodReport_bankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get paymentMethodReport_bankTransfer;

  /// No description provided for @paymentMethodReport_credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get paymentMethodReport_credit;

  /// No description provided for @paymentMethodReport_txnPercent.
  ///
  /// In en, this message translates to:
  /// **'{count} txn • {percent}%'**
  String paymentMethodReport_txnPercent(int count, String percent);

  /// No description provided for @paymentMethodReport_avgLabel.
  ///
  /// In en, this message translates to:
  /// **'Avg: {value}'**
  String paymentMethodReport_avgLabel(String value);

  /// No description provided for @paymentMethodReport_transactionsLabel.
  ///
  /// In en, this message translates to:
  /// **'{count} transactions'**
  String paymentMethodReport_transactionsLabel(int count);

  /// No description provided for @paymentMethodReport_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Payment Methods'**
  String get paymentMethodReport_printPreview;

  /// No description provided for @paymentMethodReport_breakdown.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods Breakdown'**
  String get paymentMethodReport_breakdown;

  /// No description provided for @paymentMethodReport_transactionCount.
  ///
  /// In en, this message translates to:
  /// **'Transaction Count'**
  String get paymentMethodReport_transactionCount;

  /// No description provided for @paymentMethodReport_totalTransactions.
  ///
  /// In en, this message translates to:
  /// **'Total Transactions'**
  String get paymentMethodReport_totalTransactions;

  /// No description provided for @paymentMethodReport_averageTransaction.
  ///
  /// In en, this message translates to:
  /// **'Average Transaction'**
  String get paymentMethodReport_averageTransaction;

  /// No description provided for @inventoryReport_title.
  ///
  /// In en, this message translates to:
  /// **'Inventory Report'**
  String get inventoryReport_title;

  /// No description provided for @inventoryReport_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get inventoryReport_summary;

  /// No description provided for @inventoryReport_products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get inventoryReport_products;

  /// No description provided for @inventoryReport_totalProducts.
  ///
  /// In en, this message translates to:
  /// **'Total Products'**
  String get inventoryReport_totalProducts;

  /// No description provided for @inventoryReport_stockValue.
  ///
  /// In en, this message translates to:
  /// **'Stock Value'**
  String get inventoryReport_stockValue;

  /// No description provided for @inventoryReport_totalValue.
  ///
  /// In en, this message translates to:
  /// **'Total Value'**
  String get inventoryReport_totalValue;

  /// No description provided for @inventoryReport_lowStock.
  ///
  /// In en, this message translates to:
  /// **'Low Stock'**
  String get inventoryReport_lowStock;

  /// No description provided for @inventoryReport_outOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get inventoryReport_outOfStock;

  /// No description provided for @inventoryReport_allProducts.
  ///
  /// In en, this message translates to:
  /// **'All Products'**
  String get inventoryReport_allProducts;

  /// No description provided for @inventoryReport_stockStatus.
  ///
  /// In en, this message translates to:
  /// **'Stock Status'**
  String get inventoryReport_stockStatus;

  /// No description provided for @inventoryReport_selectStatus.
  ///
  /// In en, this message translates to:
  /// **'Select status...'**
  String get inventoryReport_selectStatus;

  /// No description provided for @inventoryReport_valueSummary.
  ///
  /// In en, this message translates to:
  /// **'Value Summary'**
  String get inventoryReport_valueSummary;

  /// No description provided for @inventoryReport_stockValueCost.
  ///
  /// In en, this message translates to:
  /// **'Stock Value (Cost)'**
  String get inventoryReport_stockValueCost;

  /// No description provided for @inventoryReport_retailValue.
  ///
  /// In en, this message translates to:
  /// **'Retail Value'**
  String get inventoryReport_retailValue;

  /// No description provided for @inventoryReport_potentialProfit.
  ///
  /// In en, this message translates to:
  /// **'Potential Profit'**
  String get inventoryReport_potentialProfit;

  /// No description provided for @inventoryReport_topProductsByValue.
  ///
  /// In en, this message translates to:
  /// **'Top 5 Products by Value'**
  String get inventoryReport_topProductsByValue;

  /// No description provided for @inventoryReport_pcsInStock.
  ///
  /// In en, this message translates to:
  /// **'{count} pcs in stock'**
  String inventoryReport_pcsInStock(String count);

  /// No description provided for @inventoryReport_pcs.
  ///
  /// In en, this message translates to:
  /// **'{count} pcs'**
  String inventoryReport_pcs(String count);

  /// No description provided for @inventoryReport_itemsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String inventoryReport_itemsCount(int count);

  /// No description provided for @inventoryReport_noProductsFound.
  ///
  /// In en, this message translates to:
  /// **'No products found'**
  String get inventoryReport_noProductsFound;

  /// No description provided for @inventoryReport_uncategorized.
  ///
  /// In en, this message translates to:
  /// **'Uncategorized'**
  String get inventoryReport_uncategorized;

  /// No description provided for @inventoryReport_totalStockValue.
  ///
  /// In en, this message translates to:
  /// **'Total Stock Value'**
  String get inventoryReport_totalStockValue;

  /// No description provided for @inventoryReport_totalRetailValue.
  ///
  /// In en, this message translates to:
  /// **'Total Retail Value'**
  String get inventoryReport_totalRetailValue;

  /// No description provided for @settings_title.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get settings_title;

  /// No description provided for @settings_storeInfo.
  ///
  /// In en, this message translates to:
  /// **'Store Information'**
  String get settings_storeInfo;

  /// No description provided for @settings_storeName.
  ///
  /// In en, this message translates to:
  /// **'Store Name'**
  String get settings_storeName;

  /// No description provided for @settings_storeAddress.
  ///
  /// In en, this message translates to:
  /// **'Store Address'**
  String get settings_storeAddress;

  /// No description provided for @settings_storeContact.
  ///
  /// In en, this message translates to:
  /// **'Store Contact'**
  String get settings_storeContact;

  /// No description provided for @settings_receiptLogo.
  ///
  /// In en, this message translates to:
  /// **'Receipt Logo'**
  String get settings_receiptLogo;

  /// No description provided for @settings_currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get settings_currency;

  /// No description provided for @settings_currencySymbol.
  ///
  /// In en, this message translates to:
  /// **'Currency Symbol'**
  String get settings_currencySymbol;

  /// No description provided for @settings_tax.
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get settings_tax;

  /// No description provided for @settings_taxRate.
  ///
  /// In en, this message translates to:
  /// **'Tax Rate'**
  String get settings_taxRate;

  /// No description provided for @settings_tableMode.
  ///
  /// In en, this message translates to:
  /// **'Table Mode'**
  String get settings_tableMode;

  /// No description provided for @settings_tableModeDesc.
  ///
  /// In en, this message translates to:
  /// **'Enable table selection in POS'**
  String get settings_tableModeDesc;

  /// No description provided for @settings_creditSale.
  ///
  /// In en, this message translates to:
  /// **'Credit Sale'**
  String get settings_creditSale;

  /// No description provided for @settings_creditSaleDesc.
  ///
  /// In en, this message translates to:
  /// **'Allow credit sales to customers'**
  String get settings_creditSaleDesc;

  /// No description provided for @settings_sellOutOfStock.
  ///
  /// In en, this message translates to:
  /// **'Sell Out of Stock'**
  String get settings_sellOutOfStock;

  /// No description provided for @settings_sellOutOfStockDesc.
  ///
  /// In en, this message translates to:
  /// **'Allow selling products with 0 stock'**
  String get settings_sellOutOfStockDesc;

  /// No description provided for @settings_editPurchasePrice.
  ///
  /// In en, this message translates to:
  /// **'Edit Purchase Price'**
  String get settings_editPurchasePrice;

  /// No description provided for @settings_editPurchasePriceDesc.
  ///
  /// In en, this message translates to:
  /// **'Allow editing purchase price in POS'**
  String get settings_editPurchasePriceDesc;

  /// No description provided for @settings_menuVisibility.
  ///
  /// In en, this message translates to:
  /// **'Menu Visibility'**
  String get settings_menuVisibility;

  /// No description provided for @settings_userRoleMenus.
  ///
  /// In en, this message translates to:
  /// **'User Role Menus'**
  String get settings_userRoleMenus;

  /// No description provided for @settings_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settings_language;

  /// No description provided for @settings_languageDesc.
  ///
  /// In en, this message translates to:
  /// **'Select app language'**
  String get settings_languageDesc;

  /// No description provided for @settings_english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settings_english;

  /// No description provided for @settings_indonesian.
  ///
  /// In en, this message translates to:
  /// **'Indonesian'**
  String get settings_indonesian;

  /// No description provided for @settings_saved.
  ///
  /// In en, this message translates to:
  /// **'Settings saved successfully'**
  String get settings_saved;

  /// No description provided for @settings_requireCashDrawer.
  ///
  /// In en, this message translates to:
  /// **'Require Cash Drawer'**
  String get settings_requireCashDrawer;

  /// No description provided for @settings_cashDrawerEnabled.
  ///
  /// In en, this message translates to:
  /// **'Cash drawer requirement enabled'**
  String get settings_cashDrawerEnabled;

  /// No description provided for @settings_cashDrawerDisabled.
  ///
  /// In en, this message translates to:
  /// **'Cash drawer requirement disabled'**
  String get settings_cashDrawerDisabled;

  /// No description provided for @settings_cashDrawerEnabledDesc.
  ///
  /// In en, this message translates to:
  /// **'Users must open a cash drawer session before accessing the app.'**
  String get settings_cashDrawerEnabledDesc;

  /// No description provided for @settings_cashDrawerDisabledDesc.
  ///
  /// In en, this message translates to:
  /// **'Cash drawer is optional, users can access the app freely.'**
  String get settings_cashDrawerDisabledDesc;

  /// No description provided for @settings_cashDrawerLocked.
  ///
  /// In en, this message translates to:
  /// **'App locked until session opened'**
  String get settings_cashDrawerLocked;

  /// No description provided for @settings_cashDrawerUnlocked.
  ///
  /// In en, this message translates to:
  /// **'No session required to access app'**
  String get settings_cashDrawerUnlocked;

  /// No description provided for @settings_general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settings_general;

  /// No description provided for @settings_sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get settings_sales;

  /// No description provided for @settings_menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get settings_menu;

  /// No description provided for @settings_pricing.
  ///
  /// In en, this message translates to:
  /// **'Pricing'**
  String get settings_pricing;

  /// No description provided for @developer_title.
  ///
  /// In en, this message translates to:
  /// **'Developer Tools'**
  String get developer_title;

  /// No description provided for @developer_warning.
  ///
  /// In en, this message translates to:
  /// **'These actions are destructive and cannot be undone.'**
  String get developer_warning;

  /// No description provided for @developer_note.
  ///
  /// In en, this message translates to:
  /// **'These tools are intended for development and testing purposes only. Use with caution in production environments.'**
  String get developer_note;

  /// No description provided for @developer_dataManagement.
  ///
  /// In en, this message translates to:
  /// **'Data Management'**
  String get developer_dataManagement;

  /// No description provided for @developer_deleteAll.
  ///
  /// In en, this message translates to:
  /// **'Delete All'**
  String get developer_deleteAll;

  /// No description provided for @developer_deleteAllDesc.
  ///
  /// In en, this message translates to:
  /// **'Orders, expenses, credits'**
  String get developer_deleteAllDesc;

  /// No description provided for @developer_dummyDataGenerators.
  ///
  /// In en, this message translates to:
  /// **'Dummy Data Generators'**
  String get developer_dummyDataGenerators;

  /// No description provided for @developer_cafe.
  ///
  /// In en, this message translates to:
  /// **'Cafe'**
  String get developer_cafe;

  /// No description provided for @developer_cafeDesc.
  ///
  /// In en, this message translates to:
  /// **'Coffee, tea, pastries'**
  String get developer_cafeDesc;

  /// No description provided for @developer_grocery.
  ///
  /// In en, this message translates to:
  /// **'Grocery'**
  String get developer_grocery;

  /// No description provided for @developer_groceryDesc.
  ///
  /// In en, this message translates to:
  /// **'Fruits, vegetables, dairy'**
  String get developer_groceryDesc;

  /// No description provided for @developer_pharmacy.
  ///
  /// In en, this message translates to:
  /// **'Pharmacy'**
  String get developer_pharmacy;

  /// No description provided for @developer_pharmacyDesc.
  ///
  /// In en, this message translates to:
  /// **'Medicines, vitamins'**
  String get developer_pharmacyDesc;

  /// No description provided for @developer_laundry.
  ///
  /// In en, this message translates to:
  /// **'Laundry'**
  String get developer_laundry;

  /// No description provided for @developer_laundryDesc.
  ///
  /// In en, this message translates to:
  /// **'Wash, dry clean, iron'**
  String get developer_laundryDesc;

  /// No description provided for @developer_padang.
  ///
  /// In en, this message translates to:
  /// **'Padang Restaurant'**
  String get developer_padang;

  /// No description provided for @developer_padangDesc.
  ///
  /// In en, this message translates to:
  /// **'Nasi Padang, rendang, gulai'**
  String get developer_padangDesc;

  /// No description provided for @developer_backupRestore.
  ///
  /// In en, this message translates to:
  /// **'Backup & Restore'**
  String get developer_backupRestore;

  /// No description provided for @developer_backupMasterData.
  ///
  /// In en, this message translates to:
  /// **'Backup Master Data'**
  String get developer_backupMasterData;

  /// No description provided for @developer_backupMasterDataDesc.
  ///
  /// In en, this message translates to:
  /// **'Products, customers, settings'**
  String get developer_backupMasterDataDesc;

  /// No description provided for @developer_backupFullData.
  ///
  /// In en, this message translates to:
  /// **'Backup Full Data'**
  String get developer_backupFullData;

  /// No description provided for @developer_backupFullDataDesc.
  ///
  /// In en, this message translates to:
  /// **'All data including transactions'**
  String get developer_backupFullDataDesc;

  /// No description provided for @developer_restoreMasterData.
  ///
  /// In en, this message translates to:
  /// **'Restore Master Data'**
  String get developer_restoreMasterData;

  /// No description provided for @developer_restoreMasterDataDesc.
  ///
  /// In en, this message translates to:
  /// **'Restore from master backup'**
  String get developer_restoreMasterDataDesc;

  /// No description provided for @developer_restoreFullData.
  ///
  /// In en, this message translates to:
  /// **'Restore Full Data'**
  String get developer_restoreFullData;

  /// No description provided for @developer_restoreFullDataDesc.
  ///
  /// In en, this message translates to:
  /// **'Restore from full backup'**
  String get developer_restoreFullDataDesc;

  /// No description provided for @developer_backupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup Successful'**
  String get developer_backupSuccess;

  /// No description provided for @developer_backupSavedTo.
  ///
  /// In en, this message translates to:
  /// **'Backup file has been saved to:'**
  String get developer_backupSavedTo;

  /// No description provided for @developer_shareBackupHint.
  ///
  /// In en, this message translates to:
  /// **'You can share this file to save it to cloud storage or send to another device.'**
  String get developer_shareBackupHint;

  /// No description provided for @developer_restoreWarning.
  ///
  /// In en, this message translates to:
  /// **'WARNING: This will DELETE all current data before restoring!'**
  String get developer_restoreWarning;

  /// No description provided for @developer_selectFile.
  ///
  /// In en, this message translates to:
  /// **'Select File'**
  String get developer_selectFile;

  /// No description provided for @developer_restoreNow.
  ///
  /// In en, this message translates to:
  /// **'Restore Now'**
  String get developer_restoreNow;

  /// No description provided for @developer_restoringData.
  ///
  /// In en, this message translates to:
  /// **'Restoring data...'**
  String get developer_restoringData;

  /// No description provided for @developer_restoreSuccess.
  ///
  /// In en, this message translates to:
  /// **'Restored {count} collections successfully!'**
  String developer_restoreSuccess(int count);

  /// No description provided for @developer_generateData.
  ///
  /// In en, this message translates to:
  /// **'Generate Data'**
  String get developer_generateData;

  /// No description provided for @developer_deleteAllConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete All Orders'**
  String get developer_deleteAllConfirmTitle;

  /// No description provided for @developer_deleteAllConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete ALL transaction data?\n\nThis action cannot be undone and will:\n• Delete all order records\n• Delete all expense records\n• Delete all credit records\n• Delete all debt records\n• Delete all purchase orders\n• Delete all stock history\n• Delete all stock adjustments\n• Reset all tables to available status\n• Reset all product stock to 0\n• Reset all product purchase price to 0'**
  String get developer_deleteAllConfirmMessage;

  /// No description provided for @developer_finalConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Final Confirmation'**
  String get developer_finalConfirmationTitle;

  /// No description provided for @developer_finalConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'This is your FINAL warning.\n\nAre you absolutely sure you want to delete all transaction data?'**
  String get developer_finalConfirmationMessage;

  /// No description provided for @developer_lastWarningTitle.
  ///
  /// In en, this message translates to:
  /// **'Last Warning'**
  String get developer_lastWarningTitle;

  /// No description provided for @developer_lastWarningMessage.
  ///
  /// In en, this message translates to:
  /// **'This action CANNOT be undone.\n\nAll transaction data will be permanently deleted.\n\nClick the button below to proceed.'**
  String get developer_lastWarningMessage;

  /// No description provided for @developer_iUnderstandDelete.
  ///
  /// In en, this message translates to:
  /// **'I Understand, Delete'**
  String get developer_iUnderstandDelete;

  /// No description provided for @developer_deletingTransactionData.
  ///
  /// In en, this message translates to:
  /// **'Deleting all transaction data...'**
  String get developer_deletingTransactionData;

  /// No description provided for @developer_allDataDeleted.
  ///
  /// In en, this message translates to:
  /// **'All data deleted and tables reset!'**
  String get developer_allDataDeleted;

  /// No description provided for @developer_someDeletionsFailed.
  ///
  /// In en, this message translates to:
  /// **'Some deletions may have failed. Check your data.'**
  String get developer_someDeletionsFailed;

  /// No description provided for @developer_destroyAllData.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get developer_destroyAllData;

  /// No description provided for @developer_destroyAllDataDesc.
  ///
  /// In en, this message translates to:
  /// **'Reset app to first time setup'**
  String get developer_destroyAllDataDesc;

  /// No description provided for @developer_destroyAllDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset App'**
  String get developer_destroyAllDataTitle;

  /// No description provided for @developer_destroyAllDataMessage.
  ///
  /// In en, this message translates to:
  /// **'WARNING: This will DELETE ALL DATA including:\n\n• All products and categories\n• All customers and suppliers\n• All orders and transactions\n• All users (you will be logged out)\n• All settings\n\nThe app will return to first time setup.'**
  String get developer_destroyAllDataMessage;

  /// No description provided for @developer_destroyFinalConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Are You Sure?'**
  String get developer_destroyFinalConfirmTitle;

  /// No description provided for @developer_destroyFinalConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'This operation is IRREVERSIBLE.\n\nYou will lose ALL your data and the app will reset to initial state.\n\nAre you absolutely sure?'**
  String get developer_destroyFinalConfirmMessage;

  /// No description provided for @developer_destroyLastWarningTitle.
  ///
  /// In en, this message translates to:
  /// **'Point of No Return'**
  String get developer_destroyLastWarningTitle;

  /// No description provided for @developer_destroyLastWarningMessage.
  ///
  /// In en, this message translates to:
  /// **'This is your FINAL chance to cancel.\n\nOnce you click the button below, ALL DATA will be permanently deleted.\n\nThere is NO way to recover your data after this.'**
  String get developer_destroyLastWarningMessage;

  /// No description provided for @developer_destroyNow.
  ///
  /// In en, this message translates to:
  /// **'RESET NOW'**
  String get developer_destroyNow;

  /// No description provided for @developer_destroyingAllData.
  ///
  /// In en, this message translates to:
  /// **'Resetting all data...'**
  String get developer_destroyingAllData;

  /// No description provided for @developer_allDataDestroyed.
  ///
  /// In en, this message translates to:
  /// **'App has been reset to initial state.'**
  String get developer_allDataDestroyed;

  /// No description provided for @developer_generatingData.
  ///
  /// In en, this message translates to:
  /// **'Generating {type} data...'**
  String developer_generatingData(String type);

  /// No description provided for @developer_dataGenerated.
  ///
  /// In en, this message translates to:
  /// **'{type} data generated! {modeLabel}'**
  String developer_dataGenerated(String type, String modeLabel);

  /// No description provided for @developer_tableModeEnabled.
  ///
  /// In en, this message translates to:
  /// **'Table mode enabled'**
  String get developer_tableModeEnabled;

  /// No description provided for @developer_tableModeDisabled.
  ///
  /// In en, this message translates to:
  /// **'Table mode disabled'**
  String get developer_tableModeDisabled;

  /// No description provided for @developer_errorGeneratingData.
  ///
  /// In en, this message translates to:
  /// **'Error generating data: {error}'**
  String developer_errorGeneratingData(String error);

  /// No description provided for @developer_creatingBackup.
  ///
  /// In en, this message translates to:
  /// **'Creating {type} backup...'**
  String developer_creatingBackup(String type);

  /// No description provided for @developer_backupFailed.
  ///
  /// In en, this message translates to:
  /// **'Backup failed: {error}'**
  String developer_backupFailed(String error);

  /// No description provided for @developer_restoreFailed.
  ///
  /// In en, this message translates to:
  /// **'Restore failed: {error}'**
  String developer_restoreFailed(String error);

  /// No description provided for @developer_invalidBackupFile.
  ///
  /// In en, this message translates to:
  /// **'Invalid backup file format'**
  String get developer_invalidBackupFile;

  /// No description provided for @developer_couldNotReadFile.
  ///
  /// In en, this message translates to:
  /// **'Could not read file'**
  String get developer_couldNotReadFile;

  /// No description provided for @developer_confirmRestore.
  ///
  /// In en, this message translates to:
  /// **'Confirm Restore'**
  String get developer_confirmRestore;

  /// No description provided for @developer_backupInfo.
  ///
  /// In en, this message translates to:
  /// **'Backup Info:'**
  String get developer_backupInfo;

  /// No description provided for @developer_backupType.
  ///
  /// In en, this message translates to:
  /// **'Type: {type}'**
  String developer_backupType(String type);

  /// No description provided for @developer_masterDataType.
  ///
  /// In en, this message translates to:
  /// **'Master Data'**
  String get developer_masterDataType;

  /// No description provided for @developer_fullDataType.
  ///
  /// In en, this message translates to:
  /// **'Full Data'**
  String get developer_fullDataType;

  /// No description provided for @developer_backupCreated.
  ///
  /// In en, this message translates to:
  /// **'Created: {date}'**
  String developer_backupCreated(String date);

  /// No description provided for @developer_backupItems.
  ///
  /// In en, this message translates to:
  /// **'Items: {count} records'**
  String developer_backupItems(int count);

  /// No description provided for @developer_proceedWithRestore.
  ///
  /// In en, this message translates to:
  /// **'Proceed with restore?'**
  String get developer_proceedWithRestore;

  /// No description provided for @developer_generateDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Generate {type} Data'**
  String developer_generateDataTitle(String type);

  /// No description provided for @developer_willDeleteExistingData.
  ///
  /// In en, this message translates to:
  /// **'This will DELETE all existing data.'**
  String get developer_willDeleteExistingData;

  /// No description provided for @developer_demoMode.
  ///
  /// In en, this message translates to:
  /// **'Demo Mode'**
  String get developer_demoMode;

  /// No description provided for @developer_withStockTransactions.
  ///
  /// In en, this message translates to:
  /// **'With Stock & Transactions'**
  String get developer_withStockTransactions;

  /// No description provided for @developer_withStockTransactionsDesc.
  ///
  /// In en, this message translates to:
  /// **'Include stock, orders, credits data'**
  String get developer_withStockTransactionsDesc;

  /// No description provided for @developer_emptyMode.
  ///
  /// In en, this message translates to:
  /// **'Empty Mode'**
  String get developer_emptyMode;

  /// No description provided for @developer_emptyModeDesc.
  ///
  /// In en, this message translates to:
  /// **'Products & categories only, no transactions'**
  String get developer_emptyModeDesc;

  /// No description provided for @developer_productOptions.
  ///
  /// In en, this message translates to:
  /// **'Product Options'**
  String get developer_productOptions;

  /// No description provided for @developer_stockTracking.
  ///
  /// In en, this message translates to:
  /// **'Stock Tracking'**
  String get developer_stockTracking;

  /// No description provided for @developer_stockTrackingDesc.
  ///
  /// In en, this message translates to:
  /// **'Track product stock levels'**
  String get developer_stockTrackingDesc;

  /// No description provided for @developer_serviceProducts.
  ///
  /// In en, this message translates to:
  /// **'Service Products'**
  String get developer_serviceProducts;

  /// No description provided for @developer_serviceProductsDesc.
  ///
  /// In en, this message translates to:
  /// **'Products are services (no physical stock)'**
  String get developer_serviceProductsDesc;

  /// No description provided for @developer_allowCommaQuantity.
  ///
  /// In en, this message translates to:
  /// **'Allow Comma Quantity'**
  String get developer_allowCommaQuantity;

  /// No description provided for @developer_allowCommaQuantityDesc.
  ///
  /// In en, this message translates to:
  /// **'Allow decimal quantities (e.g., 1.5 kg)'**
  String get developer_allowCommaQuantityDesc;

  /// No description provided for @developer_appSettings.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get developer_appSettings;

  /// No description provided for @developer_tableMode.
  ///
  /// In en, this message translates to:
  /// **'Table Mode'**
  String get developer_tableMode;

  /// No description provided for @developer_tableModeDesc.
  ///
  /// In en, this message translates to:
  /// **'Enable table selection in POS'**
  String get developer_tableModeDesc;

  /// No description provided for @developer_sellOutOfStock.
  ///
  /// In en, this message translates to:
  /// **'Sell Out of Stock'**
  String get developer_sellOutOfStock;

  /// No description provided for @developer_sellOutOfStockDesc.
  ///
  /// In en, this message translates to:
  /// **'Allow selling products with 0 stock'**
  String get developer_sellOutOfStockDesc;

  /// No description provided for @developer_restoreMasterDataWarning.
  ///
  /// In en, this message translates to:
  /// **'WARNING: This will DELETE all current master data before restoring!\n\nMaster data includes:\n• Products & Categories\n• Customers & Suppliers\n• Variants & Vouchers\n• Tables & Users\n• Payment Methods & Expense Types\n\nTransaction data will NOT be affected.\n\nAre you sure you want to continue?'**
  String get developer_restoreMasterDataWarning;

  /// No description provided for @developer_restoreFullDataWarning.
  ///
  /// In en, this message translates to:
  /// **'CRITICAL WARNING: This will DELETE ALL current data before restoring!\n\nThis includes:\n• All master data (Products, Customers, etc.)\n• All transactions (Orders, Expenses, etc.)\n• All credits and debts\n• All settings\n\nThis action CANNOT be undone!\n\nAre you sure you want to continue?'**
  String get developer_restoreFullDataWarning;

  /// No description provided for @developer_kasirBaikBackup.
  ///
  /// In en, this message translates to:
  /// **'Kasir Baik Backup'**
  String get developer_kasirBaikBackup;

  /// No description provided for @developer_backupFile.
  ///
  /// In en, this message translates to:
  /// **'Backup file: {fileName}'**
  String developer_backupFile(String fileName);

  /// No description provided for @developer_data.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get developer_data;

  /// No description provided for @developer_unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get developer_unknown;

  /// No description provided for @profile_title.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile_title;

  /// No description provided for @profile_editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profile_editProfile;

  /// No description provided for @profile_changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get profile_changePassword;

  /// No description provided for @profile_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profile_logout;

  /// No description provided for @payment_title.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment_title;

  /// No description provided for @payment_selectMethod.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get payment_selectMethod;

  /// No description provided for @payment_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get payment_amount;

  /// No description provided for @payment_amountPaid.
  ///
  /// In en, this message translates to:
  /// **'Amount Paid'**
  String get payment_amountPaid;

  /// No description provided for @payment_amountDue.
  ///
  /// In en, this message translates to:
  /// **'Amount Due'**
  String get payment_amountDue;

  /// No description provided for @payment_change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get payment_change;

  /// No description provided for @payment_notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get payment_notes;

  /// No description provided for @payment_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm Payment'**
  String get payment_confirm;

  /// No description provided for @payment_success.
  ///
  /// In en, this message translates to:
  /// **'Payment successful!'**
  String get payment_success;

  /// No description provided for @payment_failed.
  ///
  /// In en, this message translates to:
  /// **'Payment failed'**
  String get payment_failed;

  /// No description provided for @order_orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get order_orderDetails;

  /// No description provided for @order_orderId.
  ///
  /// In en, this message translates to:
  /// **'Order ID'**
  String get order_orderId;

  /// No description provided for @order_orderDate.
  ///
  /// In en, this message translates to:
  /// **'Order Date'**
  String get order_orderDate;

  /// No description provided for @order_orderStatus.
  ///
  /// In en, this message translates to:
  /// **'Order Status'**
  String get order_orderStatus;

  /// No description provided for @order_paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get order_paid;

  /// No description provided for @order_unpaid.
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get order_unpaid;

  /// No description provided for @order_partial.
  ///
  /// In en, this message translates to:
  /// **'Partial'**
  String get order_partial;

  /// No description provided for @order_cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get order_cancelled;

  /// No description provided for @order_items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get order_items;

  /// No description provided for @order_notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get order_notes;

  /// No description provided for @validation_required.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get validation_required;

  /// No description provided for @validation_invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get validation_invalidEmail;

  /// No description provided for @validation_minLength.
  ///
  /// In en, this message translates to:
  /// **'Minimum {length} characters'**
  String validation_minLength(int length);

  /// No description provided for @validation_invalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid number'**
  String get validation_invalidNumber;

  /// No description provided for @validation_positiveNumber.
  ///
  /// In en, this message translates to:
  /// **'Must be a positive number'**
  String get validation_positiveNumber;

  /// No description provided for @dateFilter_today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get dateFilter_today;

  /// No description provided for @dateFilter_yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get dateFilter_yesterday;

  /// No description provided for @dateFilter_thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get dateFilter_thisWeek;

  /// No description provided for @dateFilter_lastWeek.
  ///
  /// In en, this message translates to:
  /// **'Last Week'**
  String get dateFilter_lastWeek;

  /// No description provided for @dateFilter_thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get dateFilter_thisMonth;

  /// No description provided for @dateFilter_lastMonth.
  ///
  /// In en, this message translates to:
  /// **'Last Month'**
  String get dateFilter_lastMonth;

  /// No description provided for @dateFilter_custom.
  ///
  /// In en, this message translates to:
  /// **'Custom Range'**
  String get dateFilter_custom;

  /// No description provided for @dateFilter_selectCustomRange.
  ///
  /// In en, this message translates to:
  /// **'Select custom date range'**
  String get dateFilter_selectCustomRange;

  /// No description provided for @sortBy_nameAsc.
  ///
  /// In en, this message translates to:
  /// **'Name A-Z'**
  String get sortBy_nameAsc;

  /// No description provided for @sortBy_nameDesc.
  ///
  /// In en, this message translates to:
  /// **'Name Z-A'**
  String get sortBy_nameDesc;

  /// No description provided for @sortBy_priceAsc.
  ///
  /// In en, this message translates to:
  /// **'Price Low-High'**
  String get sortBy_priceAsc;

  /// No description provided for @sortBy_priceDesc.
  ///
  /// In en, this message translates to:
  /// **'Price High-Low'**
  String get sortBy_priceDesc;

  /// No description provided for @sortBy_stockAsc.
  ///
  /// In en, this message translates to:
  /// **'Stock Low-High'**
  String get sortBy_stockAsc;

  /// No description provided for @sortBy_stockDesc.
  ///
  /// In en, this message translates to:
  /// **'Stock High-Low'**
  String get sortBy_stockDesc;

  /// No description provided for @sortBy_dateAsc.
  ///
  /// In en, this message translates to:
  /// **'Oldest First'**
  String get sortBy_dateAsc;

  /// No description provided for @sortBy_dateDesc.
  ///
  /// In en, this message translates to:
  /// **'Newest First'**
  String get sortBy_dateDesc;

  /// No description provided for @sortBy_salesDesc.
  ///
  /// In en, this message translates to:
  /// **'Highest Sales'**
  String get sortBy_salesDesc;

  /// No description provided for @sortBy_salesAsc.
  ///
  /// In en, this message translates to:
  /// **'Lowest Sales'**
  String get sortBy_salesAsc;

  /// No description provided for @sortBy_profitDesc.
  ///
  /// In en, this message translates to:
  /// **'Highest Profit'**
  String get sortBy_profitDesc;

  /// No description provided for @sortBy_profitAsc.
  ///
  /// In en, this message translates to:
  /// **'Lowest Profit'**
  String get sortBy_profitAsc;

  /// No description provided for @sortBy_qtyDesc.
  ///
  /// In en, this message translates to:
  /// **'Most Sold'**
  String get sortBy_qtyDesc;

  /// No description provided for @sortBy_qtyAsc.
  ///
  /// In en, this message translates to:
  /// **'Least Sold'**
  String get sortBy_qtyAsc;

  /// No description provided for @purchaseOrders_title.
  ///
  /// In en, this message translates to:
  /// **'Purchase Orders'**
  String get purchaseOrders_title;

  /// No description provided for @purchaseOrders_noOrders.
  ///
  /// In en, this message translates to:
  /// **'No purchase orders'**
  String get purchaseOrders_noOrders;

  /// No description provided for @purchaseOrders_allStatus.
  ///
  /// In en, this message translates to:
  /// **'All Status'**
  String get purchaseOrders_allStatus;

  /// No description provided for @purchaseOrders_allPaymentStatus.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get purchaseOrders_allPaymentStatus;

  /// No description provided for @purchaseOrders_receive.
  ///
  /// In en, this message translates to:
  /// **'Receive'**
  String get purchaseOrders_receive;

  /// No description provided for @purchaseOrders_receiveOrder.
  ///
  /// In en, this message translates to:
  /// **'Receive Order'**
  String get purchaseOrders_receiveOrder;

  /// No description provided for @purchaseOrders_receivePurchaseOrder.
  ///
  /// In en, this message translates to:
  /// **'Receive Purchase Order'**
  String get purchaseOrders_receivePurchaseOrder;

  /// No description provided for @purchaseOrders_receiveConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to mark this purchase order as received? This will:\n\n• Add stock for all items\n• Update purchase prices\n• Create stock history records'**
  String get purchaseOrders_receiveConfirmMessage;

  /// No description provided for @purchaseOrders_receiving.
  ///
  /// In en, this message translates to:
  /// **'Receiving purchase order...'**
  String get purchaseOrders_receiving;

  /// No description provided for @purchaseOrders_receiveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Purchase order received! Stock updated.'**
  String get purchaseOrders_receiveSuccess;

  /// No description provided for @purchaseOrders_receiveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to receive purchase order'**
  String get purchaseOrders_receiveFailed;

  /// No description provided for @purchaseOrders_cancelPurchaseOrder.
  ///
  /// In en, this message translates to:
  /// **'Cancel Purchase Order'**
  String get purchaseOrders_cancelPurchaseOrder;

  /// No description provided for @purchaseOrders_cancelConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel this purchase order?'**
  String get purchaseOrders_cancelConfirmMessage;

  /// No description provided for @purchaseOrders_cancelOrder.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order'**
  String get purchaseOrders_cancelOrder;

  /// No description provided for @purchaseOrders_cancelling.
  ///
  /// In en, this message translates to:
  /// **'Cancelling...'**
  String get purchaseOrders_cancelling;

  /// No description provided for @purchaseOrders_cancelSuccess.
  ///
  /// In en, this message translates to:
  /// **'Purchase order cancelled'**
  String get purchaseOrders_cancelSuccess;

  /// No description provided for @purchaseOrders_cancelFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to cancel purchase order'**
  String get purchaseOrders_cancelFailed;

  /// No description provided for @purchaseOrders_created.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get purchaseOrders_created;

  /// No description provided for @purchaseOrders_unknownSupplier.
  ///
  /// In en, this message translates to:
  /// **'Unknown Supplier'**
  String get purchaseOrders_unknownSupplier;

  /// No description provided for @purchaseOrders_itemsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String purchaseOrders_itemsCount(int count);

  /// No description provided for @purchaseOrderReport_title.
  ///
  /// In en, this message translates to:
  /// **'Purchase Order Report'**
  String get purchaseOrderReport_title;

  /// No description provided for @purchaseOrderReport_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get purchaseOrderReport_summary;

  /// No description provided for @purchaseOrderReport_orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get purchaseOrderReport_orders;

  /// No description provided for @purchaseOrderReport_totalPO.
  ///
  /// In en, this message translates to:
  /// **'Total PO'**
  String get purchaseOrderReport_totalPO;

  /// No description provided for @purchaseOrderReport_totalValue.
  ///
  /// In en, this message translates to:
  /// **'Total Value'**
  String get purchaseOrderReport_totalValue;

  /// No description provided for @purchaseOrderReport_pendingAmount.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get purchaseOrderReport_pendingAmount;

  /// No description provided for @purchaseOrderReport_completedAmount.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get purchaseOrderReport_completedAmount;

  /// No description provided for @purchaseOrderReport_orderStatusOverview.
  ///
  /// In en, this message translates to:
  /// **'Order Status Overview'**
  String get purchaseOrderReport_orderStatusOverview;

  /// No description provided for @purchaseOrderReport_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get purchaseOrderReport_pending;

  /// No description provided for @purchaseOrderReport_received.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get purchaseOrderReport_received;

  /// No description provided for @purchaseOrderReport_cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get purchaseOrderReport_cancelled;

  /// No description provided for @purchaseOrderReport_purchaseOrders.
  ///
  /// In en, this message translates to:
  /// **'Purchase Orders'**
  String get purchaseOrderReport_purchaseOrders;

  /// No description provided for @purchaseOrderReport_ordersCount.
  ///
  /// In en, this message translates to:
  /// **'{count} orders'**
  String purchaseOrderReport_ordersCount(int count);

  /// No description provided for @purchaseOrderReport_noPurchaseOrdersFound.
  ///
  /// In en, this message translates to:
  /// **'No purchase orders found'**
  String get purchaseOrderReport_noPurchaseOrdersFound;

  /// No description provided for @purchaseOrderReport_itemsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} item(s)'**
  String purchaseOrderReport_itemsCount(int count);

  /// No description provided for @purchaseOrderReport_credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get purchaseOrderReport_credit;

  /// No description provided for @purchaseOrderReport_cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get purchaseOrderReport_cash;

  /// No description provided for @purchaseOrderReport_unknownSupplier.
  ///
  /// In en, this message translates to:
  /// **'Unknown Supplier'**
  String get purchaseOrderReport_unknownSupplier;

  /// No description provided for @purchaseOrderReport_purchaseOrderDetail.
  ///
  /// In en, this message translates to:
  /// **'Purchase Order'**
  String get purchaseOrderReport_purchaseOrderDetail;

  /// No description provided for @purchaseOrderReport_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get purchaseOrderReport_status;

  /// No description provided for @purchaseOrderReport_payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get purchaseOrderReport_payment;

  /// No description provided for @purchaseOrderReport_created.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get purchaseOrderReport_created;

  /// No description provided for @purchaseOrderReport_items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get purchaseOrderReport_items;

  /// No description provided for @purchaseOrderReport_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get purchaseOrderReport_total;

  /// No description provided for @purchaseOrderReport_notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get purchaseOrderReport_notes;

  /// No description provided for @purchaseOrderReport_dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get purchaseOrderReport_dateRange;

  /// No description provided for @purchaseOrderReport_selectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select date range...'**
  String get purchaseOrderReport_selectDateRange;

  /// No description provided for @purchaseOrderReport_searchDateRange.
  ///
  /// In en, this message translates to:
  /// **'Search date range...'**
  String get purchaseOrderReport_searchDateRange;

  /// No description provided for @purchaseOrderReport_selectCustomDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select custom date range'**
  String get purchaseOrderReport_selectCustomDateRange;

  /// No description provided for @purchaseOrderReport_supplier.
  ///
  /// In en, this message translates to:
  /// **'Supplier'**
  String get purchaseOrderReport_supplier;

  /// No description provided for @purchaseOrderReport_allSuppliers.
  ///
  /// In en, this message translates to:
  /// **'All Suppliers'**
  String get purchaseOrderReport_allSuppliers;

  /// No description provided for @purchaseOrderReport_searchSupplier.
  ///
  /// In en, this message translates to:
  /// **'Search supplier...'**
  String get purchaseOrderReport_searchSupplier;

  /// No description provided for @purchaseOrderReport_allStatus.
  ///
  /// In en, this message translates to:
  /// **'All Status'**
  String get purchaseOrderReport_allStatus;

  /// No description provided for @purchaseOrderReport_searchStatus.
  ///
  /// In en, this message translates to:
  /// **'Search status...'**
  String get purchaseOrderReport_searchStatus;

  /// No description provided for @purchaseOrderReport_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Purchase Order'**
  String get purchaseOrderReport_printPreview;

  /// No description provided for @purchaseOrderReport_totalPOs.
  ///
  /// In en, this message translates to:
  /// **'Total POs'**
  String get purchaseOrderReport_totalPOs;

  /// No description provided for @purchaseOrderReport_totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get purchaseOrderReport_totalAmount;

  /// No description provided for @purchaseOrderReport_receivedAmount.
  ///
  /// In en, this message translates to:
  /// **'Received Amount'**
  String get purchaseOrderReport_receivedAmount;

  /// No description provided for @purchaseOrderReport_poNumber.
  ///
  /// In en, this message translates to:
  /// **'PO Number'**
  String get purchaseOrderReport_poNumber;

  /// No description provided for @purchaseOrderReport_date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get purchaseOrderReport_date;

  /// No description provided for @purchaseOrderReport_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get purchaseOrderReport_amount;

  /// No description provided for @stockHistoryReport_title.
  ///
  /// In en, this message translates to:
  /// **'Stock History'**
  String get stockHistoryReport_title;

  /// No description provided for @stockHistoryReport_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Stock History'**
  String get stockHistoryReport_printPreview;

  /// No description provided for @stockHistoryReport_totalTransactions.
  ///
  /// In en, this message translates to:
  /// **'Total Transactions'**
  String get stockHistoryReport_totalTransactions;

  /// No description provided for @stockHistoryReport_totalStockIn.
  ///
  /// In en, this message translates to:
  /// **'Total Stock In'**
  String get stockHistoryReport_totalStockIn;

  /// No description provided for @stockHistoryReport_totalStockOut.
  ///
  /// In en, this message translates to:
  /// **'Total Stock Out'**
  String get stockHistoryReport_totalStockOut;

  /// No description provided for @stockHistoryReport_totalStockCanceled.
  ///
  /// In en, this message translates to:
  /// **'Total Stock Canceled'**
  String get stockHistoryReport_totalStockCanceled;

  /// No description provided for @stockHistoryReport_totalValueIn.
  ///
  /// In en, this message translates to:
  /// **'Total Value In'**
  String get stockHistoryReport_totalValueIn;

  /// No description provided for @stockHistoryReport_totalValueOut.
  ///
  /// In en, this message translates to:
  /// **'Total Value Out'**
  String get stockHistoryReport_totalValueOut;

  /// No description provided for @stockHistoryReport_netValue.
  ///
  /// In en, this message translates to:
  /// **'Net Value'**
  String get stockHistoryReport_netValue;

  /// No description provided for @stockHistoryReport_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get stockHistoryReport_summary;

  /// No description provided for @stockHistoryReport_transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get stockHistoryReport_transactions;

  /// No description provided for @stockHistoryReport_stockIn.
  ///
  /// In en, this message translates to:
  /// **'Stock In'**
  String get stockHistoryReport_stockIn;

  /// No description provided for @stockHistoryReport_stockOut.
  ///
  /// In en, this message translates to:
  /// **'Stock Out'**
  String get stockHistoryReport_stockOut;

  /// No description provided for @stockHistoryReport_stockCanceled.
  ///
  /// In en, this message translates to:
  /// **'Stock Canceled'**
  String get stockHistoryReport_stockCanceled;

  /// No description provided for @stockHistoryReport_fromPO.
  ///
  /// In en, this message translates to:
  /// **'From PO'**
  String get stockHistoryReport_fromPO;

  /// No description provided for @stockHistoryReport_fromSales.
  ///
  /// In en, this message translates to:
  /// **'From Sales'**
  String get stockHistoryReport_fromSales;

  /// No description provided for @stockHistoryReport_fromCanceled.
  ///
  /// In en, this message translates to:
  /// **'From Canceled'**
  String get stockHistoryReport_fromCanceled;

  /// No description provided for @stockHistoryReport_adjustment.
  ///
  /// In en, this message translates to:
  /// **'Adjustment'**
  String get stockHistoryReport_adjustment;

  /// No description provided for @stockHistoryReport_adjustments.
  ///
  /// In en, this message translates to:
  /// **'Adjustments'**
  String get stockHistoryReport_adjustments;

  /// No description provided for @stockHistoryReport_allTypes.
  ///
  /// In en, this message translates to:
  /// **'All Types'**
  String get stockHistoryReport_allTypes;

  /// No description provided for @stockHistoryReport_allTime.
  ///
  /// In en, this message translates to:
  /// **'All Time'**
  String get stockHistoryReport_allTime;

  /// No description provided for @stockHistoryReport_last30Days.
  ///
  /// In en, this message translates to:
  /// **'Last 30 Days'**
  String get stockHistoryReport_last30Days;

  /// No description provided for @stockHistoryReport_dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get stockHistoryReport_dateRange;

  /// No description provided for @stockHistoryReport_selectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select date range...'**
  String get stockHistoryReport_selectDateRange;

  /// No description provided for @stockHistoryReport_selectCustomDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select custom date range'**
  String get stockHistoryReport_selectCustomDateRange;

  /// No description provided for @stockHistoryReport_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get stockHistoryReport_type;

  /// No description provided for @stockHistoryReport_searchType.
  ///
  /// In en, this message translates to:
  /// **'Search type...'**
  String get stockHistoryReport_searchType;

  /// No description provided for @stockHistoryReport_product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get stockHistoryReport_product;

  /// No description provided for @stockHistoryReport_allProducts.
  ///
  /// In en, this message translates to:
  /// **'All Products'**
  String get stockHistoryReport_allProducts;

  /// No description provided for @stockHistoryReport_searchProduct.
  ///
  /// In en, this message translates to:
  /// **'Search product...'**
  String get stockHistoryReport_searchProduct;

  /// No description provided for @stockHistoryReport_scanBarcodeToFilter.
  ///
  /// In en, this message translates to:
  /// **'Scan barcode to filter'**
  String get stockHistoryReport_scanBarcodeToFilter;

  /// No description provided for @stockHistoryReport_filteredBy.
  ///
  /// In en, this message translates to:
  /// **'Filtered by: {productName}'**
  String stockHistoryReport_filteredBy(String productName);

  /// No description provided for @stockHistoryReport_productNotFoundSearching.
  ///
  /// In en, this message translates to:
  /// **'Product not found, searching: {code}'**
  String stockHistoryReport_productNotFoundSearching(String code);

  /// No description provided for @stockHistoryReport_topProductsByMovement.
  ///
  /// In en, this message translates to:
  /// **'Top Products by Movement'**
  String get stockHistoryReport_topProductsByMovement;

  /// No description provided for @stockHistoryReport_stockMovementDistribution.
  ///
  /// In en, this message translates to:
  /// **'Stock Movement Distribution'**
  String get stockHistoryReport_stockMovementDistribution;

  /// No description provided for @stockHistoryReport_noStockMovementData.
  ///
  /// In en, this message translates to:
  /// **'No stock movement data'**
  String get stockHistoryReport_noStockMovementData;

  /// No description provided for @stockHistoryReport_noDataToDisplay.
  ///
  /// In en, this message translates to:
  /// **'No data to display'**
  String get stockHistoryReport_noDataToDisplay;

  /// No description provided for @stockHistoryReport_unitsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} units'**
  String stockHistoryReport_unitsCount(String count);

  /// No description provided for @stockHistoryReport_units.
  ///
  /// In en, this message translates to:
  /// **'units'**
  String get stockHistoryReport_units;

  /// No description provided for @stockHistoryReport_searchByProductName.
  ///
  /// In en, this message translates to:
  /// **'Search by product name...'**
  String get stockHistoryReport_searchByProductName;

  /// No description provided for @stockHistoryReport_recordsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} records'**
  String stockHistoryReport_recordsCount(int count);

  /// No description provided for @stockHistoryReport_noStockHistory.
  ///
  /// In en, this message translates to:
  /// **'No stock history'**
  String get stockHistoryReport_noStockHistory;

  /// No description provided for @stockHistoryReport_clearDateFilter.
  ///
  /// In en, this message translates to:
  /// **'Clear date filter'**
  String get stockHistoryReport_clearDateFilter;

  /// No description provided for @stockHistoryReport_netChange.
  ///
  /// In en, this message translates to:
  /// **'Net Change'**
  String get stockHistoryReport_netChange;

  /// No description provided for @stockHistoryReport_transactionsLabel.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get stockHistoryReport_transactionsLabel;

  /// No description provided for @stockHistoryReport_adjustmentsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} adjustments'**
  String stockHistoryReport_adjustmentsCount(int count);

  /// No description provided for @stockHistoryReport_transactionsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} transactions'**
  String stockHistoryReport_transactionsCount(int count);

  /// No description provided for @stockHistoryReport_unknownProduct.
  ///
  /// In en, this message translates to:
  /// **'Unknown Product'**
  String get stockHistoryReport_unknownProduct;

  /// No description provided for @stockHistoryReport_totalRecords.
  ///
  /// In en, this message translates to:
  /// **'Total Records'**
  String get stockHistoryReport_totalRecords;

  /// No description provided for @pnl_title.
  ///
  /// In en, this message translates to:
  /// **'Profit & Loss'**
  String get pnl_title;

  /// No description provided for @pnl_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get pnl_summary;

  /// No description provided for @pnl_transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get pnl_transactions;

  /// No description provided for @pnl_filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get pnl_filter;

  /// No description provided for @pnl_reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get pnl_reset;

  /// No description provided for @pnl_applyFilter.
  ///
  /// In en, this message translates to:
  /// **'Apply Filter'**
  String get pnl_applyFilter;

  /// No description provided for @pnl_dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get pnl_dateRange;

  /// No description provided for @pnl_selectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select date range...'**
  String get pnl_selectDateRange;

  /// No description provided for @pnl_searchDateRange.
  ///
  /// In en, this message translates to:
  /// **'Search date range...'**
  String get pnl_searchDateRange;

  /// No description provided for @pnl_selectCustomDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select custom date range'**
  String get pnl_selectCustomDateRange;

  /// No description provided for @pnl_netSales.
  ///
  /// In en, this message translates to:
  /// **'Net Sales'**
  String get pnl_netSales;

  /// No description provided for @pnl_grossProfit.
  ///
  /// In en, this message translates to:
  /// **'Gross Profit'**
  String get pnl_grossProfit;

  /// No description provided for @pnl_netProfit.
  ///
  /// In en, this message translates to:
  /// **'Net Profit'**
  String get pnl_netProfit;

  /// No description provided for @pnl_netLoss.
  ///
  /// In en, this message translates to:
  /// **'Net Loss'**
  String get pnl_netLoss;

  /// No description provided for @pnl_profitMargin.
  ///
  /// In en, this message translates to:
  /// **'Profit Margin'**
  String get pnl_profitMargin;

  /// No description provided for @pnl_orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get pnl_orders;

  /// No description provided for @pnl_margin.
  ///
  /// In en, this message translates to:
  /// **'Margin'**
  String get pnl_margin;

  /// No description provided for @pnl_statement.
  ///
  /// In en, this message translates to:
  /// **'Profit & Loss Statement'**
  String get pnl_statement;

  /// No description provided for @pnl_revenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get pnl_revenue;

  /// No description provided for @pnl_grossSales.
  ///
  /// In en, this message translates to:
  /// **'Gross Sales'**
  String get pnl_grossSales;

  /// No description provided for @pnl_discounts.
  ///
  /// In en, this message translates to:
  /// **'Discounts'**
  String get pnl_discounts;

  /// No description provided for @pnl_costOfGoodsSold.
  ///
  /// In en, this message translates to:
  /// **'Cost of Goods Sold'**
  String get pnl_costOfGoodsSold;

  /// No description provided for @pnl_cogs.
  ///
  /// In en, this message translates to:
  /// **'COGS'**
  String get pnl_cogs;

  /// No description provided for @pnl_otherIncome.
  ///
  /// In en, this message translates to:
  /// **'Other Income'**
  String get pnl_otherIncome;

  /// No description provided for @pnl_cashOverage.
  ///
  /// In en, this message translates to:
  /// **'Cash Overage'**
  String get pnl_cashOverage;

  /// No description provided for @pnl_operatingExpenses.
  ///
  /// In en, this message translates to:
  /// **'Operating Expenses'**
  String get pnl_operatingExpenses;

  /// No description provided for @pnl_totalExpenses.
  ///
  /// In en, this message translates to:
  /// **'Total Expenses'**
  String get pnl_totalExpenses;

  /// No description provided for @pnl_expenseBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Expense Breakdown'**
  String get pnl_expenseBreakdown;

  /// No description provided for @pnl_salesOrders.
  ///
  /// In en, this message translates to:
  /// **'Sales Orders'**
  String get pnl_salesOrders;

  /// No description provided for @pnl_expenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get pnl_expenses;

  /// No description provided for @pnl_ordersExpensesCount.
  ///
  /// In en, this message translates to:
  /// **'{orders} orders, {expenses} expenses'**
  String pnl_ordersExpensesCount(int orders, int expenses);

  /// No description provided for @pnl_noTransactionsFound.
  ///
  /// In en, this message translates to:
  /// **'No transactions found for this period'**
  String get pnl_noTransactionsFound;

  /// No description provided for @pnl_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Profit & Loss'**
  String get pnl_printPreview;

  /// No description provided for @pnl_loss.
  ///
  /// In en, this message translates to:
  /// **'Loss'**
  String get pnl_loss;

  /// No description provided for @staffReport_title.
  ///
  /// In en, this message translates to:
  /// **'Staff Performance'**
  String get staffReport_title;

  /// No description provided for @staffReport_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get staffReport_summary;

  /// No description provided for @staffReport_staff.
  ///
  /// In en, this message translates to:
  /// **'Staff'**
  String get staffReport_staff;

  /// No description provided for @staffReport_totalSales.
  ///
  /// In en, this message translates to:
  /// **'Total Sales'**
  String get staffReport_totalSales;

  /// No description provided for @staffReport_transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get staffReport_transactions;

  /// No description provided for @staffReport_activeStaff.
  ///
  /// In en, this message translates to:
  /// **'Active Staff'**
  String get staffReport_activeStaff;

  /// No description provided for @staffReport_avgPerStaff.
  ///
  /// In en, this message translates to:
  /// **'Avg per Staff'**
  String get staffReport_avgPerStaff;

  /// No description provided for @staffReport_topStaff.
  ///
  /// In en, this message translates to:
  /// **'Top 5 Staff'**
  String get staffReport_topStaff;

  /// No description provided for @staffReport_noStaffData.
  ///
  /// In en, this message translates to:
  /// **'No staff data for this period'**
  String get staffReport_noStaffData;

  /// No description provided for @staffReport_staffRankings.
  ///
  /// In en, this message translates to:
  /// **'Staff Rankings ({filter})'**
  String staffReport_staffRankings(String filter);

  /// No description provided for @staffReport_staffCount.
  ///
  /// In en, this message translates to:
  /// **'{count} staff'**
  String staffReport_staffCount(int count);

  /// No description provided for @staffReport_topSales.
  ///
  /// In en, this message translates to:
  /// **'Top Sales'**
  String get staffReport_topSales;

  /// No description provided for @staffReport_mostTransactions.
  ///
  /// In en, this message translates to:
  /// **'Most Transactions'**
  String get staffReport_mostTransactions;

  /// No description provided for @staffReport_avgOrderValue.
  ///
  /// In en, this message translates to:
  /// **'Avg Order Value'**
  String get staffReport_avgOrderValue;

  /// No description provided for @staffReport_nTransactions.
  ///
  /// In en, this message translates to:
  /// **'{count} transactions'**
  String staffReport_nTransactions(int count);

  /// No description provided for @staffReport_transactionsAvg.
  ///
  /// In en, this message translates to:
  /// **'{count} transactions • Avg {amount}'**
  String staffReport_transactionsAvg(int count, String amount);

  /// No description provided for @staffReport_dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get staffReport_dateRange;

  /// No description provided for @staffReport_selectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select date range...'**
  String get staffReport_selectDateRange;

  /// No description provided for @staffReport_searchDateRange.
  ///
  /// In en, this message translates to:
  /// **'Search date range...'**
  String get staffReport_searchDateRange;

  /// No description provided for @staffReport_selectCustomDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select custom date range'**
  String get staffReport_selectCustomDateRange;

  /// No description provided for @staffReport_totalTransactions.
  ///
  /// In en, this message translates to:
  /// **'Total Transactions'**
  String get staffReport_totalTransactions;

  /// No description provided for @staffReport_avgPerTransaction.
  ///
  /// In en, this message translates to:
  /// **'Avg per Transaction'**
  String get staffReport_avgPerTransaction;

  /// No description provided for @staffReport_staffPerformance.
  ///
  /// In en, this message translates to:
  /// **'Staff Performance'**
  String get staffReport_staffPerformance;

  /// No description provided for @staffReport_staffName.
  ///
  /// In en, this message translates to:
  /// **'Staff Name'**
  String get staffReport_staffName;

  /// No description provided for @staffReport_avgOrder.
  ///
  /// In en, this message translates to:
  /// **'Avg Order'**
  String get staffReport_avgOrder;

  /// No description provided for @staffReport_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Staff Report'**
  String get staffReport_printPreview;

  /// No description provided for @staffReport_sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get staffReport_sales;

  /// No description provided for @supplierReport_title.
  ///
  /// In en, this message translates to:
  /// **'Supplier Report'**
  String get supplierReport_title;

  /// No description provided for @supplierReport_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get supplierReport_summary;

  /// No description provided for @supplierReport_suppliers.
  ///
  /// In en, this message translates to:
  /// **'Suppliers'**
  String get supplierReport_suppliers;

  /// No description provided for @supplierReport_totalPurchase.
  ///
  /// In en, this message translates to:
  /// **'Total Purchase'**
  String get supplierReport_totalPurchase;

  /// No description provided for @supplierReport_totalPO.
  ///
  /// In en, this message translates to:
  /// **'Total PO'**
  String get supplierReport_totalPO;

  /// No description provided for @supplierReport_activeSuppliers.
  ///
  /// In en, this message translates to:
  /// **'Active Suppliers'**
  String get supplierReport_activeSuppliers;

  /// No description provided for @supplierReport_pendingPO.
  ///
  /// In en, this message translates to:
  /// **'Pending PO'**
  String get supplierReport_pendingPO;

  /// No description provided for @supplierReport_topSuppliers.
  ///
  /// In en, this message translates to:
  /// **'Top 5 Suppliers'**
  String get supplierReport_topSuppliers;

  /// No description provided for @supplierReport_noSupplierData.
  ///
  /// In en, this message translates to:
  /// **'No supplier data for this period'**
  String get supplierReport_noSupplierData;

  /// No description provided for @supplierReport_supplierRankings.
  ///
  /// In en, this message translates to:
  /// **'Supplier Rankings ({filter})'**
  String supplierReport_supplierRankings(String filter);

  /// No description provided for @supplierReport_topPurchase.
  ///
  /// In en, this message translates to:
  /// **'Top Purchase'**
  String get supplierReport_topPurchase;

  /// No description provided for @supplierReport_mostOrders.
  ///
  /// In en, this message translates to:
  /// **'Most Orders'**
  String get supplierReport_mostOrders;

  /// No description provided for @supplierReport_recentOrder.
  ///
  /// In en, this message translates to:
  /// **'Recent Order'**
  String get supplierReport_recentOrder;

  /// No description provided for @supplierReport_alphabetical.
  ///
  /// In en, this message translates to:
  /// **'Alphabetical'**
  String get supplierReport_alphabetical;

  /// No description provided for @supplierReport_nPO.
  ///
  /// In en, this message translates to:
  /// **'{count} PO'**
  String supplierReport_nPO(int count);

  /// No description provided for @supplierReport_nPending.
  ///
  /// In en, this message translates to:
  /// **'{count} pending'**
  String supplierReport_nPending(int count);

  /// No description provided for @supplierReport_dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get supplierReport_dateRange;

  /// No description provided for @supplierReport_selectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select date range...'**
  String get supplierReport_selectDateRange;

  /// No description provided for @supplierReport_searchDateRange.
  ///
  /// In en, this message translates to:
  /// **'Search date range...'**
  String get supplierReport_searchDateRange;

  /// No description provided for @supplierReport_selectCustomDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select custom date range'**
  String get supplierReport_selectCustomDateRange;

  /// No description provided for @supplierReport_supplier.
  ///
  /// In en, this message translates to:
  /// **'Supplier'**
  String get supplierReport_supplier;

  /// No description provided for @supplierReport_allSuppliers.
  ///
  /// In en, this message translates to:
  /// **'All Suppliers'**
  String get supplierReport_allSuppliers;

  /// No description provided for @supplierReport_searchSupplier.
  ///
  /// In en, this message translates to:
  /// **'Search supplier...'**
  String get supplierReport_searchSupplier;

  /// No description provided for @supplierReport_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Supplier Report'**
  String get supplierReport_printPreview;

  /// No description provided for @supplierReport_totalSuppliers.
  ///
  /// In en, this message translates to:
  /// **'Total Suppliers'**
  String get supplierReport_totalSuppliers;

  /// No description provided for @supplierReport_totalOrders.
  ///
  /// In en, this message translates to:
  /// **'Total Orders'**
  String get supplierReport_totalOrders;

  /// No description provided for @supplierReport_pendingOrders.
  ///
  /// In en, this message translates to:
  /// **'Pending Orders'**
  String get supplierReport_pendingOrders;

  /// No description provided for @supplierReport_supplierSummary.
  ///
  /// In en, this message translates to:
  /// **'Supplier Summary'**
  String get supplierReport_supplierSummary;

  /// No description provided for @supplierReport_poCount.
  ///
  /// In en, this message translates to:
  /// **'PO'**
  String get supplierReport_poCount;

  /// No description provided for @supplierReport_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get supplierReport_pending;

  /// No description provided for @supplierReport_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Supplier Report?'**
  String get supplierReport_helpTitle;

  /// No description provided for @supplierReport_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Supplier Report shows purchase history and transaction details with each supplier.'**
  String get supplierReport_helpDescription;

  /// No description provided for @supplierReport_helpIncludes.
  ///
  /// In en, this message translates to:
  /// **'Includes'**
  String get supplierReport_helpIncludes;

  /// No description provided for @supplierReport_helpPurchaseOrders.
  ///
  /// In en, this message translates to:
  /// **'Purchase orders per supplier'**
  String get supplierReport_helpPurchaseOrders;

  /// No description provided for @supplierReport_helpTotalPurchaseValue.
  ///
  /// In en, this message translates to:
  /// **'Total purchase value'**
  String get supplierReport_helpTotalPurchaseValue;

  /// No description provided for @supplierReport_helpPendingOrders.
  ///
  /// In en, this message translates to:
  /// **'Pending and received orders'**
  String get supplierReport_helpPendingOrders;

  /// No description provided for @customerReport_title.
  ///
  /// In en, this message translates to:
  /// **'Customer Report'**
  String get customerReport_title;

  /// No description provided for @customerReport_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get customerReport_summary;

  /// No description provided for @customerReport_customers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customerReport_customers;

  /// No description provided for @customerReport_activeCustomers.
  ///
  /// In en, this message translates to:
  /// **'Active Customers'**
  String get customerReport_activeCustomers;

  /// No description provided for @customerReport_totalOrders.
  ///
  /// In en, this message translates to:
  /// **'Total Orders'**
  String get customerReport_totalOrders;

  /// No description provided for @customerReport_totalRevenue.
  ///
  /// In en, this message translates to:
  /// **'Total Revenue'**
  String get customerReport_totalRevenue;

  /// No description provided for @customerReport_avgOrderValue.
  ///
  /// In en, this message translates to:
  /// **'Avg Order Value'**
  String get customerReport_avgOrderValue;

  /// No description provided for @customerReport_top5Customers.
  ///
  /// In en, this message translates to:
  /// **'Top 5 Customers'**
  String get customerReport_top5Customers;

  /// No description provided for @customerReport_noCustomerData.
  ///
  /// In en, this message translates to:
  /// **'No customer data for this period'**
  String get customerReport_noCustomerData;

  /// No description provided for @customerReport_ordersCount.
  ///
  /// In en, this message translates to:
  /// **'{count} orders'**
  String customerReport_ordersCount(int count);

  /// No description provided for @customerReport_customersCount.
  ///
  /// In en, this message translates to:
  /// **'{count} customers'**
  String customerReport_customersCount(int count);

  /// No description provided for @customerReport_dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get customerReport_dateRange;

  /// No description provided for @customerReport_selectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select date range...'**
  String get customerReport_selectDateRange;

  /// No description provided for @customerReport_searchDateRange.
  ///
  /// In en, this message translates to:
  /// **'Search date range...'**
  String get customerReport_searchDateRange;

  /// No description provided for @customerReport_selectCustomDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select custom date range'**
  String get customerReport_selectCustomDateRange;

  /// No description provided for @customerReport_topSpender.
  ///
  /// In en, this message translates to:
  /// **'Top Spender'**
  String get customerReport_topSpender;

  /// No description provided for @customerReport_topSpenderDesc.
  ///
  /// In en, this message translates to:
  /// **'Customers with highest spending'**
  String get customerReport_topSpenderDesc;

  /// No description provided for @customerReport_mostOrders.
  ///
  /// In en, this message translates to:
  /// **'Most Orders'**
  String get customerReport_mostOrders;

  /// No description provided for @customerReport_mostOrdersDesc.
  ///
  /// In en, this message translates to:
  /// **'Customers with most orders'**
  String get customerReport_mostOrdersDesc;

  /// No description provided for @customerReport_recentPurchase.
  ///
  /// In en, this message translates to:
  /// **'Recent Purchase'**
  String get customerReport_recentPurchase;

  /// No description provided for @customerReport_recentPurchaseDesc.
  ///
  /// In en, this message translates to:
  /// **'Recently active customers'**
  String get customerReport_recentPurchaseDesc;

  /// No description provided for @customerReport_alphabetical.
  ///
  /// In en, this message translates to:
  /// **'Alphabetical'**
  String get customerReport_alphabetical;

  /// No description provided for @customerReport_alphabeticalDesc.
  ///
  /// In en, this message translates to:
  /// **'A to Z by name'**
  String get customerReport_alphabeticalDesc;

  /// No description provided for @customerReport_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Customer Report'**
  String get customerReport_printPreview;

  /// No description provided for @customerReport_customerDetails.
  ///
  /// In en, this message translates to:
  /// **'Customer Details'**
  String get customerReport_customerDetails;

  /// No description provided for @customerReport_orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get customerReport_orders;

  /// No description provided for @customerReport_totalSpent.
  ///
  /// In en, this message translates to:
  /// **'Total Spent'**
  String get customerReport_totalSpent;

  /// No description provided for @customerReport_lastPurchase.
  ///
  /// In en, this message translates to:
  /// **'Last Purchase'**
  String get customerReport_lastPurchase;

  /// No description provided for @customerReport_averageOrderValue.
  ///
  /// In en, this message translates to:
  /// **'Average Order Value'**
  String get customerReport_averageOrderValue;

  /// No description provided for @customerReport_customersWithOrders.
  ///
  /// In en, this message translates to:
  /// **'Customers with Orders'**
  String get customerReport_customersWithOrders;

  /// No description provided for @customerReport_topCustomers.
  ///
  /// In en, this message translates to:
  /// **'Top Customers'**
  String get customerReport_topCustomers;

  /// No description provided for @productPerformance_title.
  ///
  /// In en, this message translates to:
  /// **'Product Performance'**
  String get productPerformance_title;

  /// No description provided for @productPerformance_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get productPerformance_summary;

  /// No description provided for @productPerformance_products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get productPerformance_products;

  /// No description provided for @productPerformance_totalRevenue.
  ///
  /// In en, this message translates to:
  /// **'Total Revenue'**
  String get productPerformance_totalRevenue;

  /// No description provided for @productPerformance_totalProfit.
  ///
  /// In en, this message translates to:
  /// **'Total Profit'**
  String get productPerformance_totalProfit;

  /// No description provided for @productPerformance_itemsSold.
  ///
  /// In en, this message translates to:
  /// **'Items Sold'**
  String get productPerformance_itemsSold;

  /// No description provided for @productPerformance_avgMargin.
  ///
  /// In en, this message translates to:
  /// **'Avg Margin'**
  String get productPerformance_avgMargin;

  /// No description provided for @productPerformance_top5BestSellers.
  ///
  /// In en, this message translates to:
  /// **'Top 5 Best Sellers'**
  String get productPerformance_top5BestSellers;

  /// No description provided for @productPerformance_noSalesData.
  ///
  /// In en, this message translates to:
  /// **'No sales data for this period'**
  String get productPerformance_noSalesData;

  /// No description provided for @productPerformance_sold.
  ///
  /// In en, this message translates to:
  /// **'sold'**
  String get productPerformance_sold;

  /// No description provided for @productPerformance_margin.
  ///
  /// In en, this message translates to:
  /// **'margin'**
  String get productPerformance_margin;

  /// No description provided for @productPerformance_profit.
  ///
  /// In en, this message translates to:
  /// **'Profit'**
  String get productPerformance_profit;

  /// No description provided for @productPerformance_productsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} products'**
  String productPerformance_productsCount(int count);

  /// No description provided for @productPerformance_soldCount.
  ///
  /// In en, this message translates to:
  /// **'{count} sold'**
  String productPerformance_soldCount(int count);

  /// No description provided for @productPerformance_dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get productPerformance_dateRange;

  /// No description provided for @productPerformance_selectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select date range...'**
  String get productPerformance_selectDateRange;

  /// No description provided for @productPerformance_searchDateRange.
  ///
  /// In en, this message translates to:
  /// **'Search date range...'**
  String get productPerformance_searchDateRange;

  /// No description provided for @productPerformance_category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get productPerformance_category;

  /// No description provided for @productPerformance_allCategories.
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get productPerformance_allCategories;

  /// No description provided for @productPerformance_searchCategory.
  ///
  /// In en, this message translates to:
  /// **'Search category...'**
  String get productPerformance_searchCategory;

  /// No description provided for @productPerformance_topSelling.
  ///
  /// In en, this message translates to:
  /// **'Top Selling'**
  String get productPerformance_topSelling;

  /// No description provided for @productPerformance_topSellingDesc.
  ///
  /// In en, this message translates to:
  /// **'Products with highest sales'**
  String get productPerformance_topSellingDesc;

  /// No description provided for @productPerformance_lowSelling.
  ///
  /// In en, this message translates to:
  /// **'Low Selling'**
  String get productPerformance_lowSelling;

  /// No description provided for @productPerformance_lowSellingDesc.
  ///
  /// In en, this message translates to:
  /// **'Products with lowest sales'**
  String get productPerformance_lowSellingDesc;

  /// No description provided for @productPerformance_highMargin.
  ///
  /// In en, this message translates to:
  /// **'High Margin'**
  String get productPerformance_highMargin;

  /// No description provided for @productPerformance_highMarginDesc.
  ///
  /// In en, this message translates to:
  /// **'Products with highest profit margin'**
  String get productPerformance_highMarginDesc;

  /// No description provided for @productPerformance_lowMargin.
  ///
  /// In en, this message translates to:
  /// **'Low Margin'**
  String get productPerformance_lowMargin;

  /// No description provided for @productPerformance_lowMarginDesc.
  ///
  /// In en, this message translates to:
  /// **'Products with lowest profit margin'**
  String get productPerformance_lowMarginDesc;

  /// No description provided for @productPerformance_selectSort.
  ///
  /// In en, this message translates to:
  /// **'Select sort...'**
  String get productPerformance_selectSort;

  /// No description provided for @productPerformance_totalQtySold.
  ///
  /// In en, this message translates to:
  /// **'Total Qty Sold'**
  String get productPerformance_totalQtySold;

  /// No description provided for @productPerformance_totalProducts.
  ///
  /// In en, this message translates to:
  /// **'Total Products'**
  String get productPerformance_totalProducts;

  /// No description provided for @productPerformance_performanceTable.
  ///
  /// In en, this message translates to:
  /// **'Product Performance'**
  String get productPerformance_performanceTable;

  /// No description provided for @productPerformance_qtySold.
  ///
  /// In en, this message translates to:
  /// **'Qty Sold'**
  String get productPerformance_qtySold;

  /// No description provided for @productPerformance_revenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get productPerformance_revenue;

  /// No description provided for @productPerformance_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Product Performance'**
  String get productPerformance_printPreview;

  /// No description provided for @productSalesProfit_title.
  ///
  /// In en, this message translates to:
  /// **'Product Sales & Profit'**
  String get productSalesProfit_title;

  /// No description provided for @productSalesProfit_totalProfit.
  ///
  /// In en, this message translates to:
  /// **'Total Profit'**
  String get productSalesProfit_totalProfit;

  /// No description provided for @productSalesProfit_topProducts.
  ///
  /// In en, this message translates to:
  /// **'Top Products'**
  String get productSalesProfit_topProducts;

  /// No description provided for @productSalesProfit_productsSold.
  ///
  /// In en, this message translates to:
  /// **'Products Sold'**
  String get productSalesProfit_productsSold;

  /// No description provided for @productSalesProfit_qtySold.
  ///
  /// In en, this message translates to:
  /// **'Qty Sold'**
  String get productSalesProfit_qtySold;

  /// No description provided for @productSalesProfit_top5MostProfitable.
  ///
  /// In en, this message translates to:
  /// **'Top 5 Most Profitable'**
  String get productSalesProfit_top5MostProfitable;

  /// No description provided for @productSalesProfit_cogsCalculation.
  ///
  /// In en, this message translates to:
  /// **'COGS Calculation'**
  String get productSalesProfit_cogsCalculation;

  /// No description provided for @productSalesProfit_cogsDescription.
  ///
  /// In en, this message translates to:
  /// **'Cost of Goods Sold is calculated using the Average Cost (Weighted Average) method. Product Purchase Price is automatically updated when receiving a Purchase Order.'**
  String get productSalesProfit_cogsDescription;

  /// No description provided for @productSalesProfit_product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get productSalesProfit_product;

  /// No description provided for @productSalesProfit_sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get productSalesProfit_sales;

  /// No description provided for @productSalesProfit_totalProducts.
  ///
  /// In en, this message translates to:
  /// **'Total Products'**
  String get productSalesProfit_totalProducts;

  /// No description provided for @productSalesProfit_totalQtySold.
  ///
  /// In en, this message translates to:
  /// **'Total Qty Sold'**
  String get productSalesProfit_totalQtySold;

  /// No description provided for @productSalesProfit_totalSales.
  ///
  /// In en, this message translates to:
  /// **'Total Sales'**
  String get productSalesProfit_totalSales;

  /// No description provided for @productSalesProfit_totalCogs.
  ///
  /// In en, this message translates to:
  /// **'Total COGS'**
  String get productSalesProfit_totalCogs;

  /// No description provided for @productSalesProfit_netProfit.
  ///
  /// In en, this message translates to:
  /// **'Net Profit'**
  String get productSalesProfit_netProfit;

  /// No description provided for @productSalesProfit_profitMargin.
  ///
  /// In en, this message translates to:
  /// **'Profit Margin'**
  String get productSalesProfit_profitMargin;

  /// No description provided for @productSalesProfit_salesAmount.
  ///
  /// In en, this message translates to:
  /// **'Sales Amount'**
  String get productSalesProfit_salesAmount;

  /// No description provided for @productSalesProfit_cogs.
  ///
  /// In en, this message translates to:
  /// **'COGS'**
  String get productSalesProfit_cogs;

  /// No description provided for @productSalesProfit_profit.
  ///
  /// In en, this message translates to:
  /// **'Profit'**
  String get productSalesProfit_profit;

  /// No description provided for @hourlySales_title.
  ///
  /// In en, this message translates to:
  /// **'Hourly Sales'**
  String get hourlySales_title;

  /// No description provided for @hourlySales_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get hourlySales_summary;

  /// No description provided for @hourlySales_breakdown.
  ///
  /// In en, this message translates to:
  /// **'Breakdown'**
  String get hourlySales_breakdown;

  /// No description provided for @hourlySales_peakHour.
  ///
  /// In en, this message translates to:
  /// **'Peak Hour'**
  String get hourlySales_peakHour;

  /// No description provided for @hourlySales_peakSales.
  ///
  /// In en, this message translates to:
  /// **'Peak Sales'**
  String get hourlySales_peakSales;

  /// No description provided for @hourlySales_totalSales.
  ///
  /// In en, this message translates to:
  /// **'Total Sales'**
  String get hourlySales_totalSales;

  /// No description provided for @hourlySales_totalOrders.
  ///
  /// In en, this message translates to:
  /// **'Total Orders'**
  String get hourlySales_totalOrders;

  /// No description provided for @hourlySales_hourlyBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Hourly Breakdown'**
  String get hourlySales_hourlyBreakdown;

  /// No description provided for @hourlySales_hoursWithSales.
  ///
  /// In en, this message translates to:
  /// **'{count} hours with sales'**
  String hourlySales_hoursWithSales(int count);

  /// No description provided for @hourlySales_noSalesData.
  ///
  /// In en, this message translates to:
  /// **'No sales data for this period'**
  String get hourlySales_noSalesData;

  /// No description provided for @hourlySales_salesByHour.
  ///
  /// In en, this message translates to:
  /// **'Sales by Hour'**
  String get hourlySales_salesByHour;

  /// No description provided for @hourlySales_noTransactions.
  ///
  /// In en, this message translates to:
  /// **'No transactions recorded'**
  String get hourlySales_noTransactions;

  /// No description provided for @hourlySales_peak.
  ///
  /// In en, this message translates to:
  /// **'PEAK'**
  String get hourlySales_peak;

  /// No description provided for @hourlySales_slow.
  ///
  /// In en, this message translates to:
  /// **'SLOW'**
  String get hourlySales_slow;

  /// No description provided for @hourlySales_orders.
  ///
  /// In en, this message translates to:
  /// **'{count} orders'**
  String hourlySales_orders(int count);

  /// No description provided for @hourlySales_morning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get hourlySales_morning;

  /// No description provided for @hourlySales_afternoon.
  ///
  /// In en, this message translates to:
  /// **'Afternoon'**
  String get hourlySales_afternoon;

  /// No description provided for @hourlySales_evening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get hourlySales_evening;

  /// No description provided for @hourlySales_night.
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get hourlySales_night;

  /// No description provided for @hourlySales_lateNight.
  ///
  /// In en, this message translates to:
  /// **'Late Night'**
  String get hourlySales_lateNight;

  /// No description provided for @hourlySales_dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get hourlySales_dateRange;

  /// No description provided for @hourlySales_selectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select date range...'**
  String get hourlySales_selectDateRange;

  /// No description provided for @hourlySales_searchDateRange.
  ///
  /// In en, this message translates to:
  /// **'Search date range...'**
  String get hourlySales_searchDateRange;

  /// No description provided for @hourlySales_selectCustomDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select custom date range'**
  String get hourlySales_selectCustomDateRange;

  /// No description provided for @hourlySales_hour.
  ///
  /// In en, this message translates to:
  /// **'Hour'**
  String get hourlySales_hour;

  /// No description provided for @hourlySales_transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get hourlySales_transactions;

  /// No description provided for @hourlySales_sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get hourlySales_sales;

  /// No description provided for @payOrder_title.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payOrder_title;

  /// No description provided for @payOrder_titleWithTable.
  ///
  /// In en, this message translates to:
  /// **'Table {tableNumber} - Payment'**
  String payOrder_titleWithTable(int tableNumber);

  /// No description provided for @payOrder_selectPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get payOrder_selectPaymentMethod;

  /// No description provided for @payOrder_cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get payOrder_cash;

  /// No description provided for @payOrder_payWithCash.
  ///
  /// In en, this message translates to:
  /// **'Pay with cash'**
  String get payOrder_payWithCash;

  /// No description provided for @payOrder_qris.
  ///
  /// In en, this message translates to:
  /// **'QRIS'**
  String get payOrder_qris;

  /// No description provided for @payOrder_bankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get payOrder_bankTransfer;

  /// No description provided for @payOrder_credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get payOrder_credit;

  /// No description provided for @payOrder_creditHutang.
  ///
  /// In en, this message translates to:
  /// **'Credit (Hutang)'**
  String get payOrder_creditHutang;

  /// No description provided for @payOrder_customerPaysLater.
  ///
  /// In en, this message translates to:
  /// **'Customer pays later'**
  String get payOrder_customerPaysLater;

  /// No description provided for @payOrder_noDigitalPaymentMethods.
  ///
  /// In en, this message translates to:
  /// **'No digital payment methods configured'**
  String get payOrder_noDigitalPaymentMethods;

  /// No description provided for @payOrder_addQrisOrBankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Add QRIS or Bank Transfer in Settings > Payment Methods'**
  String get payOrder_addQrisOrBankTransfer;

  /// No description provided for @payOrder_creditRequiresCustomer.
  ///
  /// In en, this message translates to:
  /// **'Credit payment requires a customer. Please select a customer first.'**
  String get payOrder_creditRequiresCustomer;

  /// No description provided for @payOrder_creditSaleDisabled.
  ///
  /// In en, this message translates to:
  /// **'Credit sale is disabled. Enable it in Settings.'**
  String get payOrder_creditSaleDisabled;

  /// No description provided for @payOrder_enterVoucherCode.
  ///
  /// In en, this message translates to:
  /// **'Please enter a voucher code'**
  String get payOrder_enterVoucherCode;

  /// No description provided for @payOrder_voucherApplied.
  ///
  /// In en, this message translates to:
  /// **'Voucher applied! Discount: Rp {discount}'**
  String payOrder_voucherApplied(String discount);

  /// No description provided for @payOrder_invalidVoucher.
  ///
  /// In en, this message translates to:
  /// **'Invalid voucher'**
  String get payOrder_invalidVoucher;

  /// No description provided for @payOrder_voucherRemoved.
  ///
  /// In en, this message translates to:
  /// **'Voucher removed'**
  String get payOrder_voucherRemoved;

  /// No description provided for @payOrder_paymentFailed.
  ///
  /// In en, this message translates to:
  /// **'Payment failed: {error}'**
  String payOrder_paymentFailed(String error);

  /// No description provided for @payOrder_scanQrCode.
  ///
  /// In en, this message translates to:
  /// **'Scan QR code above using your e-wallet app'**
  String get payOrder_scanQrCode;

  /// No description provided for @payOrder_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get payOrder_total;

  /// No description provided for @payOrder_ivePaid.
  ///
  /// In en, this message translates to:
  /// **'I\'ve Paid'**
  String get payOrder_ivePaid;

  /// No description provided for @payOrder_accountNumber.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get payOrder_accountNumber;

  /// No description provided for @payOrder_accountHolder.
  ///
  /// In en, this message translates to:
  /// **'Account Holder'**
  String get payOrder_accountHolder;

  /// No description provided for @payOrder_accountNumberCopied.
  ///
  /// In en, this message translates to:
  /// **'Account number copied'**
  String get payOrder_accountNumberCopied;

  /// No description provided for @payOrder_amountCopied.
  ///
  /// In en, this message translates to:
  /// **'Amount copied'**
  String get payOrder_amountCopied;

  /// No description provided for @payOrder_transferAmount.
  ///
  /// In en, this message translates to:
  /// **'Transfer Amount:'**
  String get payOrder_transferAmount;

  /// No description provided for @payOrder_transferExactAmount.
  ///
  /// In en, this message translates to:
  /// **'Transfer the exact amount to the account above'**
  String get payOrder_transferExactAmount;

  /// No description provided for @payOrder_iveTransferred.
  ///
  /// In en, this message translates to:
  /// **'I\'ve Transferred'**
  String get payOrder_iveTransferred;

  /// No description provided for @payOrder_creditPayment.
  ///
  /// In en, this message translates to:
  /// **'Credit Payment'**
  String get payOrder_creditPayment;

  /// No description provided for @payOrder_creditRecordedFor.
  ///
  /// In en, this message translates to:
  /// **'This order will be recorded as credit (hutang) for:'**
  String get payOrder_creditRecordedFor;

  /// No description provided for @payOrder_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount: Rp {amount}'**
  String payOrder_amount(String amount);

  /// No description provided for @payOrder_creditWarning.
  ///
  /// In en, this message translates to:
  /// **'Customer must pay this amount later. You can track credits in Credit Management.'**
  String get payOrder_creditWarning;

  /// No description provided for @payOrder_confirmCredit.
  ///
  /// In en, this message translates to:
  /// **'Confirm Credit'**
  String get payOrder_confirmCredit;

  /// No description provided for @payOrder_customerRequired.
  ///
  /// In en, this message translates to:
  /// **'Customer is required for credit payment'**
  String get payOrder_customerRequired;

  /// No description provided for @payOrder_unknownCustomer.
  ///
  /// In en, this message translates to:
  /// **'Unknown Customer'**
  String get payOrder_unknownCustomer;

  /// No description provided for @payOrder_processingCreditSale.
  ///
  /// In en, this message translates to:
  /// **'Processing credit sale...'**
  String get payOrder_processingCreditSale;

  /// No description provided for @payOrder_failedToCreateOrder.
  ///
  /// In en, this message translates to:
  /// **'Failed to create order'**
  String get payOrder_failedToCreateOrder;

  /// No description provided for @payOrder_verifyPayment.
  ///
  /// In en, this message translates to:
  /// **'Verify Payment'**
  String get payOrder_verifyPayment;

  /// No description provided for @payOrder_checkEWallet.
  ///
  /// In en, this message translates to:
  /// **'Please check your e-wallet app to confirm the payment has been received.'**
  String get payOrder_checkEWallet;

  /// No description provided for @payOrder_checkBanking.
  ///
  /// In en, this message translates to:
  /// **'Please check your mobile banking or internet banking to confirm the transfer has been received.'**
  String get payOrder_checkBanking;

  /// No description provided for @payOrder_confirmPaymentReceived.
  ///
  /// In en, this message translates to:
  /// **'Confirm Payment Received'**
  String get payOrder_confirmPaymentReceived;

  /// No description provided for @payOrder_processingPayment.
  ///
  /// In en, this message translates to:
  /// **'Processing payment...'**
  String get payOrder_processingPayment;

  /// No description provided for @payOrder_orderFailed.
  ///
  /// In en, this message translates to:
  /// **'Order failed: {error}'**
  String payOrder_orderFailed(String error);

  /// No description provided for @payOrder_customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get payOrder_customer;

  /// No description provided for @payOrder_selectCustomer.
  ///
  /// In en, this message translates to:
  /// **'Select customer (optional)'**
  String get payOrder_selectCustomer;

  /// No description provided for @payOrder_searchCustomer.
  ///
  /// In en, this message translates to:
  /// **'Search customer...'**
  String get payOrder_searchCustomer;

  /// No description provided for @payOrder_subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get payOrder_subtotal;

  /// No description provided for @payOrder_voucher.
  ///
  /// In en, this message translates to:
  /// **'Voucher'**
  String get payOrder_voucher;

  /// No description provided for @payOrder_enterVoucher.
  ///
  /// In en, this message translates to:
  /// **'Enter voucher code'**
  String get payOrder_enterVoucher;

  /// No description provided for @payOrder_apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get payOrder_apply;

  /// No description provided for @payOrder_removeVoucher.
  ///
  /// In en, this message translates to:
  /// **'Remove voucher'**
  String get payOrder_removeVoucher;

  /// No description provided for @payOrder_amountPaid.
  ///
  /// In en, this message translates to:
  /// **'Amount paid'**
  String get payOrder_amountPaid;

  /// No description provided for @payOrder_change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get payOrder_change;

  /// No description provided for @payOrder_insufficient.
  ///
  /// In en, this message translates to:
  /// **'Kurang'**
  String get payOrder_insufficient;

  /// No description provided for @payOrder_customerWillPayLater.
  ///
  /// In en, this message translates to:
  /// **'Customer will pay later'**
  String get payOrder_customerWillPayLater;

  /// No description provided for @payOrder_processing.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get payOrder_processing;

  /// No description provided for @payOrder_confirmPayment.
  ///
  /// In en, this message translates to:
  /// **'Confirm Payment'**
  String get payOrder_confirmPayment;

  /// No description provided for @payOrder_orderSummary.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get payOrder_orderSummary;

  /// No description provided for @payOrder_items.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String payOrder_items(int count);

  /// No description provided for @payOrder_unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get payOrder_unknown;

  /// No description provided for @payOrder_note.
  ///
  /// In en, this message translates to:
  /// **'Note: {note}'**
  String payOrder_note(String note);

  /// No description provided for @payOrder_exact.
  ///
  /// In en, this message translates to:
  /// **'Exact'**
  String get payOrder_exact;

  /// No description provided for @payOrder_salesCredit.
  ///
  /// In en, this message translates to:
  /// **'Sales Credit'**
  String get payOrder_salesCredit;

  /// No description provided for @tableLive_title_tables.
  ///
  /// In en, this message translates to:
  /// **'Tables'**
  String get tableLive_title_tables;

  /// No description provided for @tableLive_title_orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get tableLive_title_orders;

  /// No description provided for @tableLive_orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get tableLive_orderDetails;

  /// No description provided for @tableLive_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get tableLive_total;

  /// No description provided for @tableLive_note.
  ///
  /// In en, this message translates to:
  /// **'Note: {note}'**
  String tableLive_note(String note);

  /// No description provided for @tableLive_printOrder.
  ///
  /// In en, this message translates to:
  /// **'Print Order'**
  String get tableLive_printOrder;

  /// No description provided for @tableLive_tableNumber.
  ///
  /// In en, this message translates to:
  /// **'Table {number}'**
  String tableLive_tableNumber(int number);

  /// No description provided for @tableLive_statusSeats.
  ///
  /// In en, this message translates to:
  /// **'{status} • {capacity} seats'**
  String tableLive_statusSeats(String status, int capacity);

  /// No description provided for @tableLive_activeOrder.
  ///
  /// In en, this message translates to:
  /// **'Active Order'**
  String get tableLive_activeOrder;

  /// No description provided for @tableLive_noActiveOrder.
  ///
  /// In en, this message translates to:
  /// **'No Active Order'**
  String get tableLive_noActiveOrder;

  /// No description provided for @tableLive_totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total: Rp {amount}'**
  String tableLive_totalAmount(String amount);

  /// No description provided for @tableLive_addItems.
  ///
  /// In en, this message translates to:
  /// **'Add Items'**
  String get tableLive_addItems;

  /// No description provided for @tableLive_noActiveOrderYet.
  ///
  /// In en, this message translates to:
  /// **'No active order yet'**
  String get tableLive_noActiveOrderYet;

  /// No description provided for @tableLive_changeStatus.
  ///
  /// In en, this message translates to:
  /// **'Change Status:'**
  String get tableLive_changeStatus;

  /// No description provided for @tableLive_underMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Under Maintenance'**
  String get tableLive_underMaintenance;

  /// No description provided for @tableLive_startNewOrder.
  ///
  /// In en, this message translates to:
  /// **'Start New Order'**
  String get tableLive_startNewOrder;

  /// No description provided for @tableLive_processPayment.
  ///
  /// In en, this message translates to:
  /// **'Process Payment (Rp {amount})'**
  String tableLive_processPayment(String amount);

  /// No description provided for @tableLive_changeStatusBtn.
  ///
  /// In en, this message translates to:
  /// **'Change Status'**
  String get tableLive_changeStatusBtn;

  /// No description provided for @tableLive_setAvailable.
  ///
  /// In en, this message translates to:
  /// **'Set Available'**
  String get tableLive_setAvailable;

  /// No description provided for @tableLive_tableChangeStatus.
  ///
  /// In en, this message translates to:
  /// **'Table {number} - Change Status'**
  String tableLive_tableChangeStatus(int number);

  /// No description provided for @tableLive_noTablesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No Tables Available'**
  String get tableLive_noTablesAvailable;

  /// No description provided for @tableLive_goToTablesHint.
  ///
  /// In en, this message translates to:
  /// **'Go to Home > Tables to add tables'**
  String get tableLive_goToTablesHint;

  /// No description provided for @tableLive_searchTableNumber.
  ///
  /// In en, this message translates to:
  /// **'Search table number...'**
  String get tableLive_searchTableNumber;

  /// No description provided for @tableLive_availableCount.
  ///
  /// In en, this message translates to:
  /// **'Available ({count})'**
  String tableLive_availableCount(int count);

  /// No description provided for @tableLive_occupiedCount.
  ///
  /// In en, this message translates to:
  /// **'Occupied ({count})'**
  String tableLive_occupiedCount(int count);

  /// No description provided for @tableLive_maintenanceCount.
  ///
  /// In en, this message translates to:
  /// **'Maintenance ({count})'**
  String tableLive_maintenanceCount(int count);

  /// No description provided for @tableLive_allCount.
  ///
  /// In en, this message translates to:
  /// **'All ({count})'**
  String tableLive_allCount(int count);

  /// No description provided for @tableLive_noTablesWithStatus.
  ///
  /// In en, this message translates to:
  /// **'No {status} tables'**
  String tableLive_noTablesWithStatus(String status);

  /// No description provided for @tableLive_tapTableHint.
  ///
  /// In en, this message translates to:
  /// **'Tap a table to view details'**
  String get tableLive_tapTableHint;

  /// No description provided for @tableLive_searchCustomerOrTable.
  ///
  /// In en, this message translates to:
  /// **'Search customer or table...'**
  String get tableLive_searchCustomerOrTable;

  /// No description provided for @tableLive_unpaidCount.
  ///
  /// In en, this message translates to:
  /// **'Unpaid ({count})'**
  String tableLive_unpaidCount(int count);

  /// No description provided for @tableLive_finishedCount.
  ///
  /// In en, this message translates to:
  /// **'Finished ({count})'**
  String tableLive_finishedCount(int count);

  /// No description provided for @tableLive_noUnpaidOrders.
  ///
  /// In en, this message translates to:
  /// **'No unpaid orders'**
  String get tableLive_noUnpaidOrders;

  /// No description provided for @tableLive_noFinishedOrders.
  ///
  /// In en, this message translates to:
  /// **'No finished orders'**
  String get tableLive_noFinishedOrders;

  /// No description provided for @tableLive_paymentStatus.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get tableLive_paymentStatus;

  /// No description provided for @tableLive_allPaymentStatus.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get tableLive_allPaymentStatus;

  /// No description provided for @tableLive_unpaid.
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get tableLive_unpaid;

  /// No description provided for @tableLive_finished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get tableLive_finished;

  /// No description provided for @tableLive_allOrderStatus.
  ///
  /// In en, this message translates to:
  /// **'All Status'**
  String get tableLive_allOrderStatus;

  /// No description provided for @tableLive_noTakeawayOrders.
  ///
  /// In en, this message translates to:
  /// **'No takeaway orders'**
  String get tableLive_noTakeawayOrders;

  /// No description provided for @tableLive_order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get tableLive_order;

  /// No description provided for @tableLive_takeaway.
  ///
  /// In en, this message translates to:
  /// **'Takeaway'**
  String get tableLive_takeaway;

  /// No description provided for @tableLive_noCustomer.
  ///
  /// In en, this message translates to:
  /// **'No customer'**
  String get tableLive_noCustomer;

  /// No description provided for @tableLive_completedOrder.
  ///
  /// In en, this message translates to:
  /// **'Completed Order'**
  String get tableLive_completedOrder;

  /// No description provided for @tableLive_paid.
  ///
  /// In en, this message translates to:
  /// **'PAID'**
  String get tableLive_paid;

  /// No description provided for @tableLive_itemsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String tableLive_itemsCount(int count);

  /// No description provided for @tableLive_filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get tableLive_filter;

  /// No description provided for @tableLive_dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get tableLive_dateRange;

  /// No description provided for @tableLive_selectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select date range...'**
  String get tableLive_selectDateRange;

  /// No description provided for @tableLive_searchDateRange.
  ///
  /// In en, this message translates to:
  /// **'Search date range...'**
  String get tableLive_searchDateRange;

  /// No description provided for @tableLive_selectCustomDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select custom date range'**
  String get tableLive_selectCustomDateRange;

  /// No description provided for @tableLive_customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get tableLive_customer;

  /// No description provided for @tableLive_allCustomers.
  ///
  /// In en, this message translates to:
  /// **'All Customers'**
  String get tableLive_allCustomers;

  /// No description provided for @tableLive_searchCustomer.
  ///
  /// In en, this message translates to:
  /// **'Search customer...'**
  String get tableLive_searchCustomer;

  /// No description provided for @tableLive_cancelOrder.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order'**
  String get tableLive_cancelOrder;

  /// No description provided for @tableLive_cancelOrderTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order?'**
  String get tableLive_cancelOrderTitle;

  /// No description provided for @tableLive_cancelOrderMessage.
  ///
  /// In en, this message translates to:
  /// **'Stock will be returned to inventory.\n\nAny losses from this transaction should be recorded in Stock Adjustment or Expense.'**
  String get tableLive_cancelOrderMessage;

  /// No description provided for @tableLive_cancelOrderConfirm.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order'**
  String get tableLive_cancelOrderConfirm;

  /// No description provided for @tableLive_cancellingOrder.
  ///
  /// In en, this message translates to:
  /// **'Cancelling order...'**
  String get tableLive_cancellingOrder;

  /// No description provided for @tableLive_orderCancelled.
  ///
  /// In en, this message translates to:
  /// **'Order cancelled successfully'**
  String get tableLive_orderCancelled;

  /// No description provided for @tableLive_cannotChangeStatusTitle.
  ///
  /// In en, this message translates to:
  /// **'Cannot Change Status'**
  String get tableLive_cannotChangeStatusTitle;

  /// No description provided for @tableLive_cannotChangeStatusMessage.
  ///
  /// In en, this message translates to:
  /// **'This table has an active order. Please complete or cancel the order first before changing the table status.'**
  String get tableLive_cannotChangeStatusMessage;

  /// No description provided for @tableLive_editItem.
  ///
  /// In en, this message translates to:
  /// **'Edit Item'**
  String get tableLive_editItem;

  /// No description provided for @tableLive_quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get tableLive_quantity;

  /// No description provided for @tableLive_noteOptional.
  ///
  /// In en, this message translates to:
  /// **'Note (optional)'**
  String get tableLive_noteOptional;

  /// No description provided for @tableLive_removeItem.
  ///
  /// In en, this message translates to:
  /// **'Remove Item'**
  String get tableLive_removeItem;

  /// No description provided for @tableLive_removeItemConfirm.
  ///
  /// In en, this message translates to:
  /// **'Remove \"{itemName}\" from order?'**
  String tableLive_removeItemConfirm(String itemName);

  /// No description provided for @tableLive_itemRemoved.
  ///
  /// In en, this message translates to:
  /// **'Item removed from order'**
  String get tableLive_itemRemoved;

  /// No description provided for @tableLive_itemUpdated.
  ///
  /// In en, this message translates to:
  /// **'Item updated'**
  String get tableLive_itemUpdated;

  /// No description provided for @tableLive_orderEmptyCancelled.
  ///
  /// In en, this message translates to:
  /// **'Order cancelled (no items left)'**
  String get tableLive_orderEmptyCancelled;

  /// No description provided for @tableLive_updatingItem.
  ///
  /// In en, this message translates to:
  /// **'Updating item...'**
  String get tableLive_updatingItem;

  /// No description provided for @tableLive_removingItem.
  ///
  /// In en, this message translates to:
  /// **'Removing item...'**
  String get tableLive_removingItem;

  /// No description provided for @tableLive_tapToEdit.
  ///
  /// In en, this message translates to:
  /// **'Tap item to edit'**
  String get tableLive_tapToEdit;

  /// No description provided for @developerUi_title.
  ///
  /// In en, this message translates to:
  /// **'UI Components'**
  String get developerUi_title;

  /// No description provided for @developerUi_tabForm.
  ///
  /// In en, this message translates to:
  /// **'Form'**
  String get developerUi_tabForm;

  /// No description provided for @developerUi_tabDialogSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Dialog & Snackbar'**
  String get developerUi_tabDialogSnackbar;

  /// No description provided for @developerUi_qbuttonTitle.
  ///
  /// In en, this message translates to:
  /// **'QButton'**
  String get developerUi_qbuttonTitle;

  /// No description provided for @developerUi_qbuttonDesc.
  ///
  /// In en, this message translates to:
  /// **'Reusable button with variants: primary, secondary, danger, text'**
  String get developerUi_qbuttonDesc;

  /// No description provided for @developerUi_primary.
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get developerUi_primary;

  /// No description provided for @developerUi_secondary.
  ///
  /// In en, this message translates to:
  /// **'Secondary'**
  String get developerUi_secondary;

  /// No description provided for @developerUi_danger.
  ///
  /// In en, this message translates to:
  /// **'Danger'**
  String get developerUi_danger;

  /// No description provided for @developerUi_text.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get developerUi_text;

  /// No description provided for @developerUi_withIcon.
  ///
  /// In en, this message translates to:
  /// **'With Icon'**
  String get developerUi_withIcon;

  /// No description provided for @developerUi_loadingState.
  ///
  /// In en, this message translates to:
  /// **'Loading State'**
  String get developerUi_loadingState;

  /// No description provided for @developerUi_primaryClicked.
  ///
  /// In en, this message translates to:
  /// **'Primary clicked'**
  String get developerUi_primaryClicked;

  /// No description provided for @developerUi_secondaryClicked.
  ///
  /// In en, this message translates to:
  /// **'Secondary clicked'**
  String get developerUi_secondaryClicked;

  /// No description provided for @developerUi_dangerClicked.
  ///
  /// In en, this message translates to:
  /// **'Danger clicked'**
  String get developerUi_dangerClicked;

  /// No description provided for @developerUi_textClicked.
  ///
  /// In en, this message translates to:
  /// **'Text clicked'**
  String get developerUi_textClicked;

  /// No description provided for @developerUi_iconButtonClicked.
  ///
  /// In en, this message translates to:
  /// **'Icon button clicked'**
  String get developerUi_iconButtonClicked;

  /// No description provided for @developerUi_qtextfieldTitle.
  ///
  /// In en, this message translates to:
  /// **'QTextField'**
  String get developerUi_qtextfieldTitle;

  /// No description provided for @developerUi_qtextfieldDesc.
  ///
  /// In en, this message translates to:
  /// **'Reusable text field with label, hint, icons, validation'**
  String get developerUi_qtextfieldDesc;

  /// No description provided for @developerUi_username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get developerUi_username;

  /// No description provided for @developerUi_enterUsername.
  ///
  /// In en, this message translates to:
  /// **'Enter your username'**
  String get developerUi_enterUsername;

  /// No description provided for @developerUi_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get developerUi_password;

  /// No description provided for @developerUi_enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get developerUi_enterPassword;

  /// No description provided for @developerUi_multiline.
  ///
  /// In en, this message translates to:
  /// **'Multiline'**
  String get developerUi_multiline;

  /// No description provided for @developerUi_enterDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter description...'**
  String get developerUi_enterDescription;

  /// No description provided for @developerUi_qdropdownTitle.
  ///
  /// In en, this message translates to:
  /// **'QDropdownField'**
  String get developerUi_qdropdownTitle;

  /// No description provided for @developerUi_qdropdownDesc.
  ///
  /// In en, this message translates to:
  /// **'Reusable dropdown field with generic type support'**
  String get developerUi_qdropdownDesc;

  /// No description provided for @developerUi_selectOption.
  ///
  /// In en, this message translates to:
  /// **'Select Option'**
  String get developerUi_selectOption;

  /// No description provided for @developerUi_chooseOne.
  ///
  /// In en, this message translates to:
  /// **'Choose one'**
  String get developerUi_chooseOne;

  /// No description provided for @developerUi_option1.
  ///
  /// In en, this message translates to:
  /// **'Option 1'**
  String get developerUi_option1;

  /// No description provided for @developerUi_option2.
  ///
  /// In en, this message translates to:
  /// **'Option 2'**
  String get developerUi_option2;

  /// No description provided for @developerUi_option3.
  ///
  /// In en, this message translates to:
  /// **'Option 3'**
  String get developerUi_option3;

  /// No description provided for @developerUi_selected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get developerUi_selected;

  /// No description provided for @developerUi_qimageTitle.
  ///
  /// In en, this message translates to:
  /// **'QImageField'**
  String get developerUi_qimageTitle;

  /// No description provided for @developerUi_qimageDesc.
  ///
  /// In en, this message translates to:
  /// **'Image picker with camera/gallery support and auto-upload'**
  String get developerUi_qimageDesc;

  /// No description provided for @developerUi_productImage.
  ///
  /// In en, this message translates to:
  /// **'Product Image'**
  String get developerUi_productImage;

  /// No description provided for @developerUi_categoryFilterTitle.
  ///
  /// In en, this message translates to:
  /// **'CategoryFilter'**
  String get developerUi_categoryFilterTitle;

  /// No description provided for @developerUi_categoryFilterDesc.
  ///
  /// In en, this message translates to:
  /// **'Horizontal scrollable category filter chips'**
  String get developerUi_categoryFilterDesc;

  /// No description provided for @developerUi_formWidgetsUsage.
  ///
  /// In en, this message translates to:
  /// **'Form Widgets Usage'**
  String get developerUi_formWidgetsUsage;

  /// No description provided for @developerUi_appDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'AppDialog'**
  String get developerUi_appDialogTitle;

  /// No description provided for @developerUi_appDialogDesc.
  ///
  /// In en, this message translates to:
  /// **'Contextless dialog utilities.\nImport: lib/core/util/contextless/dialog.dart'**
  String get developerUi_appDialogDesc;

  /// No description provided for @developerUi_confirmAction.
  ///
  /// In en, this message translates to:
  /// **'Confirm Action'**
  String get developerUi_confirmAction;

  /// No description provided for @developerUi_confirmDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'This is a confirmation dialog. Do you want to proceed?'**
  String get developerUi_confirmDialogMessage;

  /// No description provided for @developerUi_confirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed!'**
  String get developerUi_confirmed;

  /// No description provided for @developerUi_information.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get developerUi_information;

  /// No description provided for @developerUi_infoDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'This is an informational dialog to display messages.'**
  String get developerUi_infoDialogMessage;

  /// No description provided for @developerUi_warningDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'This action may have consequences. Continue?'**
  String get developerUi_warningDialogMessage;

  /// No description provided for @developerUi_proceededWithWarning.
  ///
  /// In en, this message translates to:
  /// **'Proceeded with warning'**
  String get developerUi_proceededWithWarning;

  /// No description provided for @developerUi_deleteItem.
  ///
  /// In en, this message translates to:
  /// **'Delete Item'**
  String get developerUi_deleteItem;

  /// No description provided for @developerUi_dangerDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone. Delete?'**
  String get developerUi_dangerDialogMessage;

  /// No description provided for @developerUi_itemDeleted.
  ///
  /// In en, this message translates to:
  /// **'Item deleted!'**
  String get developerUi_itemDeleted;

  /// No description provided for @developerUi_appSnackbarTitle.
  ///
  /// In en, this message translates to:
  /// **'AppSnackbar'**
  String get developerUi_appSnackbarTitle;

  /// No description provided for @developerUi_appSnackbarDesc.
  ///
  /// In en, this message translates to:
  /// **'Contextless snackbar utilities.\nImport: lib/core/util/contextless/snackbar.dart'**
  String get developerUi_appSnackbarDesc;

  /// No description provided for @developerUi_successMessage.
  ///
  /// In en, this message translates to:
  /// **'This is a success message!'**
  String get developerUi_successMessage;

  /// No description provided for @developerUi_errorMessage.
  ///
  /// In en, this message translates to:
  /// **'This is an error message!'**
  String get developerUi_errorMessage;

  /// No description provided for @developerUi_warningMessage.
  ///
  /// In en, this message translates to:
  /// **'This is a warning message!'**
  String get developerUi_warningMessage;

  /// No description provided for @developerUi_infoMessage.
  ///
  /// In en, this message translates to:
  /// **'This is an info message!'**
  String get developerUi_infoMessage;

  /// No description provided for @developerUi_undo.
  ///
  /// In en, this message translates to:
  /// **'UNDO'**
  String get developerUi_undo;

  /// No description provided for @developerUi_undoSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Undo successful!'**
  String get developerUi_undoSuccessful;

  /// No description provided for @developerUi_appLoadingTitle.
  ///
  /// In en, this message translates to:
  /// **'AppLoading'**
  String get developerUi_appLoadingTitle;

  /// No description provided for @developerUi_appLoadingDesc.
  ///
  /// In en, this message translates to:
  /// **'Contextless loading overlay.\nImport: lib/core/util/contextless/loading.dart'**
  String get developerUi_appLoadingDesc;

  /// No description provided for @developerUi_loadingFinished.
  ///
  /// In en, this message translates to:
  /// **'Loading finished!'**
  String get developerUi_loadingFinished;

  /// No description provided for @developerUi_withMessage.
  ///
  /// In en, this message translates to:
  /// **'with message'**
  String get developerUi_withMessage;

  /// No description provided for @developerUi_pleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please wait...'**
  String get developerUi_pleaseWait;

  /// No description provided for @developerUi_processing.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get developerUi_processing;

  /// No description provided for @developerUi_dialogSnackbarLoadingUsage.
  ///
  /// In en, this message translates to:
  /// **'Dialog, Snackbar & Loading Usage'**
  String get developerUi_dialogSnackbarLoadingUsage;

  /// No description provided for @developerUi_tabMoreWidgets.
  ///
  /// In en, this message translates to:
  /// **'More Widgets'**
  String get developerUi_tabMoreWidgets;

  /// No description provided for @developerUi_tabChips.
  ///
  /// In en, this message translates to:
  /// **'Chips'**
  String get developerUi_tabChips;

  /// No description provided for @developerUi_qtextareaTitle.
  ///
  /// In en, this message translates to:
  /// **'QTextArea'**
  String get developerUi_qtextareaTitle;

  /// No description provided for @developerUi_qtextareaDesc.
  ///
  /// In en, this message translates to:
  /// **'Multiline text area with internal controller, min/max lines, and counter'**
  String get developerUi_qtextareaDesc;

  /// No description provided for @developerUi_notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get developerUi_notes;

  /// No description provided for @developerUi_enterNotes.
  ///
  /// In en, this message translates to:
  /// **'Enter your notes here...'**
  String get developerUi_enterNotes;

  /// No description provided for @developerUi_qdropdownSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'QDropdownSearch'**
  String get developerUi_qdropdownSearchTitle;

  /// No description provided for @developerUi_qdropdownSearchDesc.
  ///
  /// In en, this message translates to:
  /// **'Full-screen searchable dropdown for long lists (customers, products, etc.)'**
  String get developerUi_qdropdownSearchDesc;

  /// No description provided for @developerUi_selectCustomer.
  ///
  /// In en, this message translates to:
  /// **'Select Customer'**
  String get developerUi_selectCustomer;

  /// No description provided for @developerUi_searchCustomer.
  ///
  /// In en, this message translates to:
  /// **'Search customer...'**
  String get developerUi_searchCustomer;

  /// No description provided for @developerUi_qdateFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'QDateField'**
  String get developerUi_qdateFieldTitle;

  /// No description provided for @developerUi_qdateFieldDesc.
  ///
  /// In en, this message translates to:
  /// **'Date picker field with clearable option and consistent styling'**
  String get developerUi_qdateFieldDesc;

  /// No description provided for @developerUi_selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get developerUi_selectDate;

  /// No description provided for @developerUi_qdateRangeFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'QDateRangeField'**
  String get developerUi_qdateRangeFieldTitle;

  /// No description provided for @developerUi_qdateRangeFieldDesc.
  ///
  /// In en, this message translates to:
  /// **'Date range picker with start and end date fields'**
  String get developerUi_qdateRangeFieldDesc;

  /// No description provided for @developerUi_dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get developerUi_dateRange;

  /// No description provided for @developerUi_qtyPickerTitle.
  ///
  /// In en, this message translates to:
  /// **'QtyPicker'**
  String get developerUi_qtyPickerTitle;

  /// No description provided for @developerUi_qtyPickerDesc.
  ///
  /// In en, this message translates to:
  /// **'Quantity picker with +/- buttons. Two types: fullWidth (form) and compact (list/cart)'**
  String get developerUi_qtyPickerDesc;

  /// No description provided for @developerUi_quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get developerUi_quantity;

  /// No description provided for @developerUi_compactMode.
  ///
  /// In en, this message translates to:
  /// **'Compact Mode'**
  String get developerUi_compactMode;

  /// No description provided for @developerUi_qswitchTileTitle.
  ///
  /// In en, this message translates to:
  /// **'QSwitchTile'**
  String get developerUi_qswitchTileTitle;

  /// No description provided for @developerUi_qswitchTileDesc.
  ///
  /// In en, this message translates to:
  /// **'Switch tile with title, subtitle, and icon in a styled container'**
  String get developerUi_qswitchTileDesc;

  /// No description provided for @developerUi_trackStock.
  ///
  /// In en, this message translates to:
  /// **'Track Stock'**
  String get developerUi_trackStock;

  /// No description provided for @developerUi_stockTracked.
  ///
  /// In en, this message translates to:
  /// **'Stock will be tracked'**
  String get developerUi_stockTracked;

  /// No description provided for @developerUi_stockNotTracked.
  ///
  /// In en, this message translates to:
  /// **'Tap to enable'**
  String get developerUi_stockNotTracked;

  /// No description provided for @developerUi_statisticCardTitle.
  ///
  /// In en, this message translates to:
  /// **'StatisticCard & StatisticCardGrid'**
  String get developerUi_statisticCardTitle;

  /// No description provided for @developerUi_statisticCardDesc.
  ///
  /// In en, this message translates to:
  /// **'Statistic cards for dashboards and reports. Max 2 cards per row'**
  String get developerUi_statisticCardDesc;

  /// No description provided for @developerUi_totalSales.
  ///
  /// In en, this message translates to:
  /// **'Total Sales'**
  String get developerUi_totalSales;

  /// No description provided for @developerUi_totalOrders.
  ///
  /// In en, this message translates to:
  /// **'Total Orders'**
  String get developerUi_totalOrders;

  /// No description provided for @developerUi_avgOrder.
  ///
  /// In en, this message translates to:
  /// **'Avg Order'**
  String get developerUi_avgOrder;

  /// No description provided for @developerUi_profit.
  ///
  /// In en, this message translates to:
  /// **'Profit'**
  String get developerUi_profit;

  /// No description provided for @developerUi_commonWidgetsTitle.
  ///
  /// In en, this message translates to:
  /// **'Common Widgets'**
  String get developerUi_commonWidgetsTitle;

  /// No description provided for @developerUi_commonWidgetsDesc.
  ///
  /// In en, this message translates to:
  /// **'Reusable common widgets from common_widgets.dart'**
  String get developerUi_commonWidgetsDesc;

  /// No description provided for @developerUi_emptyStateTitle.
  ///
  /// In en, this message translates to:
  /// **'EmptyStateWidget'**
  String get developerUi_emptyStateTitle;

  /// No description provided for @developerUi_emptyStateDesc.
  ///
  /// In en, this message translates to:
  /// **'Consistent empty state with icon, message, and optional action'**
  String get developerUi_emptyStateDesc;

  /// No description provided for @developerUi_noDataFound.
  ///
  /// In en, this message translates to:
  /// **'No data found'**
  String get developerUi_noDataFound;

  /// No description provided for @developerUi_tryAdding.
  ///
  /// In en, this message translates to:
  /// **'Try adding some items'**
  String get developerUi_tryAdding;

  /// No description provided for @developerUi_viewModeToggleTitle.
  ///
  /// In en, this message translates to:
  /// **'ViewModeToggle'**
  String get developerUi_viewModeToggleTitle;

  /// No description provided for @developerUi_viewModeToggleDesc.
  ///
  /// In en, this message translates to:
  /// **'Grid/List view mode toggle for management views'**
  String get developerUi_viewModeToggleDesc;

  /// No description provided for @developerUi_detailRowTitle.
  ///
  /// In en, this message translates to:
  /// **'DetailRow'**
  String get developerUi_detailRowTitle;

  /// No description provided for @developerUi_detailRowDesc.
  ///
  /// In en, this message translates to:
  /// **'Label-value row for detail sheets and info displays'**
  String get developerUi_detailRowDesc;

  /// No description provided for @developerUi_customerName.
  ///
  /// In en, this message translates to:
  /// **'Customer Name'**
  String get developerUi_customerName;

  /// No description provided for @developerUi_johnDoe.
  ///
  /// In en, this message translates to:
  /// **'John Doe'**
  String get developerUi_johnDoe;

  /// No description provided for @developerUi_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get developerUi_status;

  /// No description provided for @developerUi_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get developerUi_completed;

  /// No description provided for @developerUi_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get developerUi_phone;

  /// No description provided for @developerUi_sectionHeaderTitle.
  ///
  /// In en, this message translates to:
  /// **'SectionHeader'**
  String get developerUi_sectionHeaderTitle;

  /// No description provided for @developerUi_sectionHeaderDesc.
  ///
  /// In en, this message translates to:
  /// **'Section title with optional icon and trailing widget'**
  String get developerUi_sectionHeaderDesc;

  /// No description provided for @developerUi_customerInfo.
  ///
  /// In en, this message translates to:
  /// **'Customer Information'**
  String get developerUi_customerInfo;

  /// No description provided for @developerUi_lineItemRowTitle.
  ///
  /// In en, this message translates to:
  /// **'LineItemRow & TotalRow'**
  String get developerUi_lineItemRowTitle;

  /// No description provided for @developerUi_lineItemRowDesc.
  ///
  /// In en, this message translates to:
  /// **'Line items and total rows for financial reports'**
  String get developerUi_lineItemRowDesc;

  /// No description provided for @developerUi_productSales.
  ///
  /// In en, this message translates to:
  /// **'Product Sales'**
  String get developerUi_productSales;

  /// No description provided for @developerUi_discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get developerUi_discount;

  /// No description provided for @developerUi_grandTotal.
  ///
  /// In en, this message translates to:
  /// **'Grand Total'**
  String get developerUi_grandTotal;

  /// No description provided for @developerUi_bulletPointTitle.
  ///
  /// In en, this message translates to:
  /// **'BulletPoint'**
  String get developerUi_bulletPointTitle;

  /// No description provided for @developerUi_bulletPointDesc.
  ///
  /// In en, this message translates to:
  /// **'Simple bullet point text for help dialogs and lists'**
  String get developerUi_bulletPointDesc;

  /// No description provided for @developerUi_bulletText1.
  ///
  /// In en, this message translates to:
  /// **'First point of information'**
  String get developerUi_bulletText1;

  /// No description provided for @developerUi_bulletText2.
  ///
  /// In en, this message translates to:
  /// **'Second point of information'**
  String get developerUi_bulletText2;

  /// No description provided for @developerUi_bulletText3.
  ///
  /// In en, this message translates to:
  /// **'Third point of information'**
  String get developerUi_bulletText3;

  /// No description provided for @developerUi_filterIconButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'FilterIconButton'**
  String get developerUi_filterIconButtonTitle;

  /// No description provided for @developerUi_filterIconButtonDesc.
  ///
  /// In en, this message translates to:
  /// **'Filter button with badge indicator for AppBar'**
  String get developerUi_filterIconButtonDesc;

  /// No description provided for @developerUi_statusChipTitle.
  ///
  /// In en, this message translates to:
  /// **'StatusChip'**
  String get developerUi_statusChipTitle;

  /// No description provided for @developerUi_statusChipDesc.
  ///
  /// In en, this message translates to:
  /// **'Read-only status badge with optional icon'**
  String get developerUi_statusChipDesc;

  /// No description provided for @developerUi_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get developerUi_active;

  /// No description provided for @developerUi_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get developerUi_pending;

  /// No description provided for @developerUi_paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get developerUi_paid;

  /// No description provided for @developerUi_infoChipTitle.
  ///
  /// In en, this message translates to:
  /// **'InfoChip'**
  String get developerUi_infoChipTitle;

  /// No description provided for @developerUi_infoChipDesc.
  ///
  /// In en, this message translates to:
  /// **'Icon + label info display (not a Chip widget)'**
  String get developerUi_infoChipDesc;

  /// No description provided for @developerUi_quickActionChipTitle.
  ///
  /// In en, this message translates to:
  /// **'QuickActionChip'**
  String get developerUi_quickActionChipTitle;

  /// No description provided for @developerUi_quickActionChipDesc.
  ///
  /// In en, this message translates to:
  /// **'Tappable quick action chips (amount shortcuts, etc.)'**
  String get developerUi_quickActionChipDesc;

  /// No description provided for @developerUi_chipTapped.
  ///
  /// In en, this message translates to:
  /// **'Chip tapped'**
  String get developerUi_chipTapped;

  /// No description provided for @developerUi_selectableActionChipTitle.
  ///
  /// In en, this message translates to:
  /// **'SelectableActionChip'**
  String get developerUi_selectableActionChipTitle;

  /// No description provided for @developerUi_selectableActionChipDesc.
  ///
  /// In en, this message translates to:
  /// **'Tappable chip with selected state (currency, tax rate, etc.)'**
  String get developerUi_selectableActionChipDesc;

  /// No description provided for @developerUi_selectionCardTitle.
  ///
  /// In en, this message translates to:
  /// **'SelectionCard'**
  String get developerUi_selectionCardTitle;

  /// No description provided for @developerUi_selectionCardDesc.
  ///
  /// In en, this message translates to:
  /// **'Card-like selection with icon (role, type picker)'**
  String get developerUi_selectionCardDesc;

  /// No description provided for @developerUi_admin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get developerUi_admin;

  /// No description provided for @developerUi_cashier.
  ///
  /// In en, this message translates to:
  /// **'Cashier'**
  String get developerUi_cashier;

  /// No description provided for @developerUi_manager.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get developerUi_manager;

  /// No description provided for @developerUi_selectableChipWrapTitle.
  ///
  /// In en, this message translates to:
  /// **'SelectableChipWrap'**
  String get developerUi_selectableChipWrapTitle;

  /// No description provided for @developerUi_selectableChipWrapDesc.
  ///
  /// In en, this message translates to:
  /// **'Multi-select chips in Wrap layout'**
  String get developerUi_selectableChipWrapDesc;

  /// No description provided for @developerUi_size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get developerUi_size;

  /// No description provided for @developerUi_color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get developerUi_color;

  /// No description provided for @developerUi_topping.
  ///
  /// In en, this message translates to:
  /// **'Topping'**
  String get developerUi_topping;

  /// No description provided for @developerUi_deletableChipListTitle.
  ///
  /// In en, this message translates to:
  /// **'DeletableChipList'**
  String get developerUi_deletableChipListTitle;

  /// No description provided for @developerUi_deletableChipListDesc.
  ///
  /// In en, this message translates to:
  /// **'Chips with delete button (units, tags)'**
  String get developerUi_deletableChipListDesc;

  /// No description provided for @developerUi_chipDeleted.
  ///
  /// In en, this message translates to:
  /// **'Chip deleted'**
  String get developerUi_chipDeleted;

  /// No description provided for @developerUi_singleSelectChipRowTitle.
  ///
  /// In en, this message translates to:
  /// **'SingleSelectChipRow'**
  String get developerUi_singleSelectChipRowTitle;

  /// No description provided for @developerUi_singleSelectChipRowDesc.
  ///
  /// In en, this message translates to:
  /// **'Single select chips in a Row (payment type, etc.)'**
  String get developerUi_singleSelectChipRowDesc;

  /// No description provided for @developerUi_cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get developerUi_cash;

  /// No description provided for @developerUi_credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get developerUi_credit;

  /// No description provided for @developerUi_transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get developerUi_transfer;

  /// No description provided for @developerUi_moreWidgetsUsage.
  ///
  /// In en, this message translates to:
  /// **'More Widgets Usage'**
  String get developerUi_moreWidgetsUsage;

  /// No description provided for @developerUi_chipsUsage.
  ///
  /// In en, this message translates to:
  /// **'Chips & Selection Widgets Usage'**
  String get developerUi_chipsUsage;

  /// No description provided for @nav_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get nav_home;

  /// No description provided for @nav_pos.
  ///
  /// In en, this message translates to:
  /// **'POS'**
  String get nav_pos;

  /// No description provided for @nav_tables.
  ///
  /// In en, this message translates to:
  /// **'Tables'**
  String get nav_tables;

  /// No description provided for @nav_orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get nav_orders;

  /// No description provided for @nav_stockAlert.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get nav_stockAlert;

  /// No description provided for @nav_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get nav_profile;

  /// No description provided for @creditPayment_title.
  ///
  /// In en, this message translates to:
  /// **'Add Payment'**
  String get creditPayment_title;

  /// No description provided for @creditPayment_selectPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get creditPayment_selectPaymentMethod;

  /// No description provided for @creditPayment_payWithCash.
  ///
  /// In en, this message translates to:
  /// **'Pay with cash'**
  String get creditPayment_payWithCash;

  /// No description provided for @creditPayment_scanQrisToPay.
  ///
  /// In en, this message translates to:
  /// **'Scan QRIS to pay'**
  String get creditPayment_scanQrisToPay;

  /// No description provided for @creditPayment_enterValidAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount'**
  String get creditPayment_enterValidAmount;

  /// No description provided for @creditPayment_amountExceedsRemaining.
  ///
  /// In en, this message translates to:
  /// **'Amount exceeds remaining balance'**
  String get creditPayment_amountExceedsRemaining;

  /// No description provided for @creditPayment_processingPayment.
  ///
  /// In en, this message translates to:
  /// **'Processing payment...'**
  String get creditPayment_processingPayment;

  /// No description provided for @creditPayment_paymentAddedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Payment added successfully'**
  String get creditPayment_paymentAddedSuccess;

  /// No description provided for @creditPayment_paymentFailed.
  ///
  /// In en, this message translates to:
  /// **'Payment failed: {error}'**
  String creditPayment_paymentFailed(String error);

  /// No description provided for @creditPayment_paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get creditPayment_paymentMethod;

  /// No description provided for @creditPayment_unknownCustomer.
  ///
  /// In en, this message translates to:
  /// **'Unknown Customer'**
  String get creditPayment_unknownCustomer;

  /// No description provided for @creditPayment_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get creditPayment_total;

  /// No description provided for @creditPayment_paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get creditPayment_paid;

  /// No description provided for @creditPayment_remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get creditPayment_remaining;

  /// No description provided for @creditPayment_amountPaid.
  ///
  /// In en, this message translates to:
  /// **'Amount paid'**
  String get creditPayment_amountPaid;

  /// No description provided for @creditPayment_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get creditPayment_amount;

  /// No description provided for @creditPayment_change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get creditPayment_change;

  /// No description provided for @creditPayment_insufficient.
  ///
  /// In en, this message translates to:
  /// **'Insufficient'**
  String get creditPayment_insufficient;

  /// No description provided for @creditPayment_exact.
  ///
  /// In en, this message translates to:
  /// **'Exact'**
  String get creditPayment_exact;

  /// No description provided for @creditPayment_full.
  ///
  /// In en, this message translates to:
  /// **'Full'**
  String get creditPayment_full;

  /// No description provided for @creditPayment_notesOptional.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get creditPayment_notesOptional;

  /// No description provided for @creditPayment_processing.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get creditPayment_processing;

  /// No description provided for @creditPayment_addPayment.
  ///
  /// In en, this message translates to:
  /// **'Add Payment'**
  String get creditPayment_addPayment;

  /// No description provided for @creditPayment_ivePaid.
  ///
  /// In en, this message translates to:
  /// **'I\'ve Paid'**
  String get creditPayment_ivePaid;

  /// No description provided for @creditPayment_iveTransferred.
  ///
  /// In en, this message translates to:
  /// **'I\'ve Transferred'**
  String get creditPayment_iveTransferred;

  /// No description provided for @creditPayment_scanQrCode.
  ///
  /// In en, this message translates to:
  /// **'Scan QR code above using your e-wallet app'**
  String get creditPayment_scanQrCode;

  /// No description provided for @creditPayment_accountNumber.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get creditPayment_accountNumber;

  /// No description provided for @creditPayment_accountHolder.
  ///
  /// In en, this message translates to:
  /// **'Account Holder'**
  String get creditPayment_accountHolder;

  /// No description provided for @creditPayment_transferAmount.
  ///
  /// In en, this message translates to:
  /// **'Transfer Amount:'**
  String get creditPayment_transferAmount;

  /// No description provided for @creditPayment_transferExactAmount.
  ///
  /// In en, this message translates to:
  /// **'Transfer the exact amount to the account above'**
  String get creditPayment_transferExactAmount;

  /// No description provided for @creditPayment_accountNumberCopied.
  ///
  /// In en, this message translates to:
  /// **'Account number copied'**
  String get creditPayment_accountNumberCopied;

  /// No description provided for @creditPayment_amountCopied.
  ///
  /// In en, this message translates to:
  /// **'Amount copied'**
  String get creditPayment_amountCopied;

  /// No description provided for @purchaseAddItem_addItem.
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get purchaseAddItem_addItem;

  /// No description provided for @purchaseAddItem_editItem.
  ///
  /// In en, this message translates to:
  /// **'Edit Item'**
  String get purchaseAddItem_editItem;

  /// No description provided for @purchaseAddItem_currentStock.
  ///
  /// In en, this message translates to:
  /// **'Current Stock: {stock}'**
  String purchaseAddItem_currentStock(String stock);

  /// No description provided for @purchaseAddItem_defaultCost.
  ///
  /// In en, this message translates to:
  /// **'Default Cost: {cost}'**
  String purchaseAddItem_defaultCost(String cost);

  /// No description provided for @purchaseAddItem_purchasePricePerUnit.
  ///
  /// In en, this message translates to:
  /// **'Purchase Price (per {unit})'**
  String purchaseAddItem_purchasePricePerUnit(String unit);

  /// No description provided for @purchaseAddItem_basePricePcs.
  ///
  /// In en, this message translates to:
  /// **'Base price (PCS): {price}'**
  String purchaseAddItem_basePricePcs(String price);

  /// No description provided for @purchaseAddItem_qtyMustBeGreater.
  ///
  /// In en, this message translates to:
  /// **'Quantity must be greater than 0'**
  String get purchaseAddItem_qtyMustBeGreater;

  /// No description provided for @purchaseAddItem_noDecimalQty.
  ///
  /// In en, this message translates to:
  /// **'This product does not allow decimal quantities'**
  String get purchaseAddItem_noDecimalQty;

  /// No description provided for @purchaseAddItem_priceCannotBeNegative.
  ///
  /// In en, this message translates to:
  /// **'Price cannot be negative'**
  String get purchaseAddItem_priceCannotBeNegative;

  /// No description provided for @users_cannotDeleteDemoAccount.
  ///
  /// In en, this message translates to:
  /// **'Cannot delete demo account'**
  String get users_cannotDeleteDemoAccount;

  /// No description provided for @users_cannotDeactivateDemoAccount.
  ///
  /// In en, this message translates to:
  /// **'Cannot deactivate demo account'**
  String get users_cannotDeactivateDemoAccount;

  /// No description provided for @users_maxUsersReached.
  ///
  /// In en, this message translates to:
  /// **'Maximum 2 users in Free mode. Upgrade to Premium for unlimited users.'**
  String get users_maxUsersReached;

  /// No description provided for @users_maxUsersReachedTrial.
  ///
  /// In en, this message translates to:
  /// **'Maximum 2 users in Trial mode. Enter serial number for unlimited users.'**
  String get users_maxUsersReachedTrial;

  /// No description provided for @upgrade_title.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Premium'**
  String get upgrade_title;

  /// No description provided for @upgrade_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock all features with Premium'**
  String get upgrade_subtitle;

  /// No description provided for @upgrade_limitationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Current Limitations'**
  String get upgrade_limitationsTitle;

  /// No description provided for @upgrade_limitProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get upgrade_limitProducts;

  /// No description provided for @upgrade_limitUsers.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get upgrade_limitUsers;

  /// No description provided for @upgrade_limitTransactions.
  ///
  /// In en, this message translates to:
  /// **'Daily Transactions'**
  String get upgrade_limitTransactions;

  /// No description provided for @upgrade_limitTransactionsValue.
  ///
  /// In en, this message translates to:
  /// **'5/type'**
  String get upgrade_limitTransactionsValue;

  /// No description provided for @upgrade_perDay.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get upgrade_perDay;

  /// No description provided for @upgrade_limitAds.
  ///
  /// In en, this message translates to:
  /// **'Advertisements'**
  String get upgrade_limitAds;

  /// No description provided for @upgrade_limitAdsValue.
  ///
  /// In en, this message translates to:
  /// **'Shown'**
  String get upgrade_limitAdsValue;

  /// No description provided for @upgrade_transactionTypesTitle.
  ///
  /// In en, this message translates to:
  /// **'Transaction Types'**
  String get upgrade_transactionTypesTitle;

  /// No description provided for @upgrade_transactionPos.
  ///
  /// In en, this message translates to:
  /// **'POS / Sales'**
  String get upgrade_transactionPos;

  /// No description provided for @upgrade_transactionPurchase.
  ///
  /// In en, this message translates to:
  /// **'Purchase Orders'**
  String get upgrade_transactionPurchase;

  /// No description provided for @upgrade_transactionExpense.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get upgrade_transactionExpense;

  /// No description provided for @upgrade_transactionStockAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Stock Adjustments'**
  String get upgrade_transactionStockAdjustment;

  /// No description provided for @upgrade_transactionCredit.
  ///
  /// In en, this message translates to:
  /// **'Credits (Receivables)'**
  String get upgrade_transactionCredit;

  /// No description provided for @upgrade_transactionDebt.
  ///
  /// In en, this message translates to:
  /// **'Debts (Payables)'**
  String get upgrade_transactionDebt;

  /// No description provided for @upgrade_premiumBenefits.
  ///
  /// In en, this message translates to:
  /// **'Premium Benefits'**
  String get upgrade_premiumBenefits;

  /// No description provided for @upgrade_benefitUnlimitedProducts.
  ///
  /// In en, this message translates to:
  /// **'Unlimited products'**
  String get upgrade_benefitUnlimitedProducts;

  /// No description provided for @upgrade_benefitUnlimitedUsers.
  ///
  /// In en, this message translates to:
  /// **'Unlimited users'**
  String get upgrade_benefitUnlimitedUsers;

  /// No description provided for @upgrade_benefitUnlimitedTransactions.
  ///
  /// In en, this message translates to:
  /// **'Unlimited daily transactions'**
  String get upgrade_benefitUnlimitedTransactions;

  /// No description provided for @upgrade_benefitNoAds.
  ///
  /// In en, this message translates to:
  /// **'No advertisements'**
  String get upgrade_benefitNoAds;

  /// No description provided for @upgrade_upgradeToPremium.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Premium'**
  String get upgrade_upgradeToPremium;

  /// No description provided for @upgrade_maxProductsReached.
  ///
  /// In en, this message translates to:
  /// **'Maximum 15 products reached'**
  String get upgrade_maxProductsReached;

  /// No description provided for @upgrade_maxTransactionsReached.
  ///
  /// In en, this message translates to:
  /// **'Daily transaction limit reached for this type'**
  String get upgrade_maxTransactionsReached;

  /// No description provided for @upgrade_freeModeLimits.
  ///
  /// In en, this message translates to:
  /// **'Free Mode: 5 transactions/day per type'**
  String get upgrade_freeModeLimits;

  /// No description provided for @upgrade_trialModeLimits.
  ///
  /// In en, this message translates to:
  /// **'Trial Mode: 50 transactions/day per type (with ads)'**
  String get upgrade_trialModeLimits;

  /// No description provided for @upgrade_premiumModeLimits.
  ///
  /// In en, this message translates to:
  /// **'Premium: Unlimited transactions, no ads'**
  String get upgrade_premiumModeLimits;

  /// No description provided for @upgrade_modeComparison.
  ///
  /// In en, this message translates to:
  /// **'Mode Comparison'**
  String get upgrade_modeComparison;

  /// No description provided for @upgrade_currentMode.
  ///
  /// In en, this message translates to:
  /// **'CURRENT'**
  String get upgrade_currentMode;

  /// No description provided for @upgrade_freeProducts.
  ///
  /// In en, this message translates to:
  /// **'Max 15 products'**
  String get upgrade_freeProducts;

  /// No description provided for @upgrade_freeUsers.
  ///
  /// In en, this message translates to:
  /// **'Max 2 users'**
  String get upgrade_freeUsers;

  /// No description provided for @upgrade_freeTransactions.
  ///
  /// In en, this message translates to:
  /// **'5 transactions/day per type'**
  String get upgrade_freeTransactions;

  /// No description provided for @upgrade_freeAds.
  ///
  /// In en, this message translates to:
  /// **'Ads displayed'**
  String get upgrade_freeAds;

  /// No description provided for @upgrade_trialProducts.
  ///
  /// In en, this message translates to:
  /// **'Max 15 products'**
  String get upgrade_trialProducts;

  /// No description provided for @upgrade_trialUsers.
  ///
  /// In en, this message translates to:
  /// **'Max 2 users'**
  String get upgrade_trialUsers;

  /// No description provided for @upgrade_trialTransactions.
  ///
  /// In en, this message translates to:
  /// **'50 transactions/day per type'**
  String get upgrade_trialTransactions;

  /// No description provided for @upgrade_trialAds.
  ///
  /// In en, this message translates to:
  /// **'Ads displayed'**
  String get upgrade_trialAds;

  /// No description provided for @subscription_title.
  ///
  /// In en, this message translates to:
  /// **'Subscribe to Premium'**
  String get subscription_title;

  /// No description provided for @subscription_upgradeToPremium.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Premium'**
  String get subscription_upgradeToPremium;

  /// No description provided for @subscription_fillForm.
  ///
  /// In en, this message translates to:
  /// **'Fill in your details to subscribe'**
  String get subscription_fillForm;

  /// No description provided for @subscription_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get subscription_name;

  /// No description provided for @subscription_nameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get subscription_nameHint;

  /// No description provided for @subscription_nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get subscription_nameRequired;

  /// No description provided for @subscription_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get subscription_phone;

  /// No description provided for @subscription_phoneHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get subscription_phoneHint;

  /// No description provided for @subscription_phoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get subscription_phoneRequired;

  /// No description provided for @subscription_voucherCode.
  ///
  /// In en, this message translates to:
  /// **'Voucher Code (Optional)'**
  String get subscription_voucherCode;

  /// No description provided for @subscription_voucherHint.
  ///
  /// In en, this message translates to:
  /// **'Enter voucher code...'**
  String get subscription_voucherHint;

  /// No description provided for @subscription_voucherDiscount.
  ///
  /// In en, this message translates to:
  /// **'{percent}% Discount Applied!'**
  String subscription_voucherDiscount(int percent);

  /// No description provided for @subscription_voucherInfo.
  ///
  /// In en, this message translates to:
  /// **'Enter voucher code to get special discount on your subscription.'**
  String get subscription_voucherInfo;

  /// No description provided for @subscription_voucherLocked.
  ///
  /// In en, this message translates to:
  /// **'Voucher code is locked from your previous subscription.'**
  String get subscription_voucherLocked;

  /// No description provided for @subscription_voucherExpired.
  ///
  /// In en, this message translates to:
  /// **'This voucher code has expired.'**
  String get subscription_voucherExpired;

  /// No description provided for @subscription_voucherNotFound.
  ///
  /// In en, this message translates to:
  /// **'Voucher code not found. It may have been removed.'**
  String get subscription_voucherNotFound;

  /// No description provided for @subscription_voucherInactive.
  ///
  /// In en, this message translates to:
  /// **'This voucher code is no longer active.'**
  String get subscription_voucherInactive;

  /// No description provided for @subscription_voucherExpiredDeleted.
  ///
  /// In en, this message translates to:
  /// **'This voucher has expired and has been removed. Please use another voucher or continue without discount.'**
  String get subscription_voucherExpiredDeleted;

  /// No description provided for @subscription_voucherInvalid.
  ///
  /// In en, this message translates to:
  /// **'This voucher code is invalid.'**
  String get subscription_voucherInvalid;

  /// No description provided for @subscription_voucherUsageExceeded.
  ///
  /// In en, this message translates to:
  /// **'This voucher has reached its maximum usage limit.'**
  String get subscription_voucherUsageExceeded;

  /// No description provided for @subscription_clearVoucherTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear Voucher Code'**
  String get subscription_clearVoucherTitle;

  /// No description provided for @subscription_clearVoucherMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this voucher code? You will need to re-enter it for your next subscription.'**
  String get subscription_clearVoucherMessage;

  /// No description provided for @subscription_voucherCleared.
  ///
  /// In en, this message translates to:
  /// **'Voucher code cleared'**
  String get subscription_voucherCleared;

  /// No description provided for @subscription_selectDuration.
  ///
  /// In en, this message translates to:
  /// **'Select Subscription Duration'**
  String get subscription_selectDuration;

  /// No description provided for @subscription_selectPlan.
  ///
  /// In en, this message translates to:
  /// **'Please select a subscription plan'**
  String get subscription_selectPlan;

  /// No description provided for @subscription_totalPrice.
  ///
  /// In en, this message translates to:
  /// **'Total Price'**
  String get subscription_totalPrice;

  /// No description provided for @subscription_savings.
  ///
  /// In en, this message translates to:
  /// **'You save Rp {amount}!'**
  String subscription_savings(String amount);

  /// No description provided for @subscription_subscribe.
  ///
  /// In en, this message translates to:
  /// **'Subscribe Now'**
  String get subscription_subscribe;

  /// No description provided for @subscription_selectedPlan.
  ///
  /// In en, this message translates to:
  /// **'Selected Plan'**
  String get subscription_selectedPlan;

  /// No description provided for @subscription_creatingOrder.
  ///
  /// In en, this message translates to:
  /// **'Creating order...'**
  String get subscription_creatingOrder;

  /// No description provided for @subscription_activating.
  ///
  /// In en, this message translates to:
  /// **'Activating premium...'**
  String get subscription_activating;

  /// No description provided for @subscription_successTitle.
  ///
  /// In en, this message translates to:
  /// **'Premium Activated!'**
  String get subscription_successTitle;

  /// No description provided for @subscription_successMessage.
  ///
  /// In en, this message translates to:
  /// **'Your premium subscription has been activated. Enjoy all premium features!'**
  String get subscription_successMessage;

  /// No description provided for @subscription_startingPurchase.
  ///
  /// In en, this message translates to:
  /// **'Starting purchase...'**
  String get subscription_startingPurchase;

  /// No description provided for @subscription_networkError.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection'**
  String get subscription_networkError;

  /// No description provided for @subscription_googleRequired.
  ///
  /// In en, this message translates to:
  /// **'Google Account Required'**
  String get subscription_googleRequired;

  /// No description provided for @subscription_googleRequiredDesc.
  ///
  /// In en, this message translates to:
  /// **'Please link your Google account to subscribe. This ensures your subscription can be restored if you reinstall the app.'**
  String get subscription_googleRequiredDesc;

  /// No description provided for @subscription_googleLinkNow.
  ///
  /// In en, this message translates to:
  /// **'Link Google Account'**
  String get subscription_googleLinkNow;

  /// No description provided for @subscription_alreadyActive.
  ///
  /// In en, this message translates to:
  /// **'This Google account already has an active subscription. You cannot subscribe again until the current subscription expires.'**
  String get subscription_alreadyActive;

  /// No description provided for @subscriptionInfo_title.
  ///
  /// In en, this message translates to:
  /// **'Subscription Plans'**
  String get subscriptionInfo_title;

  /// No description provided for @subscriptionInfo_headerTitle.
  ///
  /// In en, this message translates to:
  /// **'Kasir Baik Premium'**
  String get subscriptionInfo_headerTitle;

  /// No description provided for @subscriptionInfo_headerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock all features and grow your business without limits'**
  String get subscriptionInfo_headerSubtitle;

  /// No description provided for @subscriptionInfo_currentMode.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get subscriptionInfo_currentMode;

  /// No description provided for @subscriptionInfo_premiumDesc.
  ///
  /// In en, this message translates to:
  /// **'You have full access to all features'**
  String get subscriptionInfo_premiumDesc;

  /// No description provided for @subscriptionInfo_trialDesc.
  ///
  /// In en, this message translates to:
  /// **'Temporary premium access from watching ads'**
  String get subscriptionInfo_trialDesc;

  /// No description provided for @subscriptionInfo_freeDesc.
  ///
  /// In en, this message translates to:
  /// **'Limited features with daily transaction limits'**
  String get subscriptionInfo_freeDesc;

  /// No description provided for @subscriptionInfo_plansTitle.
  ///
  /// In en, this message translates to:
  /// **'Available Plans'**
  String get subscriptionInfo_plansTitle;

  /// No description provided for @subscriptionInfo_normalPrice.
  ///
  /// In en, this message translates to:
  /// **'Normal Price'**
  String get subscriptionInfo_normalPrice;

  /// No description provided for @subscriptionInfo_voucherPrice.
  ///
  /// In en, this message translates to:
  /// **'With Voucher'**
  String get subscriptionInfo_voucherPrice;

  /// No description provided for @subscriptionInfo_save.
  ///
  /// In en, this message translates to:
  /// **'Save Rp {amount}'**
  String subscriptionInfo_save(String amount);

  /// No description provided for @subscriptionInfo_popular.
  ///
  /// In en, this message translates to:
  /// **'POPULAR'**
  String get subscriptionInfo_popular;

  /// No description provided for @subscriptionInfo_comparisonTitle.
  ///
  /// In en, this message translates to:
  /// **'Feature Comparison'**
  String get subscriptionInfo_comparisonTitle;

  /// No description provided for @subscriptionInfo_featureProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get subscriptionInfo_featureProducts;

  /// No description provided for @subscriptionInfo_featureUsers.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get subscriptionInfo_featureUsers;

  /// No description provided for @subscriptionInfo_featureTransactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get subscriptionInfo_featureTransactions;

  /// No description provided for @subscriptionInfo_featureAds.
  ///
  /// In en, this message translates to:
  /// **'Ads'**
  String get subscriptionInfo_featureAds;

  /// No description provided for @subscriptionInfo_featureReports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get subscriptionInfo_featureReports;

  /// No description provided for @subscriptionInfo_unlimited.
  ///
  /// In en, this message translates to:
  /// **'Unlimited'**
  String get subscriptionInfo_unlimited;

  /// No description provided for @subscriptionInfo_day.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get subscriptionInfo_day;

  /// No description provided for @subscriptionInfo_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get subscriptionInfo_yes;

  /// No description provided for @subscriptionInfo_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get subscriptionInfo_no;

  /// No description provided for @subscriptionInfo_withAds.
  ///
  /// In en, this message translates to:
  /// **'With Ads'**
  String get subscriptionInfo_withAds;

  /// No description provided for @subscriptionInfo_full.
  ///
  /// In en, this message translates to:
  /// **'Full'**
  String get subscriptionInfo_full;

  /// No description provided for @subscriptionInfo_voucherTitle.
  ///
  /// In en, this message translates to:
  /// **'Get Special Discount'**
  String get subscriptionInfo_voucherTitle;

  /// No description provided for @subscriptionInfo_voucherDesc.
  ///
  /// In en, this message translates to:
  /// **'Enter a voucher code during checkout to get discounted subscription prices!'**
  String get subscriptionInfo_voucherDesc;

  /// No description provided for @subscriptionInfo_subscribeCta.
  ///
  /// In en, this message translates to:
  /// **'Subscribe to Premium'**
  String get subscriptionInfo_subscribeCta;

  /// No description provided for @payment_confirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Payment'**
  String get payment_confirmTitle;

  /// No description provided for @payment_confirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Have you completed the payment? Click confirm to activate your premium subscription.'**
  String get payment_confirmMessage;

  /// No description provided for @payment_confirmButton.
  ///
  /// In en, this message translates to:
  /// **'I Have Paid'**
  String get payment_confirmButton;

  /// No description provided for @payment_successTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment Successful!'**
  String get payment_successTitle;

  /// No description provided for @payment_successMessage.
  ///
  /// In en, this message translates to:
  /// **'Your premium subscription for {duration} has been activated. Enjoy all premium features!'**
  String payment_successMessage(String duration);

  /// No description provided for @payment_cancelTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel Payment?'**
  String get payment_cancelTitle;

  /// No description provided for @payment_cancelMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel the payment process?'**
  String get payment_cancelMessage;

  /// No description provided for @payment_warningTitle.
  ///
  /// In en, this message translates to:
  /// **'Important!'**
  String get payment_warningTitle;

  /// No description provided for @payment_warningMessage.
  ///
  /// In en, this message translates to:
  /// **'Do not close this page while making a payment for the premium activation to work.\n\nIf you have already made a payment but nothing happens, tap the \'Check Payment Status\' button at the bottom of the screen.'**
  String get payment_warningMessage;

  /// No description provided for @payment_checkStatus.
  ///
  /// In en, this message translates to:
  /// **'Check Payment Status'**
  String get payment_checkStatus;

  /// No description provided for @payment_doNotCloseWarning.
  ///
  /// In en, this message translates to:
  /// **'Do not close this page while making a payment for the premium activation to work. If you close it, you must confirm manually via the Contact Us menu.'**
  String get payment_doNotCloseWarning;

  /// No description provided for @payment_screenshotTitle.
  ///
  /// In en, this message translates to:
  /// **'Screenshot Page?'**
  String get payment_screenshotTitle;

  /// No description provided for @payment_screenshotMessage.
  ///
  /// In en, this message translates to:
  /// **'Save a screenshot of this page as payment proof?'**
  String get payment_screenshotMessage;

  /// No description provided for @payment_screenshotConfirm.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get payment_screenshotConfirm;

  /// No description provided for @payment_screenshotSaving.
  ///
  /// In en, this message translates to:
  /// **'Saving screenshot...'**
  String get payment_screenshotSaving;

  /// No description provided for @payment_screenshotSaved.
  ///
  /// In en, this message translates to:
  /// **'Screenshot saved to gallery'**
  String get payment_screenshotSaved;

  /// No description provided for @payment_screenshotFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save screenshot'**
  String get payment_screenshotFailed;

  /// No description provided for @payment_infoText.
  ///
  /// In en, this message translates to:
  /// **'Complete your payment in the browser above, then tap the button below to confirm.'**
  String get payment_infoText;

  /// No description provided for @firstTimeSetup_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get firstTimeSetup_welcome;

  /// No description provided for @firstTimeSetup_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s set up your business'**
  String get firstTimeSetup_subtitle;

  /// No description provided for @firstTimeSetup_selectAppType.
  ///
  /// In en, this message translates to:
  /// **'Select Your Business Type'**
  String get firstTimeSetup_selectAppType;

  /// No description provided for @firstTimeSetup_pleaseSelectAppType.
  ///
  /// In en, this message translates to:
  /// **'Please select an app type'**
  String get firstTimeSetup_pleaseSelectAppType;

  /// No description provided for @firstTimeSetup_generateSampleData.
  ///
  /// In en, this message translates to:
  /// **'Generate Sample Data'**
  String get firstTimeSetup_generateSampleData;

  /// No description provided for @firstTimeSetup_generateSampleDataDesc.
  ///
  /// In en, this message translates to:
  /// **'Add sample products, categories, and customers to get started quickly'**
  String get firstTimeSetup_generateSampleDataDesc;

  /// No description provided for @firstTimeSetup_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get firstTimeSetup_continue;

  /// No description provided for @firstTimeSetup_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip Setup'**
  String get firstTimeSetup_skip;

  /// No description provided for @firstTimeSetup_settingUp.
  ///
  /// In en, this message translates to:
  /// **'Setting up your app...'**
  String get firstTimeSetup_settingUp;

  /// No description provided for @firstTimeSetup_setupComplete.
  ///
  /// In en, this message translates to:
  /// **'Setup complete!'**
  String get firstTimeSetup_setupComplete;

  /// No description provided for @firstTimeSetup_cafe.
  ///
  /// In en, this message translates to:
  /// **'Cafe'**
  String get firstTimeSetup_cafe;

  /// No description provided for @firstTimeSetup_cafeDesc.
  ///
  /// In en, this message translates to:
  /// **'Coffee shop, restaurant, food & beverage'**
  String get firstTimeSetup_cafeDesc;

  /// No description provided for @firstTimeSetup_grocery.
  ///
  /// In en, this message translates to:
  /// **'Grocery'**
  String get firstTimeSetup_grocery;

  /// No description provided for @firstTimeSetup_groceryDesc.
  ///
  /// In en, this message translates to:
  /// **'Supermarket, mini market, retail store'**
  String get firstTimeSetup_groceryDesc;

  /// No description provided for @firstTimeSetup_pharmacy.
  ///
  /// In en, this message translates to:
  /// **'Pharmacy'**
  String get firstTimeSetup_pharmacy;

  /// No description provided for @firstTimeSetup_pharmacyDesc.
  ///
  /// In en, this message translates to:
  /// **'Drugstore, pharmacy, health store'**
  String get firstTimeSetup_pharmacyDesc;

  /// No description provided for @firstTimeSetup_laundry.
  ///
  /// In en, this message translates to:
  /// **'Laundry'**
  String get firstTimeSetup_laundry;

  /// No description provided for @firstTimeSetup_laundryDesc.
  ///
  /// In en, this message translates to:
  /// **'Laundry service, dry cleaning'**
  String get firstTimeSetup_laundryDesc;

  /// No description provided for @firstTimeSetup_blank.
  ///
  /// In en, this message translates to:
  /// **'Blank'**
  String get firstTimeSetup_blank;

  /// No description provided for @firstTimeSetup_blankDesc.
  ///
  /// In en, this message translates to:
  /// **'Start from scratch, add your own data'**
  String get firstTimeSetup_blankDesc;

  /// No description provided for @firstTimeSetup_storagePermissionDesc.
  ///
  /// In en, this message translates to:
  /// **'To keep your data safe even after clearing app data, please grant storage permission. This allows the app to store data in a location that won\'t be deleted.'**
  String get firstTimeSetup_storagePermissionDesc;

  /// No description provided for @firstTimeSetup_storagePermissionWarning.
  ///
  /// In en, this message translates to:
  /// **'Without this permission, your data will be lost if you clear app data!'**
  String get firstTimeSetup_storagePermissionWarning;

  /// No description provided for @storagePermission_title.
  ///
  /// In en, this message translates to:
  /// **'Storage Access Required'**
  String get storagePermission_title;

  /// No description provided for @storagePermission_description.
  ///
  /// In en, this message translates to:
  /// **'This app needs storage access to keep your business data safe. This permission is required to ensure your data is not lost when you uninstall the app or clear app data.'**
  String get storagePermission_description;

  /// No description provided for @storagePermission_benefit1Title.
  ///
  /// In en, this message translates to:
  /// **'Data Protection'**
  String get storagePermission_benefit1Title;

  /// No description provided for @storagePermission_benefit1Desc.
  ///
  /// In en, this message translates to:
  /// **'Your master data and transactions stay safe even after app uninstall'**
  String get storagePermission_benefit1Desc;

  /// No description provided for @storagePermission_benefit2Title.
  ///
  /// In en, this message translates to:
  /// **'Local Backup'**
  String get storagePermission_benefit2Title;

  /// No description provided for @storagePermission_benefit2Desc.
  ///
  /// In en, this message translates to:
  /// **'Create and restore backups anytime without internet'**
  String get storagePermission_benefit2Desc;

  /// No description provided for @storagePermission_benefit3Title.
  ///
  /// In en, this message translates to:
  /// **'Data Security'**
  String get storagePermission_benefit3Title;

  /// No description provided for @storagePermission_benefit3Desc.
  ///
  /// In en, this message translates to:
  /// **'Your data is stored securely on your device'**
  String get storagePermission_benefit3Desc;

  /// No description provided for @storagePermission_grantAccess.
  ///
  /// In en, this message translates to:
  /// **'Grant Access'**
  String get storagePermission_grantAccess;

  /// No description provided for @storagePermission_deniedWarning.
  ///
  /// In en, this message translates to:
  /// **'Permission was denied. Please grant storage access to continue using the app. Tap \'Open Settings\' and enable \'All files access\' for this app.'**
  String get storagePermission_deniedWarning;

  /// No description provided for @storagePermission_checkAgain.
  ///
  /// In en, this message translates to:
  /// **'Check Again'**
  String get storagePermission_checkAgain;

  /// No description provided for @storagePermission_note.
  ///
  /// In en, this message translates to:
  /// **'We only access the KasirBaik folder on your device. Your other files remain private and untouched.'**
  String get storagePermission_note;

  /// No description provided for @export_title.
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get export_title;

  /// No description provided for @export_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Export to Excel'**
  String get export_subtitle;

  /// No description provided for @export_confirmMessage.
  ///
  /// In en, this message translates to:
  /// **'This will export all data to an Excel file. Continue?'**
  String get export_confirmMessage;

  /// No description provided for @export_export.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get export_export;

  /// No description provided for @export_exporting.
  ///
  /// In en, this message translates to:
  /// **'Exporting data...'**
  String get export_exporting;

  /// No description provided for @export_success.
  ///
  /// In en, this message translates to:
  /// **'Data exported successfully'**
  String get export_success;

  /// No description provided for @export_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to export data'**
  String get export_failed;

  /// No description provided for @export_share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get export_share;

  /// No description provided for @export_masterData.
  ///
  /// In en, this message translates to:
  /// **'Master Data'**
  String get export_masterData;

  /// No description provided for @export_masterDataDesc.
  ///
  /// In en, this message translates to:
  /// **'Products, categories, customers, and other reference data'**
  String get export_masterDataDesc;

  /// No description provided for @export_reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get export_reports;

  /// No description provided for @export_transactionData.
  ///
  /// In en, this message translates to:
  /// **'Transaction Data'**
  String get export_transactionData;

  /// No description provided for @export_transactionDataDesc.
  ///
  /// In en, this message translates to:
  /// **'Orders, expenses, purchases, and other transaction records (filtered by: {dateRange})'**
  String export_transactionDataDesc(String dateRange);

  /// No description provided for @export_products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get export_products;

  /// No description provided for @export_categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get export_categories;

  /// No description provided for @export_customers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get export_customers;

  /// No description provided for @export_suppliers.
  ///
  /// In en, this message translates to:
  /// **'Suppliers'**
  String get export_suppliers;

  /// No description provided for @export_tables.
  ///
  /// In en, this message translates to:
  /// **'Tables'**
  String get export_tables;

  /// No description provided for @export_users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get export_users;

  /// No description provided for @export_orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get export_orders;

  /// No description provided for @export_expenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get export_expenses;

  /// No description provided for @export_purchases.
  ///
  /// In en, this message translates to:
  /// **'Purchases'**
  String get export_purchases;

  /// No description provided for @export_stockAdjustments.
  ///
  /// In en, this message translates to:
  /// **'Stock Adjustments'**
  String get export_stockAdjustments;

  /// No description provided for @export_credits.
  ///
  /// In en, this message translates to:
  /// **'Credits'**
  String get export_credits;

  /// No description provided for @export_debts.
  ///
  /// In en, this message translates to:
  /// **'Debts'**
  String get export_debts;

  /// No description provided for @export_paymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get export_paymentMethods;

  /// No description provided for @export_reportSummaries.
  ///
  /// In en, this message translates to:
  /// **'Report Summaries'**
  String get export_reportSummaries;

  /// No description provided for @export_reportSummariesDesc.
  ///
  /// In en, this message translates to:
  /// **'Calculated report summaries based on {period} data'**
  String export_reportSummariesDesc(String period);

  /// No description provided for @export_salesReport.
  ///
  /// In en, this message translates to:
  /// **'Sales Report'**
  String get export_salesReport;

  /// No description provided for @export_profitLossReport.
  ///
  /// In en, this message translates to:
  /// **'Profit & Loss'**
  String get export_profitLossReport;

  /// No description provided for @export_cashflowReport.
  ///
  /// In en, this message translates to:
  /// **'Cashflow'**
  String get export_cashflowReport;

  /// No description provided for @export_inventoryReport.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get export_inventoryReport;

  /// No description provided for @export_productPerformance.
  ///
  /// In en, this message translates to:
  /// **'Product Performance'**
  String get export_productPerformance;

  /// No description provided for @export_expenseReport.
  ///
  /// In en, this message translates to:
  /// **'Expense Report'**
  String get export_expenseReport;

  /// No description provided for @export_creditReport.
  ///
  /// In en, this message translates to:
  /// **'Credit Report'**
  String get export_creditReport;

  /// No description provided for @export_debtReport.
  ///
  /// In en, this message translates to:
  /// **'Debt Report'**
  String get export_debtReport;

  /// No description provided for @export_balanceSheet.
  ///
  /// In en, this message translates to:
  /// **'Balance Sheet'**
  String get export_balanceSheet;

  /// No description provided for @export_variants.
  ///
  /// In en, this message translates to:
  /// **'Variants'**
  String get export_variants;

  /// No description provided for @export_posCategories.
  ///
  /// In en, this message translates to:
  /// **'POS Categories'**
  String get export_posCategories;

  /// No description provided for @export_cashReasons.
  ///
  /// In en, this message translates to:
  /// **'Cash Reasons'**
  String get export_cashReasons;

  /// No description provided for @export_expenseTypes.
  ///
  /// In en, this message translates to:
  /// **'Expense Types'**
  String get export_expenseTypes;

  /// No description provided for @export_orderStatuses.
  ///
  /// In en, this message translates to:
  /// **'Order Statuses'**
  String get export_orderStatuses;

  /// No description provided for @export_vouchers.
  ///
  /// In en, this message translates to:
  /// **'Vouchers'**
  String get export_vouchers;

  /// No description provided for @export_cashDrawerSessions.
  ///
  /// In en, this message translates to:
  /// **'Cash Drawer'**
  String get export_cashDrawerSessions;

  /// No description provided for @export_stockHistory.
  ///
  /// In en, this message translates to:
  /// **'Stock History'**
  String get export_stockHistory;

  /// No description provided for @export_goodReceives.
  ///
  /// In en, this message translates to:
  /// **'Good Receives'**
  String get export_goodReceives;

  /// No description provided for @export_info.
  ///
  /// In en, this message translates to:
  /// **'Export Information'**
  String get export_info;

  /// No description provided for @export_infoDescription.
  ///
  /// In en, this message translates to:
  /// **'Master data will be exported in full. Transaction data will be filtered based on the selected date range.'**
  String get export_infoDescription;

  /// No description provided for @export_exportToExcel.
  ///
  /// In en, this message translates to:
  /// **'Export to Excel'**
  String get export_exportToExcel;

  /// No description provided for @export_dateFilter.
  ///
  /// In en, this message translates to:
  /// **'Date Filter'**
  String get export_dateFilter;

  /// No description provided for @export_preview.
  ///
  /// In en, this message translates to:
  /// **'Preview Data'**
  String get export_preview;

  /// No description provided for @exportPreview_title.
  ///
  /// In en, this message translates to:
  /// **'Export Preview'**
  String get exportPreview_title;

  /// No description provided for @exportPreview_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get exportPreview_summary;

  /// No description provided for @exportPreview_sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get exportPreview_sales;

  /// No description provided for @exportPreview_expenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get exportPreview_expenses;

  /// No description provided for @exportPreview_receivablesPayables.
  ///
  /// In en, this message translates to:
  /// **'Receivables/Payables'**
  String get exportPreview_receivablesPayables;

  /// No description provided for @exportPreview_financialSummary.
  ///
  /// In en, this message translates to:
  /// **'Financial Summary'**
  String get exportPreview_financialSummary;

  /// No description provided for @exportPreview_balanceSummary.
  ///
  /// In en, this message translates to:
  /// **'Balance Summary'**
  String get exportPreview_balanceSummary;

  /// No description provided for @exportPreview_masterData.
  ///
  /// In en, this message translates to:
  /// **'Master Data'**
  String get exportPreview_masterData;

  /// No description provided for @exportPreview_transactionSummary.
  ///
  /// In en, this message translates to:
  /// **'Transaction Summary'**
  String get exportPreview_transactionSummary;

  /// No description provided for @exportPreview_totalSales.
  ///
  /// In en, this message translates to:
  /// **'Total Sales'**
  String get exportPreview_totalSales;

  /// No description provided for @exportPreview_grossProfit.
  ///
  /// In en, this message translates to:
  /// **'Gross Profit'**
  String get exportPreview_grossProfit;

  /// No description provided for @exportPreview_totalExpenses.
  ///
  /// In en, this message translates to:
  /// **'Total Expenses'**
  String get exportPreview_totalExpenses;

  /// No description provided for @exportPreview_netProfit.
  ///
  /// In en, this message translates to:
  /// **'Net Profit'**
  String get exportPreview_netProfit;

  /// No description provided for @exportPreview_inventoryValue.
  ///
  /// In en, this message translates to:
  /// **'Inventory Value'**
  String get exportPreview_inventoryValue;

  /// No description provided for @exportPreview_receivables.
  ///
  /// In en, this message translates to:
  /// **'Receivables'**
  String get exportPreview_receivables;

  /// No description provided for @exportPreview_payables.
  ///
  /// In en, this message translates to:
  /// **'Payables'**
  String get exportPreview_payables;

  /// No description provided for @exportPreview_netPosition.
  ///
  /// In en, this message translates to:
  /// **'Net Position'**
  String get exportPreview_netPosition;

  /// No description provided for @exportPreview_orderCount.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get exportPreview_orderCount;

  /// No description provided for @exportPreview_expenseCount.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get exportPreview_expenseCount;

  /// No description provided for @exportPreview_salesByPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Sales by Payment Method'**
  String get exportPreview_salesByPaymentMethod;

  /// No description provided for @exportPreview_expensesByCategory.
  ///
  /// In en, this message translates to:
  /// **'Expenses by Category'**
  String get exportPreview_expensesByCategory;

  /// No description provided for @exportPreview_recentOrders.
  ///
  /// In en, this message translates to:
  /// **'Recent Orders'**
  String get exportPreview_recentOrders;

  /// No description provided for @exportPreview_andMore.
  ///
  /// In en, this message translates to:
  /// **'and {count} more'**
  String exportPreview_andMore(int count);

  /// No description provided for @dateFilter_thisYear.
  ///
  /// In en, this message translates to:
  /// **'This Year'**
  String get dateFilter_thisYear;

  /// No description provided for @dateFilter_allTime.
  ///
  /// In en, this message translates to:
  /// **'All Time'**
  String get dateFilter_allTime;

  /// No description provided for @reward_pleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please wait a moment'**
  String get reward_pleaseWait;

  /// No description provided for @reward_earnAfterTimer.
  ///
  /// In en, this message translates to:
  /// **'Reward will be given after the timer ends'**
  String get reward_earnAfterTimer;

  /// No description provided for @reward_offlineExplanation.
  ///
  /// In en, this message translates to:
  /// **'This page appears because no ads are available, or you are in offline mode, or your internet connection is unstable.'**
  String get reward_offlineExplanation;

  /// No description provided for @reward_offlineHint.
  ///
  /// In en, this message translates to:
  /// **'You can close this page and try again when your internet is stable, or wait until the timer finishes.'**
  String get reward_offlineHint;

  /// No description provided for @cloudBackup_title.
  ///
  /// In en, this message translates to:
  /// **'Cloud Backup'**
  String get cloudBackup_title;

  /// No description provided for @cloudBackup_backup.
  ///
  /// In en, this message translates to:
  /// **'Backup to Cloud'**
  String get cloudBackup_backup;

  /// No description provided for @cloudBackup_backupDesc.
  ///
  /// In en, this message translates to:
  /// **'Upload backup to cloud storage'**
  String get cloudBackup_backupDesc;

  /// No description provided for @cloudBackup_restore.
  ///
  /// In en, this message translates to:
  /// **'Restore from Cloud'**
  String get cloudBackup_restore;

  /// No description provided for @cloudBackup_restoreDesc.
  ///
  /// In en, this message translates to:
  /// **'View and restore from cloud backups'**
  String get cloudBackup_restoreDesc;

  /// No description provided for @cloudBackup_backingUp.
  ///
  /// In en, this message translates to:
  /// **'Uploading backup to cloud...'**
  String get cloudBackup_backingUp;

  /// No description provided for @cloudBackup_backupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup uploaded successfully!'**
  String get cloudBackup_backupSuccess;

  /// No description provided for @cloudBackup_backupFailed.
  ///
  /// In en, this message translates to:
  /// **'Backup failed: {error}'**
  String cloudBackup_backupFailed(String error);

  /// No description provided for @cloudBackup_noBackups.
  ///
  /// In en, this message translates to:
  /// **'No cloud backups found'**
  String get cloudBackup_noBackups;

  /// No description provided for @cloudBackup_noBackupsHint.
  ///
  /// In en, this message translates to:
  /// **'Create a backup first to see it here'**
  String get cloudBackup_noBackupsHint;

  /// No description provided for @cloudBackup_backupHistory.
  ///
  /// In en, this message translates to:
  /// **'Backup History'**
  String get cloudBackup_backupHistory;

  /// No description provided for @cloudBackup_masterData.
  ///
  /// In en, this message translates to:
  /// **'Master Data'**
  String get cloudBackup_masterData;

  /// No description provided for @cloudBackup_fullData.
  ///
  /// In en, this message translates to:
  /// **'Full Data'**
  String get cloudBackup_fullData;

  /// No description provided for @cloudBackup_createdAt.
  ///
  /// In en, this message translates to:
  /// **'Created: {date}'**
  String cloudBackup_createdAt(String date);

  /// No description provided for @cloudBackup_itemCount.
  ///
  /// In en, this message translates to:
  /// **'{count} records'**
  String cloudBackup_itemCount(int count);

  /// No description provided for @cloudBackup_restoreThis.
  ///
  /// In en, this message translates to:
  /// **'Restore this backup?'**
  String get cloudBackup_restoreThis;

  /// No description provided for @cloudBackup_restoreWarning.
  ///
  /// In en, this message translates to:
  /// **'This will DELETE all current data and replace it with data from this backup.\n\nBackup info:\n• Type: {type}\n• Created: {date}\n• Records: {count}\n\nThis action cannot be undone!'**
  String cloudBackup_restoreWarning(String type, String date, int count);

  /// No description provided for @cloudBackup_restoring.
  ///
  /// In en, this message translates to:
  /// **'Restoring from cloud backup...'**
  String get cloudBackup_restoring;

  /// No description provided for @cloudBackup_restoreSuccess.
  ///
  /// In en, this message translates to:
  /// **'Restored {count} collections from cloud backup!'**
  String cloudBackup_restoreSuccess(int count);

  /// No description provided for @cloudBackup_restoreFailed.
  ///
  /// In en, this message translates to:
  /// **'Restore failed: {error}'**
  String cloudBackup_restoreFailed(String error);

  /// No description provided for @cloudBackup_autoRestoring.
  ///
  /// In en, this message translates to:
  /// **'Cloud backup found. Restoring your data...'**
  String get cloudBackup_autoRestoring;

  /// No description provided for @cloudBackup_autoRestoreSuccess.
  ///
  /// In en, this message translates to:
  /// **'Data restored successfully!'**
  String get cloudBackup_autoRestoreSuccess;

  /// No description provided for @cloudBackup_autoRestoreFailed.
  ///
  /// In en, this message translates to:
  /// **'Auto-restore failed. Starting fresh setup.'**
  String get cloudBackup_autoRestoreFailed;

  /// No description provided for @cloudBackup_deleteEntry.
  ///
  /// In en, this message translates to:
  /// **'Delete from history?'**
  String get cloudBackup_deleteEntry;

  /// No description provided for @cloudBackup_deleteEntryMessage.
  ///
  /// In en, this message translates to:
  /// **'This will only remove the backup from history. The file on cloud storage will not be deleted.'**
  String get cloudBackup_deleteEntryMessage;

  /// No description provided for @cloudBackup_selectBackupType.
  ///
  /// In en, this message translates to:
  /// **'Select Backup Type'**
  String get cloudBackup_selectBackupType;

  /// No description provided for @cloudBackup_masterDataDesc.
  ///
  /// In en, this message translates to:
  /// **'Products, customers, categories, suppliers'**
  String get cloudBackup_masterDataDesc;

  /// No description provided for @cloudBackup_fullDataDesc.
  ///
  /// In en, this message translates to:
  /// **'All data including transactions and orders'**
  String get cloudBackup_fullDataDesc;

  /// No description provided for @cloudBackup_storeName.
  ///
  /// In en, this message translates to:
  /// **'Store: {name}'**
  String cloudBackup_storeName(String name);

  /// No description provided for @cloudBackup_fileSize.
  ///
  /// In en, this message translates to:
  /// **'Size: {size}'**
  String cloudBackup_fileSize(String size);

  /// No description provided for @cloudBackup_premiumRequired.
  ///
  /// In en, this message translates to:
  /// **'Cloud Backup is a premium feature. Please upgrade to use this feature.'**
  String get cloudBackup_premiumRequired;

  /// No description provided for @cloudBackup_createBackup.
  ///
  /// In en, this message translates to:
  /// **'Create Backup'**
  String get cloudBackup_createBackup;

  /// No description provided for @cloudBackup_createBackupConfirm.
  ///
  /// In en, this message translates to:
  /// **'This will backup all your data including products, transactions, expenses, credits, debts, and settings to the cloud.'**
  String get cloudBackup_createBackupConfirm;

  /// No description provided for @cloudBackup_viewOnline.
  ///
  /// In en, this message translates to:
  /// **'View Online'**
  String get cloudBackup_viewOnline;

  /// No description provided for @cloudBackup_viewLocal.
  ///
  /// In en, this message translates to:
  /// **'View Local'**
  String get cloudBackup_viewLocal;

  /// No description provided for @cloudBackup_viewLocalFolder.
  ///
  /// In en, this message translates to:
  /// **'View Local Folder'**
  String get cloudBackup_viewLocalFolder;

  /// No description provided for @cloudBackup_localStorageLocation.
  ///
  /// In en, this message translates to:
  /// **'Local Backup Location'**
  String get cloudBackup_localStorageLocation;

  /// No description provided for @cloudBackup_localFileSaved.
  ///
  /// In en, this message translates to:
  /// **'Local file saved'**
  String get cloudBackup_localFileSaved;

  /// No description provided for @cloudBackup_localFileDeleted.
  ///
  /// In en, this message translates to:
  /// **'Local file not available'**
  String get cloudBackup_localFileDeleted;

  /// No description provided for @cloudBackup_localBackupFile.
  ///
  /// In en, this message translates to:
  /// **'Backup File'**
  String get cloudBackup_localBackupFile;

  /// No description provided for @cloudBackup_noLocalFile.
  ///
  /// In en, this message translates to:
  /// **'No local file available'**
  String get cloudBackup_noLocalFile;

  /// No description provided for @cloudBackup_localFileNotFound.
  ///
  /// In en, this message translates to:
  /// **'Local file not found'**
  String get cloudBackup_localFileNotFound;

  /// No description provided for @cloudBackup_cannotOpenLocalFile.
  ///
  /// In en, this message translates to:
  /// **'Cannot open local file'**
  String get cloudBackup_cannotOpenLocalFile;

  /// No description provided for @cloudBackup_autoBackupInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Auto Backup Schedule'**
  String get cloudBackup_autoBackupInfoTitle;

  /// No description provided for @cloudBackup_autoBackupInfoDesc.
  ///
  /// In en, this message translates to:
  /// **'Your data is automatically backed up at the following times each day. Backups are triggered when you open the app or navigate between menus.'**
  String get cloudBackup_autoBackupInfoDesc;

  /// No description provided for @cloudBackup_autoBackupDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get cloudBackup_autoBackupDone;

  /// No description provided for @cloudBackup_autoBackupCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed today'**
  String get cloudBackup_autoBackupCompleted;

  /// No description provided for @cashDrawer_title.
  ///
  /// In en, this message translates to:
  /// **'Cash Drawer'**
  String get cashDrawer_title;

  /// No description provided for @cashDrawer_noActiveSession.
  ///
  /// In en, this message translates to:
  /// **'No Active Session'**
  String get cashDrawer_noActiveSession;

  /// No description provided for @cashDrawer_noActiveSessionDesc.
  ///
  /// In en, this message translates to:
  /// **'Open a new session to start tracking cash'**
  String get cashDrawer_noActiveSessionDesc;

  /// No description provided for @cashDrawer_openSession.
  ///
  /// In en, this message translates to:
  /// **'Open Session'**
  String get cashDrawer_openSession;

  /// No description provided for @cashDrawer_closeSession.
  ///
  /// In en, this message translates to:
  /// **'Close Session'**
  String get cashDrawer_closeSession;

  /// No description provided for @cashDrawer_openingBalance.
  ///
  /// In en, this message translates to:
  /// **'Opening Balance'**
  String get cashDrawer_openingBalance;

  /// No description provided for @cashDrawer_currentBalance.
  ///
  /// In en, this message translates to:
  /// **'Current Balance'**
  String get cashDrawer_currentBalance;

  /// No description provided for @cashDrawer_expectedBalance.
  ///
  /// In en, this message translates to:
  /// **'Expected Balance'**
  String get cashDrawer_expectedBalance;

  /// No description provided for @cashDrawer_actualBalance.
  ///
  /// In en, this message translates to:
  /// **'Actual Balance'**
  String get cashDrawer_actualBalance;

  /// No description provided for @cashDrawer_difference.
  ///
  /// In en, this message translates to:
  /// **'Difference'**
  String get cashDrawer_difference;

  /// No description provided for @cashDrawer_cashIn.
  ///
  /// In en, this message translates to:
  /// **'Cash In'**
  String get cashDrawer_cashIn;

  /// No description provided for @cashDrawer_cashOut.
  ///
  /// In en, this message translates to:
  /// **'Cash Out'**
  String get cashDrawer_cashOut;

  /// No description provided for @cashDrawer_totalSales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get cashDrawer_totalSales;

  /// No description provided for @cashDrawer_totalCashIn.
  ///
  /// In en, this message translates to:
  /// **'Cash In'**
  String get cashDrawer_totalCashIn;

  /// No description provided for @cashDrawer_totalCashOut.
  ///
  /// In en, this message translates to:
  /// **'Cash Out'**
  String get cashDrawer_totalCashOut;

  /// No description provided for @cashDrawer_transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get cashDrawer_transactions;

  /// No description provided for @cashDrawer_noTransactions.
  ///
  /// In en, this message translates to:
  /// **'No transactions yet'**
  String get cashDrawer_noTransactions;

  /// No description provided for @cashDrawer_enterOpeningBalance.
  ///
  /// In en, this message translates to:
  /// **'Enter opening balance'**
  String get cashDrawer_enterOpeningBalance;

  /// No description provided for @cashDrawer_selectReason.
  ///
  /// In en, this message translates to:
  /// **'Select Reason'**
  String get cashDrawer_selectReason;

  /// No description provided for @cashDrawer_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get cashDrawer_amount;

  /// No description provided for @cashDrawer_notes.
  ///
  /// In en, this message translates to:
  /// **'Notes (Optional)'**
  String get cashDrawer_notes;

  /// No description provided for @cashDrawer_insufficientBalance.
  ///
  /// In en, this message translates to:
  /// **'Insufficient balance. Cannot cash out more than current balance.'**
  String get cashDrawer_insufficientBalance;

  /// No description provided for @cashDrawer_sessionOpened.
  ///
  /// In en, this message translates to:
  /// **'Cash drawer session opened'**
  String get cashDrawer_sessionOpened;

  /// No description provided for @cashDrawer_sessionClosed.
  ///
  /// In en, this message translates to:
  /// **'Cash drawer session closed'**
  String get cashDrawer_sessionClosed;

  /// No description provided for @cashDrawer_backupBeforeLogout.
  ///
  /// In en, this message translates to:
  /// **'Would you like to backup your data to the cloud before logging out?'**
  String get cashDrawer_backupBeforeLogout;

  /// No description provided for @cashDrawer_cashInSuccess.
  ///
  /// In en, this message translates to:
  /// **'Cash in recorded successfully'**
  String get cashDrawer_cashInSuccess;

  /// No description provided for @cashDrawer_cashOutSuccess.
  ///
  /// In en, this message translates to:
  /// **'Cash out recorded successfully'**
  String get cashDrawer_cashOutSuccess;

  /// No description provided for @cashDrawer_closeConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Close Cash Drawer'**
  String get cashDrawer_closeConfirmTitle;

  /// No description provided for @cashDrawer_closeConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Enter the actual cash amount to close the session'**
  String get cashDrawer_closeConfirmMessage;

  /// No description provided for @cashDrawer_actualAmount.
  ///
  /// In en, this message translates to:
  /// **'Actual Amount'**
  String get cashDrawer_actualAmount;

  /// No description provided for @cashDrawer_varianceWarning.
  ///
  /// In en, this message translates to:
  /// **'There is a variance of {amount}. Please verify the amount.'**
  String cashDrawer_varianceWarning(String amount);

  /// No description provided for @cashDrawer_varianceOk.
  ///
  /// In en, this message translates to:
  /// **'Balance matches! No variance.'**
  String get cashDrawer_varianceOk;

  /// No description provided for @cashDrawer_sessionBy.
  ///
  /// In en, this message translates to:
  /// **'Session by {name}'**
  String cashDrawer_sessionBy(String name);

  /// No description provided for @cashDrawer_openSessionDesc.
  ///
  /// In en, this message translates to:
  /// **'Enter the opening cash balance to start a new session'**
  String get cashDrawer_openSessionDesc;

  /// No description provided for @cashDrawer_invalidAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount'**
  String get cashDrawer_invalidAmount;

  /// No description provided for @cashDrawer_enterActualBalance.
  ///
  /// In en, this message translates to:
  /// **'Please enter the actual balance'**
  String get cashDrawer_enterActualBalance;

  /// No description provided for @cashDrawer_negativeExpectedInfo.
  ///
  /// In en, this message translates to:
  /// **'Expected balance is negative. Actual balance will be set automatically.'**
  String get cashDrawer_negativeExpectedInfo;

  /// No description provided for @cashDrawer_reason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get cashDrawer_reason;

  /// No description provided for @cashDrawer_addCashIn.
  ///
  /// In en, this message translates to:
  /// **'Add Cash In'**
  String get cashDrawer_addCashIn;

  /// No description provided for @cashDrawer_addCashOut.
  ///
  /// In en, this message translates to:
  /// **'Add Cash Out'**
  String get cashDrawer_addCashOut;

  /// No description provided for @cashDrawer_cashInAdded.
  ///
  /// In en, this message translates to:
  /// **'Cash in added successfully'**
  String get cashDrawer_cashInAdded;

  /// No description provided for @cashDrawer_cashOutAdded.
  ///
  /// In en, this message translates to:
  /// **'Cash out added successfully'**
  String get cashDrawer_cashOutAdded;

  /// No description provided for @cashDrawer_availableBalance.
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get cashDrawer_availableBalance;

  /// No description provided for @cashDrawer_openedBy.
  ///
  /// In en, this message translates to:
  /// **'Opened by'**
  String get cashDrawer_openedBy;

  /// No description provided for @cashDrawer_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get cashDrawer_close;

  /// No description provided for @cashDrawer_items.
  ///
  /// In en, this message translates to:
  /// **'items'**
  String get cashDrawer_items;

  /// No description provided for @cashDrawer_sale.
  ///
  /// In en, this message translates to:
  /// **'Sale'**
  String get cashDrawer_sale;

  /// No description provided for @cashDrawer_refund.
  ///
  /// In en, this message translates to:
  /// **'Refund'**
  String get cashDrawer_refund;

  /// No description provided for @cashDrawer_additionalBalance.
  ///
  /// In en, this message translates to:
  /// **'Additional Balance'**
  String get cashDrawer_additionalBalance;

  /// No description provided for @cashDrawer_bankDeposit.
  ///
  /// In en, this message translates to:
  /// **'Bank Deposit'**
  String get cashDrawer_bankDeposit;

  /// No description provided for @cashDrawer_capitalReturn.
  ///
  /// In en, this message translates to:
  /// **'Capital Return'**
  String get cashDrawer_capitalReturn;

  /// No description provided for @cashDrawer_sessionRequired.
  ///
  /// In en, this message translates to:
  /// **'Cash Drawer Required'**
  String get cashDrawer_sessionRequired;

  /// No description provided for @cashDrawer_sessionRequiredDesc.
  ///
  /// In en, this message translates to:
  /// **'Please open a cash drawer session before accessing the app. This helps track all cash transactions during your shift.'**
  String get cashDrawer_sessionRequiredDesc;

  /// No description provided for @cashDrawer_cannotCloseSession.
  ///
  /// In en, this message translates to:
  /// **'Cannot Close Session'**
  String get cashDrawer_cannotCloseSession;

  /// No description provided for @cashDrawer_unpaidOrdersExist.
  ///
  /// In en, this message translates to:
  /// **'There are {count} unpaid order(s). Please complete all payments before closing the session.'**
  String cashDrawer_unpaidOrdersExist(int count);

  /// No description provided for @cashDrawerReport_title.
  ///
  /// In en, this message translates to:
  /// **'Cash Drawer Report'**
  String get cashDrawerReport_title;

  /// No description provided for @cashDrawerReport_sessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get cashDrawerReport_sessions;

  /// No description provided for @cashDrawerReport_cashier.
  ///
  /// In en, this message translates to:
  /// **'Cashier'**
  String get cashDrawerReport_cashier;

  /// No description provided for @cashDrawerReport_noSessions.
  ///
  /// In en, this message translates to:
  /// **'No sessions found in this period'**
  String get cashDrawerReport_noSessions;

  /// No description provided for @cashDrawerReport_totalSessions.
  ///
  /// In en, this message translates to:
  /// **'Total Sessions'**
  String get cashDrawerReport_totalSessions;

  /// No description provided for @cashDrawerReport_closedSessions.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get cashDrawerReport_closedSessions;

  /// No description provided for @cashDrawerReport_openSessions.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get cashDrawerReport_openSessions;

  /// No description provided for @cashDrawerReport_totalDifference.
  ///
  /// In en, this message translates to:
  /// **'Total Variance'**
  String get cashDrawerReport_totalDifference;

  /// No description provided for @cashDrawerReport_cashFlow.
  ///
  /// In en, this message translates to:
  /// **'Cash Flow Summary'**
  String get cashDrawerReport_cashFlow;

  /// No description provided for @cashDrawerReport_netCashFlow.
  ///
  /// In en, this message translates to:
  /// **'Net Cash Flow'**
  String get cashDrawerReport_netCashFlow;

  /// No description provided for @cashDrawerReport_sessionsByUser.
  ///
  /// In en, this message translates to:
  /// **'Sessions by Cashier'**
  String get cashDrawerReport_sessionsByUser;

  /// No description provided for @cashDrawerReport_differenceHistory.
  ///
  /// In en, this message translates to:
  /// **'Variance History'**
  String get cashDrawerReport_differenceHistory;

  /// No description provided for @cashDrawerReport_open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get cashDrawerReport_open;

  /// No description provided for @cashDrawerReport_closed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get cashDrawerReport_closed;

  /// No description provided for @cashDrawerReport_openingBalance.
  ///
  /// In en, this message translates to:
  /// **'Opening Balance'**
  String get cashDrawerReport_openingBalance;

  /// No description provided for @cashDrawerReport_currentBalance.
  ///
  /// In en, this message translates to:
  /// **'Current Balance'**
  String get cashDrawerReport_currentBalance;

  /// No description provided for @cashDrawerReport_income.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get cashDrawerReport_income;

  /// No description provided for @cashDrawerReport_outcome.
  ///
  /// In en, this message translates to:
  /// **'Outcome'**
  String get cashDrawerReport_outcome;

  /// No description provided for @cashDrawerReport_sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get cashDrawerReport_sales;

  /// No description provided for @cashDrawerReport_creditPayments.
  ///
  /// In en, this message translates to:
  /// **'Credit Payments'**
  String get cashDrawerReport_creditPayments;

  /// No description provided for @cashDrawerReport_purchaseOrders.
  ///
  /// In en, this message translates to:
  /// **'Purchase Orders'**
  String get cashDrawerReport_purchaseOrders;

  /// No description provided for @cashDrawerReport_expenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get cashDrawerReport_expenses;

  /// No description provided for @cashDrawerReport_debtPayments.
  ///
  /// In en, this message translates to:
  /// **'Debt Payments'**
  String get cashDrawerReport_debtPayments;

  /// No description provided for @cashDrawerReport_transactionSummary.
  ///
  /// In en, this message translates to:
  /// **'Transaction Summary'**
  String get cashDrawerReport_transactionSummary;

  /// No description provided for @cashDrawerReport_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Cash Drawer'**
  String get cashDrawerReport_printPreview;

  /// No description provided for @cashDrawerReport_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get cashDrawerReport_summary;

  /// No description provided for @cashDrawerReport_openedAt.
  ///
  /// In en, this message translates to:
  /// **'Opened At'**
  String get cashDrawerReport_openedAt;

  /// No description provided for @cashDrawerReport_closingBalance.
  ///
  /// In en, this message translates to:
  /// **'Closing Balance'**
  String get cashDrawerReport_closingBalance;

  /// No description provided for @cashDrawerReport_difference.
  ///
  /// In en, this message translates to:
  /// **'Difference'**
  String get cashDrawerReport_difference;

  /// No description provided for @cashDrawerReport_totalOpeningBalance.
  ///
  /// In en, this message translates to:
  /// **'Total Opening Balance'**
  String get cashDrawerReport_totalOpeningBalance;

  /// No description provided for @cashDrawerReport_totalClosingBalance.
  ///
  /// In en, this message translates to:
  /// **'Total Closing Balance'**
  String get cashDrawerReport_totalClosingBalance;

  /// No description provided for @cashDrawerReport_totalIncome.
  ///
  /// In en, this message translates to:
  /// **'Total Income'**
  String get cashDrawerReport_totalIncome;

  /// No description provided for @cashDrawerReport_totalOutcome.
  ///
  /// In en, this message translates to:
  /// **'Total Outcome'**
  String get cashDrawerReport_totalOutcome;

  /// No description provided for @cashDrawerReport_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get cashDrawerReport_status;

  /// No description provided for @cashReasons_title.
  ///
  /// In en, this message translates to:
  /// **'Cash Reasons'**
  String get cashReasons_title;

  /// No description provided for @cashReasons_add.
  ///
  /// In en, this message translates to:
  /// **'Add Cash Reason'**
  String get cashReasons_add;

  /// No description provided for @cashReasons_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit Cash Reason'**
  String get cashReasons_edit;

  /// No description provided for @cashReasons_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get cashReasons_name;

  /// No description provided for @cashReasons_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get cashReasons_type;

  /// No description provided for @cashReasons_cashIn.
  ///
  /// In en, this message translates to:
  /// **'Cash In'**
  String get cashReasons_cashIn;

  /// No description provided for @cashReasons_cashOut.
  ///
  /// In en, this message translates to:
  /// **'Cash Out'**
  String get cashReasons_cashOut;

  /// No description provided for @cashReasons_icon.
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get cashReasons_icon;

  /// No description provided for @cashReasons_color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get cashReasons_color;

  /// No description provided for @cashReasons_createExpense.
  ///
  /// In en, this message translates to:
  /// **'Create Expense'**
  String get cashReasons_createExpense;

  /// No description provided for @cashReasons_createExpenseDesc.
  ///
  /// In en, this message translates to:
  /// **'Automatically create expense record when using this reason'**
  String get cashReasons_createExpenseDesc;

  /// No description provided for @cashReasons_expenseCategory.
  ///
  /// In en, this message translates to:
  /// **'Expense Category'**
  String get cashReasons_expenseCategory;

  /// No description provided for @cashReasons_noReasons.
  ///
  /// In en, this message translates to:
  /// **'No cash reasons found'**
  String get cashReasons_noReasons;

  /// No description provided for @cashReasons_generateDefaults.
  ///
  /// In en, this message translates to:
  /// **'Generate Defaults'**
  String get cashReasons_generateDefaults;

  /// No description provided for @cashReasons_generateDefaultsDesc.
  ///
  /// In en, this message translates to:
  /// **'Create default cash in/out reasons'**
  String get cashReasons_generateDefaultsDesc;

  /// No description provided for @cashReasons_defaultsGenerated.
  ///
  /// In en, this message translates to:
  /// **'Default cash reasons generated'**
  String get cashReasons_defaultsGenerated;

  /// No description provided for @cashReasons_searchReasons.
  ///
  /// In en, this message translates to:
  /// **'Search reasons...'**
  String get cashReasons_searchReasons;

  /// No description provided for @cashReasons_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get cashReasons_all;

  /// No description provided for @cashReasons_sortOrder.
  ///
  /// In en, this message translates to:
  /// **'Sort Order'**
  String get cashReasons_sortOrder;

  /// No description provided for @cashReasons_deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this cash reason?'**
  String get cashReasons_deleteConfirm;

  /// No description provided for @cashReasons_saved.
  ///
  /// In en, this message translates to:
  /// **'Cash reason saved successfully'**
  String get cashReasons_saved;

  /// No description provided for @cashReasons_deleted.
  ///
  /// In en, this message translates to:
  /// **'Cash reason deleted'**
  String get cashReasons_deleted;

  /// No description provided for @cashReasons_deleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Cash Reason'**
  String get cashReasons_deleteTitle;

  /// No description provided for @cashReasons_generateDefaultsConfirm.
  ///
  /// In en, this message translates to:
  /// **'This will create default cash in/out reasons. Continue?'**
  String get cashReasons_generateDefaultsConfirm;

  /// No description provided for @cashReasons_typeCashIn.
  ///
  /// In en, this message translates to:
  /// **'Cash In Only'**
  String get cashReasons_typeCashIn;

  /// No description provided for @cashReasons_typeCashOut.
  ///
  /// In en, this message translates to:
  /// **'Cash Out Only'**
  String get cashReasons_typeCashOut;

  /// No description provided for @cashReasons_in.
  ///
  /// In en, this message translates to:
  /// **'In'**
  String get cashReasons_in;

  /// No description provided for @cashReasons_out.
  ///
  /// In en, this message translates to:
  /// **'Out'**
  String get cashReasons_out;

  /// No description provided for @cashReasons_autoExpense.
  ///
  /// In en, this message translates to:
  /// **'Auto Expense'**
  String get cashReasons_autoExpense;

  /// No description provided for @cashReasons_willCreateExpense.
  ///
  /// In en, this message translates to:
  /// **'Will create expense in category'**
  String get cashReasons_willCreateExpense;

  /// No description provided for @cashReasons_nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get cashReasons_nameRequired;

  /// No description provided for @cashReasons_updated.
  ///
  /// In en, this message translates to:
  /// **'Cash reason updated successfully'**
  String get cashReasons_updated;

  /// No description provided for @cashReasons_added.
  ///
  /// In en, this message translates to:
  /// **'Cash reason added successfully'**
  String get cashReasons_added;

  /// No description provided for @cashReasons_preview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get cashReasons_preview;

  /// No description provided for @cashReasons_selectIcon.
  ///
  /// In en, this message translates to:
  /// **'Select Icon'**
  String get cashReasons_selectIcon;

  /// No description provided for @cashReasons_selectColor.
  ///
  /// In en, this message translates to:
  /// **'Select Color'**
  String get cashReasons_selectColor;

  /// No description provided for @cashReasons_autoCreateExpense.
  ///
  /// In en, this message translates to:
  /// **'Auto Create Expense'**
  String get cashReasons_autoCreateExpense;

  /// No description provided for @common_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get common_summary;

  /// No description provided for @common_notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get common_notes;

  /// No description provided for @common_optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get common_optional;

  /// No description provided for @common_saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get common_saving;

  /// No description provided for @common_sortOrder.
  ///
  /// In en, this message translates to:
  /// **'Sort Order'**
  String get common_sortOrder;

  /// No description provided for @stockAdjustment_lossValueModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Loss Value Calculation'**
  String get stockAdjustment_lossValueModeTitle;

  /// No description provided for @stockAdjustment_lossValueModeDescription.
  ///
  /// In en, this message translates to:
  /// **'How should the loss value be calculated for stock adjustments?'**
  String get stockAdjustment_lossValueModeDescription;

  /// No description provided for @stockAdjustment_lossValueBasedOnPurchasePrice.
  ///
  /// In en, this message translates to:
  /// **'Based on Purchase Price'**
  String get stockAdjustment_lossValueBasedOnPurchasePrice;

  /// No description provided for @stockAdjustment_lossValueBasedOnPurchasePriceDesc.
  ///
  /// In en, this message translates to:
  /// **'Loss = Purchase Price × Quantity'**
  String get stockAdjustment_lossValueBasedOnPurchasePriceDesc;

  /// No description provided for @stockAdjustment_lossValueZero.
  ///
  /// In en, this message translates to:
  /// **'No Loss Value'**
  String get stockAdjustment_lossValueZero;

  /// No description provided for @stockAdjustment_lossValueZeroDesc.
  ///
  /// In en, this message translates to:
  /// **'Set loss value to 0 (no expense)'**
  String get stockAdjustment_lossValueZeroDesc;

  /// No description provided for @stockAdjustment_negativeQtyInfo.
  ///
  /// In en, this message translates to:
  /// **'Use negative quantity to reduce stock'**
  String get stockAdjustment_negativeQtyInfo;

  /// No description provided for @stockAdjustment_negativeForIncrease.
  ///
  /// In en, this message translates to:
  /// **'Use negative value to increase stock'**
  String get stockAdjustment_negativeForIncrease;

  /// No description provided for @stockAdjustment_positiveForIncrease.
  ///
  /// In en, this message translates to:
  /// **'+ to add stock, - to reduce stock'**
  String get stockAdjustment_positiveForIncrease;

  /// No description provided for @stockAdjustment_stockIncrease.
  ///
  /// In en, this message translates to:
  /// **'Stock Increase'**
  String get stockAdjustment_stockIncrease;

  /// No description provided for @stockAdjustment_selectUnit.
  ///
  /// In en, this message translates to:
  /// **'Select Unit'**
  String get stockAdjustment_selectUnit;

  /// No description provided for @stockAdjustment_baseUnit.
  ///
  /// In en, this message translates to:
  /// **'Base unit'**
  String get stockAdjustment_baseUnit;

  /// No description provided for @stockAdjustment_qtyCannotExceedStock.
  ///
  /// In en, this message translates to:
  /// **'Reduction cannot exceed current stock ({stock})'**
  String stockAdjustment_qtyCannotExceedStock(String stock);

  /// No description provided for @stockAdjustmentCart_qtyCannotExceedStock.
  ///
  /// In en, this message translates to:
  /// **'Reduction cannot exceed current stock ({stock})'**
  String stockAdjustmentCart_qtyCannotExceedStock(String stock);

  /// No description provided for @stockAdjustmentAddItem_addItem.
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get stockAdjustmentAddItem_addItem;

  /// No description provided for @stockAdjustmentAddItem_editItem.
  ///
  /// In en, this message translates to:
  /// **'Edit Item'**
  String get stockAdjustmentAddItem_editItem;

  /// No description provided for @stockAdjustmentAddItem_addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Adjustment'**
  String get stockAdjustmentAddItem_addToCart;

  /// No description provided for @stockAdjustmentAddItem_update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get stockAdjustmentAddItem_update;

  /// No description provided for @stockAdjustmentAddItem_qtyMustNotBeZero.
  ///
  /// In en, this message translates to:
  /// **'Quantity must not be zero'**
  String get stockAdjustmentAddItem_qtyMustNotBeZero;

  /// No description provided for @stockAdjustmentAddItem_noDecimalQty.
  ///
  /// In en, this message translates to:
  /// **'This product does not allow decimal quantities'**
  String get stockAdjustmentAddItem_noDecimalQty;

  /// No description provided for @stockAdjustmentAddItem_costInfo.
  ///
  /// In en, this message translates to:
  /// **'Cost: {price}/{unit}'**
  String stockAdjustmentAddItem_costInfo(String price, String unit);

  /// No description provided for @validator_required.
  ///
  /// In en, this message translates to:
  /// **'is required'**
  String get validator_required;

  /// No description provided for @validator_invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get validator_invalidEmail;

  /// No description provided for @validator_invalidPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get validator_invalidPhone;

  /// No description provided for @validator_minLength.
  ///
  /// In en, this message translates to:
  /// **'Must be at least {length} characters'**
  String validator_minLength(int length);

  /// No description provided for @validator_maxLength.
  ///
  /// In en, this message translates to:
  /// **'Must be at most {length} characters'**
  String validator_maxLength(int length);

  /// No description provided for @validator_numericOnly.
  ///
  /// In en, this message translates to:
  /// **'Please enter numbers only'**
  String get validator_numericOnly;

  /// No description provided for @validator_minValue.
  ///
  /// In en, this message translates to:
  /// **'Value must be at least {value}'**
  String validator_minValue(int value);

  /// No description provided for @validator_maxValue.
  ///
  /// In en, this message translates to:
  /// **'Value cannot exceed {value}'**
  String validator_maxValue(int value);

  /// No description provided for @validator_passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least {length} characters'**
  String validator_passwordMinLength(int length);

  /// No description provided for @validator_passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get validator_passwordMismatch;

  /// No description provided for @validator_invalidUrl.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid URL'**
  String get validator_invalidUrl;

  /// No description provided for @validator_invalidBarcode.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid barcode (4-20 alphanumeric characters)'**
  String get validator_invalidBarcode;

  /// No description provided for @home_balanceSheet.
  ///
  /// In en, this message translates to:
  /// **'Balance Sheet'**
  String get home_balanceSheet;

  /// No description provided for @balanceSheet_title.
  ///
  /// In en, this message translates to:
  /// **'Balance Sheet'**
  String get balanceSheet_title;

  /// No description provided for @balanceSheet_printPreview.
  ///
  /// In en, this message translates to:
  /// **'Print Preview - Balance Sheet'**
  String get balanceSheet_printPreview;

  /// No description provided for @balanceSheet_details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get balanceSheet_details;

  /// No description provided for @balanceSheet_difference.
  ///
  /// In en, this message translates to:
  /// **'Difference'**
  String get balanceSheet_difference;

  /// No description provided for @balanceSheet_statement.
  ///
  /// In en, this message translates to:
  /// **'Balance Sheet Statement'**
  String get balanceSheet_statement;

  /// No description provided for @balanceSheet_assets.
  ///
  /// In en, this message translates to:
  /// **'Assets'**
  String get balanceSheet_assets;

  /// No description provided for @balanceSheet_liabilities.
  ///
  /// In en, this message translates to:
  /// **'Liabilities'**
  String get balanceSheet_liabilities;

  /// No description provided for @balanceSheet_equity.
  ///
  /// In en, this message translates to:
  /// **'Equity'**
  String get balanceSheet_equity;

  /// No description provided for @balanceSheet_totalAssets.
  ///
  /// In en, this message translates to:
  /// **'Total Assets'**
  String get balanceSheet_totalAssets;

  /// No description provided for @balanceSheet_totalLiabilities.
  ///
  /// In en, this message translates to:
  /// **'Total Liabilities'**
  String get balanceSheet_totalLiabilities;

  /// No description provided for @balanceSheet_ownersEquity.
  ///
  /// In en, this message translates to:
  /// **'Owner\'s Equity'**
  String get balanceSheet_ownersEquity;

  /// No description provided for @balanceSheet_cashOnHand.
  ///
  /// In en, this message translates to:
  /// **'Cash on Hand'**
  String get balanceSheet_cashOnHand;

  /// No description provided for @balanceSheet_accountsReceivable.
  ///
  /// In en, this message translates to:
  /// **'Accounts Receivable'**
  String get balanceSheet_accountsReceivable;

  /// No description provided for @balanceSheet_accountsPayable.
  ///
  /// In en, this message translates to:
  /// **'Accounts Payable'**
  String get balanceSheet_accountsPayable;

  /// No description provided for @balanceSheet_inventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get balanceSheet_inventory;

  /// No description provided for @balanceSheet_balanceCheck.
  ///
  /// In en, this message translates to:
  /// **'Balance Check'**
  String get balanceSheet_balanceCheck;

  /// No description provided for @balanceSheet_liabilitiesPlusEquity.
  ///
  /// In en, this message translates to:
  /// **'Liabilities + Equity'**
  String get balanceSheet_liabilitiesPlusEquity;

  /// No description provided for @balanceSheet_inventoryDetail.
  ///
  /// In en, this message translates to:
  /// **'Inventory Detail'**
  String get balanceSheet_inventoryDetail;

  /// No description provided for @balanceSheet_receivablesDetail.
  ///
  /// In en, this message translates to:
  /// **'Receivables Detail'**
  String get balanceSheet_receivablesDetail;

  /// No description provided for @balanceSheet_payablesDetail.
  ///
  /// In en, this message translates to:
  /// **'Payables Detail'**
  String get balanceSheet_payablesDetail;

  /// No description provided for @balanceSheet_totalProducts.
  ///
  /// In en, this message translates to:
  /// **'Total Products'**
  String get balanceSheet_totalProducts;

  /// No description provided for @balanceSheet_totalStock.
  ///
  /// In en, this message translates to:
  /// **'Total Stock'**
  String get balanceSheet_totalStock;

  /// No description provided for @balanceSheet_inventoryValue.
  ///
  /// In en, this message translates to:
  /// **'Inventory Value'**
  String get balanceSheet_inventoryValue;

  /// No description provided for @balanceSheet_totalCredits.
  ///
  /// In en, this message translates to:
  /// **'Outstanding Credits'**
  String get balanceSheet_totalCredits;

  /// No description provided for @balanceSheet_totalDebts.
  ///
  /// In en, this message translates to:
  /// **'Outstanding Debts'**
  String get balanceSheet_totalDebts;

  /// No description provided for @balanceSheet_outstandingAmount.
  ///
  /// In en, this message translates to:
  /// **'Outstanding Amount'**
  String get balanceSheet_outstandingAmount;

  /// No description provided for @balanceSheet_assetComposition.
  ///
  /// In en, this message translates to:
  /// **'Asset Composition'**
  String get balanceSheet_assetComposition;

  /// No description provided for @balanceSheet_cashSessions.
  ///
  /// In en, this message translates to:
  /// **'Cash Sessions'**
  String get balanceSheet_cashSessions;

  /// No description provided for @balanceSheet_noSessions.
  ///
  /// In en, this message translates to:
  /// **'No cash sessions in this period'**
  String get balanceSheet_noSessions;

  /// No description provided for @balanceSheet_noReceivables.
  ///
  /// In en, this message translates to:
  /// **'No outstanding receivables in this period'**
  String get balanceSheet_noReceivables;

  /// No description provided for @balanceSheet_noPayables.
  ///
  /// In en, this message translates to:
  /// **'No outstanding payables in this period'**
  String get balanceSheet_noPayables;

  /// No description provided for @common_closed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get common_closed;

  /// No description provided for @common_open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get common_open;

  /// No description provided for @common_noDescription.
  ///
  /// In en, this message translates to:
  /// **'No Description'**
  String get common_noDescription;

  /// No description provided for @common_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get common_other;

  /// No description provided for @common_auditInfo.
  ///
  /// In en, this message translates to:
  /// **'Audit Information'**
  String get common_auditInfo;

  /// No description provided for @common_createdBy.
  ///
  /// In en, this message translates to:
  /// **'Created By'**
  String get common_createdBy;

  /// No description provided for @common_updatedBy.
  ///
  /// In en, this message translates to:
  /// **'Updated By'**
  String get common_updatedBy;

  /// No description provided for @common_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get common_amount;

  /// No description provided for @common_percentage.
  ///
  /// In en, this message translates to:
  /// **'Percentage'**
  String get common_percentage;

  /// No description provided for @common_date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get common_date;

  /// No description provided for @common_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get common_description;

  /// No description provided for @expenses_detailTitle.
  ///
  /// In en, this message translates to:
  /// **'Expense Detail'**
  String get expenses_detailTitle;

  /// No description provided for @goodReceive_title.
  ///
  /// In en, this message translates to:
  /// **'Good Receive'**
  String get goodReceive_title;

  /// No description provided for @goodReceive_selectPO.
  ///
  /// In en, this message translates to:
  /// **'Select Purchase Order'**
  String get goodReceive_selectPO;

  /// No description provided for @goodReceive_noPendingPO.
  ///
  /// In en, this message translates to:
  /// **'No pending purchase orders'**
  String get goodReceive_noPendingPO;

  /// No description provided for @goodReceive_noPendingPOHint.
  ///
  /// In en, this message translates to:
  /// **'Create a purchase order first'**
  String get goodReceive_noPendingPOHint;

  /// No description provided for @goodReceive_partial.
  ///
  /// In en, this message translates to:
  /// **'Partial'**
  String get goodReceive_partial;

  /// No description provided for @goodReceive_fullyReceived.
  ///
  /// In en, this message translates to:
  /// **'Fully Received'**
  String get goodReceive_fullyReceived;

  /// No description provided for @goodReceive_remainingItems.
  ///
  /// In en, this message translates to:
  /// **'remaining'**
  String get goodReceive_remainingItems;

  /// No description provided for @goodReceive_items.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String goodReceive_items(int count);

  /// No description provided for @goodReceive_product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get goodReceive_product;

  /// No description provided for @goodReceive_ordered.
  ///
  /// In en, this message translates to:
  /// **'Ordered'**
  String get goodReceive_ordered;

  /// No description provided for @goodReceive_received.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get goodReceive_received;

  /// No description provided for @goodReceive_receiveNow.
  ///
  /// In en, this message translates to:
  /// **'Receive Now'**
  String get goodReceive_receiveNow;

  /// No description provided for @goodReceive_remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get goodReceive_remaining;

  /// No description provided for @goodReceive_totalReceiveAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Receive Amount'**
  String get goodReceive_totalReceiveAmount;

  /// No description provided for @goodReceive_noItemsToReceive.
  ///
  /// In en, this message translates to:
  /// **'No items to receive'**
  String get goodReceive_noItemsToReceive;

  /// No description provided for @goodReceive_noItemsToReceiveHint.
  ///
  /// In en, this message translates to:
  /// **'Enter quantity to receive for at least one item'**
  String get goodReceive_noItemsToReceiveHint;

  /// No description provided for @goodReceive_saveGoodReceive.
  ///
  /// In en, this message translates to:
  /// **'Save Good Receive'**
  String get goodReceive_saveGoodReceive;

  /// No description provided for @goodReceive_confirmReceive.
  ///
  /// In en, this message translates to:
  /// **'Confirm Good Receive'**
  String get goodReceive_confirmReceive;

  /// No description provided for @goodReceive_confirmReceiveMessage.
  ///
  /// In en, this message translates to:
  /// **'This will update the stock for {count} items. Continue?'**
  String goodReceive_confirmReceiveMessage(int count);

  /// No description provided for @goodReceive_saving.
  ///
  /// In en, this message translates to:
  /// **'Saving good receive...'**
  String get goodReceive_saving;

  /// No description provided for @goodReceive_receiveAll.
  ///
  /// In en, this message translates to:
  /// **'Receive All'**
  String get goodReceive_receiveAll;

  /// No description provided for @goodReceive_saveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Good receive saved successfully'**
  String get goodReceive_saveSuccess;

  /// No description provided for @goodReceive_saveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save good receive: {error}'**
  String goodReceive_saveFailed(String error);

  /// No description provided for @goodReceive_grNumber.
  ///
  /// In en, this message translates to:
  /// **'GR Number'**
  String get goodReceive_grNumber;

  /// No description provided for @goodReceive_purchaseOrder.
  ///
  /// In en, this message translates to:
  /// **'Purchase Order'**
  String get goodReceive_purchaseOrder;

  /// No description provided for @goodReceive_receiveDate.
  ///
  /// In en, this message translates to:
  /// **'Receive Date'**
  String get goodReceive_receiveDate;

  /// No description provided for @goodReceive_supplier.
  ///
  /// In en, this message translates to:
  /// **'Supplier'**
  String get goodReceive_supplier;

  /// No description provided for @goodReceive_history.
  ///
  /// In en, this message translates to:
  /// **'Good Receive History'**
  String get goodReceive_history;

  /// No description provided for @goodReceive_noHistory.
  ///
  /// In en, this message translates to:
  /// **'No good receive history'**
  String get goodReceive_noHistory;

  /// No description provided for @goodReceive_viewDetail.
  ///
  /// In en, this message translates to:
  /// **'View Detail'**
  String get goodReceive_viewDetail;

  /// No description provided for @goodReceive_allPOReceived.
  ///
  /// In en, this message translates to:
  /// **'All purchase orders have been fully received'**
  String get goodReceive_allPOReceived;

  /// No description provided for @salesReport_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Sales Report?'**
  String get salesReport_helpTitle;

  /// No description provided for @salesReport_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Sales Report shows your revenue from completed sales transactions within the selected period.'**
  String get salesReport_helpDescription;

  /// No description provided for @salesReport_helpIncludes.
  ///
  /// In en, this message translates to:
  /// **'Includes'**
  String get salesReport_helpIncludes;

  /// No description provided for @salesReport_helpPaidOrders.
  ///
  /// In en, this message translates to:
  /// **'Paid orders (cash, QRIS, bank transfer)'**
  String get salesReport_helpPaidOrders;

  /// No description provided for @salesReport_helpCreditSales.
  ///
  /// In en, this message translates to:
  /// **'Credit sales (counted as revenue when sold)'**
  String get salesReport_helpCreditSales;

  /// No description provided for @salesReport_helpTaxCalculation.
  ///
  /// In en, this message translates to:
  /// **'Tax calculation based on settings'**
  String get salesReport_helpTaxCalculation;

  /// No description provided for @salesReport_helpGrossProfit.
  ///
  /// In en, this message translates to:
  /// **'Gross profit (revenue - COGS)'**
  String get salesReport_helpGrossProfit;

  /// No description provided for @salesReport_helpNotIncluded.
  ///
  /// In en, this message translates to:
  /// **'Not Included'**
  String get salesReport_helpNotIncluded;

  /// No description provided for @salesReport_helpPendingOrders.
  ///
  /// In en, this message translates to:
  /// **'Pending/unpaid orders'**
  String get salesReport_helpPendingOrders;

  /// No description provided for @salesReport_helpCancelledOrders.
  ///
  /// In en, this message translates to:
  /// **'Cancelled orders'**
  String get salesReport_helpCancelledOrders;

  /// No description provided for @salesReport_helpRefunds.
  ///
  /// In en, this message translates to:
  /// **'Refunds'**
  String get salesReport_helpRefunds;

  /// No description provided for @expenseReport_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Expense Report?'**
  String get expenseReport_helpTitle;

  /// No description provided for @expenseReport_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Expense Report tracks all business expenses and operational costs within the selected period.'**
  String get expenseReport_helpDescription;

  /// No description provided for @expenseReport_helpIncludes.
  ///
  /// In en, this message translates to:
  /// **'Includes'**
  String get expenseReport_helpIncludes;

  /// No description provided for @expenseReport_helpOperationalExpenses.
  ///
  /// In en, this message translates to:
  /// **'Operational expenses (rent, utilities, salaries)'**
  String get expenseReport_helpOperationalExpenses;

  /// No description provided for @expenseReport_helpCashShortage.
  ///
  /// In en, this message translates to:
  /// **'Cash shortage from cash drawer'**
  String get expenseReport_helpCashShortage;

  /// No description provided for @expenseReport_helpSupplies.
  ///
  /// In en, this message translates to:
  /// **'Supplies and consumables'**
  String get expenseReport_helpSupplies;

  /// No description provided for @expenseReport_helpOtherExpenses.
  ///
  /// In en, this message translates to:
  /// **'Other business expenses'**
  String get expenseReport_helpOtherExpenses;

  /// No description provided for @expenseReport_helpNotIncluded.
  ///
  /// In en, this message translates to:
  /// **'Not Included'**
  String get expenseReport_helpNotIncluded;

  /// No description provided for @expenseReport_helpPurchaseOrders.
  ///
  /// In en, this message translates to:
  /// **'Purchase orders (inventory purchases)'**
  String get expenseReport_helpPurchaseOrders;

  /// No description provided for @expenseReport_helpDebtPayments.
  ///
  /// In en, this message translates to:
  /// **'Debt payments to suppliers'**
  String get expenseReport_helpDebtPayments;

  /// No description provided for @creditReport_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Credit Report?'**
  String get creditReport_helpTitle;

  /// No description provided for @creditReport_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Credit Report shows outstanding amounts owed by customers (accounts receivable) for credit sales.'**
  String get creditReport_helpDescription;

  /// No description provided for @creditReport_helpIncludes.
  ///
  /// In en, this message translates to:
  /// **'Includes'**
  String get creditReport_helpIncludes;

  /// No description provided for @creditReport_helpCreditSales.
  ///
  /// In en, this message translates to:
  /// **'Credit sales to customers'**
  String get creditReport_helpCreditSales;

  /// No description provided for @creditReport_helpOutstandingAmount.
  ///
  /// In en, this message translates to:
  /// **'Outstanding amount to be collected'**
  String get creditReport_helpOutstandingAmount;

  /// No description provided for @creditReport_helpPaymentHistory.
  ///
  /// In en, this message translates to:
  /// **'Payment history and status'**
  String get creditReport_helpPaymentHistory;

  /// No description provided for @creditReport_helpNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get creditReport_helpNote;

  /// No description provided for @creditReport_helpNoteDescription.
  ///
  /// In en, this message translates to:
  /// **'Credit is money customers owe to you. When customers pay, the credit balance decreases.'**
  String get creditReport_helpNoteDescription;

  /// No description provided for @debtReport_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Debt Report?'**
  String get debtReport_helpTitle;

  /// No description provided for @debtReport_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Debt Report shows outstanding amounts you owe to suppliers (accounts payable) for credit purchases.'**
  String get debtReport_helpDescription;

  /// No description provided for @debtReport_helpIncludes.
  ///
  /// In en, this message translates to:
  /// **'Includes'**
  String get debtReport_helpIncludes;

  /// No description provided for @debtReport_helpCreditPurchases.
  ///
  /// In en, this message translates to:
  /// **'Credit purchases from suppliers'**
  String get debtReport_helpCreditPurchases;

  /// No description provided for @debtReport_helpOutstandingAmount.
  ///
  /// In en, this message translates to:
  /// **'Outstanding amount to be paid'**
  String get debtReport_helpOutstandingAmount;

  /// No description provided for @debtReport_helpPaymentHistory.
  ///
  /// In en, this message translates to:
  /// **'Payment history and status'**
  String get debtReport_helpPaymentHistory;

  /// No description provided for @debtReport_helpNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get debtReport_helpNote;

  /// No description provided for @debtReport_helpNoteDescription.
  ///
  /// In en, this message translates to:
  /// **'Debt is money you owe to suppliers. When you pay suppliers, the debt balance decreases.'**
  String get debtReport_helpNoteDescription;

  /// No description provided for @inventoryReport_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Inventory Report?'**
  String get inventoryReport_helpTitle;

  /// No description provided for @inventoryReport_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Inventory Report shows the current stock levels and values of all products in your inventory.'**
  String get inventoryReport_helpDescription;

  /// No description provided for @inventoryReport_helpIncludes.
  ///
  /// In en, this message translates to:
  /// **'Includes'**
  String get inventoryReport_helpIncludes;

  /// No description provided for @inventoryReport_helpCurrentStock.
  ///
  /// In en, this message translates to:
  /// **'Current stock quantities'**
  String get inventoryReport_helpCurrentStock;

  /// No description provided for @inventoryReport_helpStockValue.
  ///
  /// In en, this message translates to:
  /// **'Stock value at purchase price (cost)'**
  String get inventoryReport_helpStockValue;

  /// No description provided for @inventoryReport_helpRetailValue.
  ///
  /// In en, this message translates to:
  /// **'Potential retail value at selling price'**
  String get inventoryReport_helpRetailValue;

  /// No description provided for @inventoryReport_helpLowStock.
  ///
  /// In en, this message translates to:
  /// **'Low stock and out of stock alerts'**
  String get inventoryReport_helpLowStock;

  /// No description provided for @inventoryReport_helpNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get inventoryReport_helpNote;

  /// No description provided for @inventoryReport_helpNoteDescription.
  ///
  /// In en, this message translates to:
  /// **'This is a real-time snapshot of your inventory. It is not filtered by date.'**
  String get inventoryReport_helpNoteDescription;

  /// No description provided for @balanceSheet_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Balance Sheet?'**
  String get balanceSheet_helpTitle;

  /// No description provided for @balanceSheet_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Balance Sheet shows your business\'s financial position: what you own (assets), what you owe (liabilities), and your net worth (equity).'**
  String get balanceSheet_helpDescription;

  /// No description provided for @balanceSheet_helpAssets.
  ///
  /// In en, this message translates to:
  /// **'Assets'**
  String get balanceSheet_helpAssets;

  /// No description provided for @balanceSheet_helpCashOnHand.
  ///
  /// In en, this message translates to:
  /// **'Cash on hand (from cash drawer)'**
  String get balanceSheet_helpCashOnHand;

  /// No description provided for @balanceSheet_helpInventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory value (current stock)'**
  String get balanceSheet_helpInventory;

  /// No description provided for @balanceSheet_helpAccountsReceivable.
  ///
  /// In en, this message translates to:
  /// **'Accounts receivable (customer credits)'**
  String get balanceSheet_helpAccountsReceivable;

  /// No description provided for @balanceSheet_helpLiabilities.
  ///
  /// In en, this message translates to:
  /// **'Liabilities'**
  String get balanceSheet_helpLiabilities;

  /// No description provided for @balanceSheet_helpAccountsPayable.
  ///
  /// In en, this message translates to:
  /// **'Accounts payable (supplier debts)'**
  String get balanceSheet_helpAccountsPayable;

  /// No description provided for @balanceSheet_helpEquity.
  ///
  /// In en, this message translates to:
  /// **'Equity'**
  String get balanceSheet_helpEquity;

  /// No description provided for @balanceSheet_helpEquityDescription.
  ///
  /// In en, this message translates to:
  /// **'Assets minus Liabilities = Owner\'s Equity'**
  String get balanceSheet_helpEquityDescription;

  /// No description provided for @profitLoss_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Profit & Loss?'**
  String get profitLoss_helpTitle;

  /// No description provided for @profitLoss_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Profit & Loss (P&L) shows your business profitability: revenue minus costs and expenses.'**
  String get profitLoss_helpDescription;

  /// No description provided for @profitLoss_helpRevenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get profitLoss_helpRevenue;

  /// No description provided for @profitLoss_helpSalesRevenue.
  ///
  /// In en, this message translates to:
  /// **'Sales revenue (all paid orders)'**
  String get profitLoss_helpSalesRevenue;

  /// No description provided for @profitLoss_helpCosts.
  ///
  /// In en, this message translates to:
  /// **'Costs'**
  String get profitLoss_helpCosts;

  /// No description provided for @profitLoss_helpCOGS.
  ///
  /// In en, this message translates to:
  /// **'Cost of Goods Sold (purchase price of items sold)'**
  String get profitLoss_helpCOGS;

  /// No description provided for @profitLoss_helpExpenses.
  ///
  /// In en, this message translates to:
  /// **'Operating expenses'**
  String get profitLoss_helpExpenses;

  /// No description provided for @profitLoss_helpOtherIncome.
  ///
  /// In en, this message translates to:
  /// **'Other Income'**
  String get profitLoss_helpOtherIncome;

  /// No description provided for @profitLoss_helpCashOverage.
  ///
  /// In en, this message translates to:
  /// **'Cash overage from cash drawer'**
  String get profitLoss_helpCashOverage;

  /// No description provided for @profitLoss_helpNetProfit.
  ///
  /// In en, this message translates to:
  /// **'Net Profit = Revenue - COGS - Expenses + Other Income'**
  String get profitLoss_helpNetProfit;

  /// No description provided for @cashDrawerReport_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Cash Drawer Report?'**
  String get cashDrawerReport_helpTitle;

  /// No description provided for @cashDrawerReport_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Cash Drawer Report shows detailed cash transactions and sessions for your cash drawer.'**
  String get cashDrawerReport_helpDescription;

  /// No description provided for @cashDrawerReport_helpIncome.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get cashDrawerReport_helpIncome;

  /// No description provided for @cashDrawerReport_helpSalesIncome.
  ///
  /// In en, this message translates to:
  /// **'Cash sales and QRIS payments'**
  String get cashDrawerReport_helpSalesIncome;

  /// No description provided for @cashDrawerReport_helpCreditPaymentsReceived.
  ///
  /// In en, this message translates to:
  /// **'Credit payments received'**
  String get cashDrawerReport_helpCreditPaymentsReceived;

  /// No description provided for @cashDrawerReport_helpCashInTransactions.
  ///
  /// In en, this message translates to:
  /// **'Cash in transactions (deposits)'**
  String get cashDrawerReport_helpCashInTransactions;

  /// No description provided for @cashDrawerReport_helpOutcome.
  ///
  /// In en, this message translates to:
  /// **'Outcome'**
  String get cashDrawerReport_helpOutcome;

  /// No description provided for @cashDrawerReport_helpExpensesPaid.
  ///
  /// In en, this message translates to:
  /// **'Expenses paid from cash drawer'**
  String get cashDrawerReport_helpExpensesPaid;

  /// No description provided for @cashDrawerReport_helpPurchaseOrdersPaid.
  ///
  /// In en, this message translates to:
  /// **'Purchase orders paid in cash'**
  String get cashDrawerReport_helpPurchaseOrdersPaid;

  /// No description provided for @cashDrawerReport_helpDebtPaymentsMade.
  ///
  /// In en, this message translates to:
  /// **'Debt payments to suppliers'**
  String get cashDrawerReport_helpDebtPaymentsMade;

  /// No description provided for @cashDrawerReport_helpCashOutTransactions.
  ///
  /// In en, this message translates to:
  /// **'Cash out transactions (withdrawals)'**
  String get cashDrawerReport_helpCashOutTransactions;

  /// No description provided for @capitalReport_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Capital Report?'**
  String get capitalReport_helpTitle;

  /// No description provided for @capitalReport_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Capital Report shows the owner\'s investment and capital contributions to the business.'**
  String get capitalReport_helpDescription;

  /// No description provided for @capitalReport_helpIncludes.
  ///
  /// In en, this message translates to:
  /// **'Includes'**
  String get capitalReport_helpIncludes;

  /// No description provided for @capitalReport_helpOpeningBalance.
  ///
  /// In en, this message translates to:
  /// **'Opening balance when starting cash drawer'**
  String get capitalReport_helpOpeningBalance;

  /// No description provided for @capitalReport_helpAdditionalCapital.
  ///
  /// In en, this message translates to:
  /// **'Additional capital deposits (cash in)'**
  String get capitalReport_helpAdditionalCapital;

  /// No description provided for @capitalReport_helpCashOverage.
  ///
  /// In en, this message translates to:
  /// **'Cash overage (extra cash found)'**
  String get capitalReport_helpCashOverage;

  /// No description provided for @capitalReport_helpNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get capitalReport_helpNote;

  /// No description provided for @capitalReport_helpNoteDescription.
  ///
  /// In en, this message translates to:
  /// **'Capital represents owner\'s investment in the business. Opening balance is the initial capital.'**
  String get capitalReport_helpNoteDescription;

  /// No description provided for @staffReport_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Staff Report?'**
  String get staffReport_helpTitle;

  /// No description provided for @staffReport_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Staff Report shows performance metrics for each staff member based on their sales transactions.'**
  String get staffReport_helpDescription;

  /// No description provided for @staffReport_helpIncludes.
  ///
  /// In en, this message translates to:
  /// **'Includes'**
  String get staffReport_helpIncludes;

  /// No description provided for @staffReport_helpSalesPerStaff.
  ///
  /// In en, this message translates to:
  /// **'Total sales per staff member'**
  String get staffReport_helpSalesPerStaff;

  /// No description provided for @staffReport_helpTransactionCount.
  ///
  /// In en, this message translates to:
  /// **'Number of transactions handled'**
  String get staffReport_helpTransactionCount;

  /// No description provided for @staffReport_helpAverageTransaction.
  ///
  /// In en, this message translates to:
  /// **'Average transaction value'**
  String get staffReport_helpAverageTransaction;

  /// No description provided for @staffReport_helpNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get staffReport_helpNote;

  /// No description provided for @staffReport_helpNoteDescription.
  ///
  /// In en, this message translates to:
  /// **'Staff performance is based on who processed the order (cashier).'**
  String get staffReport_helpNoteDescription;

  /// No description provided for @customerReport_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Customer Report?'**
  String get customerReport_helpTitle;

  /// No description provided for @customerReport_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Customer Report shows customer purchase patterns and their contribution to your revenue.'**
  String get customerReport_helpDescription;

  /// No description provided for @customerReport_helpIncludes.
  ///
  /// In en, this message translates to:
  /// **'Includes'**
  String get customerReport_helpIncludes;

  /// No description provided for @customerReport_helpCustomerPurchases.
  ///
  /// In en, this message translates to:
  /// **'Total purchases per customer'**
  String get customerReport_helpCustomerPurchases;

  /// No description provided for @customerReport_helpOrderFrequency.
  ///
  /// In en, this message translates to:
  /// **'Order frequency and count'**
  String get customerReport_helpOrderFrequency;

  /// No description provided for @customerReport_helpAverageOrderValue.
  ///
  /// In en, this message translates to:
  /// **'Average order value'**
  String get customerReport_helpAverageOrderValue;

  /// No description provided for @customerReport_helpNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get customerReport_helpNote;

  /// No description provided for @customerReport_helpNoteDescription.
  ///
  /// In en, this message translates to:
  /// **'Helps identify your best customers and their buying patterns.'**
  String get customerReport_helpNoteDescription;

  /// No description provided for @supplierReport_helpNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get supplierReport_helpNote;

  /// No description provided for @supplierReport_helpNoteDescription.
  ///
  /// In en, this message translates to:
  /// **'Helps track supplier relationships and purchase patterns.'**
  String get supplierReport_helpNoteDescription;

  /// No description provided for @productPerformance_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Product Performance?'**
  String get productPerformance_helpTitle;

  /// No description provided for @productPerformance_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Product Performance shows how well each product is selling and its profitability.'**
  String get productPerformance_helpDescription;

  /// No description provided for @productPerformance_helpIncludes.
  ///
  /// In en, this message translates to:
  /// **'Includes'**
  String get productPerformance_helpIncludes;

  /// No description provided for @productPerformance_helpQuantitySold.
  ///
  /// In en, this message translates to:
  /// **'Quantity sold per product'**
  String get productPerformance_helpQuantitySold;

  /// No description provided for @productPerformance_helpRevenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue generated'**
  String get productPerformance_helpRevenue;

  /// No description provided for @productPerformance_helpProfitMargin.
  ///
  /// In en, this message translates to:
  /// **'Profit margin per product'**
  String get productPerformance_helpProfitMargin;

  /// No description provided for @productPerformance_helpNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get productPerformance_helpNote;

  /// No description provided for @productPerformance_helpNoteDescription.
  ///
  /// In en, this message translates to:
  /// **'Use this to identify best-selling and most profitable products.'**
  String get productPerformance_helpNoteDescription;

  /// No description provided for @hourlySales_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Hourly Sales Report?'**
  String get hourlySales_helpTitle;

  /// No description provided for @hourlySales_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Hourly Sales Report shows sales distribution across different hours of the day.'**
  String get hourlySales_helpDescription;

  /// No description provided for @hourlySales_helpIncludes.
  ///
  /// In en, this message translates to:
  /// **'Includes'**
  String get hourlySales_helpIncludes;

  /// No description provided for @hourlySales_helpSalesPerHour.
  ///
  /// In en, this message translates to:
  /// **'Sales amount per hour'**
  String get hourlySales_helpSalesPerHour;

  /// No description provided for @hourlySales_helpTransactionPerHour.
  ///
  /// In en, this message translates to:
  /// **'Transaction count per hour'**
  String get hourlySales_helpTransactionPerHour;

  /// No description provided for @hourlySales_helpPeakHours.
  ///
  /// In en, this message translates to:
  /// **'Peak hours identification'**
  String get hourlySales_helpPeakHours;

  /// No description provided for @hourlySales_helpNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get hourlySales_helpNote;

  /// No description provided for @hourlySales_helpNoteDescription.
  ///
  /// In en, this message translates to:
  /// **'Helps optimize staffing and operations based on busy hours.'**
  String get hourlySales_helpNoteDescription;

  /// No description provided for @stockHistory_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Stock History?'**
  String get stockHistory_helpTitle;

  /// No description provided for @stockHistory_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Stock History shows all stock movements (in and out) for your products.'**
  String get stockHistory_helpDescription;

  /// No description provided for @stockHistory_helpStockIn.
  ///
  /// In en, this message translates to:
  /// **'Stock In'**
  String get stockHistory_helpStockIn;

  /// No description provided for @stockHistory_helpPurchaseReceived.
  ///
  /// In en, this message translates to:
  /// **'Purchase orders received'**
  String get stockHistory_helpPurchaseReceived;

  /// No description provided for @stockHistory_helpStockAdjustmentIn.
  ///
  /// In en, this message translates to:
  /// **'Stock adjustments (additions)'**
  String get stockHistory_helpStockAdjustmentIn;

  /// No description provided for @stockHistory_helpInitialStock.
  ///
  /// In en, this message translates to:
  /// **'Initial stock entries'**
  String get stockHistory_helpInitialStock;

  /// No description provided for @stockHistory_helpStockOut.
  ///
  /// In en, this message translates to:
  /// **'Stock Out'**
  String get stockHistory_helpStockOut;

  /// No description provided for @stockHistory_helpSalesDeduction.
  ///
  /// In en, this message translates to:
  /// **'Sales deductions'**
  String get stockHistory_helpSalesDeduction;

  /// No description provided for @stockHistory_helpStockAdjustmentOut.
  ///
  /// In en, this message translates to:
  /// **'Stock adjustments (deductions)'**
  String get stockHistory_helpStockAdjustmentOut;

  /// No description provided for @stockAdjustment_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Stock Adjustment Report?'**
  String get stockAdjustment_helpTitle;

  /// No description provided for @stockAdjustment_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Stock Adjustment Report shows all inventory adjustments due to damage, expiry, theft, or corrections.'**
  String get stockAdjustment_helpDescription;

  /// No description provided for @stockAdjustment_helpIncludes.
  ///
  /// In en, this message translates to:
  /// **'Includes'**
  String get stockAdjustment_helpIncludes;

  /// No description provided for @stockAdjustment_helpDamaged.
  ///
  /// In en, this message translates to:
  /// **'Damaged products'**
  String get stockAdjustment_helpDamaged;

  /// No description provided for @stockAdjustment_helpExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired products'**
  String get stockAdjustment_helpExpired;

  /// No description provided for @stockAdjustment_helpLost.
  ///
  /// In en, this message translates to:
  /// **'Lost or stolen products'**
  String get stockAdjustment_helpLost;

  /// No description provided for @stockAdjustment_helpCorrection.
  ///
  /// In en, this message translates to:
  /// **'Stock count corrections'**
  String get stockAdjustment_helpCorrection;

  /// No description provided for @stockAdjustment_helpNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get stockAdjustment_helpNote;

  /// No description provided for @stockAdjustment_helpNoteDescription.
  ///
  /// In en, this message translates to:
  /// **'Loss value is calculated using purchase price of adjusted items.'**
  String get stockAdjustment_helpNoteDescription;

  /// No description provided for @productSalesProfit_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Product Sales & Profit?'**
  String get productSalesProfit_helpTitle;

  /// No description provided for @productSalesProfit_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Product Sales & Profit shows detailed revenue and profit breakdown for each product sold.'**
  String get productSalesProfit_helpDescription;

  /// No description provided for @productSalesProfit_helpIncludes.
  ///
  /// In en, this message translates to:
  /// **'Includes'**
  String get productSalesProfit_helpIncludes;

  /// No description provided for @productSalesProfit_helpSalesRevenue.
  ///
  /// In en, this message translates to:
  /// **'Sales revenue per product'**
  String get productSalesProfit_helpSalesRevenue;

  /// No description provided for @productSalesProfit_helpCOGS.
  ///
  /// In en, this message translates to:
  /// **'Cost of goods sold'**
  String get productSalesProfit_helpCOGS;

  /// No description provided for @productSalesProfit_helpGrossProfit.
  ///
  /// In en, this message translates to:
  /// **'Gross profit per product'**
  String get productSalesProfit_helpGrossProfit;

  /// No description provided for @productSalesProfit_helpProfitMargin.
  ///
  /// In en, this message translates to:
  /// **'Profit margin percentage'**
  String get productSalesProfit_helpProfitMargin;

  /// No description provided for @paymentMethod_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Payment Method Report?'**
  String get paymentMethod_helpTitle;

  /// No description provided for @paymentMethod_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Payment Method Report shows sales breakdown by payment method used.'**
  String get paymentMethod_helpDescription;

  /// No description provided for @paymentMethod_helpIncludes.
  ///
  /// In en, this message translates to:
  /// **'Includes'**
  String get paymentMethod_helpIncludes;

  /// No description provided for @paymentMethod_helpCash.
  ///
  /// In en, this message translates to:
  /// **'Cash payments'**
  String get paymentMethod_helpCash;

  /// No description provided for @paymentMethod_helpQRIS.
  ///
  /// In en, this message translates to:
  /// **'QRIS/e-wallet payments'**
  String get paymentMethod_helpQRIS;

  /// No description provided for @paymentMethod_helpBankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank transfer payments'**
  String get paymentMethod_helpBankTransfer;

  /// No description provided for @paymentMethod_helpCredit.
  ///
  /// In en, this message translates to:
  /// **'Credit sales'**
  String get paymentMethod_helpCredit;

  /// No description provided for @paymentMethod_helpNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get paymentMethod_helpNote;

  /// No description provided for @paymentMethod_helpNoteDescription.
  ///
  /// In en, this message translates to:
  /// **'Helps understand customer payment preferences.'**
  String get paymentMethod_helpNoteDescription;

  /// No description provided for @purchaseOrderReport_helpTitle.
  ///
  /// In en, this message translates to:
  /// **'What is Purchase Order Report?'**
  String get purchaseOrderReport_helpTitle;

  /// No description provided for @purchaseOrderReport_helpDescription.
  ///
  /// In en, this message translates to:
  /// **'Purchase Order Report shows all purchase orders and their status.'**
  String get purchaseOrderReport_helpDescription;

  /// No description provided for @purchaseOrderReport_helpIncludes.
  ///
  /// In en, this message translates to:
  /// **'Includes'**
  String get purchaseOrderReport_helpIncludes;

  /// No description provided for @purchaseOrderReport_helpAllPO.
  ///
  /// In en, this message translates to:
  /// **'All purchase orders created'**
  String get purchaseOrderReport_helpAllPO;

  /// No description provided for @purchaseOrderReport_helpPendingPO.
  ///
  /// In en, this message translates to:
  /// **'Pending orders awaiting delivery'**
  String get purchaseOrderReport_helpPendingPO;

  /// No description provided for @purchaseOrderReport_helpReceivedPO.
  ///
  /// In en, this message translates to:
  /// **'Received and completed orders'**
  String get purchaseOrderReport_helpReceivedPO;

  /// No description provided for @purchaseOrderReport_helpPaymentStatus.
  ///
  /// In en, this message translates to:
  /// **'Payment status (paid/unpaid)'**
  String get purchaseOrderReport_helpPaymentStatus;

  /// No description provided for @purchaseOrderReport_helpNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get purchaseOrderReport_helpNote;

  /// No description provided for @purchaseOrderReport_helpNoteDescription.
  ///
  /// In en, this message translates to:
  /// **'Tracks inventory purchases from suppliers.'**
  String get purchaseOrderReport_helpNoteDescription;

  /// No description provided for @stockAdjustment_infoTitle.
  ///
  /// In en, this message translates to:
  /// **'Stock Adjustment Impact'**
  String get stockAdjustment_infoTitle;

  /// No description provided for @stockAdjustment_infoDescription.
  ///
  /// In en, this message translates to:
  /// **'Stock adjustment affects the weighted average purchase price calculation when receiving new Purchase Orders.'**
  String get stockAdjustment_infoDescription;

  /// No description provided for @stockAdjustment_infoHowItWorks.
  ///
  /// In en, this message translates to:
  /// **'How Weighted Average Works'**
  String get stockAdjustment_infoHowItWorks;

  /// No description provided for @stockAdjustment_infoFormula.
  ///
  /// In en, this message translates to:
  /// **'Formula: (Current Stock × Current Price + New Qty × New Price) ÷ Total Stock'**
  String get stockAdjustment_infoFormula;

  /// No description provided for @stockAdjustment_infoSimulationTitle.
  ///
  /// In en, this message translates to:
  /// **'Simulation Example'**
  String get stockAdjustment_infoSimulationTitle;

  /// No description provided for @stockAdjustment_infoBaseCase.
  ///
  /// In en, this message translates to:
  /// **'Base: 10 pcs @ Rp 5,000'**
  String get stockAdjustment_infoBaseCase;

  /// No description provided for @stockAdjustment_infoPurchase.
  ///
  /// In en, this message translates to:
  /// **'New PO: 10 pcs @ Rp 6,000'**
  String get stockAdjustment_infoPurchase;

  /// No description provided for @stockAdjustment_infoNoAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Without adjustment:'**
  String get stockAdjustment_infoNoAdjustment;

  /// No description provided for @stockAdjustment_infoNoAdjustmentCalc.
  ///
  /// In en, this message translates to:
  /// **'(10×5000 + 10×6000) ÷ 20 = Rp 5,500'**
  String get stockAdjustment_infoNoAdjustmentCalc;

  /// No description provided for @stockAdjustment_infoAfterReduce.
  ///
  /// In en, this message translates to:
  /// **'After -5 adjustment:'**
  String get stockAdjustment_infoAfterReduce;

  /// No description provided for @stockAdjustment_infoAfterReduceCalc.
  ///
  /// In en, this message translates to:
  /// **'(5×5000 + 10×6000) ÷ 15 = Rp 5,667'**
  String get stockAdjustment_infoAfterReduceCalc;

  /// No description provided for @stockAdjustment_infoAfterIncrease.
  ///
  /// In en, this message translates to:
  /// **'After +5 adjustment:'**
  String get stockAdjustment_infoAfterIncrease;

  /// No description provided for @stockAdjustment_infoAfterIncreaseCalc.
  ///
  /// In en, this message translates to:
  /// **'(15×5000 + 10×6000) ÷ 25 = Rp 5,400'**
  String get stockAdjustment_infoAfterIncreaseCalc;

  /// No description provided for @stockAdjustment_infoConclusion.
  ///
  /// In en, this message translates to:
  /// **'Key Insight'**
  String get stockAdjustment_infoConclusion;

  /// No description provided for @stockAdjustment_infoConclusionDesc.
  ///
  /// In en, this message translates to:
  /// **'Lower stock = new PO price has more weight (higher avg). Higher stock = current price has more weight (lower avg).'**
  String get stockAdjustment_infoConclusionDesc;

  /// No description provided for @stockAdjustment_infoReportSafe.
  ///
  /// In en, this message translates to:
  /// **'Your reports are safe'**
  String get stockAdjustment_infoReportSafe;

  /// No description provided for @stockAdjustment_infoReportSafeDesc.
  ///
  /// In en, this message translates to:
  /// **'Order items store purchase price at time of sale, so profit calculations remain accurate.'**
  String get stockAdjustment_infoReportSafeDesc;

  /// No description provided for @stockAdjustment_qtyIncrease.
  ///
  /// In en, this message translates to:
  /// **'+{qty} pcs'**
  String stockAdjustment_qtyIncrease(String qty);

  /// No description provided for @stockAdjustment_qtyDecrease.
  ///
  /// In en, this message translates to:
  /// **'-{qty} pcs'**
  String stockAdjustment_qtyDecrease(String qty);

  /// No description provided for @premiumGate_title.
  ///
  /// In en, this message translates to:
  /// **'Premium Feature'**
  String get premiumGate_title;

  /// No description provided for @premiumGate_message.
  ///
  /// In en, this message translates to:
  /// **'This feature is only available for Premium users. Upgrade to Premium to unlock all features.'**
  String get premiumGate_message;

  /// No description provided for @premiumGate_upgrade.
  ///
  /// In en, this message translates to:
  /// **'Upgrade'**
  String get premiumGate_upgrade;

  /// No description provided for @orderLimit_title.
  ///
  /// In en, this message translates to:
  /// **'Order Limit Reached'**
  String get orderLimit_title;

  /// No description provided for @orderLimit_message.
  ///
  /// In en, this message translates to:
  /// **'Free mode is limited to {maxOrders} orders. You currently have {currentOrders} orders. Upgrade to Premium for unlimited orders.'**
  String orderLimit_message(int maxOrders, int currentOrders);

  /// No description provided for @receipt_item.
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get receipt_item;

  /// No description provided for @receipt_qty.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get receipt_qty;

  /// No description provided for @receipt_subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get receipt_subtotal;

  /// No description provided for @receipt_total.
  ///
  /// In en, this message translates to:
  /// **'TOTAL'**
  String get receipt_total;

  /// No description provided for @receipt_paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get receipt_paid;

  /// No description provided for @receipt_change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get receipt_change;

  /// No description provided for @receipt_method.
  ///
  /// In en, this message translates to:
  /// **'Method'**
  String get receipt_method;

  /// No description provided for @receipt_note.
  ///
  /// In en, this message translates to:
  /// **'Note: {note}'**
  String receipt_note(String note);

  /// No description provided for @receipt_notePrefix.
  ///
  /// In en, this message translates to:
  /// **'Note:'**
  String get receipt_notePrefix;

  /// No description provided for @receipt_table.
  ///
  /// In en, this message translates to:
  /// **'TABLE {tableNumber}'**
  String receipt_table(String tableNumber);

  /// No description provided for @receipt_customer.
  ///
  /// In en, this message translates to:
  /// **'Customer: {customerName}'**
  String receipt_customer(String customerName);

  /// No description provided for @receipt_tax.
  ///
  /// In en, this message translates to:
  /// **'Tax {taxRate}%'**
  String receipt_tax(String taxRate);

  /// No description provided for @receipt_discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get receipt_discount;

  /// No description provided for @receipt_discountWithCode.
  ///
  /// In en, this message translates to:
  /// **'Discount ({code})'**
  String receipt_discountWithCode(String code);

  /// No description provided for @receipt_cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get receipt_cash;

  /// No description provided for @receipt_purchaseOrder.
  ///
  /// In en, this message translates to:
  /// **'PURCHASE ORDER'**
  String get receipt_purchaseOrder;

  /// No description provided for @receipt_date.
  ///
  /// In en, this message translates to:
  /// **'Date: {date}'**
  String receipt_date(String date);

  /// No description provided for @receipt_supplier.
  ///
  /// In en, this message translates to:
  /// **'Supplier: {supplierName}'**
  String receipt_supplier(String supplierName);

  /// No description provided for @receipt_status.
  ///
  /// In en, this message translates to:
  /// **'Status: {status}'**
  String receipt_status(String status);

  /// No description provided for @receipt_payment.
  ///
  /// In en, this message translates to:
  /// **'Payment: {paymentType}'**
  String receipt_payment(String paymentType);

  /// No description provided for @receipt_creditDebt.
  ///
  /// In en, this message translates to:
  /// **'Credit (Debt)'**
  String get receipt_creditDebt;

  /// No description provided for @receipt_thankYou.
  ///
  /// In en, this message translates to:
  /// **'Thank You'**
  String get receipt_thankYou;

  /// No description provided for @receipt_order.
  ///
  /// In en, this message translates to:
  /// **'ORDER'**
  String get receipt_order;

  /// No description provided for @receipt_kitchenOrder.
  ///
  /// In en, this message translates to:
  /// **'KITCHEN ORDER'**
  String get receipt_kitchenOrder;

  /// No description provided for @receipt_waiterOrder.
  ///
  /// In en, this message translates to:
  /// **'WAITER ORDER'**
  String get receipt_waiterOrder;

  /// No description provided for @receipt_open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get receipt_open;

  /// No description provided for @receipt_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get receipt_close;

  /// No description provided for @profile_bindGoogle.
  ///
  /// In en, this message translates to:
  /// **'Link Google Account'**
  String get profile_bindGoogle;

  /// No description provided for @profile_bindGoogleDesc.
  ///
  /// In en, this message translates to:
  /// **'Link your Google account for cloud backup'**
  String get profile_bindGoogleDesc;

  /// No description provided for @profile_googleBound.
  ///
  /// In en, this message translates to:
  /// **'Google Account Linked'**
  String get profile_googleBound;

  /// No description provided for @profile_googleBoundDesc.
  ///
  /// In en, this message translates to:
  /// **'Linked to {email}'**
  String profile_googleBoundDesc(String email);

  /// No description provided for @profile_unlinkGoogle.
  ///
  /// In en, this message translates to:
  /// **'Unlink Google Account'**
  String get profile_unlinkGoogle;

  /// No description provided for @profile_unlinkGoogleConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to unlink your Google account? You will lose access to cloud backups.'**
  String get profile_unlinkGoogleConfirm;

  /// No description provided for @profile_unlinkGoogleSuccess.
  ///
  /// In en, this message translates to:
  /// **'Google account unlinked'**
  String get profile_unlinkGoogleSuccess;

  /// No description provided for @profile_bindGoogleSuccess.
  ///
  /// In en, this message translates to:
  /// **'Google account linked successfully!'**
  String get profile_bindGoogleSuccess;

  /// No description provided for @profile_bindGoogleFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to link Google account: {error}'**
  String profile_bindGoogleFailed(String error);

  /// No description provided for @cloudBackup_googleRequired.
  ///
  /// In en, this message translates to:
  /// **'Google Account Required'**
  String get cloudBackup_googleRequired;

  /// No description provided for @cloudBackup_googleRequiredDesc.
  ///
  /// In en, this message translates to:
  /// **'Please link your Google account first to use cloud backup.'**
  String get cloudBackup_googleRequiredDesc;

  /// No description provided for @cloudBackup_linkNow.
  ///
  /// In en, this message translates to:
  /// **'Link Now'**
  String get cloudBackup_linkNow;

  /// No description provided for @cloudBackup_savingToCloud.
  ///
  /// In en, this message translates to:
  /// **'Saving backup info to cloud...'**
  String get cloudBackup_savingToCloud;

  /// No description provided for @firstTimeAuth_title.
  ///
  /// In en, this message translates to:
  /// **'Secure Your Data'**
  String get firstTimeAuth_title;

  /// No description provided for @firstTimeAuth_description.
  ///
  /// In en, this message translates to:
  /// **'Sign in with your Google account to keep your data safe. This is required so your data can be easily restored if your device is lost or the app is uninstalled.'**
  String get firstTimeAuth_description;

  /// No description provided for @firstTimeAuth_benefit1.
  ///
  /// In en, this message translates to:
  /// **'Automatic cloud backup of your data'**
  String get firstTimeAuth_benefit1;

  /// No description provided for @firstTimeAuth_benefit2.
  ///
  /// In en, this message translates to:
  /// **'Easy restore when switching devices or reinstalling'**
  String get firstTimeAuth_benefit2;

  /// No description provided for @firstTimeAuth_benefit3.
  ///
  /// In en, this message translates to:
  /// **'Sync subscription across devices'**
  String get firstTimeAuth_benefit3;

  /// No description provided for @firstTimeAuth_signInGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get firstTimeAuth_signInGoogle;

  /// No description provided for @firstTimeAuth_footerNote.
  ///
  /// In en, this message translates to:
  /// **'Your Google account is only used for backup and data protection. We do not access any other data.'**
  String get firstTimeAuth_footerNote;

  /// No description provided for @firstTimeAuth_success.
  ///
  /// In en, this message translates to:
  /// **'Google account linked successfully!'**
  String get firstTimeAuth_success;

  /// No description provided for @firstTimeAuth_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to sign in: {error}'**
  String firstTimeAuth_failed(String error);

  /// No description provided for @cloudBackup_syncFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to sync backup to cloud: {error}'**
  String cloudBackup_syncFailed(String error);
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return SEn();
    case 'id':
      return SId();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
