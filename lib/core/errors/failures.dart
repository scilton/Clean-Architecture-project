import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
}

// Failures:

class OfflineFailure extends Failure{
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure{
  @override
  List<Object?> get props => [];
}

class EmptyCashFailure extends Failure{
  @override
  List<Object?> get props => [];
}

class WrongDataFailure extends Failure{
  @override
  List<Object?> get props => [];
}