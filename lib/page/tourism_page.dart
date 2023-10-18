import 'package:flutter/material.dart';
import 'package:flutter_tugas2/page/detail_page.dart';
import 'package:flutter_tugas2/data/tourism_place.dart';

class TourismPage extends StatelessWidget {
  const TourismPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourism Place'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3), 
          itemCount: tourismPlaceList.length,
          itemBuilder: (context, index) {
            TourismPlace place = tourismPlaceList[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                    (context) => DetailPage(place: place), 
                  ) 
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      Image.network(
                        place.imageUrls[0],
                        width: MediaQuery.sizeOf(context).width/3,
                      ),
                      Text(place.name)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      )
    );
  }
}