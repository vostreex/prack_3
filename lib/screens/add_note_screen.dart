import 'package:flutter/material.dart';
import 'package:prack_3/main.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'Введите заметку'),
          ),
        SizedBox(height: 10,width: 10,),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                setState(() {
                  notes.add(_controller.text);
                  _controller.clear();
                });
              }
            },
            child: const Text('Добавить'),
          ),
        ],
      ),
    );
  }
}