import 'package:ai_la_trieu_phu/common/constants/string.dart';
import 'package:ai_la_trieu_phu/common/constants/text_style.dart';

import 'package:ai_la_trieu_phu/common/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class ButtonHelp extends StatelessWidget {
  final IconData icons;
  final Function callBack;
  final bool enable;
  final List<Color> listColors;

  const ButtonHelp(
      {Key key, this.icons, this.callBack, this.listColors, this.enable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        enable ? callBack() : null;
      },
      child: Container(
        height: ScreenUtil().setWidth(60),
        width: ScreenUtil().setWidth(60),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenUtil.radiusButtonHlep),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: enable ? listColors : [Colors.red, Colors.red])),
        child: Icon(
          icons,
          // size: ScreenUtil.iconSizeHelp,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ButtonHelp50 extends StatelessWidget {
  final String assetIcon;
  final Function callBack;
  final bool enable;
  final List<Color> listColors;

  const ButtonHelp50(
      {Key key,
      this.callBack,
      this.listColors,
      this.assetIcon,
      this.enable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          enable ? callBack() : null;
        },
        child: Container(
            height: ScreenUtil().setWidth(60),
            width: ScreenUtil().setWidth(60),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(ScreenUtil.radiusButtonHlep),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: enable ? listColors : [Colors.red, Colors.red])),
            child: Image.asset(
              IMAGE_PATH + assetIcon,
            )));
  }
}
