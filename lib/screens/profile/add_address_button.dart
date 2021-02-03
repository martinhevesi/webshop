import 'package:flutter/material.dart';
import 'package:webshop/db/profile_repository.dart';
import 'package:webshop/l10n/webshop_localizations.dart';
import 'package:webshop/location_service.dart';
import 'package:webshop/models/address.dart';
import 'package:webshop/screens/profile/address_form_dialog.dart';
import 'package:provider/provider.dart';

// Manages the address creation
class AddAddressButton extends StatelessWidget {
  final Function onAddressSaved;

  AddAddressButton({Key key, @required this.onAddressSaved}) : super(key: key);

  Future<void> _addAddress(BuildContext context) async {
    var address = await showDialog<Address>(
      context: context,
      builder: (BuildContext context) => AddressFormDialog(),
    );
    if (address != null) {
      // Get the repository through Provider
      var repository = context.read<ProfileRepository>();
      // Get the latitude and longitude values for that address
      address.latLng = await LocationService.find(address);
      // Save the address into the DB
      await repository.addAddress(address);

      // Call the callback
      await onAddressSaved();
      // Show info to the user
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(WebshopLocalizations.of(context).addressSaved, style: TextStyle(color: Colors.white, fontFamily: "Raleway"),),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _addAddress(context);
      },
      backgroundColor: Colors.white,
      child: Icon(Icons.add, color: Colors.deepPurple),
    );
  }
}
