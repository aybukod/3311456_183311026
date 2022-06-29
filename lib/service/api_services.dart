import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService{
  static Future getWeatherDataByCity(String city) async{
    return await http.get(Uri.parse("https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$city"), headers: {
      HttpHeaders.authorizationHeader: 'apikey 1tOKo9H5f9AXgaqOUZdiFP:77oOQ3SlcV8fh07CByHppb',
      HttpHeaders.contentTypeHeader: 'application/json'
    });
  }
}