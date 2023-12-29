import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_kg/feature/audit_test_consult_feature/domain/use_case/confirm_audit_consult.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../domain/use_case/denyAuditConsult.dart';

part 'accept_audit_consult_event.dart';
part 'accept_audit_consult_state.dart';

class AcceptAuditConsultBloc extends Bloc<AcceptAuditConsultEvent, AcceptAuditConsultState> {
  final storage = const FlutterSecureStorage();
  final ConfirmAuditConsultUseCase confirmAuditConsultUseCase;
  final DenyAuditConsultUseCase denyAuditConsultUseCase;
  AcceptAuditConsultBloc({required this.confirmAuditConsultUseCase,required this.denyAuditConsultUseCase}) : super(AcceptAuditConsultInitial()) {
    // on<OnTapConsultAcceptEvent>(_acceptAuditConsult);
    on<CheckConsultAcceptEvent>(_checkAccept);
    on<OnTapConfirmEvent>(_confirmConsult);
    on<OnTapDenyConsultEvent>(_denyAuditTest);
  }

  /*_acceptAuditConsult(OnTapConsultAcceptEvent event,Emitter emit)async{
    emit(LoadingAcceptAuditConsultState());
    final String? accepted = await storage.read(key: 'acceptedAuditConsultList');
    Set<String> acceptedList={};
    if(accepted!=null){
      acceptedList=accepted.split(',').toSet();
    }
    acceptedList.remove('');
    acceptedList.add(event.auditTestId);
    await storage.write(
        key: 'acceptedAuditConsultList', value: acceptedList.toString().replaceAll('{','').replaceAll('}', '').replaceAll(' ', ''));
    emit(const AcceptedAuditConsultState());
  }*/

  _confirmConsult(OnTapConfirmEvent event,Emitter emit)async{
    emit(LoadingAcceptAuditConsultState());
    final either=await confirmAuditConsultUseCase.call(event.auditTestId);
    either.fold((error) => emit(ErrorAcceptAuditConsultState(error: error)), (auditConsult){
      emit(const /*LoadedConfirmAuditConsultState()*/AcceptedAuditConsultState());
    });
  }

  _denyAuditTest(OnTapDenyConsultEvent event,Emitter emit)async{
    emit(LoadingAcceptAuditConsultState());
    final either=await denyAuditConsultUseCase.call(event.consultId);
    either.fold((error) => emit(ErrorAcceptAuditConsultState(error: error)), (auditTestList){
      emit(const LoadedDenyAuditConsultState());
    });
  }

  _checkAccept(CheckConsultAcceptEvent event,Emitter emit)async{
    emit(LoadingAcceptAuditConsultState());
    /*final String? accepted = await storage.read(key: 'acceptedAuditConsultList');
    Set<String> acceptedList={};
    if(accepted!=null){
      acceptedList=accepted.split(',').toSet();
    }
    print(acceptedList.toString());
    acceptedList.remove('');*/
    print('audit id is ${event.auditId}');
    if(event.auditId!='null'){
      emit(const AcceptedAuditConsultState());
    }else{
      emit(const NewAuditConsultState());
    }
  }
}
