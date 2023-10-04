import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isFavorite = false;
  int milisecond = 0, second = 0, minute = 0;
  String digitMilisecond = '0', digitSecond = '00', digitMinute = '00';
  Timer? timer;
  bool started = false; 
  List laps = [];

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void reset() {
    timer!.cancel();
    setState(() {
      milisecond = second = minute = 0;
      digitMilisecond = digitSecond = digitMinute = '00';
      started = false;
      laps = [];
    });
  }

  void addLaps() {
    if (started == true) {
      String lap = "$digitMinute:$digitSecond.$digitMilisecond";
      setState(() {
        laps.add(lap);
      });
    }
  }

  void start(){
    started = true;
    timer = Timer.periodic(Duration(milliseconds: 100), (timer) { 
      int localMilisecond = milisecond + 1;
      int localSecond = second;
      int localMinute = minute;

     if (localMilisecond > 9) {
       localSecond++;
       localMilisecond = 0;
        if (localSecond > 59) {
          localMinute++;
          localSecond = 0;
        } 
      }
      setState(() {
        milisecond = localMilisecond;
        second = localSecond;
        minute = localMinute;
        digitMilisecond = "$milisecond";
        digitSecond = (second >= 10) ? "$second" : "0$second";
        digitMinute = (minute >= 10) ? "$minute" : "0$minute";
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kelompok 2'
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  dataAnggota(),
                  SizedBox(height: 20,),
                  Text(
                    "Stop Watch",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    '$digitMinute:$digitSecond.$digitMilisecond',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: (started) ? Colors.red : Colors.teal
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: Colors.teal[50],
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: laps.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Lap ke-${index+1}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.teal, 
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                Text(
                                  "${laps[index]}", 
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.teal, 
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: () {
                        (!started) ? start() : stop();
                      },style: ElevatedButton.styleFrom(
                        backgroundColor: (started) ? Colors.red : Colors.teal
                      ), 
                      child: Text((!started) ? "Start" : "Stop")),
                      SizedBox(width: 10),
                      OutlinedButton(onPressed: () {
                        addLaps();
                      }, child: Icon(Icons.flag)),
                      SizedBox(width: 10),
                      ElevatedButton(onPressed: () {
                        reset();
                      }, child: Text("Reset")),
                    ],
                  ),
                  SizedBox(height: 50,),
                  Text(
                    "Recomended Website",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10,),
                  siteLink()
                ],
              ),
            ),
          ],
        ),
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
                color: Colors.teal,
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
                color: Colors.teal,
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
                color: Colors.teal,
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
        enableInfiniteScroll: false,
        autoPlay: true, 
        autoPlayAnimationDuration: Duration(seconds: 1)
      )
    );
  }

  Widget siteLink() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
      ),
      items: [
        InkWell(
          onTap: () {
            launchUrl(Uri.parse('https://www.niagahoster.co.id/'));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              children: [
                Image.network(
                  'https://niagaspace.sgp1.cdn.digitaloceanspaces.com/bb-uploads/tinymce/media/logo-niagahoster-1615379570.png',
                  height: MediaQuery.sizeOf(context).height/7
                ),
                SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Niagahoster",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                    SizedBox(height: 5,),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        (isFavorite) ? Icons.favorite : Icons.favorite_border,
                        size: 14,
                      ), 
                      label: Text('Favorite')
                    ),
                  ],
                )
              ],
            )
          ),
        )
      ]
    );
  }

}