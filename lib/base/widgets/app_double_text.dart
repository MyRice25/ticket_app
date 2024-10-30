import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';

class AppDoubleText extends StatefulWidget {
  const AppDoubleText({Key? key, required this.bigText, required this.smallText}) : super(key : key);
  final String bigText;
  final String smallText;

  @override
  State<AppDoubleText> createState() => _AppDoubleTextState();
}

class _AppDoubleTextState extends State<AppDoubleText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.bigText, style: AppStyles.headLineStyle3),
        InkWell(
          onTap: (){
            print("tapped");
          },
          child: Text(widget.smallText,style: AppStyles.textStyle.copyWith(
            color: AppStyles.primaryColor
          )),
        )
      ],
    );
  }
}