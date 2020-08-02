import 'package:flutter/material.dart';
import 'package:imovelapp/cadastroimovel.dart';
import 'package:imovelapp/sidemenu-menu.dart';
import 'package:imovelapp/singup.dart';
import 'package:imovelapp/resetpasswordpage.dart';
import 'package:imovelapp/cadastroimovel.dart';
import 'package:imovelapp/menu.dart';
import 'package:imovelapp/contatos.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'NOME DO APLICATIVO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'COLOCAR AQUI O NOME DO APLICATIVO'),

    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              //Se is password for true, usa passwordcontrolle senão username controller
              controller:
                  isPassword ? _passwordController : _userNameController,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return ButtonTheme(
        minWidth: MediaQuery.of(context).size.width,
        height: 80.0,
        child: RaisedButton(
          color: Color(0xfffb8c00),
          onPressed: () => {
            tryLogin(),
          },
          child: Text('Entrar', style: TextStyle(color: Colors.blueAccent)),
        ));
  }

  Future<void> tryLogin() async {
    var password = _passwordController.text;
    var userName = _userNameController.text;

  var headers = {
      "content-type": "application/json",
      "accept": "application/json",
    };

    bool userCanLogin = false;

    String data = '{"login": "$password", "accessKey": "$userName"}';

    print(data);

    var resp = await http.post(GLOBAL_VARIABLES["API_URL"] + "/Login/v1",
        body: data, headers: headers);

    final body = jsonDecode(resp.body);
  
    print(body);

   if (body["autenticated"] == true) {
      userCanLogin = true;
    }

    if (userCanLogin) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Menu()),
      );
    } else {
      // set up the button
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Ops..."),
            content: Text("Verifique seu login ou sua senha."),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {},
              )
            ],
          );
        },
      );
    }

  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Não possui uma conta?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResetPasswordPage()));
            },
            child: Text(
              'Registrar',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Image(image: AssetImage('assets/logoimg.png'));
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email id"),
        _entryField("Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: SizedBox(),
                ),
                _title(),
                SizedBox(
                  height: 50,
                ),
                _emailPasswordWidget(),
                SizedBox(
                  height: 20,
                ),
                _submitButton(),
                Container(
                  height: 40,
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                      child: Text(
                        "Recuperar Senha",
                        textAlign: TextAlign.right,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPasswordPage(),
                          ),
                        );
                      }),
                ),
                _divider(),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _createAccountLabel(),
          )        ],
      ),
    )));
  }
}
