import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class Artist {
  String name;
  String power;

  Artist(this.name, this.power);
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Artist> artists = [
    Artist("Chris   ", "Dancing"),
    Artist("Weeknd", "Singing"),
    Artist("Tyler the Creator", "Rapping"),
  ];

  var response = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("SpotifyTracks")),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: artists.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.blue, // You can change the color as needed

                    child: Text(
                      artists[index].name,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Text(response),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final res = await http.get(Uri.parse("http://192.168.163.3:5000"));
            if (res.statusCode == 200) {
              setState(() {
                List<dynamic> data = json.decode(res.body);
                for (var item in data) {
                  if (item['id'] == '3') {
                    response = item['name'];
                    break;
                  } else {
                    response = 'failed to retrieve';
                  }
                }
              });
            } else {
              setState(() {
                response = "failed to capture";
              });
            }
          },
        ),
      ),
    );
  }
}
