part of 'auto_route.dart';


abstract class _$AppRouter extends RootStackRouter{
  @override
  final Map<String, PageFactory> pagesMap={
    SplashRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const SplashScreen()
      );
    },
    SignInRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: SignInScreen()
      );
    },
    SignUpRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const SignUpScreen()
      );
    },
    ForgotPasswordRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const ForgotPaswordScreen()
      );
    },
    VerificationRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const VerificationScreen()
      );
    },
    NewPasswordRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const NewPaswordScreen()
      );
    },
    SuccessRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const SuccessScreen()
      );
    },
    HomeRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const HomeScreen()
      );
    },
    LibraryRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: LibraryScreen()
      );
    },
    ScreenTestRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child:  MainTestScreen()
      );
    },
    StartTestRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const TestsScreen()
      );
    },
    FinishTestRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const FinishScreen()
      );
    },
    ResultTestRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: ResultScreen()
      );
    },
    AuditRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: AuditScreen()
      );
    },
    PaymentRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: PaymentScreen()
      );
    },

    UserCabinetRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const UserCabinetScreen()
      );
    },
    EditUserCabinetRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: EditScreen()
      );
    },
    GetConsultDrawerRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: InfoFormForPayment()
      );
    },
    GetCertificateDrawerRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: InfoFormCertificateForPayment()
      );
    },
    PaymentGetCertificateRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: GetCertificatScreen()
      );
    },
    PaymentGetConsultationRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: ConsultationScreen()
      );
    },
  };
}

class SplashRoute extends PageRouteInfo<void>{
  static const String name='Splash';
  static const PageInfo<void> page=PageInfo<void>(name);
  const SplashRoute({List<PageRouteInfo>? children}): super(SplashRoute.name,initialChildren: children);
}

class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
    SignInRoute.name,
    initialChildren: children,
  );
  static const String name = 'SignInRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
    SignUpRoute.name,
    initialChildren: children,
  );
  static const String name = 'SignUpRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
    ForgotPasswordRoute.name,
    initialChildren: children,
  );
  static const String name = 'ForgotPasswordRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class VerificationRoute extends PageRouteInfo<void> {
  const VerificationRoute({List<PageRouteInfo>? children})
      : super(
    VerificationRoute.name,
    initialChildren: children,
  );
  static const String name = 'VerificationRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class NewPasswordRoute extends PageRouteInfo<void> {
  const NewPasswordRoute({List<PageRouteInfo>? children})
      : super(
    NewPasswordRoute.name,
    initialChildren: children,
  );
  static const String name = 'NewPasswordRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class SuccessRoute extends PageRouteInfo<void> {
  const SuccessRoute({List<PageRouteInfo>? children})
      : super(
    SuccessRoute.name,
    initialChildren: children,
  );
  static const String name = 'SuccessRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
    HomeRoute.name,
    initialChildren: children,
  );
  static const String name = 'HomeRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class LibraryRoute extends PageRouteInfo<void> {
  const LibraryRoute({List<PageRouteInfo>? children})
      : super(
    LibraryRoute.name,
    initialChildren: children,
  );
  static const String name = 'LibraryRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class StartTestRoute extends PageRouteInfo<void> {
  const StartTestRoute({List<PageRouteInfo>? children})
      : super(
    StartTestRoute.name,
    initialChildren: children,
  );
  static const String name = 'StartTestRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class ScreenTestRoute extends PageRouteInfo<void> {
  const ScreenTestRoute({List<PageRouteInfo>? children})
      : super(
    ScreenTestRoute.name,
    initialChildren: children,
  );
  static const String name = 'ScreenTestRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class FinishTestRoute extends PageRouteInfo<void> {
  const FinishTestRoute({List<PageRouteInfo>? children})
      : super(
    FinishTestRoute.name,
    initialChildren: children,
  );
  static const String name = 'FinishTestRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class ResultTestRoute extends PageRouteInfo<void> {
  const ResultTestRoute({List<PageRouteInfo>? children})
      : super(
    ResultTestRoute.name,
    initialChildren: children,
  );
  static const String name = 'ResultTestRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class AuditRoute extends PageRouteInfo<void> {
  const AuditRoute({List<PageRouteInfo>? children})
      : super(
    AuditRoute.name,
    initialChildren: children,
  );
  static const String name = 'AuditRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class PaymentRoute extends PageRouteInfo<void> {
  const PaymentRoute({List<PageRouteInfo>? children})
      : super(
    PaymentRoute.name,
    initialChildren: children,
  );
  static const String name = 'PaymentRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class UserCabinetRoute extends PageRouteInfo<void> {
  const UserCabinetRoute({List<PageRouteInfo>? children})
      : super(
    UserCabinetRoute.name,
    initialChildren: children,
  );
  static const String name = 'UserCabinetRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class EditUserCabinetRoute extends PageRouteInfo<void> {
  const EditUserCabinetRoute({List<PageRouteInfo>? children})
      : super(
    EditUserCabinetRoute.name,
    initialChildren: children,
  );
  static const String name = 'EditUserCabinetRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class GetConsultDrawerRoute extends PageRouteInfo<void> {
  const GetConsultDrawerRoute({List<PageRouteInfo>? children})
      : super(
    GetConsultDrawerRoute.name,
    initialChildren: children,
  );
  static const String name = 'GetConsultDrawerRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class GetCertificateDrawerRoute extends PageRouteInfo<void> {
  const GetCertificateDrawerRoute({List<PageRouteInfo>? children})
      : super(
    GetCertificateDrawerRoute.name,
    initialChildren: children,
  );
  static const String name = 'GetCertificateDrawerRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class PaymentGetCertificateRoute extends PageRouteInfo<void> {
  const PaymentGetCertificateRoute({List<PageRouteInfo>? children})
      : super(
    PaymentGetCertificateRoute.name,
    initialChildren: children,
  );
  static const String name = 'PaymentGetCertificateRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class PaymentGetConsultationRoute extends PageRouteInfo<void> {
  const PaymentGetConsultationRoute({List<PageRouteInfo>? children})
      : super(
    PaymentGetConsultationRoute.name,
    initialChildren: children,
  );
  static const String name = 'PaymentGetConsultationRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}