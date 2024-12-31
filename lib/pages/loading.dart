import 'package:flutter/material.dart';
import 'package:world_time_1/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

   // void getTime() async {
   //    var response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Nairobi'));
   //    Map data = jsonDecode(response.body);
   //    print(data);
   // }
   // void getData() async{
   //  var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1' ));
   //   Map data = jsonDecode(response.body);
   //   print(data);

   // }

  // String time = 'loading';
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location:'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time':instance.time,
    });
    // print(instance.time);
    //for updating time
    // setState(() {
    //   time = instance.time;
    // });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
      child: Text('loading...'),
      )
    );
  }
}

