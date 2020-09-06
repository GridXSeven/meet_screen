import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'constants.dart';

class CreateMeet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              title: new Text("widget.title"),
              centerTitle: true,
              pinned: false,
              floating: true,
              forceElevated: innerBoxIsScrolled,
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              UploadPhoto(),
              MeetLocationOnCreate(),
              SetTime(),
              MeetPurpose(),
              AboutMeCreate(),
            ],
          ),
        ),
      ),
    );
  }
}

class UploadPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/standart_photo.png"),
    );
  }
}

class MeetLocationOnCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Location",
          style: TextStyle(fontSize: 20, fontWeight: titelWeight),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("LOFT GAME BAR")),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/location_icon.png"),
                      AutoSizeText(
                        "Sichovykh Striltsiv St,\n 40, Kyiv, 04053",
                        minFontSize: 1,
                        maxFontSize: 66,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SetTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Set Time",
          style: TextStyle(fontSize: 20, fontWeight: titelWeight),
        ),
        Expanded(
          child: Center(
            child: Text("5:00 PM Mon, July 27"),
          ),
        ),
      ],
    );
  }
}

class MeetPurpose extends StatelessWidget {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return VerticalCardBlock(
        text: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            "Meet purpose",
            style: TextStyle(fontSize: 20, fontWeight: titelWeight),
          ),
        ),
        child: TextField(
          maxLines: 2,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            hintText: 'type something...',
            border: OutlineInputBorder(),
          ),
        ));
  }
}

class AboutMeCreate extends StatefulWidget {
  @override
  _AboutMeCreateState createState() => _AboutMeCreateState();
}

class _AboutMeCreateState extends State<AboutMeCreate> {
  List<String> tags = [
    "i like a football",
    "design",
    "Interested JS",
    "Interested Flutter",
    "Other",
  ];
  List<String> selectedTags = [null];

  List<DropdownMenuItem> dropDownMenuItems() {
    List<DropdownMenuItem> myList = [];
    for (var i = 0; i < tags.length; i++) {
      print(i);
      myList.add(DropdownMenuItem(
        child: Text(tags[i]),
        value: tags[i],
      ));
    }
    return myList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: selectedTags.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return DropdownButton(
            value: selectedTags[index],
            hint: Text('Choose'),
            onChanged: (v) {
              print(v);
              setState(() {
                selectedTags[index] = v;
                selectedTags.add(null);
              });
              tags.add(v + "dsa");
            },
            items: dropDownMenuItems(),
          );
        },
      ),
    );
  }
}
