import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:webshop/l10n/webshop_localizations.dart';

class ContactChooser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(WebshopLocalizations.of(context).chooseContact),
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        color: Colors.grey[900],
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: FutureBuilder<Iterable<Contact>>(
            future: ContactsService.getContacts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView(
                  children: snapshot.data.map((contact) {
                    return ListTile(
                      title: Text(contact.displayName, style: TextStyle(color: Colors.white, fontFamily: "Raleway"),),
                      onTap: () {
                        Navigator.pop(context, contact);
                      },
                    );
                  }).toList(),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
