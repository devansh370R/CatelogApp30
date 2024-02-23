import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  accountName: Text("Rana Devansh"),
                  accountEmail: Text("ranadevansh839@gamil.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/profile_image.png"),
                  ),
                )),
            ListTile(
              leading: Icon(CupertinoIcons.home),
              title: Text(
                "Home",
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled),
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail_solid),
              title: Text(
                "Email",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
