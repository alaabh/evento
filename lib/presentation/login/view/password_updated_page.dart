

import 'package:auto_route/auto_route.dart';
import 'package:evento/presentation/app_router.dart';
import 'package:evento/widgets/button.dart';
import 'package:evento/widgets/sideImage.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PasswordUpdatedPage extends StatefulWidget {
  const PasswordUpdatedPage({super.key});

  @override
  State<PasswordUpdatedPage> createState() => _PasswordUpdatedPageState();
}

class _PasswordUpdatedPageState extends State<PasswordUpdatedPage> {

  final appRouter = AppRouter();

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
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Password Updated',
                      style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(

                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const Text('Your password has been successfully reset. Click below to log in.'),
                    ),
                    SizedBox(

                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Button(
                        onpressd:  () {
                          context.router.pushNamed('/login');
                        },
                        buttonText: 'Go back to login',
                        loader: false,
                      ),
                    ),
                  ],
                ),
              ),),

            const SideImage(),
          ],


        ),
      );}

}