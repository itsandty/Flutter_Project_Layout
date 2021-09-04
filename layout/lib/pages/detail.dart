import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  //const DetailPage({ Key? key }) : super(key: key);
  final v1, v2, v3, v4;
  DetailPage(this.v1, this.v2, this.v3, this.v4);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _v1, _v2, _v3, _v4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_v1),
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Image.network(
              _v3,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              margin: EdgeInsets.fromLTRB(1, 0, 1, 1),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _v1,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "    " + _v4,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
