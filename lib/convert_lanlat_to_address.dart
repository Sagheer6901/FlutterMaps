// import 'package:flutter/material.dart';
// import 'package:flutter_geocoder/geocoder.dart';
// import 'package:flutter_geocoder/model.dart';
// import 'package:flutter_geocoder/services/base.dart';
// import 'package:flutter_geocoder/services/distant_google.dart';
// import 'package:flutter_geocoder/services/local.dart';
//
// class ConvertLatLangToAddress extends StatefulWidget {
//   const ConvertLatLangToAddress({Key? key}) : super(key: key);
//
//   @override
//   _ConvertLatLangToAddressState createState() => _ConvertLatLangToAddressState();
// }
//
// class _ConvertLatLangToAddressState extends State<ConvertLatLangToAddress> {
//
//   String setAddress = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Google Map"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(setAddress),
//           GestureDetector(
//             onTap: () async {
//
// // // From a query
// //               final query = "1600 Amphiteatre Parkway, Mountain View";
// //               var addresses = await Geocoder.local.findAddressesFromQuery(query);
// //               var first = addresses.first;
// //               print("${first.featureName} : ${first.coordinates}");
//
//           // From coordinates
//               final coordinates = new Coordinates(1.10, 45.50);
//               var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//               var first = addresses.first;
//               print("${first.featureName} : ${first.addressLine}");
//
//               setState(() {
//                 setAddress = first.addressLine.toString();
//               });
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 50,color: Colors.greenAccent,
//               child: Center(
//                 child: Text("Convert"),
//               ),
//               ),
//             ),
//
//           )
//         ],
//       ),
//     );
//   }
// }
