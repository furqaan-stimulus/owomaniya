import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:owomaniya/widget/popup_view.dart';

class MyConsultationCard extends StatefulWidget {
  @override
  _MyConsultationCardState createState() => _MyConsultationCardState();
}

class _MyConsultationCardState extends State<MyConsultationCard> {
  bool descTextShowFlag = false;
  bool onChecked = false;
  bool isVisible = false;
  bool isProgress = false;
  bool isBookmark = false;

  void toggleBookmark() {
    setState(() {
      isBookmark = !isBookmark;
    });
  }

  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void isProgressing() {
    setState(() {
      isProgress = !isProgress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Card(
          elevation: 5.0,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Query on Menstruation',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              SvgPicture.asset(
                                'assets/svg/check_pink.svg',
                                height: 15.0,
                                width: 15.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'Answered',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.pink),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Posted 7 min ago',
                            // style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                      // SvgPicture.asset('assets/svg/dots.svg'),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: SvgPicture.asset('assets/svg/icon.svg'),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Text(
                          'Your Query Title Here Your Query Title Here Your Query Title Here',
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          maxLines: 3,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                          height: 20,
                          width: 20,
                          child: GestureDetector(
                            child: isBookmark == true
                                ? SvgPicture.asset(
                                    "assets/svg/tag_inactive.svg")
                                : SvgPicture.asset("assets/svg/tag_active.svg"),
                            onTap: () {
                              toggleBookmark();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 10.0),
                    child: Text(
                      'Disclaimer: Information provide by an expert here is for general informational purpose only and it should NOT be considered as substitute for professional expert(medical,psychological or fitness advice) as complete physical assessment of an individual has not been done. Please consult your nearest doctor/expert before acting on it. The advice is also not valid for medico-legal purposes.',
                      maxLines: descTextShowFlag ? 8 : 2,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          descTextShowFlag = !descTextShowFlag;
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          descTextShowFlag
                              ? Text(
                                  "Show Less",
                                  style: TextStyle(color: Colors.grey),
                                )
                              : Text("Continue Reading",
                                  style: TextStyle(color: Colors.grey))
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(
                                  Icons.account_circle,
                                  size: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dr. Princy Joseph',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text('Gynecologist & Obstetrician'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Disclaimer: Information provide by an expert here is for general informational purpose only and it should NOT be considered as substitute for professional expert(medical,psychological or fitness advice) as complete physical assessment of an individual has not been done. Please consult your nearest doctor/expert before acting on it. The advice is also not valid for medico-legal purposes.',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/full_consultation.svg',
                                  height: 15,
                                  width: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(child: Text('See Full Consultation')),
                                Container(
                                    height: 30,
                                    child: VerticalDivider(color: Colors.grey)),
                                SvgPicture.asset(
                                  'assets/svg/sidebar_query.svg',
                                  height: 18,
                                  width: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(child: Text('Ask Dr. a query')),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 20, top: 5,
                        // top: 12,
                        child: Container(
                          padding:
                              EdgeInsets.only(bottom: 5, left: 10, right: 10),
                          color: Colors.white,
                          child: Text(
                            'Expert Says',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('129 Relate with this'),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text('.'),
                        ),
                        Text('32 Comment'),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/relate_hand.svg',
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('I Relate'),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: toggleVisibility,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/comment.svg',
                                  height: 20,
                                  width: 20,
                                  color: isVisible == false
                                      ? Colors.black
                                      : Colors.pink,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Comment',
                                  style: TextStyle(
                                    color: isVisible == false
                                        ? Colors.black
                                        : Colors.pink,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        PopupView(),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Container(
                      child: Column(
                        children: [
                          Divider(color: Colors.grey),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Commenting as ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Furqaanbeg Mirza',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 20,
                                child: Checkbox(
                                  onChanged: (newValue) {
                                    setState(() {
                                      onChecked = !onChecked;
                                    });
                                  },
                                  value: onChecked,
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Anonymous',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 6.0, top: 8.0),
                                child: SvgPicture.asset(
                                  'assets/svg/anyonmans.svg',
                                  height: 40,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: 200,
                                  child: TextField(
                                    maxLines: null,
                                    decoration: InputDecoration(
                                        hintText:
                                            'Start typing your comment...',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.pink))),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: GestureDetector(
                                  onTap: () {
                                    print('send');
                                  },
                                  child: ClipOval(
                                    child: Container(
                                      color: Colors.grey,
                                      height: 55,
                                      width: 55,
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/svg/send.svg',
                                          height: 25,
                                          width: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Visibility(
                            visible: isProgress,
                            child: CircularProgressIndicator(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: SvgPicture.asset(
                                  'assets/svg/anyonmans.svg',
                                  height: 40,
                                ),
                              ),
                              // SizedBox(
                              //   width: 5.0,
                              // ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mirza',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    'comment',
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            child: Text('load more'),
                            onTap: isProgressing,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
