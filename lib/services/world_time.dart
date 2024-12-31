import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  String location;
  String time='';
  String flag;
  String url;

  WorldTime({required this.location,required this.flag, required this.url});

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

     time = now.toString();
   }catch (e){
     print('caught error: $e');
     time = 'could not get time data';

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
