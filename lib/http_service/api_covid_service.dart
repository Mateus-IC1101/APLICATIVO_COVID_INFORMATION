import 'package:app_loja/data/estado_repository.dart';
import 'package:app_loja/http_service/http_service.dart';
import 'package:app_loja/model/estados.dart';
import 'dart:convert';

void main() async {
  final json = await ApiCovidService._response;
  final List<dynamic> estados = await json;

  estados.forEach((element) {
    final Estado estado = Estado(
        element['uid'],
        element['uf'],
        element['cases'],
        element['deaths'],
        element['suspects'],
        element['refuses'],
        element['update']);
    ApiCovidService.create(estado);
  });

}

class ApiCovid {
  
  final _response =
      HttpService('https://covid19-brazil-api.vercel.app/api/report/v1')
          .getData();

  create(object) {
    estados_repository = object;
  }

  List<Estado> all() {
    // estados_repository.forEach((element) => print(element));
    return estados_repository;
  }
}

final ApiCovid ApiCovidService = ApiCovid();
