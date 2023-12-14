import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salty_project/repository/HomeRepository.dart';
import 'package:salty_project/ui/home/bloc/HomeBloc.dart';
import 'package:salty_project/ui/home/bloc/HomeEvent.dart';
import 'package:salty_project/ui/home/bloc/HomeState.dart';

import '../../common/FormSubmissionStatus.dart';
import '../widget/ShowSnackbar.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
          create: (context) => HomeBloc(homeRepo: context.read<HomeRepository>()),
          child: BlocBuilder<HomeBloc, HomeState>(
           builder: (context, state){
             if(state.dataStatus == const InitialFormStatus()){
               context.read<HomeBloc>().add(GetDataUser());
             }

             if(state.dataStatus == const LoadingFormStatus()){
               return const Center(child: CircularProgressIndicator());
             }else{
               return ListView.builder(
                   itemCount: state.userData?.length??0,
                   itemBuilder: (context, index){
                     var imageUrl = state.userData?[index].avatar??"";
                     return Card(
                       child: Center(
                         child: Row(
                           children: [
                             Container(child: Image.network(imageUrl)),
                             SizedBox(width: 10),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Name : ${state.userData?[index].firstName??""} ${state.userData?[index].lastName??""}"),
                                 Text("Email : ${state.userData?[index].email??""}"),
                               ],
                             ),
                           ],
                         ),
                       ),
                     );
                   });
             }
    })
      ));
  }
}
