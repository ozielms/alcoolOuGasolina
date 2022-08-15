import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoresultado = "";

  void _calcular() {
    /* Tratativa para a separação decimal ser ponto(.) e não virgula(,).
    ! _controllerAlcool.text vem como String, por isso é preciso converter para double.
     podemos usar o parse ou o tryParse.
     parse: Se tiver algo errado, retorna um erro.
     tryParse: Se tiver algo de errado ele colocar o valor null.
  */

    var precoAlcool = double.tryParse(_controllerAlcool.text);
    var precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoresultado =
            "Número inválido! Digite números maiores que 0 e utilizando (.)";
      });
    } else {
      /*
      ? Se o preço do álcool dividido pelo preço da gasolina
      ? for >= 0.7 é melhor abastecer com gasolina.
      ? Senão é melhor utiliar álcool.
      */

      if (precoAlcool / precoGasolina >= 0.7) {
        setState(() {
          _textoresultado = "Melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _textoresultado = "Melhor abastecer com álcool";
        });
      }

      _limparCampos();
    }
  }

  void _limparCampos() {
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Color.fromARGB(255, 202, 202, 202),
      ),
      body: Container(
          color: Color.fromARGB(255, 226, 226, 226),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Image.asset("images/logo.png")),
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Saiba qual a melhor opção para abastecimento do seu carro",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço Alcool, ex: 4.59"),
                  style: TextStyle(fontSize: 22),
                  controller: _controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço Gasolina, ex: 5.99"),
                  style: TextStyle(fontSize: 22),
                  controller: _controllerGasolina,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          padding: EdgeInsets.all(15),
                          shadowColor: Colors.red,
                          textStyle: TextStyle(color: Colors.white)),
                      child: Text("Calcular", style: TextStyle(fontSize: 20)),
                      onPressed: _calcular),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _textoresultado,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
