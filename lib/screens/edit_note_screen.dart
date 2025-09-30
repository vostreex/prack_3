import 'package:flutter/material.dart';
import 'package:prack_3/main.dart';

class EditNoteScreen extends StatefulWidget {
  final int index;
  final String note;
  final Function(int, String) onNoteUpdated;

  const EditNoteScreen({
    super.key,
    required this.index,
    required this.note,
    required this.onNoteUpdated,
  });

  @override
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.note;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактировать заметку'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Редактировать заметку',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final text = _controller.text.trim();
                if (text.isNotEmpty) {
                  widget.onNoteUpdated(widget.index, _controller.text);
                  Navigator.pop(context);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Ошибка'),
                      content: const Text('Заметка не может быть пустой!'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}