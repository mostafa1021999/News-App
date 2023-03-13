import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/newcubit_cubit.dart';
import '../componants/componants.dart';

class search extends StatelessWidget {
  var searchcontroll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewcubitCubit, NewcubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list= NewcubitCubit.get(context).search;
        return Scaffold(
            appBar: AppBar(elevation: 0,),
            body: Column(
                children: [ Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    onChanged: (value) {
                      NewcubitCubit.get(context).getsearch(value);
                    },
                    controller: searchcontroll,
                    decoration: InputDecoration(label: Text('search'),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),

                    Expanded( child : !NewcubitCubit.get(context).search.isEmpty ? ListView.separated(itemBuilder:(context, index) => BuildArtical(context,list[index]),
                      separatorBuilder:(context, index)=> Seperate() ,
                      itemCount: NewcubitCubit.get(context).search.length>10 ?10 :NewcubitCubit.get(context).search.length,
                      physics: BouncingScrollPhysics(),
                    ): Text('No News Found'))   ,
                ]
            )
        );
      },
    );
  }
}
