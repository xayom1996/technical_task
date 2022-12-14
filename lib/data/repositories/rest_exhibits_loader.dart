import 'package:dartz/dartz.dart';
import 'package:technical_task/data/datasources/remote_data_source.dart';
import 'package:technical_task/data/exception.dart';
import 'package:technical_task/data/failure.dart';
import 'package:technical_task/data/models/exhibit.dart';
import 'package:technical_task/data/repositories/exhibits_loader.dart';

class RestExhibitsLoader implements ExhibitsLoader {
  final RemoteDataSource remoteDataSource;

  RestExhibitsLoader({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Exhibit>>> getExhibitList() async {
    try {
      final result = await remoteDataSource.getExhibitList();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }
}