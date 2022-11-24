import 'package:app_loja/data/estado_repository.dart';

class Estado{
  int? uid;
  String? uf;
  int? cases;
  int? deaths;
  int? suspects;
  int? refuses;
  String? update;

  Estado(this.uid, this.uf, this.cases, this.deaths, this.suspects, this.refuses, this.update);
  
}
