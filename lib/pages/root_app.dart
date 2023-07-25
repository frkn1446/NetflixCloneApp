import 'package:fl_netflix_app/json/root_app_json.dart';
import 'package:fl_netflix_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        Center(
          child: Text(
            "Coming Soon",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        Center(
          child: Text(
            "Search",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        Center(
          child: Text(
            "Downloads",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = index;
                });
              },
              child: Column(
                children: [
                  Icon(
                    items[index]['icon'],
                    color: Colors.white,
                  ),
                  SizedBox(height: 6),
                  Text(
                    items[index]['text'],
                    style: TextStyle(
                        fontSize: 10,
                        color: activeTab == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5)
                        //color: Colors.white,
                        ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
