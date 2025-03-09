import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketi/core/constants/colors.dart';


bool isLoggedInUser = false;
bool isCompletedOnboarding = false;

class SharedPrefKeys {
  static const String userToken = 'userToken';
  static const String onboarding = 'onboarding';
}

enum ToastColors { success, error, warning }

Color setToastColor(ToastColors color) {
  Color c;

  switch (color) {
    case ToastColors.error:
      c = Colors.red;
      break;
    case ToastColors.success:
      c = Colors.green;
      break;
    case ToastColors.warning:
      c = Colors.amber;
      break;
  }

  return c;
}

void showToast({required String text, required ToastColors color}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: setToastColor(color),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

Future<dynamic> loading(BuildContext context) {
  return showDialog(
    context: context,
    builder:
        (context) => Center(
          child: CircularProgressIndicator(color: AppColors.primaryColor),
        ),
  );
}
