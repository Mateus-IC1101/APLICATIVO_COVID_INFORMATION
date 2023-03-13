import 'package:app_loja/model/estados.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CovidListTile extends StatefulWidget {
  final estado;

  CovidListTile({super.key, required this.estado});

  @override
  State<CovidListTile> createState() => _CovidListTileState();
}

class _CovidListTileState extends State<CovidListTile> {
  @override
  formatarData(String data) {
    final data_formatada = data.substring(0, 10).split('-');
    return data_formatada[2] +
        '/' +
        data_formatada[1] +
        '/' +
        data_formatada[0] +
        ' ' +
        ' ' +
        data.substring(11, 19);
  }

  formatarNumeros(String n) {
    var formatacao = NumberFormat('###,###,###,###,###,###');
    var numero_formatado = formatacao.format(double.parse(n));
    var numero_array = numero_formatado.split(',');
    var tamanho = numero_array.length;
    String numero_final = '';
    int index_bug = 0;
    numero_array.forEach((element) {
      if (index_bug > 0) {
        numero_final = numero_final + '.' + element.toString();
        return;
      }
      numero_final = element.toString();
      index_bug += 1;
    });
    return numero_final;
  }

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
                    Text('Atualização: ' +
                        formatarData(widget.estado.datetime.toString())),
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('casos: ' +
                          formatarNumeros(widget.estado.cases.toString())),
                      Text('suspeitos: ' +
                          formatarNumeros(widget.estado.suspects.toString())),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('mortes:' +
                            formatarNumeros(widget.estado.deaths.toString())),
                        Text('recusados: ' +
                            formatarNumeros(widget.estado.refuses.toString())),
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
