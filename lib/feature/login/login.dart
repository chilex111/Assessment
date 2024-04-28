import 'package:assesment_project/res/app_color.dart';
import 'package:assesment_project/routing/route_paths.dart';
import 'package:assesment_project/utils/string_extension.dart';
import 'package:assesment_project/widget/fu_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../constant/app_sizes.dart';
import '../../constant/assets_constants.dart';


class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  bool showPassword = false;
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(AssetConstants.backIcon), // Replace with your desired icon
          onPressed: () => Navigator.pop(context), // Handle back button press
        ),
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [

            Expanded(
              child: SingleChildScrollView(
                padding:  EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Log in to your account",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                      gapH8,
                     const Text("Welcome back! Please enter your registered email address to continue.",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                      gapH8,
                      gapH24,
                      Text("Email address", style: Theme.of(context).textTheme.bodyMedium),
                      gapH4,
                      FUTextFormField(
                        controller: emailCtrl,
                        useHint: true,

                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                        label: "Enter your email",
                        validator: (val){
                          if (val!.isEmpty) {
                            return "Please enter your email";
                          }  else if (!val.isEmail) {
                            return "Invalid email!";
                          }
                          return null;
                        },
                      ),
                      gapH20,
                      Text("Password", style: Theme.of(context).textTheme.bodyMedium),
                      gapH4,
                      FUTextFormField(
                        controller: passwordCtrl,
                        useHint: true,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.visiblePassword,
                        label: "Enter your password",
                        obscureText: !showPassword,
                        suffixIcon: IconButton(
                          onPressed: (){
                            showPassword = !showPassword;
                            setState(() {});
                          },
                          icon: Icon(showPassword? Icons.visibility_off_outlined
                              : Icons.visibility_outlined, color: AppColor.disabledColor, size: 20,),
                        ),
                        validator: (val){
                          if (val!.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                      ),
                      gapH20,

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(AppColor.primaryColor),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.goNamed(AppRoute.dashboard.name);
                  }
                },
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}