import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/constants/app_route_path.dart';
import 'package:marketi/core/constants/colors.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/helper/extensions.dart';
import 'package:marketi/core/widgets/confirm_dialog.dart';
import 'package:marketi/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Commons {
  static void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder:
          (BuildContext context) => CupertinoAlertDialog(
            title: Text(
              message,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Ok"),
              ),
            ],
          ),
    );
  }

  static void showToast({
    required String message,
    Color? color,
    ToastGravity? gravity,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: color ?? AppColors.primaryColor,
    );
  }

  static Future<void> showLogoutDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder:
          (context) => ConfirmationDialog(
            alertMsg: 'Are you sure you want to logout',
            onTapConfirm: () async {
              getIt<AuthCubit>().logout();
              context.pop();
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(AppRoutePaths.login, (route) => false);
            },
          ),
    );
  }

  // static Future<void> openUrl(String urlLink) async {
  //   final Uri url = Uri.parse(urlLink);
  //   if (!await launchUrl(url)) {
  //     throw 'Could not launch $url';
  //   }
  // }

  static dynamic decodeJson(Response<dynamic> response) {
    var responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }
}
