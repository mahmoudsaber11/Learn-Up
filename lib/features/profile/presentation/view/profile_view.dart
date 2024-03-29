import 'package:flutter/material.dart';
import 'package:learn_up/config/routes/routes.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/core/utils/functions/my_sized_box.dart';
import 'package:learn_up/features/profile/presentation/widgets/custom_card_profile.dart';
import 'package:learn_up/features/profile/presentation/widgets/custom_text_and_icon.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Profile",
            style: AppStyles.textStyle24Medium,
          ),
          MySizedBox.height24,
          const CustomCardProfile(),
          MySizedBox.height40,
          const CustomTextAndIcon(
            icon: Icon(
              Icons.person_add_alt,
              color: AppColors.primaryColor,
            ),
            text: "Invite to App ",
          ),
          const CustomTextAndIcon(
            icon: Icon(
              Icons.language_outlined,
              color: AppColors.primaryColor,
            ),
            text: "Language ",
          ),
          const CustomTextAndIcon(
            icon: Icon(
              Icons.dark_mode,
              color: AppColors.primaryColor,
            ),
            text: "Dark mode",
          ),
          const CustomTextAndIcon(
            icon: Icon(
              Icons.settings,
              color: AppColors.primaryColor,
            ),
            text: "Settings",
          ),
          CustomTextAndIcon(
            icon: const Icon(
              Icons.logout_sharp,
              color: AppColors.primaryColor,
            ),
            text: "Logout",
            onPressed: () {
              context.navigateAndRemoveUntil(newRoute: Routes.loginViewRoute);
            },
          ),
        ],
      ),
    );
  }
}
