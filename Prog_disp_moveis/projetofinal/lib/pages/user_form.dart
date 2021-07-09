import 'package:flutter/material.dart';
import 'package:projetofinal/models/user.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user){
    if(user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['matricula'] = user.matricula;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user  = ModalRoute.of(context).settings.arguments;

    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Usuario', style: TextStyle(fontSize: 26)),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save), 
            onPressed: () {
              final isValid = _form.currentState.validate();
              if (isValid){
                _form.currentState.save();
                Navigator.of(context).pop();
              }
            }
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                // ignore: missing_return
                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return 'Nome inválido';
                  }
                  if (value.trim().length < 3){
                    return 'Nome muito pequeno. No minimo 3 letras.';
                  }
                },
                onSaved: (value) => _formData['name'] = value, 
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(labelText: 'E-mail'),
                onSaved: (value) => _formData['email'] = value, 
              ),
              TextFormField(
                initialValue: _formData['matricula'],
                decoration: InputDecoration(labelText: 'Matricula'),
                onSaved: (value) => _formData['matricula'] = value, 
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value, 
              ),
            ],
          ),
        ),
      ),
    );
  }
}