part of 'exhibit_bloc.dart';

abstract class ExhibitState extends Equatable {
  const ExhibitState();

  @override
  List<Object?> get props => [];
}

class ExhibitInitial extends ExhibitState {
  @override
  List<Object> get props => [];
}

class ExhibitEmpty extends ExhibitState {}

class ExhibitLoading extends ExhibitState {}

class ExhibitError extends ExhibitState {
  final String message;

  const ExhibitError(this.message);

  @override
  List<Object?> get props => [message];
}

class ExhibitFetched extends ExhibitState {
  final List<Exhibit> result;

  const ExhibitFetched(this.result);

  @override
  List<Object?> get props => [result];
}


