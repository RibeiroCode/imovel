import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imovelapp/menu.dart';
import 'package:imovelapp/sidemenu-menu.dart';



class CadastroImovel extends StatelessWidget {
  final TextEditingController _controladorCEP = TextEditingController();
  final TextEditingController _controladorEndereco = TextEditingController();
  final TextEditingController _controladorNumero = TextEditingController();

  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfffb8c00),
           leading: IconButton  ( icon: Icon(Icons.list),
            onPressed:  () {
            Navigator.push(
                        context, 
                      MaterialPageRoute (
                        builder: (context) => SideMenu (),
          ) , ); } ),
          title: Text('Cadastrando produto',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ),
        body: 
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controladorCEP,
                decoration: InputDecoration(labelText: 'CEP'),
              ), 
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorNumero,
                  decoration: InputDecoration(labelText: 'Endereco'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorEndereco,
                  decoration: InputDecoration(labelText: 'Numero'),
                  keyboardType: TextInputType.number,
                ),
              ),
               Container ( child: Text ('ADICIONAR IMAGENS DE IMOVEIS', style:TextStyle (fontWeight:  FontWeight.bold, fontSize: (20))), color: Colors.red, margin: EdgeInsets.all (30),   ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RaisedButton(
                  child: Text('Cadastrar'),
                  onPressed: () {
                    final String CEP = _controladorCEP.text;
                    final int Endereco = int.tryParse(_controladorNumero.text);
                    final double Numero =
                        double.tryParse(_controladorEndereco.text);

                    final Produto produtoNovo = Produto(CEP, Endereco, Numero);
                    print(produtoNovo);
                  },
                  
                ),
              ),
            Stack( children: [
              Positioned (
                child: IconButton (icon: Icon ( Icons.arrow_back),
                onPressed: () {
                  Navigator.push (context, MaterialPageRoute (builder: (context) => Menu () ));
                }
              )
               ) ]
            )
            ],
          
             

          ),
          
        ),
        
      ),
      
    );
  }
}


class Produto {
  final String CEP;
  final int Endereco;
  final double Numero;

  Produto(
    this.CEP,
    this.Endereco,
    this.Numero,
  );

  @override
  String toString() {
    return 'Produto{CEP: $CEP, Endereco: $Endereco, Numero: $Numero}';
  }
  
}
