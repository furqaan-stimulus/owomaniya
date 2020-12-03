import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookmarkCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5.0,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/svg/tag_active.svg'),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text(
                        'Bookmarked on 24 Nov 2020',
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 3,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: SvgPicture.asset('assets/svg/delete.svg'),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/stethoscope.png',
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(
                      width: 14.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "The Mystique of Female Masturbation - Explained by Sexuality Educator, Niyatii N Shah",
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text("23 Nov 2020"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
