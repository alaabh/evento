import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:evento/utils/password_validator.dart';
import 'package:evento/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/button.dart';
import '../../../widgets/sideImage.dart';
import '../../app_router.dart';
import '../cubit/cubit/log_in_cubit.dart';

@RoutePage()
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final appRouter = AppRouter();
  String? token = "";
  String? getResetTokenFromEmail(String resetLink) {
    final Uri uri = Uri.parse(resetLink);
    setState(() {
      token = uri.queryParameters['token'];
    });

    print(token);
    return token;
  }

  String url = "";
  bool isStrong = false;


  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    url = Uri.base.toString();
    log('Url : $url');
    print(url);
    getResetTokenFromEmail(url);
    BlocProvider.of<LogInCubit>(context).linkExpiration(token!);

  }

  bool isloading = false;
  bool expired=false;
  @override
  Widget build(BuildContext context) {
    return

    Scaffold(
      body: Row(
          children: [
      SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
        ),
        child:   BlocConsumer<LogInCubit, LogInState>(
    listener: (context, state) {
    if (state is NotExpiredLinkLoading) {
    isloading = true;
    print('loading');
    } else if (state is NotExpiredLinkSuccess) {
    // Get.to(const ComptesPreview());
    isloading = false;

    //box.read('access_token');
    print('Success');
    } else if (state is NotExpiredLinkFailed) {
    isloading = false;
    expired=true;
    print('Failed');
    }
    }, builder: (BuildContext context, LogInState state) { return expired?
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
          'Link Expired',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
        ),
          SizedBox(

          width: MediaQuery.of(context).size.width * 0.3,
          child: Text('Your link has expired, because you haven''t used it. Reset password link expires in every 24 hours and can be used only once. you can create one by clicking the button below.'),
          ),
            SizedBox(

              height: MediaQuery.of(context).size.height * 0.05,
            ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Button(
            onpressd:(){context.router.pushNamed('/request-password');} ,
            buttonText: 'Resend another link',
            loader:false
          )
        )
          ],)


            :  Column(
          mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Set New Password',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(

                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text('Your new password must be different to previously used passwords.'),
                  ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Password"),
                 InputText(controller: passwordController,hint:'Your password',obscure: true,)
                  ],
          ),
        ),


            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Confirm password"),

                 InputText(controller: confirmPasswordController,fct: (value) {
                   if (value != passwordController.text) {
                     return 'Passwords do not match.';
                   }
                   return null;
                 },hint: 'Type your password again',
                 obscure: true,)

                ],
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
                  AnimatedBuilder(
                    animation: passwordController,
                    builder: (context, child) {
                      final password = passwordController.text;

                      return PasswordValidator(
                        onStrengthChanged: (bool value) {
                          setState(() {
                            isStrong = value;
                          });
                        },
                        password: password,
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: BlocConsumer<LogInCubit, LogInState>(
                      listener: (context, state) {
                        if (state is ResetPasswordLoading) {
                          isloading = true;
                          print('loading');
                        } else if (state is ResetPasswordSuccess) {
                          // Get.to(const ComptesPreview());
                          isloading = false;
                          //box.read('access_token');
                          print('Success');
                        } else if (state is ResetPasswordFailed) {
                          isloading = false;
                          print('Failed');
                        }
                      },
                      builder: (context, state) {
                        return Button(
                          onpressd: () {
                            BlocProvider.of<LogInCubit>(context).resetPassword(
                                passwordController.text,
                                token!
                            );
                            context.router.pushNamed('/password_updated');
                          },
                          buttonText: 'Reset password',
                          loader: isloading,
                        );
                      },
                    ),
                  ),

                ],
              ),
            ),],
      );},
    ),
    ),),
            SideImage(),
          ],


    ),
       );}

}
