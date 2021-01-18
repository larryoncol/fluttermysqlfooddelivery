import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class newData extends StatefulWidget {
  @override
  _newDataState createState() => _newDataState();
}

class _newDataState extends State<newData> {

  TextEditingController cname=new TextEditingController();
  TextEditingController cmobile=new TextEditingController();

  void addData(){
    var url="http://chatter.teck.email/myfolder/adddata.php";
    http.post(url,body:{
      "name":cname.text,
      "mobile":cmobile.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Data"),
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            controller: cname,
            decoration: InputDecoration(hintText: "ENTER NAME", labelText: "ENTER NAME"),
          ),
          TextField(
            controller: cmobile,
            decoration: InputDecoration(hintText: "ENTER MOBILE", labelText: "ENTER MOBILE"),
          ),
          MaterialButton(
            child: Text("Add Data"),
            color: Colors.redAccent,
            onPressed: (){
              addData();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context)=>Home())
              );
            },

          )
        ],
      ),
    );
  }
}
