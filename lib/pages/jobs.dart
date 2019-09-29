import 'package:flutter/material.dart';
import 'package:nhef/model/resources.dart';
import 'package:nhef/pages/nav_resource.dart';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

class JobListing extends StatefulWidget {
  @override
  _JobListingState createState() => _JobListingState();
}

class _JobListingState extends State<JobListing> {
  final String url = "https://nhef.herokuapp.com/api/v1/opportunity/";

  Future<List<Opportunity>> _fetchJobs() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Opportunity> listOfJobs = items.map<Opportunity>((json) {
        return Opportunity.fromJson(json);
      }).toList();
      print(items);

      return listOfJobs;
    } else {
      throw Exception('Failed to load internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OPPORTUNITIES", style: TextStyle(color: Colors.white),),
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
      body: FutureBuilder<List<Opportunity>>(
        future: _fetchJobs(),
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
  final List<Opportunity> jobs;
  ListingScreen(this.jobs);
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

          itemCount: jobs.length,
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
                title: Text(jobs[index].title.toString()),
                subtitle: Text(jobs[index].opportunity.toString() + "\nFrom " + jobs[index].company.toString()),

              ),
            );
          }),
    );
  }
}
