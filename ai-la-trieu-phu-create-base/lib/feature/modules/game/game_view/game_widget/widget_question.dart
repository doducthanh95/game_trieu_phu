import 'package:ai_la_trieu_phu/common/constants/color.dart';
import 'package:ai_la_trieu_phu/common/constants/text_style.dart';
import 'package:ai_la_trieu_phu/common/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class WidgetQuestion extends StatelessWidget {
  final String textmoney;
  final String contentQuestion;

  const WidgetQuestion({Key key, this.textmoney, this.contentQuestion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            width: ScreenUtil().setWidth(350),
            padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
            ),
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: ScreenUtil().setHeight(200),
                    minHeight: ScreenUtil().setHeight(100)),
                child: Text(
                  contentQuestion,
                  style: AppTextTheme.textStyleQuetion,
                  textAlign: TextAlign.center,
                )),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: ScreenUtil().setWidth(100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorConstants.colorBlueLight),
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: ScreenUtil().setWidth(100),
                    minWidth: ScreenUtil().setWidth(200)),
                child: Text(
                  textmoney,
                  style: AppTextTheme.textStyleSmall,
                  textAlign: TextAlign.center,
                )),
          ),
        ),
      ],
    );
  }
}
