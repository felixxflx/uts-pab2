import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:felix/models/models.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  late String tanggal = "";
  late String jam = "";
  late String dateTime = "";
  late String coordinate = "";
  late String lintang = "";
  late String bujur = "";
  late String magnitude = "";
  late String kedalaman = "";
  late String wilayah = "";
  late String potensi = "";
  late String dirasakan = "";
  late String shakeMap = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://data.bmkg.go.id/DataMKG/TEWS/autogempa.json'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      print("test");
      print(data['Infogempa']['gempa']['Tanggal']);

      setState(() {
        tanggal = data['Infogempa']['gempa']['Tanggal'];
        jam = data['Infogempa']['gempa']['Jam'];
        dateTime = data['Infogempa']['gempa']['DateTime'];
        coordinate = data['Infogempa']['gempa']['Coordinates'];
        lintang = data['Infogempa']['gempa']['Lintang'];
        bujur = data['Infogempa']['gempa']['Bujur'];
        magnitude = data['Infogempa']['gempa']['Magnitude'];
        kedalaman = data['Infogempa']['gempa']['Kedalaman'];
        wilayah = data['Infogempa']['gempa']['Wilayah'];
        potensi = data['Infogempa']['gempa']['Potensi'];
        dirasakan = data['Infogempa']['gempa']['Dirasakan'];
        shakeMap = data['Infogempa']['gempa']['Shakemap'];
      });
    } else {
      throw Exception('Failded');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App : $tanggal')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child:
              tanggal.isEmpty ||
                      jam.isEmpty ||
                      dateTime.isEmpty ||
                      coordinate.isEmpty ||
                      lintang.isEmpty ||
                      bujur.isEmpty ||
                      magnitude.isEmpty ||
                      kedalaman.isEmpty ||
                      wilayah.isEmpty ||
                      potensi.isEmpty ||
                      dirasakan.isEmpty ||
                      shakeMap.isEmpty
                  ? CircularProgressIndicator()
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'tanggal: $tanggal,\ndateTime : $dateTime, \ncoordinate : $coordinate, \nlintang : $lintang, \nbujur : $bujur, \nmagnitude : $magnitude \nkedalaman : $kedalaman, \nwilayah : $wilayah, \npotensi $potensi, \ndirasakan : $dirasakan, \nshakemap : $shakeMap,',
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
