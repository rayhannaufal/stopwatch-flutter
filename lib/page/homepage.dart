import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tugas2/page/stopwatch_page.dart';
import 'package:flutter_tugas2/page/tourism_page.dart';
import 'package:flutter_tugas2/page/web_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height/2.5,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'GROUP 5',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                        ),
                      ),
                      dataAnggota(),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder:(context) => StopWatchPage(), 
                            )
                          );

                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height/12,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 36,
                                  color: Colors.indigo,
                                ),
                                SizedBox(width: 30,),
                                Text(
                                  'Stop Watch',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder:(context) => WebPage(), 
                            )
                          );

                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height/12,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.web,
                                  size: 36,
                                  color: Colors.indigo,
                                ),
                                SizedBox(width: 30,),
                                Text(
                                  'Recomended Web',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder:(context) => TourismPage(), 
                            )
                          );
                        },
                        child: Card(
                          child: Container(
                            height: MediaQuery.sizeOf(context).height/12,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.place,
                                  size: 36,
                                  color: Colors.indigo,
                                ),
                                SizedBox(width: 30,),
                                Text(
                                  "Tourism Place", 
                                  style: TextStyle(
                                    fontSize: 20
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget dataAnggota() {
    return CarouselSlider(
      items: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            children: [
              Icon(
                Icons.person,
                size: 150,
                color: Colors.indigo[200],
              ), 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amirul Isnaini',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text('124210002')
                ],
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            children: [
              Icon(
                Icons.person,
                size: 150,
                color: Colors.indigo[200],
              ), 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rayhan Naufal',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                  Text('124210020')
                ],
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            children: [
              Icon(
                Icons.person,
                size: 150,
                color: Colors.indigo[200],
              ), 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gilang Naufaldy',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Text('124210035')
                ],
              ),
            ],
          ),
        ),
      ], 
      options: CarouselOptions(
        autoPlay: true, 
        autoPlayAnimationDuration: Duration(seconds: 1)
      )
    );
  }
}