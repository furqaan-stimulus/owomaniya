import 'package:flutter/material.dart';
import 'package:owomaniya/viewmodels/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Welcome '),
              RaisedButton(
                child: Text(' Ask Your Query'),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(30.0, 14.0, 30.0, 14.0),
                onPressed: () => model.navigateToQueryView(),
                color: Colors.pink,
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.pink),
                child: Text('Header'),
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Text('Share Your Voice'),
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Text('Ask a Query'),
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Text('Book a Test'),
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Text('Bookmarks'),
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Text('Favorite Experts'),
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Text('Free Consultation'),
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Text('Settings'),
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Text('Join as Expert'),
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Text('About'),
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('Logout'),
                  ],
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
