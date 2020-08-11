import 'package:ai_la_trieu_phu/common/constants/color.dart';
import 'package:ai_la_trieu_phu/common/constants/string.dart';
import 'package:ai_la_trieu_phu/common/constants/text_style.dart';
import 'package:ai_la_trieu_phu/common/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class PopupLost {
  static bool showMsgDialog(BuildContext context, String money) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.transparent,
              content: Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(65)),
                      child: SizedBox(
                        height: ScreenUtil().setHeight(350),
                        width: ScreenUtil().setWidth(300),
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(ScreenUtil.radiusPage)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(300),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            IMAGE_PATH + 'guest.png',
                            height: ScreenUtil().setHeight(150),
                          ),
                          Text(
                            AppString.LOST,
                            style: AppTextTheme.textStyleLarge
                                .apply(color: Colors.black54),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(15),
                          ),
                          Text(
                            'Your money: \$$money',
                            style: AppTextTheme.textStyleVictory
                                .apply(color: Colors.blue),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(40),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.of(context).pop(PopupLost);
                              return true;
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: ScreenUtil().setWidth(150),
                              padding:
                                  EdgeInsets.all(ScreenUtil.paddingVertical),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      ScreenUtil.radiusButtonHlep),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: ColorConstants.colorsButtonBlue)),
                              child: Text(
                                "Play Again",
                                textAlign: TextAlign.center,
                                style: AppTextTheme.styleButtonNormal,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(15),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.of(context).pop(PopupLost);
                              return false;
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: ScreenUtil().setWidth(150),
                              padding:
                                  EdgeInsets.all(ScreenUtil.paddingVertical),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black87, width: 0.5),
                                borderRadius: BorderRadius.circular(
                                    ScreenUtil.radiusButtonHlep),
                              ),
                              child: Text(
                                "Exit",
                                textAlign: TextAlign.center,
                                style: AppTextTheme.styleButtonNormal
                                    .apply(color: Colors.black87),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
