import 'package:flutter/material.dart';
import 'package:projetofinal/pages/mapa.dart';
import 'package:projetofinal/pages/tela_cadastro.dart';

class ContatoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      home: ContatoPage(),
    );
  }
}

class ContatoPage extends StatefulWidget {
  @override
  _ContatoPageState createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App de Contatos', style: TextStyle(fontSize: 28)),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 30),
                width: 170,
                height: 170,
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(
                height: 240,
              ),
              ButtonTheme(
              height: 70,
              minWidth: 140,
              buttonColor: Colors.orange,
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DadosPage()),);
                },
                child: Text("Ir para Contatos", style: TextStyle(fontSize: 25, color: Colors.white),),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              ButtonTheme(
              height: 70,
              minWidth: 140,
              buttonColor: Colors.orange,
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MeuMapa()),);
                },
                child: Text("Consultar Mapa", style: TextStyle(fontSize: 25, color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}