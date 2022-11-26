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
      leading: const Icon(Icons.flight_land),
      title: Text(widget.estado.uf.toString()),
      subtitle: Text(widget.estado.cases.toString()),
      enabled: true,
      onTap: () {}
);
  }
}