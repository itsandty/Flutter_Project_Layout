import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vaccine Covid-19",
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: FutureBuilder(
            builder: (context, snapshot) {
              var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return MyBox(data[index]["title"], data[index]["subtitle"],
                      data[index]["image_url"], data[index]["detail"]);
                },
                itemCount: data.length,
              );
            },
            future:
                //Lottie.asset("assets/lottie/73810-business-idea-animation.json"),
                DefaultAssetBundle.of(context).loadString("assets/data.json"),
          )),
    );
  }

  Widget MyBox(String _title, String _body, String _urlImage, String _detail) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      padding: EdgeInsets.all(20),
      height: 220,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: NetworkImage(_urlImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.darken,
            )),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            _body,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          TextButton(
            onPressed: () {
              //print("test");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(_title, _body, _urlImage, _detail)));
            },
            child: Text(
              "อ่านต่อเพิ่มเติม",
              style: TextStyle(
                color: Colors.blue[100],
                fontSize: 16,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }
}
