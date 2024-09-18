import 'package:chat_on/global/widget/global_appbar.dart';
import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/global/widget/global_textformfield.dart';
import 'package:chat_on/modules/auth/sign_in/controller/sign_in_controller.dart';
import 'package:chat_on/utils/app_routes.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/navigation.dart';
import 'package:chat_on/utils/styles/k_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../global/widget/global_button.dart';
import '../../../../global/widget/global_svg_loader.dart';
import '../../../../utils/styles/k_assets.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(signInController);
      final controller = ref.read(signInController.notifier);
      return Scaffold(
        backgroundColor: KColor.gradient1.color,
        appBar: GlobalAppBar(
          backgroundColor: KColor.gradient2.color,
        ),
        body: Container(
          width: context.width,
          height: context.height,
          padding: EdgeInsets.symmetric(
            vertical: 24.h,
            horizontal: 20.w,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                KColor.gradient2.color,
                KColor.gradient1.color,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: GlobalImageLoader(
                    imagePath: KAssetName.appLogoPng.imagePath,
                    height: 100.h,
                  ),
                ),
                GlobalText(
                  str: context.loc.sign_in_to_your_account,
                  fontSize: 24,
                  color: KColor.white.color,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 23.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 30.h,
                    horizontal: 20.w,
                  ),
                  decoration: BoxDecoration(
                    color: KColor.white.color,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Column(
                    children: [
                      GlobalTextFormField(
                        controller: state.emailController,
                        labelText: context.loc.email,
                        textInputType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return context.loc.email_required;
                            } else if (!(value.isValidEmail)) {
                              return context.loc.enter_valid_email;
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      GlobalTextFormField(
                        controller: state.passwordController,
                        labelText: context.loc.password,
                        obscureText: state.isObscurePassword,
                        textInputType: TextInputType.emailAddress,
                        maxlength: 16,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 17.h,
                          ),
                          child: InkWell(
                            onTap: controller.togglePasswordVisibility,
                            child: GlobalSvgLoader(
                              imagePath: state.isObscurePassword
                                  ? KAssetName.passwordEyeSvg.imagePath
                                  : KAssetName.eyeOpenSvg.imagePath,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return context.loc.password_required;
                            }
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 17.h),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: InkWell(
                //     onTap: () {
                //       // Navigation.push(
                //       //   context,
                //       //   appRoutes: AppRoutes.forgetPasswordEnterNumber,
                //       // );
                //     },
                //     child: GlobalText(
                //       str: context.loc.forgot_password_question,
                //       fontSize: 14,
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 16.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GlobalButton(
                onPressed: state.isButtonEnabled
                    ? () {
                        controller.signIn(context);
                      }
                    : null,
                buttonText: context.loc.sign_in,
              ),
              SizedBox(height: 10.h),
              GlobalText(
                str: context.loc.dont_have_an_account,
                color: KColor.white.color,
              ),
              InkWell(
                onTap: () {
                  Navigation.push(
                    context,
                    appRoutes: AppRoutes.registration,
                  );
                },
                child: GlobalText(
                  str: context.loc.sign_up,
                  color: KColor.white.color,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
