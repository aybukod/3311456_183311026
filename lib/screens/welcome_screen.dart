import 'package:aa/file.dart';
import 'package:aa/pages/animation_page.dart';
import 'package:aa/pages/login.dart';
import 'package:aa/screens/HomePage.dart';
import 'package:aa/screens/info_screen.dart';
import 'package:aa/service/auth_service.dart';
import 'components/body.dart';
import 'package:flutter/material.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),

        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Ayşe Aybüke Erim"),
                accountEmail: Text("erimaybukee@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                ),
              ),
              ListTile(
                title: Text('Anasayfa'),
                leading: Icon(Icons.home),

                  onTap: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => new splashscreen()));
                  }

              ),

              ListTile(
                title: Text('Profilim'),
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.person),
              ),
              ListTile(
                title: Text('Veri ekleme'),
                leading: Icon(Icons.data_usage),
                onTap: () {

                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => new FileOperationsScreen()));
                  }

              ),
              ListTile(
                title: Text('Hava Durumu'),
                onTap: () {
                    Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new HomeScreen()));
                },
                leading: Icon(Icons.cloud_outlined),
              ),
              ListTile(
                title: Text('Veritabanı'),
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new InfoScreen()));
                },
                leading: Icon(Icons.system_update_alt_rounded),
              ),
              Divider(),
              ListTile(
                title: Text('Çıkış yap'),
                onTap: () {
                  _authService.signOut();
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new LoginPage()));
                },
                leading: Icon(Icons.remove_circle),
              ),
            ],
          ),
        ),
        body: const Body());
  }
}
