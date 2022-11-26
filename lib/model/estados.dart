import 'package:app_loja/data/estado_repository.dart';

class Estado{
  final int uid;
  final String uf;
  final String state;
  final int cases;
  final int deaths;
  final int suspects;
  final int refuses;
  final String datetime;

  Estado(this.uid, this.uf, this.state, this.cases, this.deaths, this.suspects, this.refuses, this.datetime);


  factory Estado.fromJson(Map json){
    return Estado(
      json['uid'] ?? '',
      json['uf'] ?? '',
      json['state'] ?? '',
      json['cases'] ?? '',
      json['deaths'] ?? '',
      json['suspects'] ?? '',
      json['refuses'] ?? '',
      json['datetime'] ?? ''
    );
  }

  // Map toJson(){
  //   return {
  //     'uid': uid,
  //     'uf': uf,
  //     'state': state,
  //     'cases': cases,
  //     'deaths': deaths,
  //     'suspects': suspects,
  //     'refuses': refuses,
  //     'datetime': datetime
  //   };
  // }
  
}
