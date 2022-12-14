import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technical_task/data/constants.dart';
import 'package:technical_task/data/exception.dart';
import 'package:technical_task/data/models/exhibit.dart';

abstract class RemoteDataSource {
  Future<List<Exhibit>> getExhibitList();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<Exhibit>> getExhibitList() async {
    final response = await client.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      return List<Exhibit>.from(responseBody.map((item) => Exhibit.fromJson(item)));
    } else {
      throw ServerException();
    }
  }
}