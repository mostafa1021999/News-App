import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:untitled/cubit/newcubit_cubit.dart';
import '../componants/componants.dart';

class sports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewcubitCubit,NewcubitState>(builder: (context,state){
      var list= NewcubitCubit.get(context).sport;
      return ConditionalBuilder(condition: state is! NewsSportLoading && list.length > 0,
          builder: (context)=> ListView.separated(itemBuilder:(context, index) => BuildArtical(context,NewcubitCubit.get(context).sport[index]),
            separatorBuilder:(context, index)=> Seperate() ,
            itemCount: 10,
            physics: BouncingScrollPhysics(),
          ),
          fallback: (context)=> Center(child: CircularProgressIndicator(),));
    }, listener: (context, state) {

    });
  }
}
