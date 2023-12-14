import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salty_project/common/FormSubmissionStatus.dart';
import 'package:salty_project/repository/LoginRepository.dart';
import 'package:salty_project/ui/login/bloc/LoginState.dart';

import 'LoginEvent.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final LoginRepository? loginRepo;

  LoginBloc({this.loginRepo}):super(const LoginState()){
    on<LoginEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    // Update Email
    if(event is LoginEmailChanged){
      emit(state.copyWith(email: event.email));
    }

    // Update Password
    else if(event is LoginPasswordChanged){
      emit(state.copyWith(password: event.password));
    }

    //Form Submitted
    else if(event is LoginSubmitted){
      emit(state.copyWith(formStatus: FormSubmitting()));

      try{
        var response = await loginRepo?.login(state.email, state.password);
        emit(state.copyWith(formStatus: SubmissionSuccess(response!?"Login Success":"Login Gagal")));
      }catch (e){
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }

  }



}