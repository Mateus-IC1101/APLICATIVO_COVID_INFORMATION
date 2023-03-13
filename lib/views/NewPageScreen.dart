import 'package:flutter/material.dart';

class newPageTeste extends StatefulWidget {
  final texto;
  const newPageTeste({super.key, required this.texto});

  @override
  State<newPageTeste> createState() => _newPageTesteState();
}

class _newPageTesteState extends State<newPageTeste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('----' + widget.texto.toString() + '----'),
    );
  }
}
