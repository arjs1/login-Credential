import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                child: Icon(Icons.photo_camera),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(
                      Uri(scheme: 'tel', path: "9819069954"),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: Text(
                    "9819069954",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(
                        Uri(
                          scheme: 'mailto',
                          path: "jaryan1234@gmail.com",
                        ),
                        mode: LaunchMode.externalApplication);
                  },
                  child: Text(
                    "jaryan1234@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.link,
                  color: Colors.white,
                ),
                TextButton(
                  onPressed: () {
                    const Link = 'https://www.youtube.com/';
                    launchUrl(Uri.parse(Link),
                        mode: LaunchMode.inAppBrowserView);
                  },
                  child: Text(
                    "Youtube",
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
