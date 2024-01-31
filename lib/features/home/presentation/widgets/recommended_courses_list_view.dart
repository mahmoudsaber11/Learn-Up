import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/app_assets.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/core/utils/widgets/custom_button_favorite.dart';

class RecommendedCoursesListView extends StatelessWidget {
  const RecommendedCoursesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 16.w,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 155.h,
                    width: 169.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.r),
                            topRight: Radius.circular(8.r)),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              AppAssets.imagesCourse,
                            ))),
                  ),
                  const CustomButtonFavorite()
                ],
              ),
              Container(
                width: 169.w,
                height: 65.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r)),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 2,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 8.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name of course ",
                            style: AppStyles.textStyle12Medium,
                          ),
                          Text(
                            " 3 months ",
                            style: AppStyles.textStyle8Light,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Description about course",
                          style: AppStyles.textStyle8Light
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
