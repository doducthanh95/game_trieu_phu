import 'package:ai_la_trieu_phu/common/bases/base_widget.dart';
import 'package:ai_la_trieu_phu/common/bases/custom_dialog.dart';
import 'package:ai_la_trieu_phu/common/constants/color.dart';
import 'package:ai_la_trieu_phu/common/constants/string.dart';
import 'package:ai_la_trieu_phu/common/constants/text_style.dart';
import 'package:ai_la_trieu_phu/common/di/injector.dart';

import 'package:ai_la_trieu_phu/common/navigation/route_names.dart';
import 'package:ai_la_trieu_phu/common/utils/screen_utils.dart';

import 'package:ai_la_trieu_phu/feature/modules/splash/splash_view_model/splash_view_model.dart';

import 'package:ai_la_trieu_phu/feature/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Injector.resolve<SplashViewModel>().re();
    }
    if (state == AppLifecycleState.paused) {
      Injector.resolve<SplashViewModel>().pase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SplashViewModel>(
      createViewModel: Injector.resolve<SplashViewModel>(),
      builder: (context, model, child) {
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColorConstants.COLOR_BACKGROUND,
                image: DecorationImage(
                    image: AssetImage(IMAGE_PATH + 'background.png'),
                    fit: BoxFit.cover)),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil().setHeight(100),
                ),
                Image.asset(IMAGE_PATH + 'logo.png'),
                GestureDetector(
                  onTap: () {
                    model.dissPose();
                    Routes.instance.navigateTo(RouteName.game);
                  },
                  child: Container(
                    height: ScreenUtil().setHeight(60),
                    width: ScreenUtil().setWidth(300),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: ColorConstants.colorsButtonBlue)),
                    child: Text(
                      AppString.PLAY,
                      style: AppTextTheme.styleButtonLarge,
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(40),
                ),
                GestureDetector(
                  onTap: () {
                    CustomExit.showMsgDialog(
                        context, AppString.LAYBLE_POPUP_EXIT);
                  },
                  child: Container(
                    height: ScreenUtil().setHeight(60),
                    width: ScreenUtil().setWidth(300),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: ColorConstants.colorsButtonGrey)),
                    child: Text(
                      AppString.TEXT_EXIT,
                      style: AppTextTheme.styleButtonLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
