import 'package:ai_la_trieu_phu/common/constants/color.dart';

import 'package:ai_la_trieu_phu/common/utils/screen_utils.dart';
import 'package:ai_la_trieu_phu/common/widget/item_milestone.dart';
import 'package:ai_la_trieu_phu/feature/modules/game/game_view/widget_help.dart';
import 'package:flutter/material.dart';

class PopupMilestone {
  static void showMsgDialog(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ScreenUtil.radiusPage)),
            content: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ItemMilestone(
                        color: index >= 15
                            ? ColorConstants.colorMilestone
                            : ColorConstants.colorBlueLight,
                        textButton: '\$1.000.000',
                      ),
                      ItemMilestone(
                        color: index >= 14
                            ? ColorConstants.colorMilestone
                            : ColorConstants.colorGrey,
                        textButton: '\$750.000',
                      ),
                      ItemMilestone(
                        color: index >= 13
                            ? ColorConstants.colorMilestone
                            : ColorConstants.colorGrey,
                        textButton: '\$500.000',
                      ),
                      ItemMilestone(
                        color: index >= 12
                            ? ColorConstants.colorMilestone
                            : ColorConstants.colorGrey,
                        textButton: '\$250.000',
                      ),
                      ItemMilestone(
                        color: index >= 11
                            ? ColorConstants.colorMilestone
                            : ColorConstants.colorGrey,
                        textButton: '\$100.000',
                      ),
                      ItemMilestone(
                        color: index >= 10
                            ? ColorConstants.colorMilestone
                            : ColorConstants.colorBlueLight,
                        textButton: '\$50.000',
                      ),
                      ItemMilestone(
                        color: index >= 9
                            ? ColorConstants.colorMilestone
                            : ColorConstants.colorGrey,
                        textButton: '\$25.000',
                      ),
                      ItemMilestone(
                        color: index >= 8
                            ? ColorConstants.colorMilestone
                            : ColorConstants.colorGrey,
                        textButton: '\$17.000',
                      ),
                      ItemMilestone(
                        color: index >= 7
                            ? ColorConstants.colorMilestone
                            : ColorConstants.colorGrey,
                        textButton: '\$12.000',
                      ),
                      ItemMilestone(
                        color: index >= 6
                            ? ColorConstants.colorMilestone
                            : ColorConstants.colorGrey,
                        textButton: '\$8.000',
                      ),
                      ItemMilestone(
                        color: index >= 5
                            ? ColorConstants.colorMilestone
                            : ColorConstants.colorBlueLight,
                        textButton: '\$5.000',
                      ),
                      ItemMilestone(
                        color: index >= 4
                            ? ColorConstants.colorMilestone
                            : ColorConstants.colorGrey,
                        textButton: '\$3.000',
                      ),
                      ItemMilestone(
                        color: index >= 3
                            ? ColorConstants.colorMilestone
                            : ColorConstants.colorGrey,
                        textButton: '\$1.000',
                      ),
                      ItemMilestone(
                        color: index >= 2
                            ? ColorConstants.colorMilestone
                            : ColorConstants.colorGrey,
                        textButton: '\$500',
                      ),
                      ItemMilestone(
                        color: index >= 1
                            ? ColorConstants.colorMilestone
                            : ColorConstants.colorGrey,
                        textButton: '\$100',
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      ButtonHelp50(
                        assetIcon: 'back.png',
                        callBack: () {
                          Navigator.of(context).pop();
                        },
                        listColors: ColorConstants.colorsButtonGrey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
