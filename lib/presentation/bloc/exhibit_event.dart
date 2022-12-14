part of 'exhibit_bloc.dart';

abstract class ExhibitEvent extends Equatable {
  const ExhibitEvent();

  @override
  List<Object?> get props => [];
}

class OnGetExhibitList extends ExhibitEvent {}
