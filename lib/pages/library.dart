import 'package:flutter/material.dart';
import 'package:nhef/model/resources.dart';
import 'package:nhef/pages/nav_resource.dart';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;


class LibraryResource extends StatefulWidget {
  @override
  _LibraryResourceState createState() => _LibraryResourceState();
}

class _LibraryResourceState extends State<LibraryResource> {
    final String url = "https://nhef.herokuapp.com/api/v1/resource/";

  Future<List<Resource>> _fetchResources() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Resource> listOfResource = items.map<Resource>((json) {
        return Resource.fromJson(json);
      }).toList();
      print(items);

      return listOfResource;
    } else {
      throw Exception('Failed to load internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("RESOURCES", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
            color: Colors.white,
          ),
          onPressed: (){
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage()),
              );
            }
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: (){},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Resource>>(
        future: _fetchResources(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: Image.asset(
                "assets/images/loader.gif",
                scale: 3.0,
              ),
            );

          return ListingScreen(snapshot.data);
        },
      ),
    );
  }
}




class ListingScreen extends StatelessWidget {
   final List<Resource> resource;
  ListingScreen(this.resource);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          padding: EdgeInsets.all(10),
          separatorBuilder: (BuildContext context, int index) {
            return Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width / 1.3,
                child: Divider(),
              ),
            );
          },

          itemCount: resource.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.list),
                  radius: 25,
                ),

                contentPadding: EdgeInsets.all(0),
                title: Text(resource[index].title.toString()),
                subtitle: Text(resource[index].detail.toString().substring(0,45) + "...\n" + resource[index].url.toString()),

              ),
            );
          }),
    );
  }
}