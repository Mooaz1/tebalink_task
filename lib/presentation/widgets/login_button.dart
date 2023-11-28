import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tebalink_task/core/text_style.dart';



// ignore: must_be_immutable
class LoginButton extends StatelessWidget {
  void Function()? onPress;
  String text;
  Widget? icon;
  double? borderRadius;
  double? fontSize;
  double? height;
  double? width;
  Color? backgroundColor;
  Color? textColor;
  bool hasBorder;

  LoginButton({
    Key? key,
    required this.onPress,
    required this.text,
    this.icon,
    this.borderRadius,
    this.fontSize,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ,
          padding: EdgeInsets.symmetric(vertical: height ?? 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
          )),
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            SizedBox(
              width: 15.w,
              height: 15.h,
              child: icon!,
            ),
            SizedBox(
              width: 5.w,
            ),
          ],
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: AppTextStyle.title().copyWith(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: fontSize ?? 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}