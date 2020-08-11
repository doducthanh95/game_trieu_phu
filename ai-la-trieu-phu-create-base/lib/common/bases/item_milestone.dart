import 'package:ai_la_trieu_phu/common/constants/text_style.dart';
import 'package:ai_la_trieu_phu/common/utils/screen_utils.dart';

import 'package:flutter/material.dart';

class ItemMilestone extends StatelessWidget {
  final String textButton;

  final Color color;
  const ItemMilestone({Key key, this.textButton, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ScreenUtil.radiusPage)),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Center(
              child: Text(
                textButton,
                style: AppTextTheme.styleButtonSmall,
              ),
            ),
          ),
        ));
  }
}
