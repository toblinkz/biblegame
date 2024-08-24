import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:the_bible_game/features/who_is_who/bloc/who_is_who_bloc.dart';
import 'package:the_bible_game/features/who_is_who/widget/who_is_who_guide.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/image_routes.dart';
import '../../../shared/widgets/screen_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/who_is_who_level.dart';

class WhoIsWhoHomeScreen extends StatefulWidget {
  const WhoIsWhoHomeScreen({super.key});

  @override
  State<WhoIsWhoHomeScreen> createState() => _WhoIsWhoHomeScreenState();
}

class _WhoIsWhoHomeScreenState extends State<WhoIsWhoHomeScreen> {
  WhoIsWhoBloc? whoIsWhoBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    whoIsWhoBloc = BlocProvider.of<WhoIsWhoBloc>(context);
    whoIsWhoBloc?.add(FetchGameLevels());
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF014AA0),
      body: BlocBuilder<WhoIsWhoBloc, WhoIsWhoState>(
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ProductImageRoutes.patternTwoBg),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                ScreenAppBar(
                  widgets: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            IconImageRoutes.arrowCircleBack,
                            width: 40.w,
                          ),
                        ),
                        Spacer(),
                        StrokeText(
                          text: 'Who is Who',
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w900,
                          ),
                          strokeColor: AppColors.titleDropShadowColor,
                          strokeWidth: 6,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            showWhoIsWhoGuidModal(context);
                          },
                          child: Image.asset(
                            IconImageRoutes.infoCircle,
                            width: 40.w,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    StrokeText(
                      text: 'Choose who did what in the bible',
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1),
                      strokeColor: AppColors.titleDropShadowColor,
                      strokeWidth: 4,
                    ),
                    SizedBox(
                      height: 15.h,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                state.isLoadingGameLevels!
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                    : SizedBox(
                        height: screenHeight - (150.h + 20.h),
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: state.wiwGameLevels.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 30.0.w,
                            crossAxisSpacing: 10.0.w, // spacing between columns
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                WhoIsWhoLevel(
                                  isUnLocked:
                                      state.wiwGameLevels[index].isUnlocked,
                                  level: (index + 1).toString(),
                                  backgroundUrl: state
                                      .wiwGameLevels[index].backgroundImage,
                                  isSpecialLevel:
                                      state.wiwGameLevels[index].isSpecialLevel,
                                  playTime: state.wiwGameLevels[index].playTime,
                                  reward: state.wiwGameLevels[index].reward,
                                  nextLevelIsLocked:
                                      (index + 1) < state.wiwGameLevels.length
                                          ? state.wiwGameLevels[index + 1]
                                              .isUnlocked
                                          : false,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
