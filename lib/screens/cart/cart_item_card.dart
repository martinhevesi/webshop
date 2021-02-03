import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webshop/l10n/webshop_localizations.dart';
import 'package:webshop/models/cart.dart';
import 'package:webshop/models/cart_item.dart';
import 'package:provider/provider.dart';

import 'contact_chooser.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;

  void chooseAContact(BuildContext context) async {
    var cart = context.read<Cart>();
    if (await Permission.contacts.request().isGranted) {
      Contact contact = await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ContactChooser()),
      );

      cart.setUser(item, contact);
    } else if (await Permission.contacts.isPermanentlyDenied) {
      openAppSettings();
    } else {
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content:
            Text(WebshopLocalizations.of(context).canNotAccessToContacts),
          ),
        );
    }
  }

  void removeSelectedContact(BuildContext context) {
    context.read<Cart>().setUser(item, null);
  }

  const CartItemCard({
    Key key,
    this.item,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ),
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.1),
              spreadRadius: 2,
              offset: Offset(7, 7),
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                        fontFamily: "Raleway",
                      color: Colors.white
                    ),
                  ),
                ),
                ButtonTheme(
                  padding: EdgeInsets.zero,
                  minWidth: 20,
                  child: FlatButton(
                    onPressed: () {
                      var cart = context.read<Cart>();
                      cart.remove(item);
                    },
                    child: Icon(
                      Icons.delete_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "${WebshopLocalizations.of(context).size}: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                                fontFamily: "Raleway",
                                color: Colors.white
                            ),
                          ),
                          if (item.size != null)
                            Text(
                              WebshopLocalizations.of(context)
                                  .stringById(item.size),
                              style: TextStyle(
                                fontFamily: "Raleway",
                                  color: Colors.white
                            ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "${WebshopLocalizations.of(context).color}: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontFamily: "Raleway",
                      color: Colors.white
                  ),
                ),
                if (item.color != null)
                  Text(
                    WebshopLocalizations.of(context)
                        .stringById(item.color),
                    style: TextStyle(
                      fontFamily: "Raleway",
                        color: Colors.white
                  ),
                  ),
              ],
            ),
            Row(
              children: <Widget>[
                RaisedButton.icon(
                  onPressed: () {
                    chooseAContact(context);
                  },
                  icon: Icon(Icons.contacts),
                  label: Text(item.whoWillUse?.displayName ??
                      WebshopLocalizations.of(context).whoWillUse,
                    style: TextStyle(
                      fontFamily: "Raleway"
                    ),
                  ),
                ),
                if (item.whoWillUse != null)
                  IconButton(
                    onPressed: () {
                      removeSelectedContact(context);
                    },
                    icon: Icon(Icons.remove_circle, color: Colors.white,),
                  ),
                Container(
                  padding: EdgeInsets.only(left: 60),
                  child: Text(
                  '\$${item.product.price.toStringAsPrecision(4)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontFamily: "Raleway"
                  ),
                ),)
              ],

            ),
          ],
        ),
      ),
    );
  }
}
