import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.title,
    required this.note,
    required this.date,
  }) : super(key: key);

  final String title;
  final String note;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        padding:EdgeInsets.all(20) ,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          Text(note),
          Align(
            alignment: Alignment.centerRight,
            child: Text(date),
          ),
        ]),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ));
  }
}
