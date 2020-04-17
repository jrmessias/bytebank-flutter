// StatelessWidget - não modifica conteúdo
// StatefulWidget - modifica conteúdo
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

import 'form.dart';

const _titleAppBar = "Gerenciador financeiro";

class ListTransfer extends StatefulWidget {
  final List<Transfer> _transfers = List();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListTransferState();
  }
}

// Muda valor fica no State
// Não muda deixa no StatefulWidget
class ListTransferState extends State<ListTransfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];
          return ItemTransfer(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Adicionar",
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormTransfer();
          })).then(
            (createdTransfer) => _update(createdTransfer), // Update
          );
        },
      ),
    );
  }

  void _update(Transfer createdTransfer) {
    Future.delayed(Duration(seconds: 1), () {
      if (createdTransfer != null) {
        setState(() {
          widget._transfers.add(createdTransfer);
        });
      }
    });
  }
}

// Item Transfer
class ItemTransfer extends StatelessWidget {
  final Transfer _transfer;

  ItemTransfer(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}
