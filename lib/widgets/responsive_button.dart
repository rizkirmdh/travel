// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:travel/misc/colors.dart';
import 'package:travel/widgets/app_text_normal.dart';

class ResponsiveButton extends StatelessWidget {
  double? width;
  bool isResponsive;

  ResponsiveButton({
    Key? key,
    this.width = 120,
    this.isResponsive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(margin: EdgeInsets.only(left: 20),child: AppTextNormal(text: "Book Trip Now", color: Colors.white, size: 18))
                : Container(),
            Container(
                width: 40,
                height: 30,
                child: Image(
                  image: AssetImage('assets/icons/button-1.png'),
                )),
          ],
        ),
      ),
    );
    ;
  }
}
