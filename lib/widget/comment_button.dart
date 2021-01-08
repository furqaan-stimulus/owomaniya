import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentButton extends StatefulWidget {
  final Function() onPressed;

  const CommentButton({Key key, this.onPressed}) : super(key: key);

  @override
  _CommentButtonState createState() => _CommentButtonState();
}

class _CommentButtonState extends State<CommentButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              'assets/svg/comment.svg',
              height: 20,
              width: 20,
              color: Colors.black,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Comment',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
