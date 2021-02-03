import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webshop/models/address.dart';
import 'package:webshop/location_service.dart';

class AddressMap extends StatefulWidget {
  final Address address;

  AddressMap({Key key, this.address}) : super(key: key);

  @override
  _AddressMapState createState() => _AddressMapState();
}

class _AddressMapState extends State<AddressMap> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
            target: widget.address.latLng ?? BP_LATLNG, zoom: 15),
        compassEnabled: false,
        myLocationButtonEnabled: false,
        scrollGesturesEnabled: false,
        tiltGesturesEnabled: false,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        rotateGesturesEnabled: false,
        mapToolbarEnabled: true,
        markers: [
          Marker(
            markerId: MarkerId(widget.address.id.toString()),
            position: widget.address.latLng ?? BP_LATLNG,
            draggable: false,
          ),
        ].toSet(),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
