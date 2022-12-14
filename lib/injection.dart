import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:technical_task/data/datasources/remote_data_source.dart';
import 'package:technical_task/data/repositories/rest_exhibits_loader.dart';
import 'package:technical_task/presentation/bloc/exhibit_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => ExhibitBloc(locator()));

  // repository
  locator.registerLazySingleton<RestExhibitsLoader>(
        () => RestExhibitsLoader(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}