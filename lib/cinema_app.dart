import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'chair.dart';
import 'cinema_provider.dart';
import 'package:provider/provider.dart';
import 'Home.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';


class CinemaApp extends StatefulWidget  {
  final String movieId;
  final String movieTitle;
  CinemaApp(this.movieId,this.movieTitle);
 
  @override
  ReservePageState createState() => ReservePageState(movieId,movieTitle);
}


class ReservePageState extends State<CinemaApp> {
   String movieId,movieTitle;
  ReservePageState(this.movieId,this.movieTitle);



    @override
  void initState() {
    super.initState();
  }
  Color chiarColor(ReserveState reserveState) {
    if (reserveState == ReserveState.reserved) {
      return Colors.grey;
    } else if (reserveState == ReserveState.selected) {
      return Colors.green[700];
    }else if (reserveState == ReserveState.notavailable) {
      return Colors.grey[700];
    }
     else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      
      create: (context) => CinemaProvider(),
      child: Scaffold(
        
        backgroundColor: Colors.grey[700],

        appBar: AppBar(
          actions:[
    
             IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ) );
         
            },
          ),
          ],
          
          title: Text(
            "$movieTitle",
            style: TextStyle(color: Colors.white),
        
          ),
          centerTitle: true,
          backgroundColor: Colors.white10,
        ),
        body: StreamBuilder(
 stream: Firestore.instance.collection('Movies').document(movieId).snapshots(),
             builder: (context, snapshot) {
                var data = snapshot.data;
                    return new   SingleChildScrollView(
          child: Column(
            children: [
              Container(
      
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset("images/"+data['image'],height: 400,width: 400,)
                  ],
               )),
              SizedBox(
                height: 24,
              ),
               Container(

                  child: Column(
                    children: [
       
                          Text(
                            data['description'],
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
                          ),                                 
                    ],
                  )),
                               SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Divider(
                  color: Colors.grey,
                  thickness: 4,
                ),
              ),
   
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 22,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: chairRow1.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                if(index==4||index==5)
                                {
                                    
                                }
                                else{
                                if (chairRow1[index].reserveState == ReserveState.reserved) {
                                  return;
                                }
                                if (chairRow1[index].reserveState == ReserveState.available) {
                                   setState(() {
                                    chairRow1[index].reserveState = ReserveState.selected;
                                  });
                                } else {
                                  setState(() {
                                    chairRow1[index].reserveState = ReserveState.available;
                                  });
                                }
                              }
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
                                height: 28,
                                width: 16,
                                decoration: BoxDecoration(
                                    color: chiarColor(chairRow1[index].reserveState),
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 32,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: chairRow2.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                  if(index==4||index==5)
                                {
                                    
                                }
                                else{
                                if (chairRow2[index].reserveState == ReserveState.reserved) {
                                  return;
                                }
                                if (chairRow2[index].reserveState == ReserveState.available) {
                                  setState(() {
                                    chairRow2[index].reserveState = ReserveState.selected;
                                  });
                                } else {
                                  setState(() {
                                    chairRow2[index].reserveState = ReserveState.available;
                                  });
                                }
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
                                height: 28,
                                width: 16,
                                decoration: BoxDecoration(
                                    color: chiarColor(chairRow2[index].reserveState),
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 32,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: chairRow3.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                  if(index==4||index==5)
                                {
                                    
                                }
                                else{
                                if (chairRow3[index].reserveState == ReserveState.reserved) {
                                  return;
                                }
                                if (chairRow3[index].reserveState == ReserveState.available) {
                                  setState(() {
                                    chairRow3[index].reserveState = ReserveState.selected;
                                  });
                                } else {
                                  setState(() {
                                    chairRow3[index].reserveState = ReserveState.available;
                                  });
                                }
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
                                height: 28,
                                width: 16,
                                decoration: BoxDecoration(
                                    color: chiarColor(chairRow3[index].reserveState),
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 32,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: chairRow4.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                  if(index==4||index==5)
                                {
                                    
                                }
                                else{
                                if (chairRow4[index].reserveState == ReserveState.reserved) {
                                  return;
                                }
                                if (chairRow4[index].reserveState == ReserveState.available) {
                                  setState(() {
                                    chairRow4[index].reserveState = ReserveState.selected;
                                  });
                                } else {
                                  setState(() {
                                    chairRow4[index].reserveState = ReserveState.available;
                                  });
                                }
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
                                height: 28,
                                width: 16,
                                decoration: BoxDecoration(
                                    color: chiarColor(chairRow4[index].reserveState),
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 32,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: chairRow5.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                if (chairRow5[index].reserveState == ReserveState.reserved) {
                                  return;
                                }
                                if (chairRow5[index].reserveState == ReserveState.available) {
                                  Provider.of<CinemaProvider>(context, listen: false).setRowSelected("5");
                                  Provider.of<CinemaProvider>(context, listen: false)
                                      .addSelectedChair(chairRow5[index]);
                                  setState(() {
                                    chairRow5[index].reserveState = ReserveState.selected;
                                  });
                                } else {
                                  Provider.of<CinemaProvider>(context, listen: false).setRowSelected("");
                                  setState(() {
                                    chairRow5[index].reserveState = ReserveState.available;
                                  });
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
                                height: 28,
                                width: 16,
                                decoration: BoxDecoration(
                                    color: chiarColor(chairRow5[index].reserveState),
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            );
                          }),
                    ),
                    
                  ],
                ),
              ),
            
              Container(
                //  height: MediaQuery.of(context).size.height / 4,
                  
                  child: Column(
                    children: [
       
                          Text(
                            "Time: "+data['time'],
                            style: TextStyle(color: Colors.cyan, fontSize: 20, fontWeight: FontWeight.w300),
                          ),                                 
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Divider(
                  color: Colors.grey,
                  thickness: 4,
                ),
              ),

              Container(
  
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(32)),
                  child: Center(
                    child: Text(
                      "CHECKOUT",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  )),
            ],
          ),
        );
             })
  
      ),
    );
  }
}

class SelectedSeatItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cinemaProvider = Provider.of<CinemaProvider>(context);
    return Text("${cinemaProvider.selectedToString()}", style: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w300
    ),);
  }
}

