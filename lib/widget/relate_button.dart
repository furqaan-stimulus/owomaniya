import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RelateButton extends StatefulWidget {
  final Function() onPressed;
  final bool relate;

  const RelateButton({Key key, this.onPressed, this.relate}) : super(key: key);

  @override
  _RelateButtonState createState() => _RelateButtonState();
}

class _RelateButtonState extends State<RelateButton> {
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
                    widget.relate
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
                      'I Relate',
                      style: TextStyle(color: widget.relate ? Colors.black : Colors.pink),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
