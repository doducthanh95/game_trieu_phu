import 'package:ai_la_trieu_phu/common/bases/base_widget.dart';

import 'package:ai_la_trieu_phu/common/widget/popup_victory.dart';
import 'package:ai_la_trieu_phu/common/constants/color.dart';
import 'package:ai_la_trieu_phu/common/constants/text_style.dart';
import 'package:ai_la_trieu_phu/common/di/injector.dart';
import 'package:ai_la_trieu_phu/common/constants/string.dart';
import 'package:ai_la_trieu_phu/common/enum/enum_constants.dart';
import 'package:ai_la_trieu_phu/common/utils/screen_utils.dart';
import 'package:ai_la_trieu_phu/common/widget/custom_dialog.dart';
import 'package:ai_la_trieu_phu/common/widget/popup_await.dart';
import 'package:ai_la_trieu_phu/common/widget/popup_call.dart';

import 'package:ai_la_trieu_phu/common/widget/popup_milestone.dart';
import 'package:ai_la_trieu_phu/feature/modules/game/game_view/game_widget/button_answer.dart';
import 'package:ai_la_trieu_phu/feature/modules/game/game_view/widget_help.dart';
import 'package:ai_la_trieu_phu/feature/modules/game/home_view_model/game_view_model.dart';
import 'package:ai_la_trieu_phu/feature/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/constants/string.dart';
import '../../../../../common/utils/screen_utils.dart';
import '../../../../../common/utils/screen_utils.dart';

class Game extends StatefulWidget {
  @override
  _Game createState() => _Game();
}

class _Game extends State<Game> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Injector.resolve<GameViewModel>().re();
    }
    if (state == AppLifecycleState.paused) {
      Injector.resolve<GameViewModel>().pase();
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BaseWidget<GameViewModel>(
        createViewModel: Injector.resolve<GameViewModel>()
          ..initQuestion()
          ..initAudio(),
        builder: (context, model, child) {
          // model.initAudio();
          int index = model.currentPosition + 1;
          return Scaffold(
            body: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(IMAGE_PATH + 'background.png'),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      key: ValueKey(model.percenList),
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: ScreenUtil().setHeight(40),
                        ),
                        Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 20),
                                alignment: Alignment.center,
                                width: ScreenUtil().setWidth(330),
                                padding: EdgeInsets.only(
                                    top: 30, left: 10, right: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      ScreenUtil.radiusPage),
                                ),
                                child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxHeight: height * 0.2,
                                        minHeight: height * 0.1),
                                    child: Text(
                                      'Question $index: ' +
                                              model.currentQuestion
                                                  .questionContent ??
                                          '',
                                      style: AppTextTheme.textStyleQuetion,
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  PopupMilestone.showMsgDialog(context, index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          ScreenUtil.radiusPage),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors:
                                              ColorConstants.colorsButtonBlue)),
                                  child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxWidth: width * 0.6,
                                          minWidth: width * 0.3),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          ' ${AppString.listMoney[index]}',
                                          style: AppTextTheme.textStyleSmall
                                              .apply(fontSizeDelta: 4),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            // Positioned(
                            //   top: 0,
                            //   right: ScreenUtil.paddingHorizontal,
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     height: 40,
                            //     width: 40,
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(30),
                            //         gradient: LinearGradient(
                            //             begin: Alignment.topCenter,
                            //             end: Alignment.bottomCenter,
                            //             colors: model.countDown > 5
                            //                 ? ColorConstants.colorsButtonBlue
                            //                 : ColorConstants.colorsButtonRed)),
                            //     // child:
                            //     //  StreamBuilder<Object>(
                            //     //     stream: model.streamCounDown,
                            //     //     builder: (context, snapshot) {
                            //     //       if (snapshot != null &&
                            //     //           snapshot.data == 0) {
                            //     //         Future.delayed(
                            //     //                 Duration(milliseconds: 500))
                            //     //             .then((value) => showDialog(
                            //     //                 context: context,
                            //     //                 builder:
                            //     //                     (BuildContext context) {
                            //     //                   return PopUpVictoryLost(
                            //     //                       imageLocal: 'guest.png',
                            //     //                       content: AppString
                            //     //                           .listMoney[index - 1],
                            //     //                       layble: AppString.LOST,
                            //     //                       callBack: (value) {
                            //     //                         if (value) {
                            //     //                           model.initQuestion(
                            //     //                               isReNew: true);
                            //     //                         } else {
                            //     //                           Future.delayed(Duration(
                            //     //                                   microseconds:
                            //     //                                       200))
                            //     //                               .then((value) =>
                            //     //                                   Routes
                            //     //                                       .instance
                            //     //                                       .pop());
                            //     //                         }
                            //     //                       });
                            //     //                 }));
                            //     //       }
                            //     // return
                            //     // Text(
                            //     //   '${snapshot.data ?? 30}',
                            //     //   style: AppTextTheme.textStyleSmall,
                            //     // );
                            //     // }
                            //     // ),
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(50),
                        ),
                        ButtonAnswer(
                          callBack: (value) {
                            model.setSelectedAnswer(value);
                          },
                          title: 'A',
                          content: model.currentQuestion.answerA ?? '',
                          listColors: ColorConstants.colorsButtonBlue,
                          enable: model.showList[0],
                          numberChecked: model.selectedAnswer,
                          numberOfButton: 0,
                          percentSelect: model.percenList[0],
                          state: model.getState(0),
                        ),
                        ButtonAnswer(
                          callBack: (value) {
                            model.setSelectedAnswer(value);
                          },
                          title: 'B',
                          content: model.currentQuestion.answerB ?? '',
                          listColors: ColorConstants.colorsButtonBlue,
                          enable: model.showList[1],
                          numberChecked: model.selectedAnswer,
                          numberOfButton: 1,
                          percentSelect: model.percenList[1],
                          state: model.getState(1),
                        ),
                        ButtonAnswer(
                          callBack: (value) {
                            model.setSelectedAnswer(value);
                          },
                          title: 'C',
                          content: model.currentQuestion.answerC ?? '',
                          listColors: ColorConstants.colorsButtonBlue,
                          enable: model.showList[2],
                          numberChecked: model.selectedAnswer,
                          numberOfButton: 2,
                          percentSelect: model.percenList[2],
                          state: model.getState(2),
                        ),
                        ButtonAnswer(
                          callBack: (value) {
                            model.setSelectedAnswer(value);
                          },
                          title: 'D',
                          content: model.currentQuestion.answerD ?? '',
                          listColors: ColorConstants.colorsButtonBlue,
                          enable: model.showList[3],
                          numberChecked: model.selectedAnswer,
                          numberOfButton: 3,
                          percentSelect: model.percenList[3],
                          state: model.getState(3),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(50)),
                        InkWell(
                          onTap: () async {
                            // check answer and call next
                            if (model.isAnswer) {
                              model.timer.cancel();
                              await model.checkAnswer();
                              switch (model.isCorrect) {
                                case IsCorrect.correct:
                                  model
                                      .playAudio(AUDIO_PATH + 'traloidung.ogg');
                                  CustomDialog.showRusult(context, () {
                                    model.callNext();
                                  });

                                  break;
                                case IsCorrect.notCorrect:
                                  model.playAudio(AUDIO_PATH + 'traloisai.ogg');
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return PopUpVictoryLost(
                                            imageLocal: 'guest.png',
                                            content:
                                                AppString.listMoney[index - 1],
                                            layble: AppString.LOST,
                                            callBack: (value) {
                                              if (value) {
                                                model.initQuestion(
                                                    isReNew: true);
                                              } else {
                                                Future.delayed(Duration(
                                                        microseconds: 200))
                                                    .then((value) => {
                                                          model.pauseAudio(),
                                                          Routes().pop()
                                                        });
                                              }
                                            });
                                      });

                                  break;
                                case IsCorrect.win:
                                  model
                                      .playAudio(AUDIO_PATH + 'chienthang.ogg');
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return PopUpVictoryLost(
                                            imageLocal: 'victory.png',
                                            content: AppString.MONEY_VICTORY,
                                            layble: AppString.VICTORY,
                                            callBack: (value) {
                                              if (value) {
                                                model.initQuestion(
                                                    isReNew: true);
                                              } else {
                                                Future.delayed(Duration(
                                                        microseconds: 200))
                                                    .then((value) => {
                                                          model.pauseAudio(),
                                                          Routes.instance.pop(),
                                                        });
                                              }
                                            });
                                      });

                                  break;
                                default:
                                  break;
                              }
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setHeight(12)),
                            alignment: Alignment.center,
                            width: width * 0.6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: model.isAnswer
                                        ? ColorConstants.colorsButtonGreen
                                        : ColorConstants.colorsButtonBlue)),
                            child: Text(
                              "Answer",
                              textAlign: TextAlign.center,
                              style: AppTextTheme.styleButtonLarge,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 15,
                      right: 15,
                      left: 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ButtonHelp(
                            callBack: () async {
                              PopupAwait.showMsgAwaitDialog(
                                  context, 'Pending Board Comments');
                              Future.delayed(Duration(milliseconds: 2200))
                                  .then((value) => {
                                        model.playAudio(
                                            AUDIO_PATH + 'hoiykien.ogg'),
                                        model.everyHelp(),
                                      });
                            },
                            icons: Icons.group,
                            listColors: ColorConstants.colorsButtonHlep,
                            enable: model.isEveryHelp,
                          ),
                          ButtonHelp(
                            callBack: () {
                              /// check data result show popup
                              final result = model.callFriend();
                              if (result != null) {
                                PopupCall.showMsgDialog(context, result);
                                model.playAudio(AUDIO_PATH + 'call.mp3');
                                // Future.delayed(Duration(milliseconds: 9000))
                                //     .then((value) => {model.dissPose()});
                              }
                            },
                            icons: Icons.phone,
                            listColors: ColorConstants.colorsButtonHlep,
                            enable: model.isCallFriend,
                          ),
                          ButtonHelp50(
                            assetIcon: '5050.png',
                            callBack: () async {
                              PopupAwait.showMsgAwaitDialog(context,
                                  'Waiting for the system to remove two false approaches');
                              Future.delayed(Duration(milliseconds: 2200))
                                  .then((value) => {
                                        model
                                            .playAudio(AUDIO_PATH + '5050.ogg'),
                                        model.removeHelper(),
                                      });
                            },
                            listColors: ColorConstants.colorsButtonHlep,
                            enable: model.isRemoveHelper,
                          ),
                          ButtonHelp50(
                            assetIcon: 'back.png',
                            callBack: () {
                              model.pauseAudio();
                              CustomDialog.showMsgDialog(
                                  context, 'Are you sure you want to exit ?');
                            },
                            listColors: ColorConstants.colorsButtonGrey,
                            enable: true,
                          ),
                        ],
                      ))
                ],
              ),
            ),
          );
        });
  }
}
