import 'package:ai_la_trieu_phu/common/constants/color.dart';
import 'package:ai_la_trieu_phu/common/constants/text_style.dart';
import 'package:ai_la_trieu_phu/common/navigation/route_names.dart';
import 'package:ai_la_trieu_phu/common/utils/screen_utils.dart';
import 'package:ai_la_trieu_phu/feature/routes.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  static void showMsgDialog(BuildContext context, String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ScreenUtil.radiusPage),
            ),
            content: Container(
              padding: EdgeInsets.only(top: ScreenUtil.paddingVertical),
              alignment: Alignment.center,
              height: ScreenUtil().setHeight(140),
              width: ScreenUtil().setWidth(400),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      msg,
                      style: AppTextTheme.textStyleLarge2
                          .apply(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                            color: ColorConstants.colorGrey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: () {
                              Routes.instance.navigateTo(RouteName.home);
                            },
                            child: Text(
                              "Yes",
                              style: AppTextTheme.styleButtonSmall,
                            )),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(30),
                      ),
                      Expanded(
                        child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: ColorConstants.colorBlueLight,
                            onPressed: () {
                              Routes.instance.pop();
                            },
                            child: Text(
                              "No",
                              style: AppTextTheme.styleButtonSmall,
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  static void showRusult(BuildContext context, Function callBack) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ScreenUtil.radiusPage),
            ),
            content: Container(
              padding: EdgeInsets.only(top: ScreenUtil.paddingVertical),
              alignment: Alignment.center,
              height: ScreenUtil().setHeight(140),
              width: ScreenUtil().setWidth(400),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Congratulations on choosing the correct answer !",
                      style: AppTextTheme.textStyleLarge
                          .apply(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: ColorConstants.colorBlueLight,
                      onPressed: () {
                        callBack();
                        Navigator.of(context).pop(CustomDialog);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Continue",
                          style: AppTextTheme.styleButtonSmall,
                        ),
                      )),
                ],
              ),
            ),
          );
        });
  }

  static void showPopup(BuildContext context, String content) {
    showDialog(
        context: context,
        builder: (context) {
          var height = ScreenUtil.screenHeight;
          var width = ScreenUtil.screenWidth;
          return AlertDialog(
            content: Container(
                alignment: Alignment.center,
                height: height * 0.3,
                width: width * 0.95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    Text(content),
                    InkWell(
                      onTap: () => Routes.instance.pop(),
                      child: Text('Exit'),
                    )
                  ],
                )),
          );
        });
  }
}
