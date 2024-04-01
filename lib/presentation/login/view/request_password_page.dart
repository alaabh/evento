import 'package:auto_route/auto_route.dart';
import 'package:evento/presentation/login/cubit/cubit/log_in_cubit.dart';
import 'package:evento/utils/colorConstants.dart';
import 'package:evento/widgets/button.dart';
import 'package:evento/widgets/input.dart';
import 'package:evento/widgets/sideImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RequestPasswordPage extends StatefulWidget {
  const RequestPasswordPage({super.key});

  @override
  State<RequestPasswordPage> createState() => _RequestPasswordPageState();
}

class _RequestPasswordPageState extends State<RequestPasswordPage> {
  TextEditingController emailController = TextEditingController();
  bool isloading = false;
  bool error =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
          children: [
           SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
             child: Padding(
              padding: EdgeInsets.only(
               left: MediaQuery.of(context).size.width * 0.05,
                ),
                 child:  Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
              children:[
               Row( children: [

                 IconButton(
                   color: ColorConstants.greyColor,
                   icon: Icon(
                     Icons.arrow_back_rounded,
                     size: 30,
                     color:ColorConstants.greyColor,
                   ),
                   onPressed: () => Navigator.of(context).pop(),
                 ),
                 const Text('Back',
                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
               ],),

                const Text(
                  'Forgot Password',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                SizedBox(

                  width: MediaQuery.of(context).size.width * 0.3,
                  child: const Text('Enter the email associated with your account and we''ll send an email with instructions to reset your password.'),
                ),



                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                        SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,

                           child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text('Email'),
                   InputText(controller: emailController,hint: 'Your email',
                   fct:
                       (value) {
                        if (!RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',)
                            .hasMatch(value!)&&(value.isNotEmpty)) {
                        return 'Wrong email format.';
                        }
                        else if(error){ return 'Invalid email. Please enter your registred email.';}
                        return null;},),

                  ],
                ),
              ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
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
                            if (state is RequstPasswordLoading) {
                              isloading = true;
                              print('loading');
                            } else if (state is RequstPasswordSuccess) {
                              // Get.to(const ComptesPreview());
                              isloading = false;
                              setState(() {
                                error=false;
                              });
                              //box.read('access_token');
                              print('Success');
                            } else if (state is RequstPasswordFailed) {
                              isloading = false;
                              setState(() {
                                error=true;
                              });
                              print('Failed');
                            }
                          },
                          builder: (context, state) {
                            return Button(
                              onpressd: () {
                                BlocProvider.of<LogInCubit>(context)
                                    .requestPassword(
                                  emailController.text,
                                );
                              },
                              buttonText: 'Send',
                              loader: isloading,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),],
            ),
           ),
        ),
            const SideImage(),
          ],
        ),


    );
  }
}
