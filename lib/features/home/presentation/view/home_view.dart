import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/config/routes/routes.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/features/home/presentation/widgets/certificates_or_degrees_list_view.dart';
import 'package:learn_up/features/home/presentation/widgets/custom_search_text_field.dart';
import 'package:learn_up/features/home/presentation/widgets/custom_text_type.dart';
import 'package:learn_up/features/home/presentation/widgets/recommended_courses_list_view.dart';
import 'package:learn_up/features/home/presentation/widgets/topics_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .07, left: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomSearchTextField(),
            SizedBox(
              height: 32.h,
            ),
            CustomTextType(
              type: "Topics",
              onPressed: () =>
                  context.navigateTo(routeName: Routes.topicsViewRoute),
            ),
            SizedBox(
              height: 10.h,
            ),
            const TopicsListView(),
            SizedBox(
              height: 20.h,
            ),
            const CustomTextType(type: "Recommended Courses"),
            SizedBox(
              height: 10.h,
            ),
            const RecommendedCoursesListView(),
            SizedBox(
              height: 18.h,
            ),
            const CustomTextType(type: "Most popular certificates/degrees"),
            SizedBox(
              height: 10.h,
            ),
            const CertificatesOrDegreesListView(),
          ],
        ),
      ),
    );
  }
}
