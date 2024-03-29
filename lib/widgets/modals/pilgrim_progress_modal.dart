import 'package:auto_size_text/auto_size_text.dart';
import 'package:bible_game/controllers/pilgrim_progress_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../screens/pilgrim_progress/pilgrim_progress_question_screen.dart';
import '../game_button.dart';

class PilgrimProgressModal extends StatelessWidget {
  const PilgrimProgressModal({Key? key, required this.noOfRoundLeft})
      : super(key: key);
  final int noOfRoundLeft;


  @override
  Widget build(BuildContext context) {
    PilgrimProgressController pilgrimProgressController = Get.put(PilgrimProgressController());
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: SizedBox(
        child: Container(
          margin: EdgeInsets.only(top: 80.0.h),
          child: Column(
            children: [
              Container(
                width: Get.width >= 500 ? 400.w : 300.w,
                padding: EdgeInsets.symmetric(vertical: 20.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromRGBO(152, 152, 152, 1)
                          .withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Obx(
                  () => AutoSizeText(
                    pilgrimProgressController.modalTitle.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'neuland',
                      letterSpacing: 1,
                      height: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const Text(''),
              Container(
                width: Get.width >= 500 ? 400.w : 300.w,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromRGBO(152, 152, 152, 1)
                          .withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    noOfRoundLeft == 5 ? SizedBox(
                      height: 15.h,
                    ) : const SizedBox(),
                   noOfRoundLeft == 5 ? Container(
                      padding: EdgeInsets.only(left: 15.w, top: 12.h, bottom: 12.h),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF8E193),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.r))),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Get ',
                              style: TextStyle(fontSize: 12.sp, color: const Color(0xFF22210D), height: 1.5),
                              children: <TextSpan>[
                                TextSpan(text: '3,200 points', style:TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: const Color(0xFF22210D))),
                                TextSpan(text: ' in one game \nplay to unlock new level!', style: TextStyle(fontSize: 12.sp, color: const Color(0xFF22210D)),)
                              ]
                            ),
                          ),
                          const Spacer(),
                          Image.asset('assets/images/icons/blue_star.png', width: 60,)

                        ],
                      ),
                    ): const SizedBox(),
                    noOfRoundLeft < 5 ? SizedBox(
                      height: 12.h,
                    ): const SizedBox() ,
                   noOfRoundLeft < 5 ? Container(
                      padding: EdgeInsets.only(left: 15.w, top: 12.h, bottom: 12.h),
                      decoration: BoxDecoration(
                          color: const Color(0xFFE7E2FF),
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.r))),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'You have',
                                style: TextStyle(fontSize: 12.sp, color: const Color(0xFF22210D), height: 1.5),
                                children: <TextSpan>[
                                  TextSpan(text: ' $noOfRoundLeft/5 trials', style:TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: const Color(0xFF22210D))),
                                  TextSpan(text: '  left, \nGod speed Sojourner!', style:TextStyle(fontSize: 12.sp, color: const Color(0xFF22210D))),
                                ]
                            ),
                          ),
                          const Spacer(),
                          Image.asset('assets/images/icons/hour_glass.png', width: 50.w,)

                        ],
                      ),
                    ) : const SizedBox(),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15.w, top: 12.h, bottom: 12.h),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF9ACBB),
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.r))),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Or Get ',
                                style: TextStyle(fontSize: 12.sp, color: const Color(0xFF22210D), height: 1.5),
                                children: <TextSpan>[
                                  TextSpan(text: '15,000 points', style:TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: const Color(0xFF22210D))),
                                  TextSpan(text: ' in five \ntrials to unlock new level!', style: TextStyle(fontSize: 12.sp, color: const Color(0xFF22210D)),)
                                ]
                            ),
                          ),
                          const Spacer(),
                          Image.asset('assets/images/icons/blue_star.png', width: 60.w,)

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15.w, top: 12.h, bottom: 12.h),
                      decoration: BoxDecoration(
                          color: const Color(0xFFE7E2FF),
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.r))),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Your points will be deleted \nif you don’t complete level\n',
                                style: TextStyle(fontSize: 12.sp, color: const Color(0xFF22210D), height: 1.5),
                                children: <TextSpan>[
                                  TextSpan(text: ' after 5 trials.', style:TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: const Color(0xFF22210D))),
                                ]
                            ),
                          ),
                          const Spacer(),
                         Image.asset('assets/images/icons/hour_glass.png', width: 50.w,)

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    noOfRoundLeft == 5 ? Container(
                      padding: EdgeInsets.only(left: 15.w, top: 12.h, bottom: 12.h),
                      decoration: BoxDecoration(
                          color: const Color(0xFFE7E2FF),
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.r))),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Bonus points are awarded \nbased on',
                                style: TextStyle(fontSize: 12.sp, color: const Color(0xFF22210D), height: 1.5),
                                children: <TextSpan>[
                                  TextSpan(text: ' speed!', style:TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: const Color(0xFF22210D))),
                                ]
                            ),
                          ),
                          const Spacer(),
                          Image.asset('assets/images/icons/rocket.png', width: 50.w,)
                        ],
                      ),
                    ) : const SizedBox(),
                    SizedBox(
                      height: 30.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (pilgrimProgressController.gameIsReady.isTrue) {
                          Get.back();
                          Get.to(() => const PilgrimProgressQuestionScreen(),
                              transition: Transition.rightToLeftWithFade);
                        }
                      },
                      child: Obx(() => GameButton(
                            buttonText: 'PLAY NOW',
                            buttonActive:
                                pilgrimProgressController.gameIsReady.value,
                          )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
