import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: Center(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email"),
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
