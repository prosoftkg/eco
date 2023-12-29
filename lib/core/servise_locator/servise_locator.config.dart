import 'package:eco_kg/feature/audit_test_consult_feature/domain/use_case/confirm_audit_consult.dart';
import 'package:eco_kg/feature/audit_test_consult_feature/domain/use_case/denyAuditTest.dart';
import 'package:eco_kg/feature/auth_feature/domain/use_case/checkConfirmationCode.dart';
import 'package:eco_kg/feature/auth_feature/domain/use_case/read_auth_key.dart';
import 'package:eco_kg/feature/auth_feature/domain/use_case/sign_in.dart';
import 'package:eco_kg/feature/library_feature/data/data_source/library_server.dart';
import 'package:eco_kg/feature/library_feature/data/repositories/library_repository.dart';
import 'package:eco_kg/feature/library_feature/domain/repository/repository.dart';
import 'package:eco_kg/feature/library_feature/domain/use_case/libraryIUseCase.dart';
import 'package:eco_kg/feature/library_feature/domain/use_case/removeHistory.dart';
import 'package:eco_kg/feature/splash_feature/presentation/bloc/language_bloc.dart';
import 'package:eco_kg/feature/story_feature/data/data_source/story_server.dart';
import 'package:eco_kg/feature/story_feature/domain/repository/repository.dart';
import 'package:eco_kg/feature/story_feature/domain/use_case/audit_story_use_case.dart';
import 'package:eco_kg/feature/story_feature/presentation/bloc/story_bloc.dart';
import 'package:eco_kg/feature/test_feature/domain/use_case/begin_test_use_case.dart';
import 'package:eco_kg/feature/user_cabinet_feature/data/data_source/user_cabinet_server.dart';
import 'package:eco_kg/feature/user_cabinet_feature/domain/repository/repository.dart';
import 'package:eco_kg/feature/user_cabinet_feature/domain/use_case/edit_user_data_use_case.dart';
import 'package:eco_kg/feature/user_cabinet_feature/presentation/bloc/userCabinetBloc/user_cabinet_bloc.dart';
import 'package:eco_kg/feature/user_cabinet_feature/presentation/bloc/userDataBloc/user_data_bloc.dart';
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import '../../feature/audit_test_consult_feature/data/data_source/audit_server.dart';
import '../../feature/audit_test_consult_feature/data/repositories/audit_test_list_repository.dart';
import '../../feature/audit_test_consult_feature/domain/repository/repository.dart';
import '../../feature/audit_test_consult_feature/domain/use_case/audit_consult_list_use_case.dart';
import '../../feature/audit_test_consult_feature/domain/use_case/audit_test_list_use_case.dart';
import '../../feature/audit_test_consult_feature/domain/use_case/denyAuditConsult.dart';
import '../../feature/audit_test_consult_feature/presentation/bloc/audit_accept_bloc/accept_audit_test_bloc.dart';
import '../../feature/audit_test_consult_feature/presentation/bloc/audit_bloc/audit_bloc.dart';
import '../../feature/audit_test_consult_feature/presentation/bloc/audit_consult_accept/accept_audit_consult_bloc.dart';
import '../../feature/auth_feature/data/data_source/auth_server.dart';
import '../../feature/auth_feature/data/repositories/auth_repository.dart';
import '../../feature/auth_feature/domain/repository/repository.dart';
import '../../feature/auth_feature/presentation/bloc/auth_bloc.dart';
import '../../feature/library_feature/domain/use_case/historyUseCase.dart';
import '../../feature/library_feature/domain/use_case/paramUseCase.dart';
import '../../feature/library_feature/presentation/filter/bloc/filter_bloc.dart';
import '../../feature/library_feature/presentation/library/bloc/library_bloc.dart';
import '../../feature/payment_feature/data/data_source/payment_server.dart';
import '../../feature/payment_feature/data/repositories/payment_repository.dart';
import '../../feature/payment_feature/domain/repository/repository.dart';
import '../../feature/payment_feature/domain/use_case/payment_use_case.dart';
import '../../feature/payment_feature/presentation/bloc/payment_bloc.dart';
import '../../feature/story_feature/data/repositories/story_repository.dart';
import '../../feature/test_feature/data/data_source/test_server.dart';
import '../../feature/test_feature/data/repositories/begin_test_repository.dart';
import '../../feature/test_feature/domain/repository/repository.dart';
import '../../feature/test_feature/domain/use_case/begin_audit_test_use_case.dart';
import '../../feature/test_feature/domain/use_case/finish_test_use_case.dart';
import '../../feature/test_feature/domain/use_case/next_text_use_case.dart';
import '../../feature/test_feature/presentation/bloc/test_bloc.dart';
import '../../feature/user_cabinet_feature/data/repositories/user_cabinet_repositories.dart';

extension GetItInjectableX on _i1.GetIt {
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );

    gh.factory<LanguageBloc>(() => LanguageBloc());

    gh.factory<AuthSourse>(() => AuthSourse());
    gh.factory<AuthRepository>(
            () => AuthRepositoryImpl(authSourse: gh<AuthSourse>()));
    gh.factory<SignIn>(
            () => SignIn(authRepository: gh<AuthRepository>()));
    gh.factory<ReadAuthKey>(
            () => ReadAuthKey(authRepository: gh<AuthRepository>()));
    gh.factory<CheckConfirmationCode>(
            () => CheckConfirmationCode(authRepository: gh<AuthRepository>()));
    gh.factory<AuthBloc>(() => AuthBloc(
      signIn: gh<SignIn>(),
      readAuthKey: gh<ReadAuthKey>(),
      checkConfirmationCode: gh<CheckConfirmationCode>(),
    ));

    gh.factory<LibraryDataSourse>(() => LibraryDataSourse());
    gh.factory<LibraryRepository>(
            () => LibraryRepositoryImpl(libraryDataSourse: gh<LibraryDataSourse>()));
    gh.factory<LibraryUseCase>(
            () => LibraryUseCase(libraryRepository: gh<LibraryRepository>()));
    gh.factory<ParamUseCase>(
            () => ParamUseCase(libraryRepository: gh<LibraryRepository>()));
    gh.factory<HistoryUseCase>(
            () => HistoryUseCase(libraryRepository: gh<LibraryRepository>()));
    gh.factory<RemoveHistoryUseCase>(
            () => RemoveHistoryUseCase(libraryRepository: gh<LibraryRepository>()));
    gh.factory<LibraryBloc>(() => LibraryBloc(
      libraryUseCase: gh<LibraryUseCase>(), historyUseCase: gh<HistoryUseCase>(), removeUseCase: gh<RemoveHistoryUseCase>(),
    ));
    gh.factory<FilterBloc>(() => FilterBloc(
      paramUseCase: gh<ParamUseCase>(),
    ));


    gh.factory<TestDataSource>(() => TestDataSource());
    gh.factory<TestRepository>(
            () => TestRepositoryImpl(testDataSource: gh<TestDataSource>()));

    gh.factory<BeginTestUseCase>(
            () => BeginTestUseCase(beginTestRepository: gh<TestRepository>()));
    gh.factory<BeginAuditTestUseCase>(
            () => BeginAuditTestUseCase(beginAuditTestRepository: gh<TestRepository>()));
    gh.factory<NextTestUseCase>(
            () => NextTestUseCase(beginTestRepository: gh<TestRepository>()));
    gh.factory<FinishTestUseCase>(
            () => FinishTestUseCase(beginTestRepository: gh<TestRepository>()));

    gh.factory<TestBloc>(() => TestBloc(
      beginTestUseCase: gh<BeginTestUseCase>(),
      beginAuditTestUseCase: gh<BeginAuditTestUseCase>(),
      nextTestUseCase: gh<NextTestUseCase>(),
      finishTestUseCase: gh<FinishTestUseCase>(),
    ));

    gh.factory<AuditDataSource>(() => AuditDataSource());
    gh.factory<AuditRepository>(
            () => AuditRepositoryImpl(auditDataSource: gh<AuditDataSource>()));

    gh.factory<AuditTestListUseCase>(
            () => AuditTestListUseCase(auditTestListRepository: gh<AuditRepository>()));
    gh.factory<AuditConsultListUseCase>(
            () => AuditConsultListUseCase(auditTestListRepository: gh<AuditRepository>()));

    gh.factory<AuditBloc>(() => AuditBloc(
      auditTestListUseCase: gh<AuditTestListUseCase>(),
      auditConsultListUseCase: gh<AuditConsultListUseCase>()
    ));

    gh.factory<DenyAuditTestUseCase>(
            () => DenyAuditTestUseCase(auditTestListRepository: gh<AuditRepository>()));

    gh.factory<ConfirmAuditConsultUseCase>(
            () => ConfirmAuditConsultUseCase(auditTestListRepository: gh<AuditRepository>()));

    gh.factory<DenyAuditConsultUseCase>(
            () => DenyAuditConsultUseCase(auditTestListRepository: gh<AuditRepository>()));

    gh.factory<AcceptAuditTestBloc>(() => AcceptAuditTestBloc(
      denyAuditTestUseCase: gh<DenyAuditTestUseCase>()
    ));

    gh.factory<AcceptAuditConsultBloc>(() => AcceptAuditConsultBloc(
        confirmAuditConsultUseCase: gh<ConfirmAuditConsultUseCase>(),
      denyAuditConsultUseCase: gh<DenyAuditConsultUseCase>()
    ));


    gh.factory<PaymentDataSource>(() => PaymentDataSource());
    gh.factory<PaymentRepository>(
            () => PaymentRepositoryImpl(paymentDataSource: gh<PaymentDataSource>()));

    gh.factory<PaymentUseCase>(
            () => PaymentUseCase(paymentRepository: gh<PaymentRepository>()));

    gh.factory<PaymentBloc>(() => PaymentBloc(
      paymentUseCase: gh<PaymentUseCase>(),
    ));

    gh.factory<UserCabinetDataSource>(() => UserCabinetDataSource());
    gh.factory<UserCabinetRepository>(
            () => UserCabinetRepositoryImpl(userCabinetDataSource: gh<UserCabinetDataSource>()));

    gh.factory<EditUserDataUseCase>(
            () => EditUserDataUseCase(userCabinetRepository: gh<UserCabinetRepository>()));

    gh.factory<UserCabinetBloc>(() => UserCabinetBloc(
      editUserDataUseCase: gh<EditUserDataUseCase>(),
    ));

    gh.factory<UserDataBloc>(() => UserDataBloc());


    gh.factory<StoryDataSource>(() => StoryDataSource());
    gh.factory<StoryRepository>(
            () => StoryRepositoryImpl(storyDataSource: gh<StoryDataSource>()));

    gh.factory<AuditStoryUseCase>(
            () => AuditStoryUseCase(storyRepository: gh<StoryRepository>()));

    gh.factory<StoryBloc>(() => StoryBloc(
      auditStoryUseCase: gh<AuditStoryUseCase>(),
    ));

    return this;
  }
}
