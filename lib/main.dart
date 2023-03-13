import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/shared%20prefrences.dart';
import 'package:untitled/modules/my%20app.dart';

import 'dio/dio.dart';

Future<Null> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserver();
  DioHelper.init();
  await shareprefrence.inite();
  bool? isdark=shareprefrence.getdata(key: 'isdark');
 runApp(MyApp(isdark: isdark,)) ;
}





