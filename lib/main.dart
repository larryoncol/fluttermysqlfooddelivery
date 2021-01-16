import 'package:flutter/material.dart';
import 'package:fluttermysql/details.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Ap Test',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //A future list object thats gets data

  Future<List> getData() async{
    final response=await http.get("http://chatter.teck.email/myfolder/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App Bar"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
      body: FutureBuilder <List>(
        //call future function to get data
        future: getData(),
        builder: (context, snapshot ){
          if (snapshot.hasError)
          {
            print("Error Try Again");
          }

          if (snapshot.hasData){
            print("Snapshot has Data");
          }

          if (snapshot.connectionState == ConnectionState.done)
            {
              // returns information from Items class, contructor used here
              return Items(list:snapshot.data);
            }

          else
            {
              return CircularProgressIndicator();
            }

    /*
          if(snapshot.hasError)
            {
              print("error");
            }
            if(snapshot.hasData)
            {
               return Items(list:snapshot.data);
            }
            else
              {
                return CircularProgressIndicator();
              }
    */
        }
      ),
    );
  }
}


class Items extends StatelessWidget {
  List list;
  //name contructor used here
  Items({this.list});


  @override
  Widget build(BuildContext context) {
    // we can simply print the list here. As you can see its a JSON
    // print (list);
    // print (list.length);
    //Each string can be rendered using ListView.builder
    return ListView.builder(
        // if list is null then assign 0, else assign list length
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (Listcontext, Listindex){
          return ListTile(
            leading: Icon(Icons.message),
            title: Text(list[Listindex]['name']),
            subtitle: Text(list[Listindex]['mobile']),
            onTap: ()=>Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context)=>Details(list:list, index:Listindex),
              ),
            ),
          );
        }
    );
  }
}

