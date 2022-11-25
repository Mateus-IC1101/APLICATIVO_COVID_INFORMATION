import 'dart:convert';
import 'package:app_loja/model/estados.dart';
import 'package:http/http.dart' as http;

class HttpCovidService{
  
  final String url = 'https://covid19-brazil-api.now.sh/api/report/v1';

    Future<List<Estado>> getData() async {

    List<Estado> list = []; 
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200){

      final json = jsonDecode(response.body);
      var estados = await json['data'];
      
      estados.forEach((element)  {
          final Estado estado = Estado(
              element['uid'] ?? '',
              element['uf'] ?? '',
              element['cases'] ?? '',
              element['deaths'] ?? '',
              element['suspects'] ?? '',
              element['refuses'] ?? '',
              element['update'] ?? ''
              );
          list.add(estado);
        });
      print('total');
      print(list.length);
      return list;
    }
    return list;
    
}

}