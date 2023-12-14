import 'package:equatable/equatable.dart';
import 'package:salty_project/model/UserModel.dart';

import '../../../common/FormSubmissionStatus.dart';

class HomeState extends Equatable{

  const HomeState({
    this.userData,
  this.dataStatus = const InitialFormStatus()
  });

  final List<UserModel>? userData;
  final FormSubmissionStatus? dataStatus;

  HomeState copyWith({List<UserModel>? userModel, FormSubmissionStatus? dataStatus}) {
    return HomeState(
      userData: userModel ?? this.userData,
      dataStatus: dataStatus ?? this.dataStatus,
    );
  }

  @override
  List<Object?> get props => [userData, dataStatus];
}