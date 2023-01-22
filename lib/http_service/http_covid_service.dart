import 'dart:convert';
import 'dart:math';
import 'package:app_loja/model/estados.dart';
import 'package:http/http.dart' as http;

void main() async {
  final result = await HttpCovidService().getData();
  print(result);
}

class HttpCovidService {
  final String url = 'https://covid19-brazil-api.now.sh/api/report/v1';

  Future getData() async {
    // <List<Estado>>
    List<Estado> list = [];
    var response = await http.get(Uri.parse(url));

    try {
      final json = jsonDecode(response.body);
      var json_data = await json['data'];

      json_data.forEach((element) {
        final Estado estado = Estado.fromJson(element);
        list.add(estado);
      });

      return list;
    } catch (e) {
      return Exception(e);
    }
  }
}
