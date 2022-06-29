import 'package:aa/screens/add_screen.dart';
import 'package:aa/screens/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';


class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late final Box contactBox;

  _deleteInfo(int index) {
    contactBox.deleteAt(index);

    print('Öğe dizindeki kutudan silindi: $index');
  }

  @override
  void initState() {
    super.initState();

    contactBox = Hive.box('peopleBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kişi Bilgileri'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddScreen(),
          ),
        ),
        child: Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: contactBox.listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return Center(
              child: Text('Şimdilik burası sessiz :)'),
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var currentBox = box;
                var personData = currentBox.getAt(index)!;

                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UpdateScreen(
                        index: index,
                        person: personData,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text(personData.name),
                    subtitle: Text(personData.country),
                    trailing: IconButton(
                      onPressed: () => _deleteInfo(index),
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}