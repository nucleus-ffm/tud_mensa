import 'package:flutter/material.dart';
import 'parser.dart';
import 'class_day.dart';
import 'class_meal.dart';
import 'widget_dayCard.dart';
import 'mensInfoDialog.dart';
import 'about.dart';

// global vars
List<Day> week = [];
String mensaName = "Stadtmitte";
bool loading = true;
bool firstStart = true;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TUD Mensa",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TUD Mensa"),
        backgroundColor: Colors.blueGrey,
        brightness: Brightness.dark, //change appbar Icons to white
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Center(
                  child: Text(
                "TUD Mensa",
                style: TextStyle(color: Colors.white, fontSize: 35),
              )),
            ),
            ListTile(
              leading: Icon(Icons.restaurant),
              title: Text("Stadtmitte"),
              onTap: () {
                setState(() {
                  print("ändere Mensa zu Stadtmitte");
                  mensaName = "Stadtmitte";
                  loading = true;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.restaurant),
              title: Text("Lichtwiese"),
              onTap: () {
                setState(() {
                  print("ändere Mensa zu Lichtwiese");
                  mensaName = "Lichtwiese";
                  loading = true;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.restaurant),
              title: Text("Schöfferstraße"),
              onTap: () {
                setState(() {
                  print("ändere Mensa zu Schöfferstraße");
                  mensaName = "Schöfferstraße";
                  loading = true;
                  Navigator.pop(context);
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Divider(),
            ),

            ListTile(
              leading: Icon(Icons.info_outline_rounded),
              title: Text("Über"),
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  );
                });
              },
            ),
          ],
        ),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    week.clear();
    String URL = "";
    if (mensaName == "Stadtmitte") {
      URL =
          "https://studierendenwerkdarmstadt.de/hochschulgastronomie/speisen/stadtmitte/";
    } else if (mensaName == "Lichtwiese") {
      URL =
          "https://studierendenwerkdarmstadt.de/hochschulgastronomie/speisen/lichtwiese/";
    } else if (mensaName == "Schöfferstraße") {
      URL =
          "https://studierendenwerkdarmstadt.de/hochschulgastronomie/speisen/schoefferstrasse/";
    } else {
      print("no valid mensaName");
      URL =
          "https://studierendenwerkdarmstadt.de/hochschulgastronomie/speisen/stadtmitte/";
    }
    print(URL);
    /*setState(() {
      loading = true;
    });*/
    await parser(URL);
    print("ende");
    setState(() {
      loading = false;
    });

    if (firstStart) {
      firstStart = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (loading && firstStart == false) {
      loadData();
    }
    while (loading) {
      return Center(
        child: SizedBox(
          height: 70,
          width: 70,
          child: CircularProgressIndicator(
            strokeWidth: 4,

          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Stack(
        children: [
          Positioned(
            left: screenWidth / 1.2,
            right: screenWidth / 40,
            top: screenWidth / 40,
            child: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return MensaInfoDialog();
                  },
                );
              },
              child: Icon(Icons.info_outline_rounded),
              backgroundColor: Colors.blueGrey,
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      mensaName,
                      style: TextStyle(fontSize: 25, color: Colors.blueGrey),
                    ),
                  ),
                  //IconButton(icon: Icon(Icons.info_outline_rounded), onPressed: () {})
                ],
              ),
              //IconButton(icon: Icon(Icons.info_outline_rounded) , onPressed: () {}),

              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 15),
                child: Column(
                  children: week.map((day) => DayCard(day: day)).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
