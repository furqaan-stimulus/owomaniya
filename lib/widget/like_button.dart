import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikeButton extends StatefulWidget {
  final Function() onPressed;
  final bool liked;

  const LikeButton({Key key, this.onPressed, this.liked}) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GestureDetector(
              key: UniqueKey(),
              onTap: () {
                Row(
                  children: [
                    widget.liked
                        ? SvgPicture.asset(
                            'assets/svg/relate_hand.svg',
                            height: 20,
                            width: 20,
                          )
                        : SvgPicture.asset(
                            'assets/svg/relate_hand_pink.svg',
                            height: 20,
                            width: 20,
                          ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Like',
                      style: TextStyle(color: widget.liked ? Colors.black : Colors.pink),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
