import 'package:app_loja/http_service/http_covid_service.dart';
import 'package:app_loja/views/NewPageScreen.dart';
import 'package:app_loja/views/covid_index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// void main() async {
//   runApp(ChangeNotifierProvider(
//       create: (context) => HttpCovidService().getData(),
//       child: MaterialApp(home: MyApp())));
// }
void main() async {
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
  int _index = 0;

  final List<Widget> _telas = [
    CovidIndex(),
    newPageTeste(texto: 'Tela 2'),
    newPageTeste(texto: 'Tela 3')
  ];

  onTabTapped(int i) {
    setState(() {
      _index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: onTabTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Gráficos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Leitura',
          ),
        ],
      ),
    );
  }
}
