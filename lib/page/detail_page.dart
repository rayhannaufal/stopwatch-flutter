import 'package:flutter/material.dart';
import 'package:flutter_tugas2/data/tourism_place.dart';

class DetailPage extends StatefulWidget {
  final TourismPlace place;
  const DetailPage({super.key, required this.place});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place.name),
        centerTitle: true,
         actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            }, 
            icon: Icon(
              isFavorite?  Icons.favorite : Icons.favorite_border
            )
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.place.imageUrls[0]),
            SizedBox(height: 20,),
            Text(
              'Berlokasi di ${widget.place.location}'
            ),
            SizedBox(height: 5,),
            Text(
              widget.place.openDays
            ),
            SizedBox(height: 5,),
            Text(
              widget.place.openTime
            ),
            SizedBox(height: 5,),
            Text(
              widget.place.description
            )
          ],
        ),
      ),
    );
  }
}