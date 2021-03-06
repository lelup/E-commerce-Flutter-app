import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:hello_new/NavigationBar/about_section.dart';
import 'package:hello_new/NavigationBar/history.dart';
import 'package:hello_new/NavigationBar/my_account.dart';
import 'package:hello_new/NavigationBar/my_order.dart';
import 'package:hello_new/NavigationBar/privacy_policy.dart';
import 'package:hello_new/adminScreen/admin_home.dart';
import 'package:hello_new/appBar/notification_page.dart';

import 'package:hello_new/product_lists.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imagecarousel = new Container(
      height: 200.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('images/genda.jpg'),
            AssetImage('images/ranjighanda.jpg'),
            AssetImage('images/mogralanger.jpg'),
            AssetImage('images/kudiyellow.jpg'),
          ],
          animationCurve: Curves.fastOutSlowIn,
          autoplay: true,
          animationDuration: Duration(milliseconds: 100),
          dotSize: 5,
          indicatorBgPadding: 5.0,
          dotBgColor: Colors.transparent,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onLongPress: openAdmin,
          child: Text("UNIQUE FLOWERS",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.white)),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          //Search Button
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          //Notification Button
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => NotificationPage())),
          ),
          //Shopping Cart Button
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 10,
        child: ListView(
          children: <Widget>[
            //UserProfile Inkewell
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyAccounts())),
              child: UserAccountsDrawerHeader(
                accountName:
                    Text("Sagar Shende", style: TextStyle(color: Colors.white)),
                accountEmail: Text("sagarshende631@gmail.com",
                    style: TextStyle(color: Colors.white)),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.people,
                      color: Colors.blue,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            //HomePage
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HomePage())),
              child: ListTile(
                title: Text("Home Page"),
                leading: Icon(
                  Icons.home,
                  color: Colors.green,
                ),
              ),
            ),
            //History
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => History())),
              child: ListTile(
                title: Text("History"),
                leading: Icon(
                  Icons.history,
                  color: Colors.black,
                ),
              ),
            ),
            //MyAccount
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyAccounts())),
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(Icons.person),
              ),
            ),
            //MyOrder
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyOrder())),
              child: ListTile(
                title: Text("My Order"),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            Divider(),
            //About
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AboutSection())),
              child: ListTile(
                title: Text("About"),
                leading: Icon(
                  Icons.help,
                  color: Colors.blue,
                ),
              ),
            ),
            //PrivacyPolicy
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PrivacyPolicy())),
              child: ListTile(
                title: Text("Privacy Policy"),
                leading: Icon(
                  Icons.help_outline,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ProductList(),
    );
  }

  openAdmin() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => AdminHome()));
  }
}
