import 'package:auto_route/auto_route.dart';
import 'package:eco_kg/feature/auth_feature/presentation/forgot_password/forgot_password_screen.dart';
import 'package:eco_kg/feature/auth_feature/presentation/new_password/new_password_screen.dart';
import 'package:eco_kg/feature/auth_feature/presentation/sign_in/sign_in_screen.dart';
import 'package:eco_kg/feature/auth_feature/presentation/verification/verification_screen.dart';
import 'package:eco_kg/feature/home_feature/presentation/home_screen.dart';
import 'package:eco_kg/feature/payment_feature/presentation/info_form_for_payment/info_form_for_payment.dart';
import 'package:eco_kg/feature/payment_feature/presentation/payment_screen.dart';
import 'package:eco_kg/feature/splash_feature/presentation/splash_screen.dart';
import 'package:eco_kg/feature/test_feature/presentation/finish/finish_screen.dart';
import 'package:eco_kg/feature/test_feature/presentation/main_test_screen.dart';
import 'package:eco_kg/feature/test_feature/presentation/tests/tests_screen.dart';
import 'package:eco_kg/feature/user_cabinet_feature/presentation/edit/edit_screen.dart';
import 'package:eco_kg/feature/user_cabinet_feature/presentation/user_cabinet.dart';

import '../../feature/audit_test_consult_feature/presentation/audit_screen.dart';
import '../../feature/auth_feature/presentation/new_password/success_screen.dart';
import '../../feature/auth_feature/presentation/sign_up/sign_up_screen.dart';
import '../../feature/library_feature/presentation/library/library_screen.dart';
import '../../feature/test_feature/presentation/result/result_screen.dart';
part 'auto_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter{
  @override
  List<AutoRoute> get routes=>[
    AutoRoute(page: SplashRoute.page,initial: true),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page),
    AutoRoute(page: VerificationRoute.page),
    AutoRoute(page: NewPasswordRoute.page),
    AutoRoute(page: SuccessRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: LibraryRoute.page),
    AutoRoute(page: ScreenTestRoute.page),
    AutoRoute(page: StartTestRoute.page),
    AutoRoute(page: FinishTestRoute.page),
    AutoRoute(page: ResultTestRoute.page),
    AutoRoute(page: AuditRoute.page),
    AutoRoute(page: PaymentRoute.page),
    AutoRoute(page: UserCabinetRoute.page),
    AutoRoute(page: EditUserCabinetRoute.page),
    AutoRoute(page: GetConsultDrawerRoute.page),
  ];
}