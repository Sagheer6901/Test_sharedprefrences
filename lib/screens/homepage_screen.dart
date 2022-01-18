import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_sharedpreferencees/constants.dart';
import 'package:test_sharedpreferencees/models/search_bar.dart';
import 'package:test_sharedpreferencees/screens/add_screen.dart';
import 'package:test_sharedpreferencees/screens/listing_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static List<IconData> categoryIcons = [
    Icons.lightbulb_outline,
    Icons.music_note_outlined,
    Icons.tv_outlined,
    Icons.cookie_outlined,
    Icons.airplane_ticket_outlined,
    Icons.science_outlined,
  ];

  static List<String> categories = [
    'New ideas',
    'Music',
    'Programming',
    'Cooking',
    'Traveling',
    'Science',
  ];

  static List<Color> categoryColors = [
    Colors.orangeAccent.shade100,
    Colors.lightBlueAccent.shade100,
    Colors.purpleAccent.shade200,
    Colors.pinkAccent.shade100,
    Colors.green.shade200,
    Colors.orangeAccent.shade400,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: Container(
                margin: const EdgeInsets.only(left: 25),
                child: IconButton(
                  icon: Icon(
                    Icons.scatter_plot,
                    color: Constants.secondaryColor,
                  ),
                  onPressed: () {},
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.notifications_none,
                    color: Constants.secondaryColor,
                  ),
                  onPressed: () {},
                ),
              ],
              backgroundColor: Constants.primaryColor,
              floating: true,
              expandedHeight: 200,
              shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    80,
                  ),
                  bottomRight: Radius.circular(
                    80,
                  ),
                ),
              ),
              stretch: false,
              collapsedHeight: 220,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 25,
                      right: 10,
                    ),
                    child: Text(
                      'Hi Sonia',
                      style: TextStyle(
                        color: Constants.secondaryColor,
                        fontSize: Constants.f1,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 5,
                      left: 25,
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 5,
                            right: 10,
                          ),
                          child: Text(
                            'Welcome Back',
                            style: TextStyle(
                              color: Constants.secondaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.handshake,
                          color: Colors.yellow.shade700,
                        )
                      ],
                    ),
                  ),
                  const SearchBar(
                    prefixIcon: Icons.search_rounded,
                    hintText: 'What category are you searching for?',
                  ),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.only(
                      top: 15,
                      left: 15,
                      right: 15,
                      bottom: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        35,
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const ListingsScreen();
                          }),
                        );
                      },
                      tileColor: categoryColors[index].withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          35,
                        ),
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                Constants.secondaryColor.withOpacity(0.86),
                            radius: 45,
                            child: Icon(
                              categoryIcons[index],
                              size: 45,
                              color: categoryColors[index],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 15,
                            ),
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                color: categoryColors[index],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: 6,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1,
              ),
            ),
          ],
          shrinkWrap: true,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          CupertinoIcons.add,
          color: Constants.secondaryColor,
        ),
        backgroundColor: Constants.primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) {
              return const AddScreen();
            }),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
      ),
    );
  }
}
