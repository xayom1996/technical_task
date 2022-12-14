import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:technical_task/data/models/exhibit.dart';
import 'package:technical_task/data/repositories/rest_exhibits_loader.dart';

part 'exhibit_event.dart';
part 'exhibit_state.dart';

class ExhibitBloc extends Bloc<ExhibitEvent, ExhibitState> {
  final RestExhibitsLoader _restExhibitsLoader;

  ExhibitBloc(this._restExhibitsLoader) : super(ExhibitInitial()) {
    on<OnGetExhibitList>((event, emit) async {
      emit(ExhibitLoading());

      final result = await _restExhibitsLoader.getExhibitList();
      result.fold(
            (failure) {
              emit(ExhibitError(failure.message));
            },
            (data) {
              emit(ExhibitFetched(data));
            },
      );
    });
  }
}
