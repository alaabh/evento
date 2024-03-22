import 'dart:html';

import 'package:auto_route/auto_route.dart';
import 'package:evento/widgets/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../widgets/sideImage.dart';
import '../cubit/cubit/log_in_cubit.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isloading = false;
bool error = false;
  final box = GetStorage();

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('image/evento.png'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Text(
                    'Welcome back',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text('Log in securely by entering your information below'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Visibility(

                    visible: error,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Color(0xFFe7cdcf),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                        child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "The email or the password or both you entered did not match our records. Please double-check and try again.",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email"),
                       InputText(controller: emailController,
                       hint: 'Your email',
                       fct:
                        (value) {
                              if (!RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(value!)&&(value.isNotEmpty)) {
                               return 'Wrong email format.';
                                          }
                                    return null;}),
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
                        Text("Password",
                          style: TextStyle(fontSize: 14,color: Colors.black )),
                 InputText(controller: passwordController,obscure: true,
                 hint: 'Type your password')
                      ],
                    ),
                  ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            context.router.pushNamed('/request-password');
                          },
                          child: Text(
                            "Forget password?",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromRGBO(0, 178, 158, 1),
                              color: Color.fromRGBO(0, 178, 158, 1)
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
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: BlocConsumer<LogInCubit, LogInState>(
                            listener: (context, state) {
                              if (state is LoginLoading) {
                                isloading = true;
                                print('loading');
                              } else if (state is LoginSuccess) {
                                // Get.to(const ComptesPreview());
                                isloading = false;
                                setState(() {
                                  error=false;
                                });
                                //box.read('access_token');
                                print('Success');
                              } else if (state is LoginFailed) {
                                isloading = false;
                                setState(() {
                                  error=true;
                                  passwordController.text="";
                                  emailController.text="";
                                });
                                print('Failed');
                              }
                            },
                            builder: (context, state) {
                              return FilledButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll<
                                              Color>(
                                          const Color.fromRGBO(0, 178, 158, 1)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ))),
                                  onPressed: () {
                                    BlocProvider.of<LogInCubit>(context).Login(
                                      emailController.text,
                                      passwordController.text,
                                    );
                                  },
                                 child: isloading
                                      ?  SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.01,
                                      child:
                                      const Center(
                                          child:  LoadingIndicator(
                                              indicatorType: Indicator.lineSpinFadeLoader,
                                              colors:  [Colors.white],
                                              strokeWidth: 0.2
                                          )))
                                      : Text('Login to your account'));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                  child:
                  Divider(
                    color: Colors.black,
                   thickness: 0.2,
                  )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children :[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("New to evento?", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                            Text("ask for an account", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Color(0xff00B29E)),)

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Need Help?", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                            Text("support@evento.co", style: TextStyle(fontSize: 14, color: Color(0xff00B29E)),)

                          ],
                        )
                      ]
                    ),
                  )
                ],
              ),
            ),
          ),
          SideImage(),

        ],
      ),
    );
  }
}
