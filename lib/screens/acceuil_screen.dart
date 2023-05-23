import 'package:flutter/material.dart';
import 'package:authlaravel/screens/reclamation_screen.dart';
import 'package:authlaravel/screens/about_screen.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class AcceuiScreen extends StatelessWidget {
  const AcceuiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlideshow(
              /// Width of the [ImageSlideshow].
              width: double.infinity,

              /// Height of the [ImageSlideshow].
              height: 200,

              /// The page to show when first creating the [ImageSlideshow].
              initialPage: 0,

              /// The color to paint the indicator.
              indicatorColor: Colors.orange,

              /// The color to paint behind th indicator.
              indicatorBackgroundColor: Colors.grey,

              /// The widgets to display in the [ImageSlideshow].
              /// Add the sample image file into the images folder
              children: [
                Image.asset(
                  'images/slide1.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/slide2.webp',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/slide3.jfif',
                  fit: BoxFit.cover,
                ),
              ],

              /// Auto scroll interval.
              /// Do not auto scroll with null or 0.
              autoPlayInterval: 3000,

              /// Loops back to first slide.
              isLoop: true,
            ),
            Container(
                height: 50,
                width: 300,
                alignment: Alignment.center,
                margin: EdgeInsets.all(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Color.fromARGB(255, 227, 116, 4),
                ),
                child: GestureDetector(
                  child: Text(
                    'Reclamer a un probléme !',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ReclamationScreen(),
                      ),
                    ); //navigation
                  },
                )),
            Container(
              height: 50,
              width: 300,
              alignment: Alignment.center,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Color.fromARGB(255, 227, 116, 4),
              ),
              child: GestureDetector(
                child: Text(
                  'A propos nous ?',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AboutScreen(),
                    ),
                  ); //navigation
                },
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(40),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.dribbble.com/users/2322685/screenshots/6221645/welcome-dribbble.gif"),
                        fit: BoxFit.fitWidth),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Color.fromARGB(255, 233, 231, 230),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.dribbble.com/users/2322685/screenshots/6221645/welcome-dribbble.gif"),
                        fit: BoxFit.fitWidth),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Color.fromARGB(255, 233, 231, 230),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
