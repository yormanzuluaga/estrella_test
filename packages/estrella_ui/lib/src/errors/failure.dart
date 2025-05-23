import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class GeneralFailure extends Failure {
  GeneralFailure(this.msg);
  final String msg;
}
