import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:flutter_web_with_redux/models/location.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_web_with_redux/redux/app/app_state.dart';
import 'package:flutter_web_with_redux/models/user.dart';

class GridUsers extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
        builder: (context, constraints) {
          return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              padding: EdgeInsets.only(
                  top: 30.0,
                  bottom: 50.0
              ),
              color: Theme.of(context).backgroundColor,
              child: StoreConnector<AppState, User>(
                  converter: (store) => store.state.userState.user,
                  builder: (BuildContext context, User user){

                    final card = ViewUser(user: user);
                    return SingleChildScrollView(
                      child: card
                    );
                  }
              )
          );
        }
    );
  }
}

class ViewUser extends StatelessWidget {
  final User user;

  ViewUser({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return user == null ? Text('No user data found')
        : Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 12,
              md: 6,
              lg: 4,
              child: ViewUserPictureAndName(user:user)
            ),
            ResponsiveGridCol(
              xs: 12,
              md: 6,
              lg: 4,
              child: ViewUserLocation(location: user.location),
            ),
            ResponsiveGridCol(
              xs: 12,
              md: 6,
              lg: 4,
              child: ViewUserContact(user:user)
            )
          ]
        )
    );
  }
}

class ViewUserPictureAndName extends StatelessWidget {
  final User user;

  ViewUserPictureAndName({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 80.0,
          width: 80.0,
          margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
          child:CircleAvatar(
            backgroundImage: NetworkImage(user.picture.large),
          ),
        ),
        Text(
          user.name.title + ' ' + user.name.first + ' ' + user.name.last,
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        Container(
          height: 40.0,
          width: 40.0,
          margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
          child:CircleAvatar(
            backgroundColor: user.gender == 'male' ? Colors.cyan[50] : Colors.pink[100],
            child: Icon(
              user.gender == 'male' ? FontAwesomeIcons.male : FontAwesomeIcons.female,
              color: user.gender == 'male' ? Colors.blue : Colors.pinkAccent,
              size: 28.0,
            ),
          ),
        ),
      ],
    );
  }
}

class ViewUserLocation extends StatelessWidget {
  final Location location;

  ViewUserLocation({Key key, this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(
                left:10.0,
                right:10.0,
                top:25.0,
                bottom: 25.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.addressBook,
                  color: Colors.blueGrey,
                  size: 32.0,
                ),
              ],
            )
        ),
        Container(
            margin: EdgeInsets.only(
                left: 10.0,
                right:10.0,
                top:25.0,
                bottom: 25.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Country',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text('State',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text('City',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text('Street',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            )
        ),
        Container(
            margin: EdgeInsets.only(
                left: 10.0,
                right:10.0,
                top:25.0,
                bottom: 25.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(location.country,
                  style: TextStyle(
                      fontWeight: FontWeight.normal
                  ),
                ),
                Text(location.state,
                  style: TextStyle(
                      fontWeight: FontWeight.normal
                  ),
                ),
                Text(location.city,
                  style: TextStyle(
                      fontWeight: FontWeight.normal
                  ),
                ),
                Text(location.street.name + ' ' + location.street.number.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.normal
                  ),
                ),
              ],
            )
        )
      ],
    );
  }
}

class ViewUserContact extends StatelessWidget {
  final User user;

  ViewUserContact({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(
                left:10.0,
                right:10.0,
                top:25.0,
                bottom: 25.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.solidAddressBook,
                  color: Colors.blueGrey,
                  size: 32.0,
                ),
              ],
            )
        ),
        Container(
            margin: EdgeInsets.only(
                left: 10.0,
                right:10.0,
                top:25.0,
                bottom: 25.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Email',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text('Phone',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text('Cell',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            )
        ),
        Container(
            margin: EdgeInsets.only(
                left: 10.0,
                right:10.0,
                top:25.0,
                bottom: 25.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(user.email,
                  style: TextStyle(
                      fontWeight: FontWeight.normal
                  ),
                ),
                Text(user.phone,
                  style: TextStyle(
                      fontWeight: FontWeight.normal
                  ),
                ),
                Text(user.cell,
                  style: TextStyle(
                      fontWeight: FontWeight.normal
                  ),
                )
              ],
            )
        )
      ],
    );
  }
}

