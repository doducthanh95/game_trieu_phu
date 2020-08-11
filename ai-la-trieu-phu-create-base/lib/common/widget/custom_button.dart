import 'package:ai_la_trieu_phu/common/constants/text_style.dart';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final Function callBack;
  final double width;
  final List<Color> listcolor;
  const CustomButton(
      {Key key, this.textButton, this.callBack, this.width, this.listcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return GestureDetector(
      onTap: callBack,
      child: Container(
        height: height * 0.1,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: listcolor)),
        child: Text(
          textButton,
          style: AppTextTheme.textStyleLarge,
        ),
      ),
    );
  }
}
