import 'dart:io';
import 'package:ai_la_trieu_phu/common/constants/color.dart';
import 'package:ai_la_trieu_phu/common/constants/string.dart';
import 'package:ai_la_trieu_phu/common/constants/text_style.dart';
import 'package:ai_la_trieu_phu/common/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class CustomExit {
  static void showMsgDialog(BuildContext context, String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: SizedBox(
              height: ScreenUtil().setHeight(140),
              width: ScreenUtil().setWidth(300),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: ScreenUtil.paddingVertical),
                    child: Text(
                      msg,
                      style: AppTextTheme.textStyleLarge2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: ScreenUtil.paddingVertical15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            color: ColorConstants.colorGrey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: () => exit(0),
                            child: Text(
                              AppString.YES,
                              style: AppTextTheme.styleButtonNormal,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(35),
                        ),
                        Expanded(
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: ColorConstants.colorBlueLight,
                              onPressed: () {
                                Navigator.of(context).pop(CustomExit);
                              },
                              child: Text(AppString.NO,
                                  style: AppTextTheme.styleButtonSmall)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
