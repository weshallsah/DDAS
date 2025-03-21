import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;


class FileExplorerApp extends StatelessWidget {
  const FileExplorerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter File Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const FileExplorerPage(),
    );
  }
}

class FileExplorerPage extends StatefulWidget {
  const FileExplorerPage({Key? key}) : super(key: key);

  @override
  _FileExplorerPageState createState() => _FileExplorerPageState();
}

class _FileExplorerPageState extends State<FileExplorerPage> {
  String currentPath = "C:";
  List<FileSystemEntity> files = [];

  @override
  void initState() {
    super.initState();
    _listDir(currentPath);
  }

  void _listDir(String path) async {
    try {
      final dir = Directory(path);
      var children = dir.listSync();
      setState(() {
        currentPath = path;
        files = children;
      });
    } catch (e) {
      print('Error reading directory: $e');
    }
  }

  void _goBack() {
    final parent = Directory(currentPath).parent;
    _listDir(parent.path);
  }

  Widget _buildFileItem(FileSystemEntity entity) {
    String name = p.basename(entity.path);
    bool isDir = FileSystemEntity.isDirectorySync(entity.path);

    return ListTile(
      leading: Icon(isDir ? Icons.folder : Icons.insert_drive_file),
      title: Text(name),
      onTap: () {
        if (isDir) {
          _listDir(entity.path);
        } else {
          // Optional: You can open the file with an external app.
          _openFile(entity.path);
        }
      },
    );
  }

  void _openFile(String path) {
    // You can add functionality to open files.
    // For Windows, you can use Process.start:
    Process.start('explorer.exe', [path]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explorer - $currentPath'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _goBack,
        ),
      ),
      body: ListView.builder(
        itemCount: files.length,
        itemBuilder: (context, index) {
          return _buildFileItem(files[index]);
        },
      ),
    );
  }
}