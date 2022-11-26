import 'package:app_loja/http_service/http_covid_service.dart';
import 'package:app_loja/model/estados.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CovidIndex extends StatefulWidget {
  const CovidIndex({super.key});

  @override
  State<CovidIndex> createState() => _CovidIndexState();
}

class _CovidIndexState extends State<CovidIndex> {

  List<Estado> estados_all = [];
  @override
  initState(){
    super.initState();
    apiCovid();
  }

  Future apiCovid() async {
    try {
      estados_all = await HttpCovidService().getData();
      setState((){
      
      });
    } catch (e) {
      return e;
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos os usuários")
      ),
      body: ListView.builder(padding: const EdgeInsets.all(8),
  itemCount: estados_all.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      color: Colors.green,
      child: Center(child: Text('${estados_all[index].uf}')),
    );})
    );
  }
}