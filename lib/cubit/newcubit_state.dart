part of 'newcubit_cubit.dart';

@immutable
abstract class NewcubitState {}

class NewcubitInitial extends NewcubitState {}

class InitState extends NewcubitState {}

class OtherState extends NewcubitState{}

class NewsBusinessLoading extends NewcubitState{}

class NewsBusinessSuccess extends NewcubitState{}

class NewsBusinessError extends NewcubitState{
  final String error;
  NewsBusinessError(this.error);
}
class NewsSportLoading extends NewcubitState{}

class NewsSportSuccess extends NewcubitState{}

class NewsSportError extends NewcubitState{
  final String error;
  NewsSportError(this.error);
}

class NewsSienceLoading extends NewcubitState{}

class NewsSienceSuccess extends NewcubitState{}

class NewsSienceError extends NewcubitState{
  final String error;
  NewsSienceError(this.error);
}

class newssearchloading extends NewcubitState{}

class newssearchsuccess extends NewcubitState{}

class newsearcheerror extends NewcubitState{
  final String error;
  newsearcheerror(this.error);
}