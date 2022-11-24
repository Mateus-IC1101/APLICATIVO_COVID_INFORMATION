import 'package:app_loja/data/estado_repository.dart';
import 'package:app_loja/http_service/api_covid_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos os usuários")
      ),
      body: ListView.separated(
  padding: const EdgeInsets.all(8),
  itemCount: ApiCovidService.all().length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      color: Colors.green,
      child: Center(child: Text('Estado: ${ApiCovidService.all()[index].uf}}')),
    );
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
),
    );
  }
}
