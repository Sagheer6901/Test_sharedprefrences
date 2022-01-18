import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_sharedpreferencees/constants.dart';
import 'package:test_sharedpreferencees/models/search_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ListingsScreen extends StatefulWidget {
  const ListingsScreen({Key? key}) : super(key: key);

  @override
  State<ListingsScreen> createState() => _ListingsScreenState();
}

class _ListingsScreenState extends State<ListingsScreen> {
  List <String?> images = [];
  List <String?> title = [];

  Future <void> getData () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = 0;
    while (prefs.getString('image$counter') != null) {
      images.add(prefs.getString('image$counter'));
      title.add(prefs.getString('imageTitle$counter'));
      print('added $counter');
      counter++;
    }
    setState(() {

    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.secondaryColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: Container(
              margin: const EdgeInsets.only(left: 10),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Constants.secondaryColor,
                ),
                onPressed: () {},
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.bell,
                  color: Constants.secondaryColor,
                ),
                onPressed: () {},
              ),
            ],
            backgroundColor: Constants.primaryColor,
            floating: true,
            expandedHeight: 50,
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  60,
                ),
                bottomRight: Radius.circular(
                  60,
                ),
              ),
            ),
            stretch: false,
            collapsedHeight: 180,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SearchBar(
                  prefixIcon: Icons.search,
                  hintText: 'What bookmark are you searching for?',
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context,int index) {
              if (images.isEmpty) {
                return Container(
                  color: Constants.secondaryColor,
                  height: double.maxFinite,
                  child: const Center(
                    child: Text(
                      'Nothing',
                    ),
                  ),
                );
              }
              else {
                return Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Constants.secondaryColor,
                  ),
                  child: Card(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 25,
                      right: 25,
                      bottom: 5,
                    ),
                    color: Constants.secondaryColor,
                    child: ListTile(
                      title: Text(
                        title[index].toString(),
                        style: TextStyle(
                          fontSize: 22,
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Row(children: [
                        IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: Constants.shadePrimaryColor,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.star,
                            color: Constants.shadePrimaryColor,
                          ),
                          onPressed: () {},
                        ),
                      ],),
                      leading: Container(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child:
                        Image.file(
                          File(images[index]!),
                        ),
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Constants.shadePrimaryColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                );
              }
            },
              childCount: images.length,
            ),
          ),
        ],
        shrinkWrap: true,
      ),
    );
  }
}