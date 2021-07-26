import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/Transfer.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Creating Transfer';

const _labelAccountField = 'Account number';
const _hintAccountField = '0000';

const _labelValueField = 'Value';
const _hintValueField = '0000';
const _iconValueField = Icons.monetization_on;

const _confirmTextButton = 'Confirm';

class TransferForm extends StatefulWidget {
  final TextEditingController _numberAccountFieldController =
      TextEditingController();
  final TextEditingController _valueFieldController = TextEditingController();

  void _createTransfer(context) {
    final int? accountNumber = int.tryParse(_numberAccountFieldController.text);
    final double? value = double.tryParse(_valueFieldController.text);
    if (accountNumber != null && value != null) {
      final transferCreated = Transfer(value, accountNumber);
      debugPrint('$transferCreated');
      Navigator.pop(context, transferCreated);
    }
  }

  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controller: widget._numberAccountFieldController,
                label: _labelAccountField,
                hint: _hintAccountField),
            Editor(
              controller: widget._valueFieldController,
              label: _labelValueField,
              hint: _hintValueField,
              icon: _iconValueField,
            ),
            ElevatedButton(
              child: Text(_confirmTextButton),
              onPressed: () => widget._createTransfer(context),
            )
          ],
        ),
      ),
    );
  }
}
