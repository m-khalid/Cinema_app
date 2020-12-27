import 'package:cinema_app/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'cinema_app.dart';


class Home extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ) );
         
            },
          ),
              title: Text('Movies',style: TextStyle(fontSize: 25),),
          centerTitle: true,
              backgroundColor: Colors.white10,
      ),
          backgroundColor: Colors.grey[900],


      body: StreamBuilder(
        
        stream: Firestore.instance.collection('Movies').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData) return Text('Loading');
          switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return new ListView (
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                 // ignore: unused_label
                return GestureDetector(
  onTap: () {
String movieId = document.documentID;
String movieTitle = document['title'];

//sending it to another screen
//sending it to another screen
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new CinemaApp(movieId,movieTitle)));
  },
  child:   Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("images/"+document['image']),height: 300,width: 100,
    ),
);
           }).toList(),
            );
          }
        },
      ),
    );
  }
}