import 'package:ai_la_trieu_phu/common/constants/color.dart';
import 'package:ai_la_trieu_phu/common/constants/string.dart';
import 'package:ai_la_trieu_phu/common/constants/text_style.dart';
import 'package:ai_la_trieu_phu/common/utils/screen_utils.dart';
import 'package:ai_la_trieu_phu/feature/modules/game/game_view/widget_help.dart';
import 'package:flutter/material.dart';

class PopupCall {
  static void showMsgDialog(BuildContext context, String answer) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(65)),
                  child: SizedBox(
                    height: ScreenUtil().setHeight(250),
                    width: ScreenUtil().setWidth(400),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(ScreenUtil.radiusPage),
                      ),
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
                        AppString.CALLING,
                        style: AppTextTheme.textStyleLarge
                            .apply(color: Colors.black54),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(15),
                      ),
                      Text(
                        'The correct answer is: \$$answer ',
                        textAlign: TextAlign.center,
                        style: AppTextTheme.textStyleVictory
                            .apply(color: Colors.blue),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setWidth(60),
                        padding: EdgeInsets.all(ScreenUtil.paddingVertical),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                ScreenUtil.radiusButtonHlep),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: ColorConstants.colorsButtonBlue)),
                        child: Text(
                          "A",
                          textAlign: TextAlign.center,
                          style: AppTextTheme.styleButtonNormal,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: ScreenUtil().setHeight(100)),
                        child: SizedBox(
                          height: ScreenUtil().setHeight(100),
                          width: ScreenUtil().setWidth(100),
                          child: ButtonHelp(
                            callBack: () {},
                            icons: Icons.phone,
                            listColors: ColorConstants.colorsButtonGrey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class PopUpcall extends StatelessWidget {
  final String answer;

  const PopUpcall({Key key, this.answer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(100)),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
              height: ScreenUtil().setHeight(300),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(ScreenUtil.radiusPage)),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    IMAGE_PATH + 'guest.png',
                    height: ScreenUtil().setHeight(150),
                  ),
                  Text(
                    AppString.CALLING,
                    style: AppTextTheme.textStyleLarge
                        .apply(color: Colors.black54),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  Text(
                    'The correct answer is: \$$answer ',
                    textAlign: TextAlign.center,
                    style:
                        AppTextTheme.textStyleVictory.apply(color: Colors.blue),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(60),
                    width: ScreenUtil().setWidth(60),
                    padding: EdgeInsets.all(ScreenUtil.paddingVertical),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil.radiusButtonHlep),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: ColorConstants.colorsButtonBlue)),
                    child: Text(
                      "A",
                      textAlign: TextAlign.center,
                      style: AppTextTheme.styleButtonNormal,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(150)),
                    child: SizedBox(
                      height: ScreenUtil().setHeight(100),
                      width: ScreenUtil().setWidth(100),
                      child: ButtonHelp(
                        callBack: () {
                          Navigator.of(context).pop(PopUpcall);
                        },
                        icons: Icons.phone,
                        listColors: ColorConstants.colorsButtonGrey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
