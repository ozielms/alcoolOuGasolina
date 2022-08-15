/*
  Este arquivo é o layout criado por mim.
  O layout funcional criado pelo professor Jamiltom Damasceno está em home.
*/

import 'package:flutter/material.dart';

class alcoolOuGasolina extends StatefulWidget {
  const alcoolOuGasolina({super.key});

  @override
  State<alcoolOuGasolina> createState() => _alcoolOuGasolinaState();
}

class _alcoolOuGasolinaState extends State<alcoolOuGasolina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Álcool ou Gasolina".toUpperCase()),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço Alcool, ex: 1.59"),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço Gasolina, ex: 3.15"),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: ElevatedButton(
                    child: Text("Calcular"),
                    onPressed: () {
                      print("Botão Pressionado");
                    }),
              )
            ],
          ),
        ));
  }
}
