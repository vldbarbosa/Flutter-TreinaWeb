import 'package:flutter/material.dart';

// Classe do Aplicativo
class TreinaWebFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'TreinaWeb Flutter',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new PaginaPrincipalPage(),
    );
  }
}

class PaginaPrincipalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _PaginaPrincipalState();
}

// Página Principal
class _PaginaPrincipalState extends State<PaginaPrincipalPage>{
  double _n1 = 0.0, _n2 = 0.0, _resultadoAdicao = 0.0, _resultadoSubtracao = 0.0;

  void _setN1(String valor){
    setState(() {
      try {
        _n1 = double.parse(valor);
        _resultadoAdicao = _n1 + _n2;
        _resultadoSubtracao = _n1 - _n2;
      } catch(ex){
        _n1 = 0.0;
        _resultadoAdicao = _n1 + _n2;
        _resultadoSubtracao = _n1 - _n2;
      }
    });
  }

  void _setN2(String valor){
    setState(() {
      try {
        _n2 = double.parse(valor);
        _resultadoAdicao = _n1 + _n2;
        _resultadoSubtracao = _n1 - _n2;
      } catch(ex){
        _n2 = 0.0;
        _resultadoAdicao = _n1 + _n2;
        _resultadoSubtracao = _n1 - _n2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('TreinaWeb - Flutter'),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(labelText: 'Primeiro Número'),
              keyboardType: TextInputType.number,
              onChanged: (valor) {
                _setN1(valor);
              },
            ),
            new TextField(
              decoration: new InputDecoration(labelText: 'Segundo Número'),
              keyboardType: TextInputType.number,
              onChanged: (valor) {
                _setN2(valor);
              },
            ),
//            new RaisedButton(
//                child: new Text('Calcular'),
//                onPressed: () {
//                  double adicao = _n1 + _n2;
//                  double subtracao = _n1 - _n2;
//                  showDialog(
//                      context: context,
//                      builder: (context) => new AlertDialog(
//                            title: new Text('Resultados'),
//                            content: new Text(
//                                'Adição: $adicao \nSubtracao: $subtracao'),
//                          ));
//                }),
          new Text(
            'Adição: $_resultadoAdicao\nSubtração: $_resultadoSubtracao',
            style: new TextStyle(
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          ],
        ),
      ),
    );
  }
}
void main() => runApp(new TreinaWebFlutterApp());