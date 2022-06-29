import 'package:aa/file_utils.dart';
import 'package:flutter/material.dart';



class FileOperationsScreen extends  StatefulWidget{
  FileOperationsScreen() : super();

  final String title = "File";

  @override
  _FileOperationsScreenState createState() => _FileOperationsScreenState();
}

class _FileOperationsScreenState extends State<FileOperationsScreen> {
  String fileContents = "";
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: myController,
          ),
          ElevatedButton(onPressed: () {
            FileUtils.saveToFile(myController.text);
          }, child: Text("Dosyayı Kaydet"),


          ),
          ElevatedButton(
            child: Text("Dosyadan Oku"),
            onPressed: () {
              FileUtils.readFromFile().then((contents) {
                setState(() {
                  fileContents = contents;
                });
              });
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      child: Text("$myController"),
                    ),
                  ],
                ),
              );
            },
          ),
          Text(fileContents),
        ],
      ),
    );
  }
}
