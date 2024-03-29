import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/config/routes/routes.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/core/utils/functions/app_string.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/core/utils/functions/my_sized_box.dart';
import 'package:learn_up/core/utils/widgets/custom_general_button.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 220.h),
      padding: EdgeInsets.all(65.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.check_circle,
            color: const Color(0xff0EAA00),
            size: 40.w,
          ),
          MySizedBox.height20,
          Text(
            AppString.passwordSuccessfully,
            textAlign: TextAlign.center,
            style: AppStyles.textStyle16Medium
                .copyWith(color: AppColors.primaryColor),
          ),
          MySizedBox.height27,
          CustomGeneralButton(
            width: 192.w,
            text: AppString.login,
            onPressed: () {
              context.navigateTo(routeName: Routes.loginViewRoute);
            },
          ),
        ],
      ),
    );
  }
}

// void _handleLoginStates(LoginState state, BuildContext context) {
//   if (state is LoginSuccess) {
//     serviceLocator
//         .get<CacheHelper>()
//         .saveData(key: 'uid', value: Helper.uId)
//         .then((value) {
//       if (value) {
//         context.navigateAndReplacement(
//             newRoute: Routes.storeifyLayoutViewRoute);
//       }
//     });
//   }

//   if (state is LoginError) {
//     showToast(text: state.error, state: ToastStates.error);
//   }
//}
