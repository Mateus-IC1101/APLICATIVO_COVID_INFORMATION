import 'package:app_loja/data/estado_repository.dart';
import 'package:app_loja/http_service/http_covid_service.dart';
import 'package:app_loja/model/estados.dart';
import 'package:app_loja/views/covid_index.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp (MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   
  @override
  Widget build(BuildContext context) {
    return CovidIndex();
  }
}
