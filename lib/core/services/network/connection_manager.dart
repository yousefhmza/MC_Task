import 'package:connectivity_plus/connectivity_plus.dart';

import '../../resources/strings_manager.dart';
import '../../utils/alerts.dart';

class NetworkConnectionManger {
  static Connectivity connectivity = Connectivity();

  static Future<bool> checkConnection({
    bool showErrorMessage = false,
    String? customErrorMessage,
  }) async {
    final ConnectivityResult connectivityResult =
        await connectivity.checkConnectivity();

    switch (connectivityResult) {
      case ConnectivityResult.wifi:
        return true;
      case ConnectivityResult.mobile:
        return true;
      case ConnectivityResult.none:
        if (showErrorMessage) {
          Alerts.showToast(
              customErrorMessage ?? AppStrings.noInternetConnection);
        }
        return false;
      default:
        return false;
    }
  }
}
