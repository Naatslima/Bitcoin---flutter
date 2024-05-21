// https://www.blockchain.com/ticker;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: Bitcoin(),
  ));
}

class Bitcoin extends StatefulWidget {
  const Bitcoin({Key? key}) : super(key: key);

  @override
  _BitcoinState createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {
  var preco = "0";
  Future<void> recuperarPreco() async {
    var url = Uri.parse("https://www.blockchain.com/ticker");
    http.Response response = await http.get(url);
    Map<String, dynamic> retorno = jsonDecode(response.body);
    setState(() {
      preco = retorno['BRL']['buy'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("imagem/bitcoin.png"),
            Text(
              preco,
              style: TextStyle(fontSize: 40),
            ),
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: recuperarPreco,
                child: Text(
                  "Atualizar",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}
