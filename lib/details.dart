import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  List list;
  int  index;

  Details({this.list, this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  void confirm(){

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("${widget.list[widget.index]['name']}"),
    ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(
              widget.list[widget.index]['name'],
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              widget.list[widget.index]['mobile'],
              style: TextStyle(fontSize: 20.0),
            ),
            MaterialButton(
              child: Text("EDIT"),
              color: Colors.deepOrangeAccent,
              onPressed: (){},
            ),
            MaterialButton(
              child: Text("DELETE"),
              color: Colors.deepOrangeAccent,
              onPressed: ()=> confirm(),
            ),
          ],
        ),
      ),
    );
  }
}
