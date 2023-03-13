import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/modules/siences.dart';
import 'package:untitled/modules/sports.dart';
import '../modules/business.dart';
import '../dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'newcubit_state.dart';

class NewcubitCubit extends Cubit<NewcubitState> {
  NewcubitCubit() : super(NewcubitInitial());
  static NewcubitCubit get(context) => BlocProvider.of(context);
  int current=0;
  List<BottomNavigationBarItem> bottom=[
    BottomNavigationBarItem(icon: Icon(Icons.business_sharp,),
      label: 'business',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.sports_bar,),
      label: 'sport',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.science,),
      label: 'seince',
    ),
  ];

  List<Widget>screans=[busines(),sports(),siences()];
  void changenavigator(int index){
    current=index;
    if(index==1)
      getsport();
    if (index==2)
      getsience();
    emit(OtherState());
  }
  List<dynamic> business=[];
  void getsbusiness(){
    emit(NewsBusinessLoading());
    DioHelper.getdata(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey':'eaaa4e411fc94976bbace7098261c2f2', //a6efe67bc3564f539b6fdbdf9a830574
      },
    ).then((value) {
      print(value);
      business=value.data['articles'];
      emit(NewsBusinessSuccess());
    }).catchError((error) {
      print('error when bring data ${error.toString()}');
      emit(NewsBusinessError(error.toString()));
    });

  }

  List<dynamic> sport=[];
  void getsport(){
    emit(NewsSportLoading());
    DioHelper.getdata(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'sports',
        'apiKey':'eaaa4e411fc94976bbace7098261c2f2', //a6efe67bc3564f539b6fdbdf9a830574
      },
    ).then((value) {
      sport=value.data['articles'];
      emit(NewsSportSuccess());
    }).catchError((error) {
      print('error when bring data ${error.toString()}');
      emit(NewsSportError(error.toString()));
    });

  }

  List<dynamic> sience=[];
  void getsience(){
    emit(NewsSienceLoading());
    DioHelper.getdata(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'science',
        'apiKey':'eaaa4e411fc94976bbace7098261c2f2', //a6efe67bc3564f539b6fdbdf9a830574
      },
    ).then((value) {
      sience=value.data['articles'];
      emit(NewsSienceSuccess());
    }).catchError((error) {
      print('error when bring data ${error.toString()}');
      emit(NewsSienceError(error.toString()));
    });
  }


  List<dynamic> search=[];
  void getsearch(String value){
    emit(newssearchloading());
    DioHelper.getdata(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey':'4a366d18818b40d1bdbd1321c8502640',
      },
    ).then((value) {
      search=value.data['articles'];
      emit(newssearchsuccess());
    }).catchError((error) {
      print('error when bring data ${error.toString()}');
      emit(newsearcheerror(error.toString()));
    });
  }
}
