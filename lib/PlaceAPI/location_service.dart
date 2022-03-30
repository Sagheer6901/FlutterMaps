import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class LocationService{

  final String key = "AIzaSyANC12p7TBpNmzahxm9itPVDmVAC5FPMS4";

  Future<String> getPlaceID(String input)async{
    final String url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?&input=$input&inputtype=textquery&key=$key";

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);

    var placeId = json['candidates'][0]['place_id'] as String;

    print(placeId);
    return placeId;

  }
  Future<Map<String,dynamic>> getPlace(String input)async{

    final placeId = await getPlaceID(input);
    final String url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=Y$key";

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);

    var results = json['result'] as Map<String, dynamic>;

    print(results);
    return results;
  }

}