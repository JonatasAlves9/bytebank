import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Adicionar Transferência'),
        ),
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  labelText: 'Numero da conta',
                  hintText: '0000',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Numero da conta',
                  hintText: '0000',
                ),
              ),
            ),
            ElevatedButton(style: style, onPressed: () {}, child: Text('Confirmar'))
          ],
        ));
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: 'Adicionar Transferência',
        onPressed: () {},
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: Column(children: <Widget>[
        ItemTransferencia(Transferencia(100.0, 100)),
        ItemTransferencia(Transferencia(200.0, 100)),
        ItemTransferencia(Transferencia(300.0, 100)),
      ]),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}
