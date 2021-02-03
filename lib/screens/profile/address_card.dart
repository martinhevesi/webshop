import 'package:flutter/material.dart';
import 'package:webshop/l10n/webshop_localizations.dart';
import 'package:webshop/models/address.dart';
import 'package:webshop/screens/profile/address_map.dart';

class AddressCard extends StatelessWidget {
  final Address address;

  AddressCard({Key key, this.address}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
          decoration: BoxDecoration(

            color: Colors.black54,
            borderRadius: BorderRadius.vertical(top: Radius.circular(0), bottom: Radius.circular(0)),
            border: Border.all(
              color: Colors.deepPurple,
              width: 1.5,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('${WebshopLocalizations.of(context).city}: ', style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: "Raleway"),),
                  Text(address.city, style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Raleway")),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('${WebshopLocalizations.of(context).street}: ', style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: "Raleway"),),
                  Text(address.street,style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Raleway"),),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('${WebshopLocalizations.of(context).houseNumber}: ', style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: "Raleway"),),
                  Text(address.houseNumber,style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Raleway"),),
                ],
              ),
              AddressMap(address: address),
            ],
          ),
        ),
      );
  }
}
