import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookmarkButton extends StatefulWidget {
  final bool bookmark;
  final Function() onPressed;

  const BookmarkButton({Key key, this.bookmark, this.onPressed}) : super(key: key);

  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.bookmark == false
          ? SvgPicture.asset(
              "assets/svg/tag_inactive.svg",
              width: 10.0,
              height: 16.0,
            )
          : SvgPicture.asset(
              "assets/svg/tag_active.svg",
              width: 10.0,
              height: 16.0,
            ),
      onTap: () {},
    );
  }
}
