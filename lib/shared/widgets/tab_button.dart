import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabButton extends StatelessWidget {
  const TabButton({super.key, required this.buttonText, required this.buttonSelected, required this.onTap});

  final String buttonText;
  final bool buttonSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 164.w,
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
           color: buttonSelected ? Color(0xFF055DB4) : Color(0xFF485D77) ,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Color(0xFF1E242A)),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF364865),
                offset: Offset(2, 4),
                blurRadius: 0,
                spreadRadius: -2,
              ),
            ]),
        child: Center(
          child: StrokeText(
            text: buttonText,
            textStyle: TextStyle(
              color: buttonSelected ? Color(0xFFFFFAD3) : Color(0xFFD5D5D5),
              fontSize: 18.sp,
              fontWeight: FontWeight.w900,
            ),
            strokeColor: Color(0xFF272D39),
            strokeWidth: 4,
          ),
        ),
      ),
    );
  }
}