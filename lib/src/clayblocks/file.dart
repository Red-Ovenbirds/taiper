import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:taiper/taiper.dart';

class FileClayblock extends Clayblock {
  final FileType type;
  final String src;

  FileClayblock({@required this.type, @required this.src});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => _launchURL(context),
              child: Row(
          children: <Widget>[
            SizedBox(
                width: 60,
                height: 60,
                child: Icon(icon(),
                    size: 48, color: Theme.of(context).accentColor)),
            Expanded(child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
              child: Text(src),
            ))
          ],
        ),
      ),
    );
  }

  _launchURL(context) async {
    if (await canLaunch(src)) {
      await launch(src);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Erro"),
              content: new Text("Não foi possível abrir o link..."),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  IconData icon() {
    switch (type) {
      case FileType.document:
        return Icons.insert_drive_file;
      case FileType.image:
        return Icons.image;
      case FileType.link:
        return Icons.link;
      case FileType.music:
        return Icons.music_note;
      case FileType.video:
        return Icons.movie;
    }
    return Icons.insert_drive_file;
  }
}

enum FileType { document, image, link, music, video }

class FileClayblockFactory extends ClayblockFactory {
  Clayblock build(String data, String type) {
    final fileTypes = FileType.values;
    final fileType = fileTypes.firstWhere(
        (value) => value.toString().split(".").last == type,
        orElse: () => FileType.document);
    return FileClayblock(type: fileType, src: data);
  }
}
