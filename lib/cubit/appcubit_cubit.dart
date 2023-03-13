import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/shared%20prefrences.dart';
import 'package:meta/meta.dart';
part 'appcubit_state.dart';

class AppcubitCubit extends Cubit<AppcubitState> {
  static AppcubitCubit get(context) => BlocProvider.of(context);

  AppcubitCubit() : super(AppcubitInitial());
  bool isdark = false;

  void ChangeApppMode({bool? formshare}) {
    if (formshare != null) {
      isdark = formshare;
      emit(ChangeMode());
    }
    else {
      isdark = !isdark;
      shareprefrence.putdata(key: 'isdark', value: isdark).then((value) =>
          emit(ChangeMode()));
    }
  }
}
