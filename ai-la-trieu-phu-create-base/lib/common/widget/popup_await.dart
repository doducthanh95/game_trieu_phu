import 'package:ai_la_trieu_phu/common/constants/string.dart';
import 'package:ai_la_trieu_phu/common/constants/text_style.dart';
import 'package:ai_la_trieu_phu/common/utils/screen_utils.dart';
import 'package:ai_la_trieu_phu/feature/routes.dart';
import 'package:flutter/material.dart';

import '../utils/screen_utils.dart';

class PopupAwait {
  static void showMsgAwaitDialog(BuildContext context, String layble) {
    showDialog(
        context: context,
        builder: (context) {
          return CallWidget(
            layble: layble,
          );
        });
  }
}

class CallWidget extends StatefulWidget {
  final String layble;

  const CallWidget({Key key, this.layble}) : super(key: key);
  @override
  _CallWidgetState createState() => _CallWidgetState();
}

class _CallWidgetState extends State<CallWidget> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) => {
          Routes.instance.pop(),
        });
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
              width: ScreenUtil().setWidth(400),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      IMAGE_PATH + 'guest.png',
                      height: ScreenUtil().setHeight(150),
                    ),
                    Text(
                      widget.layble,
                      style: AppTextTheme.textStyleLarge
                          .apply(color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        IMAGE_PATH + 'loading.gif',
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
