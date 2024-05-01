import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  getApi() async {
    var url = Uri.parse("https://api.covidtracking.com/v1/us/daily.json");
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    print(responseBody[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(child: Image.asset("assets/images/corona-virus.avif",height: 350,width: 350,)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Stay Home, Stay Safe!",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
            ],),
            SizedBox(height: 20,),
            Row(
              children: [
                Text("Global COVID-19",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)
              ],
            ),
          //  FutureBuilder(future: getApi(), builder: (context,AsyncSnapshot snapshot) {
          //   return ListView.builder(
          //     itemCount: snapshot.data.length,
          //     itemBuilder: (context,index){
          //     return ListTile(
          //       title: Text(snapshot.data[index][0][0].toString()),
          //     );
          //   });
          //  })
          ],
        ),
      ),
    );
  }
}