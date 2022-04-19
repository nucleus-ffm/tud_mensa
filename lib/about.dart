import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Über diese App"),
        backgroundColor: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.info_outline_rounded),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TUD Mensa",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                SizedBox(
                  width: 300,
                  child: Text(
                    """
Diese App ist keine offizielle App des Studierendenwerkdarmstadt und wurde in der Hoffnung erstellt, dass sie nützlich ist. Dabei kann ich jedoch nicht garantieren, dass sie das auch ist.

Sämtliche Informationen und Speisepläne sind ohne Gewähr und direkt von der Webseite des Studierendenwerkdarmstadt. 
          """,
                    style: TextStyle(color: Colors.blueGrey[600]),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.perm_identity),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Autor:",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Nucleus",
                    style: TextStyle(color: Colors.blueGrey[600]),
                  ),
                ],
              ),
            onTap: () {
              _launchInBrowser('https://github.com/nucleus-ffm');
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Version:",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  "1.0.0",
                  style: TextStyle(color: Colors.blueGrey[600]),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lizenz:",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  "@todo",
                  style: TextStyle(color: Colors.blueGrey[600]),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.business_center_sharp),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "andere Lizenzen:",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  "TUD Mensa verwendet nützliche andere Software",
                  style: TextStyle(color: Colors.blueGrey[600]),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LicensePage()),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.code_rounded),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Quellcode",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text("Bald erhältlich auf floppy, bis dahin auf GitHub", style: TextStyle(color: Colors.blueGrey[600]),),
              ],
            ),
            onTap: () {
              _launchInBrowser('https://github.com/nucleus-ffm/tud_mensa');
            },
          ),
        ],
      ),
    );
  }
}
