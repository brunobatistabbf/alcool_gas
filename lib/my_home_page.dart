import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _alcoolController = TextEditingController();
  final TextEditingController _gasController = TextEditingController();

  String resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Álcool VS Gasolina"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _alcoolController.text = '';
                  _gasController.text = '';
                  resultado = "";
                });
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Container(
                  width: 200,
                  height: 200,
                  child: const Image(
                    image: AssetImage("images/defaul_image.png"),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextField(
                  controller: _alcoolController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Valor do Álcool",
                    prefix: Text("R\$"),
                    labelStyle: TextStyle(color: Colors.green),
                    suffixIcon: Icon(Icons.monetization_on),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextField(
                  controller: _gasController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Valor da Gasolina",
                    prefix: Text("R\$"),
                    labelStyle: TextStyle(color: Colors.green),
                    suffixIcon: Icon(Icons.monetization_on),
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 50,
                child: ElevatedButton(
                    child: const Text(
                      "Calcular",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      double vAlcool = double.parse(
                        _alcoolController.text.toString(),
                      );
                      double vGas = double.parse(
                        _gasController.text.toString(),
                      );

                      double relacao = vAlcool / vGas;

                      setState(() {
                        if (relacao <= 0.7) {
                          resultado = "Enche de álcool";
                        } else
                          resultado = "Enche de gasolina";
                      });
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Text(
                  resultado,
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}
