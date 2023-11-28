import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/text_style.dart';


// ignore: must_be_immutable
class LoginScreenForm extends StatelessWidget {
   LoginScreenForm(
      {super.key,
      required this.hintText,
      required this.validator,
     
      required this.prefixIcon,
      required this.controller});
  final String hintText;
  final String? Function(String?)? validator;
 TextEditingController? controller;
  Widget? prefixIcon;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: TextFormField(
         keyboardType: TextInputType.name,
         controller: controller,
        validator: validator,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10.sp)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.sp)),
            filled: true,
            fillColor: Colors.white,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.sp)),
            hintText: hintText,
            prefixIcon: prefixIcon,
            hintStyle: AppTextStyle.subTitle().copyWith(color: Colors.grey)),
      ),
    );
  }
}