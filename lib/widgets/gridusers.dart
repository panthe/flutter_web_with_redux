import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
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
                  left: 30.0,
                  right: 30.0,
                  bottom: 50.0
              ),
              color: Theme.of(context).backgroundColor,
              child: StoreConnector<AppState, User>(
                  converter: (store) => store.state.userState.user,
                  builder: (BuildContext context, User user){

                    final card = ViewUser(user: user);
                    return card;
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
        child:Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 80.0,
                      width: 80.0,
                      margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
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
                  ],
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
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.addressCard,
                            color: Colors.blueGrey,
                            size: 32.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text('Country',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(user.location.country,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('State',
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(user.location.state,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('City',
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(user.location.city,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                )
              ],
            )

          ],
        )
    );
  }
}

