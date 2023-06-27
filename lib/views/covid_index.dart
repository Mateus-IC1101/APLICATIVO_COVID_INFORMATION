import 'package:app_loja/http_service/http_covid_service.dart';
import 'package:app_loja/model/estados.dart';
import 'package:app_loja/views/covid_list_tile.dart';
import 'package:flutter/material.dart';

class CovidIndex extends StatefulWidget {
  const CovidIndex({super.key});

  @override
  State<CovidIndex> createState() => _CovidIndexState();
}

class _CovidIndexState extends State<CovidIndex> {
  List<Estado> estados_all = [];
  @override
  initState() {
    super.initState();
    apiCovid();
  }

  Future apiCovid() async {
    try {
      estados_all = await HttpCovidService().getData();
      setState(() {});
    } catch (e) {
      return e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Covid Informações")),
        body: estados_all.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: estados_all.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Color.fromARGB(255, 255, 255, 254),
                      child: Center(
                        child: CovidListTile(
                          estado: estados_all[index],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 2,
                    );
                  },
                ),
                onRefresh: apiCovid));
  }
}
