import 'package:auto_route/auto_route.dart';
import 'package:evento/widgets/input.dart';
import 'package:evento/widgets/sideImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../cubit/cubit/log_in_cubit.dart';

@RoutePage()
class RequestPasswordPage extends StatefulWidget {
  const RequestPasswordPage({super.key});

  @override
  State<RequestPasswordPage> createState() => _RequestPasswordPageState();
}

class _RequestPasswordPageState extends State<RequestPasswordPage> {
  TextEditingController emailController = TextEditingController();
  bool isloading = false;
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
               Row( mainAxisAlignment: MainAxisAlignment.start,

                 children: [

                 IconButton(
                   color: Color(0xFF667085),
                   icon: Icon(
                     Icons.arrow_back_rounded,
                     size: 30.0,
                     color:Color(0xFF667085)
                   ),
                   onPressed: () => Navigator.of(context).pop(),
                 ),
                 Text("Back",
                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
               ],),

                Text(
                  'Forgot Password',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                SizedBox(

                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text('Enter the email associated with your account and we''ll send an email with instructions to reset your password.'),
                ),



                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                        SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,

                           child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Email"),
                   InputText(controller: emailController,hint: 'Your email')
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
                              //box.read('access_token');
                              print('Success');
                            } else if (state is RequstPasswordFailed) {
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
                                onPressed: () {
                                  BlocProvider.of<LogInCubit>(context)
                                      .requestPassword(
                                    emailController.text,
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
                                    : Text('Send'));
                          },
                        ),
                      ),
                    ],
                  ),
                )],
            ),
           )
        ),
            SideImage(),
          ],
        ),


    );
  }
}
