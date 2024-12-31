import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;
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
      body: ElevatedButton(
        onPressed: () {
          setState(() {
            counter +=1;
          });
        }, child: Text('counter is $counter'),
        
      ),

    );
  }
}
