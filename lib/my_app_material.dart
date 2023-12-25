import 'package:eco_kg/core/servise_locator/servise_locator.dart';
import 'package:eco_kg/feature/library_feature/presentation/library/bloc/library_bloc.dart';
import 'package:eco_kg/feature/splash_feature/presentation/bloc/language_bloc.dart';
import 'package:eco_kg/feature/user_cabinet_feature/presentation/bloc/userCabinetBloc/user_cabinet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'core/auto_route/auto_route.dart';
import 'core/style/theme.dart';
import 'feature/audit_test_consult_feature/presentation/bloc/audit_accept_bloc/accept_audit_test_bloc.dart';
import 'feature/audit_test_consult_feature/presentation/bloc/audit_bloc/audit_bloc.dart';
import 'feature/auth_feature/presentation/bloc/auth_bloc.dart';
import 'feature/library_feature/presentation/filter/bloc/filter_bloc.dart';
import 'feature/payment_feature/presentation/bloc/payment_bloc.dart';
import 'feature/test_feature/presentation/bloc/test_bloc.dart';
import 'feature/user_cabinet_feature/presentation/bloc/userDataBloc/user_data_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<LanguageBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<AuthBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<LibraryBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<FilterBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<TestBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<AuditBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<AcceptAuditTestBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<PaymentBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<UserCabinetBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<UserDataBloc>(),
            ),
          ],
          child: BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              return MaterialApp.router(
                builder: FToastBuilder(),
                  locale: Locale(state.lanCode),
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  debugShowCheckedModeBanner: false,
                  title: 'Eco kg',
                  routerConfig: _appRouter.config(),
                  theme: themeData);
            },
          ),
        );
      },
    );
  }
}
