import 'package:eco_kg/core/utils/user.dart';
import 'package:eco_kg/feature/user_cabinet_feature/domain/entities/userData.dart';
import 'package:eco_kg/feature/user_cabinet_feature/domain/entities/userDataForChangeLocal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:eco_kg/feature/user_cabinet_feature/domain/use_case/edit_user_data_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
part 'user_cabinet_event.dart';
part 'user_cabinet_state.dart';

class UserCabinetBloc extends Bloc<UserCabinetEvent, UserCabinetState> {
  final EditUserDataUseCase editUserDataUseCase;
  final storage = const FlutterSecureStorage();
  UserCabinetBloc({required this.editUserDataUseCase}) : super(UserCabinetInitial()) {
    on<EditUserDataEvent>(_editUserCabinet);
  }
  _editUserCabinet(EditUserDataEvent event,Emitter emit)async{
    emit(LoadingUserCabinetState());
    final either = await editUserDataUseCase.call(event.userDataForEdit);
    either
        .fold((error) => emit(const ErrorUserCabinetState(error: 'Вышла ошибка')),
            (active) {
          if (active == true){
            UserData.userDataChange(UserDataForChange(companyName: UserData.companyName ?? '', companyDirector: event.userDataForEdit.name, region: UserData.region ?? '', phone: event.userDataForEdit.phone));
            Fluttertoast.showToast(
                msg: "Данные изменены",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
            emit(SuccessfullyEditUserDataState());
          }
          else if(active==false) {
            emit(const ErrorUserCabinetState(error: 'Не удалось изменить'));
          }else{
            emit(const ErrorUserCabinetState(error: 'Ошибка'));
          }

        });
  }
}
