import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/appcubit_cubit.dart';
import 'package:untitled/cubit/newcubit_cubit.dart';
import 'news layout.dart';
class  MyApp extends StatelessWidget {
  final bool? isdark;

  MyApp({this.isdark});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      MultiBlocProvider(providers: [
        BlocProvider(create: (context) => NewcubitCubit()..getsbusiness()),
        BlocProvider(create: (context) => AppcubitCubit()..ChangeApppMode(formshare: isdark))],

          child:
          BlocConsumer<AppcubitCubit, AppcubitState>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primarySwatch: Colors.orange,
                    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                        type: BottomNavigationBarType.fixed,
                        selectedItemColor: Colors.orangeAccent),
                    scaffoldBackgroundColor: Colors.white,
                    appBarTheme: const AppBarTheme(
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.black12,
                      ),
                      color: Colors.orangeAccent,
                      elevation: 0.0,
                    )),
                darkTheme: ThemeData(
                  primarySwatch: Colors.orange,
                  appBarTheme: AppBarTheme(       systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                  ),),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.orangeAccent),
                  brightness: Brightness.dark,
                ),
                themeMode: AppcubitCubit.get(context).isdark? ThemeMode.dark : ThemeMode.light,
                home: NewLayout(),
              );
            },
          )
      );
  }

}