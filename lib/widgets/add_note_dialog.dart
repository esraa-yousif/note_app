import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:note_app/views/home/controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> showAddNoteDialog(BuildContext context) async=>
  showDialog(
    context: context,
    builder: (context) => _Dialog(),
  );


class _Dialog extends StatelessWidget {
  _Dialog({Key? key}) : super(key: key);

  String? title;
  String? note;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(
              onChanged: (value) => title = value,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
            TextField(
              onChanged: (value) => note = value,
              decoration: InputDecoration(
                hintText: 'Note',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (title == null ||
                    title!.isEmpty ||
                    note == null ||
                    note!.isEmpty) {
                  return;
                }
                final sp = await SharedPreferences.getInstance();
                print(title);
                print(note);
                print(HomeController.instance.notes);
                Navigator.pop(context);
                HomeController.instance.notes.insert(0, {
                  'title': title,
                  'note': note,
                  'date': DateTime.now().toString(),
                });
                List<String> data =[];
                for (var i in HomeController.instance.notes){
                  data.add(json.encode(i));
                }
                sp.setStringList('notes', data);
              },
              child: Text('Add Note'),
            )
          ])),
    );
  }
}
