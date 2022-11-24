import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService{
  final String url;

  HttpService(this.url);

Future<dynamic> getData() async {
    var response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200){
      final json = jsonDecode(response.body);
      return json['data'];

    }
    return throw Exception('error ${response.body}');
    

}

}