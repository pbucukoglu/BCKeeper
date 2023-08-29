import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SocialMedia".tr,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SocialMediaButton(
                    text: "Linkedin",
                    logo: "assets/linkedin.jpg",
                    url: "https://www.linkedin.com/", // Linkedin URL'si burada
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: SocialMediaButton(
                    text: "X",
                    logo: "assets/x.jpg",
                    url: "https://www.twitter.com/", // Twitter URL'si burada
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SocialMediaButton(
                    text: "Instagram",
                    logo: "assets/instagram.jpg",
                    url:
                        "https://www.instagram.com/", // Instagram URL'si burada
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: SocialMediaButton(
                    text: "Facebook",
                    logo: "assets/facebook.jpg",
                    url: "https://www.facebook.com/", // Facebook URL'si burada
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

class SocialMediaButton extends StatelessWidget {
  final String text;
  final String logo;
  final String url;

  const SocialMediaButton(
      {required this.text, required this.logo, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Tuşa basildi calisiyor");
        _launchURL(url);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blue[900] ?? Colors.blue,
            width: 1.0,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              logo,
              width: 64,
              height: 64,
            ),
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
