import 'package:ai_la_trieu_phu/common/constants/color.dart';
import 'package:ai_la_trieu_phu/common/constants/string.dart';
import 'package:ai_la_trieu_phu/common/constants/text_style.dart';
import 'package:ai_la_trieu_phu/common/navigation/route_names.dart';

import 'package:ai_la_trieu_phu/common/utils/screen_utils.dart';
import 'package:ai_la_trieu_phu/feature/routes.dart';

import 'package:flutter/material.dart';

class PopUpVictoryLost extends StatelessWidget {
  final String imageLocal, layble, content;
  final Function(bool value) callBack;
  const PopUpVictoryLost(
      {Key key, this.imageLocal, this.layble, this.content, this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(120)),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
              child: SizedBox(
                height: ScreenUtil().setHeight(350),
                width: ScreenUtil().setWidth(450),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(ScreenUtil.radiusPage)),
                ),
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(450),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(ScreenUtil.paddingAvartar),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(ScreenUtil.radiusAvatar)),
                    child: Image.asset(
                      IMAGE_PATH + imageLocal,
                      height: ScreenUtil().setHeight(120),
                    ),
                  ),
                  Text(
                    layble,
                    style: AppTextTheme.textStyleLarge
                        .apply(color: Colors.black54),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  Text(
                    content,
                    style: AppTextTheme.textStyleVictory
                        .apply(color: Colors.green),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(40),
                  ),
                  GestureDetector(
                    onTap: () {
                      callBack(true);
                      Routes.instance.pop();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: ScreenUtil().setWidth(150),
                      padding: EdgeInsets.all(ScreenUtil.paddingVertical),
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
                      callBack(false);
                      Routes.instance.pop();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: ScreenUtil().setWidth(150),
                      padding: EdgeInsets.all(ScreenUtil.paddingVertical),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87, width: 0.5),
                        borderRadius:
                            BorderRadius.circular(ScreenUtil.radiusButtonHlep),
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
      ),
    );
  }
}
