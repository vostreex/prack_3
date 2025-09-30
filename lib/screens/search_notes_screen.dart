import 'package:flutter/material.dart';
import 'package:prack_3/main.dart';

class SearchNotesScreen extends StatefulWidget {
  const SearchNotesScreen({super.key});

  @override
  _SearchNotesScreenState createState() => _SearchNotesScreenState();
}

class _SearchNotesScreenState extends State<SearchNotesScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> filteredNotes = [];

  @override
  void initState() {
    super.initState();
    filteredNotes = notes;
    _controller.addListener(_filterNotes);
  }

  void _filterNotes() {
    final query = _controller.text.toLowerCase();
    setState(() {
      filteredNotes = notes
          .where((note) => note.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Поиск заметок',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: filteredNotes.isEmpty
                ? const Center(child: Text('Нет заметок для отображения'))
                : ListView.builder(
              itemCount: filteredNotes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredNotes[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}