import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

class ConvertLangLatToAddress extends StatefulWidget {
  const ConvertLangLatToAddress({Key? key}) : super(key: key);

  @override
  State<ConvertLangLatToAddress> createState() =>
      _ConvertLangLatToAddressState();
}

class _ConvertLangLatToAddressState extends State<ConvertLangLatToAddress> {
  String stAddress = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            stAddress,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 3, 124, 223),
            ),
          ),
          GestureDetector(
            onTap: () async {
              // From a query
              final query = "1600 Amphiteatre Parkway, Mountain View";
              var addresses =
                  await Geocoder.local.findAddressesFromQuery(query);
              var second = addresses.first;
              print("${second.featureName} : ${second.coordinates}");
              //final coordinates = new Coordinates(33.560057, 73.010341);
              final coordinates = new Coordinates(33.623374, 73.067903);

              var address = await Geocoder.local
                  .findAddressesFromCoordinates(coordinates);
              var first = address.first;
              print(
                  'address ${first.featureName.toString() + first.addressLine.toString()}');
              setState(() {
                stAddress = first.addressLine.toString();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(119, 173, 216, 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text('Convert'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
