import 'package:flutter/material.dart';
import 'package:world_time_1/services/world_time.dart';



class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: ' Africa/Nairobi' , location:'Nairobi', flag: 'kenya.png'),
    WorldTime(url: ' Africa/Athens' , location:'Athens', flag: 'greece.png'),
    WorldTime(url: ' Europe/Madrid' , location:'Madrid', flag: 'spain-flag.png'),
    WorldTime(url: ' America/Chicago' , location:'Chicago', flag: 'usa.png'),
    WorldTime(url: ' America/WashingtonDC' , location:'WashingtonDC', flag: 'usa.png'),
    WorldTime(url: ' Africa/Capetown' , location:'Capetown', flag: 'south-africa-flag.png'),
    WorldTime(url: ' Africa/Cairo' , location:'Cairo', flag: 'egypt.png'),
    WorldTime(url: ' Asia/Tokyo' , location:'Tokyo', flag: 'japan-flag.png'),
    WorldTime(url: ' Asia/Seoul' , location:'Seoul', flag: 'south_korea.png'),
    WorldTime(url: ' Africa/England' , location:'England', flag: 'uk.png'),

  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });

  }

  // int counter = 0;

  //
  //  void getData() async{
  //     String username= await Future.delayed(Duration(seconds: 3),() {
  //      return('david a');
  //    });
  //
  //    String bio = await Future.delayed(Duration(seconds: 1),() {
  //      return('vegan,musician & software engineer');
  //    });
  //
  //    String age =await  Future.delayed(Duration(seconds: 3),() {
  //      return('thirty two');
  //    });
  //
  //    print('$username - $bio - $age');
  //  }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }
  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor:  Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('choose location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder (
       itemCount: locations.length ,
        itemBuilder: (context, index){
         return Padding(
           padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),//add this to display the circle avatar
           child: Card(
             child: ListTile(
               onTap: () {
                 updateTime(index);
               },
               title: Text(locations[index].location),
               leading: CircleAvatar(
                 backgroundImage: AssetImage('assets/${locations[index].flag}'),
               ),
             ),
           ),
         );
        },
      ),

    );
  }
}
