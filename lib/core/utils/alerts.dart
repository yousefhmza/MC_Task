import 'package:fluttertoast/fluttertoast.dart';

import '../extensions/num_extensions.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';

// Snack bars, toasts and dialogs
class Alerts {
  static void showToast(
    String message, [
    ToastGravity toastGravity = ToastGravity.BOTTOM,
  ]) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: toastGravity,
      timeInSecForIosWeb: 3,
      fontSize: FontSize.s16.sp,
      backgroundColor: AppColors.lightGrey,
      textColor: AppColors.black,
    );
  }
}
