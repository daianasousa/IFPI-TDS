import 'package:flutter/material.dart';
import 'package:projetofinal/pages/tela_listar_contato.dart';
import 'package:projetofinal/pages/user_form.dart';

class DadosPage extends StatefulWidget {
   @override
  _DadosPageState createState() => _DadosPageState();
}

class _DadosPageState extends State<DadosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos', style: TextStyle(fontSize: 26)),
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
                width: 150,
                height: 150,
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(
                height: 270,
              ),
              ButtonTheme(
              height: 70,
              minWidth: 140,
              buttonColor: Colors.orange,
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserForm()),);
                },
                child: Text("Cadastrar Contato", style: TextStyle(fontSize: 25, color: Colors.white),),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserList()),);
                },
                child: Text("Listar Contatos", style: TextStyle(fontSize: 25, color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}