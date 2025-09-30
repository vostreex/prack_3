import 'package:flutter/material.dart';
import 'package:prack_3/main.dart';

class NotesListScreen extends StatefulWidget {
  const NotesListScreen({super.key});

  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text(notes[index]),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  notes.removeAt(index);
                });
              },
            ),
          ],
        );
      },
    );
  }
}