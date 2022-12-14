import 'package:dartz/dartz.dart';
import 'package:technical_task/data/failure.dart';
import 'package:technical_task/data/models/exhibit.dart';

abstract class ExhibitsLoader {
  Future<Either<Failure, List<Exhibit>>> getExhibitList();
}