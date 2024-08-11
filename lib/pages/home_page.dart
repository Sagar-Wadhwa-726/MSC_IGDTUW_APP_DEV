// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_catalog/controller/fetchMeme.dart";
import "package:flutter_catalog/utils/reusable_widget.dart";
import "package:flutter_catalog/utils/routes.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = "";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    changeImage(context);
  }

  void changeImage(context) async {
    setState(() {
      isLoading = true;
    });

    String newUrl = await FetchMeme.fetchMeme(context);
    setState(() {
      url = newUrl;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("ProMemes App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 150),
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Image.network(url),
            ),
            ElevatedButton(
              onPressed: () => changeImage(context),
              child: Text("Make me laugh !"),
            ),
            Spacer(),
            Text(
              "App Created By : Sagar Wadhwa",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shopping App",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Order Anything within Minutes",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Profile"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(reusableSnackbar("User logged out !"));
                  Navigator.pushNamed(context, MyRoutes.loginRoute);
                }).onError((error, stackTrace) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(reusableSnackbar("Error $error"));
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_rounded),
              title: Text("Shop Page"),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.shopRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
