import 'package:ai_la_trieu_phu/common/constants/color.dart';
import 'package:ai_la_trieu_phu/common/constants/string.dart';
import 'package:ai_la_trieu_phu/common/constants/text_style.dart';
import 'package:ai_la_trieu_phu/common/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class PopupCall {
  static void showMsgDialog(BuildContext context, String answer) {
    showDialog(
        context: context,
        builder: (context) {
          return CallWidget(
            answer: answer,
          );
        });
  }
}

class CallWidget extends StatefulWidget {
  final String answer;

  const CallWidget({Key key, this.answer}) : super(key: key);
  @override
  _CallWidgetState createState() => _CallWidgetState();
}

class _CallWidgetState extends State<CallWidget> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) => {
          setState(() {
            isShow = true;
          }),
        });
    String content;
    if (widget.answer == null || widget.answer.isEmpty) {
      content = AppString.CALL_FAIL;
    } else {
      content = 'The correct answer is: ${widget.answer} ';
    }
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(65)),
              child: SizedBox(
                height: ScreenUtil().setHeight(250),
                width: ScreenUtil().setWidth(400),
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
                  Visibility(
                    visible: !isShow,
                    child: Text(
                      AppString.CALLING,
                      style: AppTextTheme.textStyleLarge
                          .apply(color: Colors.black54),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  Visibility(
                    visible: isShow,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil.paddingHorizontal),
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style: AppTextTheme.textStyleVictory
                            .apply(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  isShow
                      ? Visibility(
                          visible: widget.answer != null &&
                              widget.answer.isNotEmpty &&
                              isShow,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(PopupCall),
                            child: Container(
                              alignment: Alignment.center,
                              height: ScreenUtil().setHeight(60),
                              width: ScreenUtil().setWidth(60),
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
                                'Ok',
                                textAlign: TextAlign.center,
                                style: AppTextTheme.styleButtonNormal,
                              ),
                            ),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.asset(
                            IMAGE_PATH + 'loading.gif',
                            height: 50,
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
