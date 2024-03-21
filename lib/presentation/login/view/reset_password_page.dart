import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    url = Uri.base.toString();
    log('Url : $url');
    print(url);
    getResetTokenFromEmail(url);
  }

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("email"),
                  Material(
                    elevation: 1.5,
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                  )
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
                  Text("Password"),
                  Material(
                    elevation: 1.5,
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      log("message");
                      print("object");
                      BlocProvider.of<LogInCubit>(context).resetPassword(
                          passwordController.text, token.toString());
                    },
                    child: Text(
                      "Forget password?",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
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
                    width: MediaQuery.of(context).size.width * 0.25,
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
                        return FilledButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        const Color.fromRGBO(0, 178, 158, 1)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ))),
                            onPressed: () {},
                            child: isloading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: Color.fromRGBO(112, 74, 209, 1),
                                  ))
                                : Text('Login to your account'));
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
