import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recomended Web'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          // addAutomaticKeepAlives: true,
          children: [
            InkWell(
              onTap: () {
                launchUrl(Uri.parse('https://www.niagahoster.co.id/'));
              },
              child: Card(
                child: Container(
                  height: MediaQuery.sizeOf(context).height/8,
                  child: Row(
                    children: [
                      Image.network(
                        'https://niagaspace.sgp1.cdn.digitaloceanspaces.com/bb-uploads/tinymce/media/logo-niagahoster-1615379570.png',
                        height: MediaQuery.sizeOf(context).height/8
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Niagahoster',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                launchUrl(Uri.parse('https://www.coursera.org/'));
              },
              child: Card(
                child: Container(
                  height: MediaQuery.sizeOf(context).height/8,
                  child: Row(
                    children: [
                      Image.network(
                        'https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://coursera.s3.amazonaws.com/media/coursera-rebrand-logo-square.png?auto=format%2Ccompress&dpr=1',
                        height: MediaQuery.sizeOf(context).height/8
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Coursera',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                launchUrl(Uri.parse('https://glints.com/id'));
              },
              child: Card(
                child: Container(
                  height: MediaQuery.sizeOf(context).height/8,
                  child: Row(
                    children: [
                      Image.network(
                        'https://play-lh.googleusercontent.com/-vGKX3Jk5je9temYb6k5q9GEWiaqhvVJlsb64KavD8gl_Gqts_LFMyP_-moLIeBh4g',
                        height: MediaQuery.sizeOf(context).height/8
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Glinst',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                launchUrl(Uri.parse('https://id.khanacademy.org/'));
              },
              child: Card(
                child: Container(
                  height: MediaQuery.sizeOf(context).height/8,
                  child: Row(
                    children: [
                      Image.network(
                        'https://media.cdnandroid.com/item_images/772053/imagen-khan-academy-0ori.jpg',
                        height: MediaQuery.sizeOf(context).height/8
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Khan Academy',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                launchUrl(Uri.parse('https://www.zenius.net/'));
              },
              child: Card(
                child: Container(
                  height: MediaQuery.sizeOf(context).height/8,
                  child: Row(
                    children: [
                      Image.network(
                        'https://www.zenius.net/product/zeniusImages/zlogo.jpg',
                        height: MediaQuery.sizeOf(context).height/8
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Zenius',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}