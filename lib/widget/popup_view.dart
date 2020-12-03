import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/widget/custom_pop_up_menu.dart';

class PopupView extends StatefulWidget {
  @override
  _PopupViewState createState() => _PopupViewState();
}

List choices = [
  CustomPopupMenu(
      title: 'Whatsapp', icon: SvgPicture.asset('assets/svg/whatsapp.svg')),
  CustomPopupMenu(
      title: 'Facbook', icon: SvgPicture.asset('assets/svg/facebook.svg')),
  CustomPopupMenu(
      title: 'Settings', icon: SvgPicture.asset('assets/svg/share_media.svg')),
];

bool isOpen = false;

class _PopupViewState extends State<PopupView> {
  CustomPopupMenu _selectedChoices = choices[0];

  void _select(CustomPopupMenu choice) {
    setState(() {
      _selectedChoices = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 90,
      child: PopupMenuButton(
        elevation: 4,
        // onCanceled: () {
        //   print('You have not choose anything');
        // },
        onSelected: (value) {
          _select(value);
        },
        itemBuilder: (context) =>
        [
          PopupMenuItem(
            value: choices[0],
            child: Row(
              children: <Widget>[
                SvgPicture.asset('assets/svg/whatsapp.svg'),
                SizedBox(
                  width: 10.0,
                ),
                Text('Whatsapp')
              ],
            ),
          ),
          PopupMenuItem(
            value: choices[1],
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/svg/facebook.svg',
                  width: 18,
                  height: 18,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text('Facebook')
              ],
            ),
          ),
          PopupMenuItem(
            value: choices[2],
            child: Row(
              children: <Widget>[
                SvgPicture.asset('assets/svg/share_media.svg'),
                SizedBox(
                  width: 10.0,
                ),
                Text('Share')
              ],
            ),
          ),
        ],
        icon: Row(
          children: [
            SvgPicture.asset(
              'assets/svg/share.svg',
              height: 20,
              width: 20,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text('Share'),
          ],
        ),
      ),
    );
  }
}
