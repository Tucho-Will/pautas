import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:oktoast/oktoast.dart';

enum NOTIFICATION_TYPE { primary, info, sucess, danger, warning }

class NotificationService {
  static Color _getColorForType(NOTIFICATION_TYPE type) {
    switch (type) {
      case NOTIFICATION_TYPE.info:
        return Colors.lightBlue;
        break;
      case NOTIFICATION_TYPE.sucess:
        return Colors.green;
        break;
      case NOTIFICATION_TYPE.danger:
        return Colors.red;
        break;
      case NOTIFICATION_TYPE.warning:
        return Colors.orange;
        break;
      case NOTIFICATION_TYPE.primary:
      default:
        return Colors.lightBlue;
    }
  }

  static showToast({
    @required String message,
    IconData iconData = MdiIcons.bellRing,
    ToastPosition position = ToastPosition.bottom,
    Color backGroundColor,
    Color textColor = Colors.white,
    double textFontSize = 14,
    NOTIFICATION_TYPE type = NOTIFICATION_TYPE.primary,
    int timeout = 3,
  }) {
    showToastWidget(
      GestureDetector(
        onTap: () => dismissAllToast(showAnim: true),
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backGroundColor ?? _getColorForType(type),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(
                iconData,
                color: textColor,
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: textFontSize,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      handleTouch: true,
      duration: Duration(seconds: timeout ?? 3),
      position: position,
    );
  }
}
