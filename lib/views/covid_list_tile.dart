import 'package:app_loja/model/estados.dart';
import 'package:flutter/material.dart';

class CovidListTile extends StatefulWidget {
  final estado;

  CovidListTile({super.key, required this.estado});

  @override
  State<CovidListTile> createState() => _CovidListTileState();
}

class _CovidListTileState extends State<CovidListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 7, 184, 60),
          child: Text(
            widget.estado.uf.toString(),
            style: TextStyle(color: Colors.black),
          ),
        ),
        title: Text(widget.estado.state.toString()),
        subtitle: Container(
          width: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Atualização: ' + widget.estado.datetime.toString()),
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('casos: ' + widget.estado.cases.toString()),
                      Text('suspeitos: ' + widget.estado.suspects.toString()),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('mortes:' + widget.estado.deaths.toString()),
                        Text('recusados: ' + widget.estado.refuses.toString()),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text('mortes:' + widget.estado.deaths.toString()),
                      // Text('recusados:' + widget.estado.refuses.toString()),
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text('casos:' + widget.estado.cases.toString()),
                  //       Text('suspeitos:' + widget.estado.suspects.toString()),
                  //     ],
                  //   ),
                  // )
                ],
              )
            ],
          ),
        ),
        enabled: true,
        onTap: () {});
  }
}
