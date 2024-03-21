import 'package:auto_route/auto_route.dart';
import 'package:evento/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_router.dart';
import '../../login/cubit/cubit/log_in_cubit.dart';

class App extends StatelessWidget {
  App({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LogInCubit>(
          create: (context) => LogInCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: _appRouter.config(deepLinkBuilder: (deepLink) {
          if (deepLink.path.startsWith('/reset_password')) {
            // continute with the platfrom link
            print(deepLink.path);
            print("ba3");
            return deepLink;
          } else {
            return DeepLink.defaultPath;
            
          }
        }),
        // home: const LoginPage(),
      ),
    );
  }
}
