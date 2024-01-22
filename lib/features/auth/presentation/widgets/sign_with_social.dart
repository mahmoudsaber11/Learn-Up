import 'package:flutter/material.dart';
import 'package:learn_up/core/utils/functions/app_assets.dart';

class SignWithSocial extends StatelessWidget {
  const SignWithSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(AppAssets.imagesGoogle),
        Image.asset(AppAssets.imagesFacebook),
        Image.asset(AppAssets.imagesTwitter),
      ],
    );
  }
}
