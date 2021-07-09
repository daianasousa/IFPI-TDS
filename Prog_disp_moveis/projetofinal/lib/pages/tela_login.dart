import 'package:flutter/material.dart';
import 'package:projetofinal/pages/tela_contatos.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
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
                  height: 60,
                ),
                TextField(

                  onChanged: (text){
                    email = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                TextField(
                  onChanged: (text){
                    senha = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 18,
                ), 
                ButtonTheme( 
                  height: 50.0,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5)),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      if (email == 'daianasousa04121996@gmail.com' && 
                      senha == '1234'){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ContatoPage()),);
                      }else{
                        showDialog(
                          context: context, 
                          builder: (context) => AlertDialog(
                            title: Text("Dados inválidos!"),
                            content: Text("Usuário ou Senha inválidos!"),
                            actions: <Widget>[
                              // ignore: deprecated_member_use
                              FlatButton(
                                child: Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }, 
                              ),
                            ],
                          )
                        );
                      }
                  },
                  child: Text('Entrar', style: TextStyle(color: Colors.white, fontSize: 22)),
                  color: Colors.orange, 
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}