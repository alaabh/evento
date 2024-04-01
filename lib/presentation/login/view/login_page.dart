

import 'package:auto_route/auto_route.dart';
import 'package:evento/presentation/login/cubit/cubit/log_in_cubit.dart';
import 'package:evento/utils/colorConstants.dart';
import 'package:evento/widgets/button.dart';
import 'package:evento/widgets/input.dart';
import 'package:evento/widgets/sideImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

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
                  const Text(
                    'Welcome back',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Text('Log in securely by entering your information below'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Visibility(

                    visible: error,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: ColorConstants.lightRedColor,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                        child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'The email or the password or both you entered did not match our records. Please double-check and try again.',
                      style: TextStyle(color: ColorConstants.redColor),
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
                        const Text('Email'),
                       InputText(controller: emailController,
                       hint: 'Your email',
                       fct:
                        (value) {
                              if (!RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',)
                                  .hasMatch(value!)&&(value.isNotEmpty)) {
                               return 'Wrong email format.';
                                          }
                                    return null;},),
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
                        const Text('Password',
                          style: TextStyle(fontSize: 14,color: Colors.black ),),
                                    InputText(controller: passwordController,obscure: true,
                 hint: 'Type your password',),
                      ],
                    ),
                  ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,),
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
                            'Forget password?',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: ColorConstants.greenColor,
                              color: ColorConstants.greenColor,
                            ),
                          ),
                        ),
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
                                  passwordController.text='';
                                  emailController.text='';
                                });
                                print('Failed');
                              }
                            },
                            builder: (context, state) {
                              return Button(
                                onpressd:() {  BlocProvider.of<LogInCubit>(context).Login(
                              emailController.text,
                              passwordController.text,
                              );
                                },
                                buttonText: 'Login to your account',
                                loader: isloading,
                              );
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
                  const Divider(
                    color: Colors.black,
                   thickness: 0.2,
                  ),),
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
                          const Text('New to evento?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                            Text('ask for an account', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: ColorConstants.greenColor),),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('Need Help?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                            Text('support@evento.co', style: TextStyle(fontSize: 14, color: ColorConstants.greenColor),),

                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SideImage(),

        ],
      ),
    );
  }
}
