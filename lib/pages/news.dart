import 'package:flutter/material.dart';
import 'package:nhef/model/resources.dart';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

class NewsListing extends StatefulWidget {
  @override
  _NewsListingState createState() => _NewsListingState();
}

class _NewsListingState extends State<NewsListing> {
  final String url = "https://nhef.herokuapp.com/api/v1/news/";

  Future<List<News>> _fetchScholars() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<News> listOfNews = items.map<News>((json) {
        return News.fromJson(json);
      }).toList();
      print(items);

      return listOfNews;
    } else {
      throw Exception('Failed to load internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<News>>(
        future: _fetchScholars(),
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
  final List<News> news;
  ListingScreen(this.news);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: news.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical:20.0),
              child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(child: Icon(Icons.school),),
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FittedBox(
                                                                  child: Row(
                                    children: <Widget>[
                                      Text("TITLE : ",style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text(news[index].title,style: TextStyle(fontFamily: 'montserrat'),),
                                    ],
                                  ),
                                ),
                                 FittedBox(
                                                                  child: Row(
                                    children: <Widget>[
                                      Text("AUTHOR : ",style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text(news[index].author,style: TextStyle(fontFamily: 'montserrat'),),
                                    ],
                                  ),
                                ),
                                 FittedBox(
                                                                  child: Row(
                                    children: <Widget>[
                                      Text("DATE : ",style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text(news[index].dateadded,style: TextStyle(fontFamily: 'montserrat'),),
                                    ],
                                  ),
                                ),
                               
                                
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
