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
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
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
          ),
        );
      },
    );
  }
}