import 'package:bytebank/components/field.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _titleAppBar = "Nova transferência";
const _labelFieldAccountNumber = "Número da conta";
const _hintFieldAccountNumber = "000";
const _labelFieldValue = "Valor";
const _hintFieldValue = "000";
const _confirm = "Confirmar";

class FormTransfer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormTransferState();
  }
}

class FormTransferState extends State<FormTransfer> {
  final TextEditingController _controllerFieldAccountNumber =
      TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Field(
              controller: _controllerFieldAccountNumber,
              label: _labelFieldAccountNumber,
              hint: _hintFieldAccountNumber,
            ),
            Field(
              controller: _controllerFieldValue,
              label: _labelFieldValue,
              hint: _hintFieldValue,
              icon: Icons.attach_money,
            ),
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              child: Text(_confirm),
              onPressed: () {
                _createTransfer(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Create transfer
  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_controllerFieldAccountNumber.text);
    final double value = double.tryParse(_controllerFieldValue.text);

    if (accountNumber != null && value != null) {
      final createdTransfer = Transfer(value, accountNumber);
      Navigator.pop(context, createdTransfer);
    } else {
//      Scaffold.of(context).showSnackBar(
//        SnackBar(
//          backgroundColor: Colors.red,
//          content: Text(
//            'Verifique os dados informados!',
//            textAlign: TextAlign.center,
//          ),
//        ),
//      );
    }
  }
}
