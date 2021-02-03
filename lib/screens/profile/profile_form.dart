import 'package:flutter/material.dart';
import 'package:webshop/db/profile_repository.dart';
import 'package:webshop/l10n/webshop_localizations.dart';
import 'package:webshop/models/profile.dart';
import 'package:webshop/screens/profile/address_card.dart';
import 'package:provider/provider.dart';

class ProfileForm extends StatefulWidget {
  final Profile profile;

  ProfileForm({Key key, this.profile}) : super(key: key);
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController.fromValue(
        TextEditingValue(text: widget.profile.name ?? ''));
    _emailController = TextEditingController.fromValue(
        TextEditingValue(text: widget.profile.email ?? ''));
    _phoneController = TextEditingController.fromValue(
        TextEditingValue(text: widget.profile.phone ?? ''));
  }

  void saveProfile(BuildContext context) async {
    var repository = context.read<ProfileRepository>();
    await repository.save(widget.profile);
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(WebshopLocalizations.of(context).profileSaved, style: TextStyle(fontFamily: "Raleway"),),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                WebshopLocalizations.of(context).profile,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Raleway"
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white54,
                      blurRadius: 8.0,
                      spreadRadius: 1.0,
                    ),
                  ]
              ),
              child: Card(
                color: Colors.grey[900],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white, fontFamily: "Raleway"),
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white, fontFamily: "Raleway"),
                          hintText:
                          WebshopLocalizations.of(context).enterYourName,
                          labelText: WebshopLocalizations.of(context).name,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return WebshopLocalizations.of(context)
                                .mandatoryField;
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white, fontFamily: "Raleway"),
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white, fontFamily: "Raleway"),
                          hintText:
                          WebshopLocalizations.of(context).enterYourEmail,
                          labelText: WebshopLocalizations.of(context).email,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return WebshopLocalizations.of(context)
                                .mandatoryField;
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white, fontFamily: "Raleway"),
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white, fontFamily: "Raleway"),
                          hintText:
                          WebshopLocalizations.of(context).enterYourPhone,
                          labelText: WebshopLocalizations.of(context).phone,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return WebshopLocalizations.of(context)
                                .mandatoryField;
                          }
                          return null;
                        },
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: RaisedButton(
                          color: Colors.white,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              widget.profile.name = _nameController?.value?.text;
                              widget.profile.email =
                                  _emailController?.value?.text;
                              widget.profile.phone =
                                  _phoneController?.value?.text;
                              saveProfile(context);
                            }
                          },
                          child: Text(WebshopLocalizations.of(context).save, style: TextStyle(color: Colors.grey[900], fontFamily: "Raleway"), ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                WebshopLocalizations.of(context).addresses,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                    fontFamily: "Raleway"
                ),
              ),
            ),
            if (widget.profile.addresses.length > 0)
              ...widget.profile.addresses
                  .map((address) => AddressCard(address: address))
                  .toList()
          ],
        ),
      ),
    );
  }
}
