import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:untitled/cubit/newcubit_cubit.dart';

import '../componants/componants.dart';

class siences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewcubitCubit,NewcubitState>(builder: (context,state){
      var list= NewcubitCubit.get(context).sience;
      return ConditionalBuilder(condition: state is! NewsSienceLoading&& list.length > 0,
          builder: (context)=> ListView.separated(itemBuilder:(context, index) => BuildArtical(context,NewcubitCubit.get(context).sience[index]),
            separatorBuilder:(context, index)=> Seperate() ,
            itemCount: 10,
            physics: BouncingScrollPhysics(),
          ),
          fallback: (context)=> Center(child: CircularProgressIndicator(),));
    }, listener: (context, state) {

    });
  }
}
