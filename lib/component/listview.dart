import 'dart:io';

import 'package:ddas/controller/Sacn.controller.dart';
import 'package:ddas/controller/home.controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class listfiles extends StatelessWidget {
  List files;
  ScanController controller;
  listfiles({super.key, required this.files, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: files.length,
      itemBuilder: (context, index) {
        // String size = ;
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: 6,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    files[index][1],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "File_Path: ${files[index][2]}",
                  ),
                  Text(
                    "File_Size: ${controller.getFileSizeString(bytes: files[index][3])}",
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.Info.value = files[index];
                    },
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.blueGrey,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      controller.DeleteFile(files[index][0], files[index][2]);
                    },
                    icon: Icon(
                      Icons.delete_outline_outlined,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
