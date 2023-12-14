
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salty_project/common/FormSubmissionStatus.dart';
import 'package:salty_project/repository/HomeRepository.dart';
import 'package:salty_project/ui/home/bloc/HomeEvent.dart';
import 'package:salty_project/ui/home/bloc/HomeState.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository? homeRepo;

  HomeBloc({this.homeRepo}) :super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(HomeEvent event, Emitter<HomeState> emit) async {
    if(event is GetDataUser){
      try{
        emit(state.copyWith(dataStatus: const LoadingFormStatus()));
        var response = await homeRepo?.getUserData();
        emit(state.copyWith(dataStatus: SubmissionSuccess("Success")));
        emit(state.copyWith(userModel: response));
      }catch(e){
        emit(state.copyWith(dataStatus: SubmissionFailed(e)));
      }
    }
  }
}