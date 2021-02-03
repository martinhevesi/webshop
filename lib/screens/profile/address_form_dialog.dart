import 'package:flutter/material.dart';
import 'package:webshop/l10n/webshop_localizations.dart';
import 'package:webshop/models/address.dart';

class AddressFormDialog extends StatefulWidget {
  @override
  _AddressFormDialogState createState() => _AddressFormDialogState();
}

class _AddressFormDialogState extends State<AddressFormDialog> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _houseNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Creates a dialog
    return SimpleDialog(
      backgroundColor: Colors.grey[900],
      title: Container(
        child: Text(WebshopLocalizations.of(context).addAddressDialogTitle, style: TextStyle(color: Colors.white, fontFamily: "Raleway"),),
        alignment: Alignment.center,
      ),
      contentPadding: EdgeInsets.all(10),
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white, fontFamily: "Raleway"),
                  labelText: WebshopLocalizations.of(context).city,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return WebshopLocalizations.of(context).mandatoryField;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _streetController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white, fontFamily: "Raleway"),
                  labelText: WebshopLocalizations.of(context).street,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return WebshopLocalizations.of(context).mandatoryField;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _houseNumberController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white, fontFamily: "Raleway"),
                  labelText: WebshopLocalizations.of(context).houseNumber,
                ),
                cursorColor: Colors.deepPurple,
                validator: (value) {
                  if (value.isEmpty) {
                    return WebshopLocalizations.of(context).mandatoryField;
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    textColor: Colors.redAccent[100],
                    child: Text(WebshopLocalizations.of(context).cancel, style: TextStyle(fontFamily: "Raleway"),),
                  ),
                  FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.of(context).pop(
                          Address(
                              city: _cityController.value.text,
                              street: _streetController.value.text,
                              houseNumber: _houseNumberController.value.text),
                        );
                      }
                    },
                    textColor: Colors.green[200],
                    child: Text(WebshopLocalizations.of(context).save, style: TextStyle(fontFamily: "Raleway", color: Colors.deepPurple),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
