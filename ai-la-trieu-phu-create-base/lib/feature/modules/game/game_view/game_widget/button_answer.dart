import 'package:ai_la_trieu_phu/common/constants/color.dart';
import 'package:ai_la_trieu_phu/common/constants/text_style.dart';
import 'package:ai_la_trieu_phu/common/utils/screen_utils.dart';
import 'package:flutter/material.dart';

import '../../../../../common/enum/enum_constants.dart';
import '../../../../../common/enum/enum_constants.dart';
import '../../../../../common/enum/enum_constants.dart';

class ButtonAnswer extends StatelessWidget {
  final Function(int value) callBack;
  final bool enable;
  final String title;
  final String content;
  final answerState state;
  final List<Color> listColors;
  final int numberOfButton;
  final int numberChecked;
  final int percentSelect;

  const ButtonAnswer(
      {Key key,
      this.title,
      this.content,
      this.listColors,
      this.callBack,
      this.enable,
      @required this.state,
      @required this.numberOfButton,
      @required this.numberChecked,
      @required this.percentSelect})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setWidth(55),
      width: ScreenUtil().setWidth(330),
      child: GestureDetector(
        onTap: () {
          enable ? callBack(numberOfButton) : null;
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 70, minHeight: 45),
          child: Card(
            color: numberChecked == numberOfButton
                ? ColorConstants.colorBlueLight
                : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                AnimatedContainer(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(5),
                  duration: Duration(seconds: 1),
                  width: percentSelect == 0
                      ? 0
                      : ScreenUtil().setWidth(280) * (percentSelect + 15) / 100,
                  decoration: BoxDecoration(
                      // color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: numberChecked == numberOfButton
                              ? ColorConstants.colorsButtonGreen
                              : listColors)),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: state == answerState.none
                        ? Colors.transparent
                        : state == answerState.correct
                            ? Colors.green
                            : Colors.red,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.transparent,
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 7, right: 5),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: numberChecked == numberOfButton
                                    ? ColorConstants.colorsButtonGreen
                                    : listColors)),
                        child: Text(
                          title,
                          style: AppTextTheme.textStyleSmall,
                        ),
                      ),
                      Expanded(
                          child: Visibility(
                              visible: enable,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text('$content ',
                                        style: AppTextTheme.textStyleNormal),
                                  ),
                                  Visibility(
                                    visible: percentSelect > 0,
                                    child: Text('$percentSelect%  ',
                                        style: AppTextTheme.textStyleNormal),
                                  ),
                                ],
                              )))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
