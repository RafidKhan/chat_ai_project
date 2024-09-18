import 'package:chat_on/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_on/global/widget/global_appbar.dart';
import 'package:chat_on/global/widget/global_button.dart';
import 'package:chat_on/global/widget/global_svg_loader.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:chat_on/global/widget/global_textformfield.dart';
import 'package:chat_on/modules/auth/registration/controller/registration_controller.dart';
import 'package:chat_on/utils/enum.dart';
import 'package:chat_on/utils/extension.dart';
import 'package:chat_on/utils/styles/k_assets.dart';
import 'package:chat_on/utils/styles/k_colors.dart';

import '../../../../global/widget/global_image_loader.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read(registrationController.notifier);
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(registrationController);
      return Scaffold(
        backgroundColor: KColor.gradient2.color,
        appBar: GlobalAppBar(
          backgroundColor: KColor.gradient1.color,
        ),
        body: Container(
          height: context.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                KColor.gradient1.color,
                KColor.gradient2.color,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    str: context.loc.create_your_account,
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
                          controller: state.firstNameController,
                          labelText: context.loc.first_name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value != null) {
                              if (value.trim().isEmpty) {
                                return context.loc.first_name_required;
                              }
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GlobalTextFormField(
                          controller: state.lastNameController,
                          labelText: context.loc.last_name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value != null) {
                              if (value.trim().isEmpty) {
                                return context.loc.last_name_required;
                              }
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GlobalTextFormField(
                          controller: state.emailController,
                          labelText: context.loc.email,
                          textInputType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value != null) {
                              if (value.trim().isEmpty) {
                                return context.loc.email_required;
                              }
                              if (!value.trim().isValidEmail) {
                                return context.loc.enter_valid_email;
                              }
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GlobalTextFormField(
                          controller: state.phoneController,
                          labelText: context.loc.phone,
                          textInputType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value != null) {
                              if (value.trim().isEmpty) {
                                return context.loc.phone_required;
                              }
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GlobalTextFormField(
                          controller: state.password,
                          labelText: context.loc.password,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: !state.isPasswordVisible,
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 17.h,
                            ),
                            child: InkWell(
                              onTap: controller.togglePasswordVisibility,
                              child: GlobalSvgLoader(
                                imagePath: !state.isPasswordVisible
                                    ? KAssetName.passwordEyeSvg.imagePath
                                    : KAssetName.eyeOpenSvg.imagePath,
                                svgFor: SvgFor.asset,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if ((value ?? "").trim().isEmpty) {
                              return context.loc.password_required;
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GlobalTextFormField(
                          controller: state.confirmPassword,
                          labelText: "Confirm Password",
                          obscureText: !state.isConfirmPasswordVisible,
                          textInputType: TextInputType.emailAddress,
                          maxlength: 32,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 17.h,
                            ),
                            child: InkWell(
                              onTap: controller.toggleConfirmPasswordVisibility,
                              child: GlobalSvgLoader(
                                imagePath: !state.isConfirmPasswordVisible
                                    ? KAssetName.passwordEyeSvg.imagePath
                                    : KAssetName.eyeOpenSvg.imagePath,
                                svgFor: SvgFor.asset,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value != null) {
                              if (value != state.password.text) {
                                return context.loc
                                    .password_and_confirm_password_must_be_the_same;
                              }
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 16.h,
              ),
              child: GlobalButton(
                onPressed: state.isButtonEnabled
                    ? () {
                        controller.requestSignUp(context);
                      }
                    : null,
                buttonText: context.loc.sign_up,
              ),
            ),
            SizedBox(height: 10.h),
            GlobalText(
              str: context.loc.already_have_an_account,
              color: KColor.white.color,
            ),
            InkWell(
              onTap: () {
                Navigation.pop(context);
              },
              child: GlobalText(
                str: context.loc.sign_in,
                color: KColor.white.color,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      );
    });
  }
}
