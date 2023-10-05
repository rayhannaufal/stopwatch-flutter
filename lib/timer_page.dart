import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {

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
        title: Text('Stopwatch'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(height: 10,),
            Text(
              '$digitMinute:$digitSecond.$digitMilisecond',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: (started) ? Colors.red : Colors.indigo
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: MediaQuery.sizeOf(context).height/1.5,
              decoration: BoxDecoration(
                color: Colors.indigo[50],
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
                              color: Colors.indigo, 
                              fontWeight: FontWeight.bold
                            )
                          ),
                          Text(
                            "${laps[index]}", 
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.indigo, 
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    (!started) ? start() : stop();
                  }, child: Icon(
                    (!started) ? Icons.play_arrow_rounded : Icons.stop
                  ),
                    backgroundColor: !started ? Colors.indigo : Colors.red,
                ),
                FloatingActionButton(
                  onPressed:() {
                    addLaps();                    
                  }, child: Icon(
                    Icons.flag,
                    color: Colors.indigo,
                  ),
                  backgroundColor: Colors.white,
                ),
                FloatingActionButton(
                  onPressed:() {
                    reset();                    
                  }, child: Icon(Icons.restore),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}