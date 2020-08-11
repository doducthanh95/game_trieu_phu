import 'package:ai_la_trieu_phu/common/bases/base_widget.dart';
import 'package:ai_la_trieu_phu/common/constants/string.dart';
import 'package:ai_la_trieu_phu/common/di/injector.dart';
import 'package:ai_la_trieu_phu/common/utils/screen_utils.dart';
import 'package:ai_la_trieu_phu/feature/modules/splash/splash_view_model/splash_view_model.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    var height = MediaQuery.of(context).size.height;
    var wight = MediaQuery.of(context).size.width;
    return BaseWidget<SplashViewModel>(
      createViewModel: Injector.resolve<SplashViewModel>(),
      builder: (context, model, child) {
        model.initData();

        model.playAudio(AUDIO_PATH + 'music.mp3');
        return Scaffold(
            backgroundColor: Colors.white,
            body: SizedBox(
              height: height,
              width: wight,
              child: Stack(children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.1),
                    child: Image.asset(
                      IMAGE_PATH + 'logo.png',
                      fit: BoxFit.cover,
                      height: height * 0.4,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: height * 0.6,
                    width: wight,
                    child: Image.asset(
                      IMAGE_PATH + 'image_splash.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ]),
            ));
      },
    );
  }
}
