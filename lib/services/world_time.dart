import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time='';
  String flag;
  String url;
  bool isDaytime;

  WorldTime({required this.location,required this.flag, required this.url,   this.isDaytime=false,});

 Future <void> getTime() async {
   try{
     var response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
     Map data = jsonDecode(response.body);
     // print(data);



     String datetime = data['datetime'];
     String offset = data['utc_offset'].substring(1,3);
     // print(datetime);
     // print(offset);

     DateTime now = DateTime.parse(datetime);
     now = now.add(Duration(hours: int.parse(offset)));
     // print(now);


     time = DateFormat.jm().format(now);
     isDaytime = now.hour > 6 && now.hour <20 ? true: false;

   }catch (e){
     print('caught error: $e');
     time = 'could not get time data';
     isDaytime = false;

   }
//     var response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
//     Map data = jsonDecode(response.body);
//     // print(data);
//
//     String datetime = data['datetime'];
//     String offset = data['utc_offset'].substring(1,3);
//     // print(datetime);
//     // print(offset);
//
//     DateTime now = DateTime.parse(datetime);
//     now = now.add(Duration(hours: int.parse(offset)));
//     // print(now);
//
//     time = now.toString();
  }
}
