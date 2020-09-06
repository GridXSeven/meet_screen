import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'create_meet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      home: CreateMeet(),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class MeetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff9C27B0),
        title: Text("Never Eat Alone"),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Color(0x56000000),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(child: MeetCard()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CreateButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MeetCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/coffee.png"), fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  child: Container(
                    color: Color(0x96000000),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Сup of coffee",
                                  style: whiteTextStyle(25),
                                ),
                                Text(
                                  "5m ago",
                                  style: whiteTextStyle(15),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Container(
                                width: double.maxFinite,
                                child: Text(
                                  "Owner Nickname",
                                  style: whiteTextStyle(15),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: 16.0,
                  ),
                  MeetPurpose(),
                  AboutMe(),
                  AboutYou(),
                  MeetLocation(),
                ],
              ),
            ),
          ),
        ),
        MeetBottomButtonBar(),
      ],
    );
  }
}

class CreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(
          child: Text(
            "create my meet on this place".toUpperCase(),
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff9C27B0),
            ),
          ),
        ),
      ),
    );
  }
}

class MeetPurpose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerticalCardBlock(
      text: Text(
        "Meet purpose",
        style: TextStyle(fontSize: 20, fontWeight: titelWeight),
      ),
      child: Text(
          "text text text text text text text text text text text text text text text text text text text text text text text text text text text "),
    );
  }
}

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerticalCardBlock(
      text: Text(
        "About me",
        style: TextStyle(fontSize: 20, fontWeight: titelWeight),
      ),
      child: Container(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            MyCustomChip(text: "Footbal"),
            MyCustomChip(text: "Programming"),
            MyCustomChip(text: "Dogs"),
            MyCustomChip(text: "Footbal"),
            MyCustomChip(text: "Programming"),
            MyCustomChip(text: "Dogs"),
          ],
        ),
      ),
    );
  }
}

class MyCustomChip extends StatelessWidget {
  MyCustomChip({@required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Chip(
        label: new Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: new TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF9C27B0),
      ),
    );
  }
}

class AboutYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerticalCardBlock(
      text: Row(
        children: [
          Text(
            "About you",
            style: TextStyle(fontSize: 20, fontWeight: titelWeight),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "(Want to meet)",
            style: TextStyle(
                fontSize: 15, fontWeight: titelWeight, color: Colors.black45),
          ),
        ],
      ),
      child: Container(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            MyCustomChip(text: "Footbal"),
            MyCustomChip(text: "Designer"),
            MyCustomChip(text: "Art"),
            MyCustomChip(text: "Footbal"),
            MyCustomChip(text: "Programming"),
            MyCustomChip(text: "Dogs"),
          ],
        ),
      ),
    );
  }
}

class MeetLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerticalCardBlock(
      text: Text(
        "Location",
        style: TextStyle(fontSize: 20, fontWeight: titelWeight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("LOFT GAME BAR"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/location_icon.png"),
                    ),
                    Text("Sichovykh Striltsiv St, 40, Kyiv, 04053"),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/time_icon.png"),
                    ),
                    Text("5:00 PM Mon, July 27"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MeetBottomButtonBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Divider(
            color: Color(0x409C27B0),
            height: 1,
          ),
          Row(
            children: [
              Expanded(
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    "ANOTHER ONE",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )),
              ),
              Expanded(
                child: Container(
                  color: Color(0x409C27B0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: AutoSizeText(
                        "INTERESTED!",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff9C27B0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class VerticalCardBlock extends StatelessWidget {
  VerticalCardBlock({
    @required this.text,
    @required this.child,
  });
  final Widget child;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: child,
        ),
      ],
    );
  }
}
