import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_bible_game/shared/constants/app_routes.dart';
import 'package:the_bible_game/shared/widgets/blue_button.dart';
import 'package:stroke_text/stroke_text.dart';
import '../constants/image_routes.dart';

class GameSummaryModal extends StatelessWidget {
  const GameSummaryModal(
      {super.key,
      required this.pointsEarned,
      required this.bonusPoint,
      required this.noOfCorrectionQuestions,
      required this.totalQuestions,
      required this.averageTimePerQuestion});

  final String pointsEarned;
  final String bonusPoint;
  final String noOfCorrectionQuestions;
  final String totalQuestions;
  final String averageTimePerQuestion;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      insetAnimationCurve: Curves.bounceInOut,
      insetAnimationDuration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: 500.h,
        child: Container(
          height: 450.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ProductImageRoutes.gameSummaryBg),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 80.h,
              ),
              Image.asset(
                ProductImageRoutes.threeStars,
                width: 180.w,
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 2.w, color: const Color(0xFF306DB6)),
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
                padding: EdgeInsets.symmetric(vertical: 8.h),
                width: 180.w,
                child: Column(
                  children: [
                    Text(
                      'You earned',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color(0xFF306DB6),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          IconImageRoutes.coinIcon,
                          width: 30.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        StrokeText(
                          text: pointsEarned,
                          textStyle: TextStyle(
                            color: const Color(0xFF1768B9),
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w900,
                          ),
                          strokeColor: Colors.white,
                          strokeWidth: 5,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 2.w, color: const Color(0xFF0B5DB0)),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r))),
                width: 150.w,
                child: Text(
                  'Bonus point: +$bonusPoint',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF0B5DB0),
                    fontWeight: FontWeight.w700,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              IntrinsicHeight(
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconImageRoutes.blueCircleMark,
                        width: 24.w,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        children: [
                          Text(
                            '$noOfCorrectionQuestions/$totalQuestions',
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: const Color(0xFF0155AF),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'questions',
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: const Color(0xFF0155AF)),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      VerticalDivider(
                        color: const Color(0xFF0B5DB0),
                        thickness: 2.w,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Image.asset(
                        IconImageRoutes.timer,
                        width: 24.w,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        children: [
                          Text(
                            ': ${averageTimePerQuestion}s',
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: const Color(0xFF0155AF),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'per question',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xFF0155AF),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              BlueButton(
                onTap: () => Navigator.pushNamed(context, AppRoutes.multiplayerQuestionScreen),
                buttonText: 'See leaderboard',
                buttonIsLoading: false,
                width: 235.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}