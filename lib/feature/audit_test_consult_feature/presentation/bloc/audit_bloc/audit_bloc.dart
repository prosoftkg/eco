import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_kg/core/use_case/use_case.dart';
import 'package:eco_kg/feature/audit_test_consult_feature/domain/entities/audit_consult_list_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../domain/entities/audit_test_list_entity.dart';
import '../../../domain/use_case/audit_consult_list_use_case.dart';
import '../../../domain/use_case/audit_test_list_use_case.dart';
part 'audit_event.dart';
part 'audit_state.dart';

class AuditBloc extends Bloc<AuditEvent, AuditState> {
  final AuditTestListUseCase auditTestListUseCase;
  final AuditConsultListUseCase auditConsultListUseCase;
  final storage = const FlutterSecureStorage();
  AuditBloc({required this.auditTestListUseCase,required this.auditConsultListUseCase}) : super(AuditInitial()) {
    on<AuditTestListEvent>(_auditTestList);
    on<AuditConsultListEvent>(_auditConsultList);
  }

  _auditTestList(AuditTestListEvent event,Emitter emit)async{
    emit(LoadingAuditState());
    final either=await auditTestListUseCase.call(NoParams());
    either.fold((error) => emit(ErrorAuditState(error: error)), (auditTestList){
      emit(LoadedAuditTestListState(auditTestList: auditTestList));
    });
  }

  _auditConsultList(AuditConsultListEvent event,Emitter emit)async{
    emit(LoadingAuditState());
    final either=await auditConsultListUseCase.call(NoParams());
    either.fold((error) => emit(ErrorAuditState(error: error)), (auditConsultList){
      emit(LoadedAuditConsultListState(auditConsultList: auditConsultList));
    });
  }

  /*_acceptAuditTest(AcceptAuditTestEvent event,Emitter emit)async{
    final String? accepted = await storage.read(key: 'acceptedAuditTestList');
    Set<String> acceptedList={};
    if(accepted!=null){
      acceptedList=accepted.split(',').toSet();
    }
    acceptedList.remove('');
    emit(LoadedAuditTestListState(auditTestList: event.auditTestList, acceptList: acceptedList.toList()));
  }*/
}
