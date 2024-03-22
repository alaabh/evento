import 'package:auto_route/auto_route.dart';

import 'login/view/login_page.dart';
import 'login/view/request_password_page.dart';
import 'login/view/reset_password_page.dart';
import 'login/view/password_updated_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // add your routes here
        AutoRoute(
          page: LoginRoute.page,
          initial: true,
          path: '/login',
        ),
        AutoRoute(
          page: ResetPasswordRoute.page,
          path: '/reset_password',
        ),
        AutoRoute(
          page: RequestPasswordRoute.page,
          path: '/request-password',
        ),
    AutoRoute(
      page: PasswordUpdatedRoute.page,
      path: '/password_updated',
    ),

      ];
}
