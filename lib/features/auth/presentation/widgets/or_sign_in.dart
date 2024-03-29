import 'package:flutter/widgets.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_string.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';

class OrSignIn extends StatelessWidget {
  const OrSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppString.or,
        style: AppStyles.textStyle16Regular
            .copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
