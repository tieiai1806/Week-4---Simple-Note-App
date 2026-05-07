import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/note_provider.dart';
import '../widgets/note_card.dart';
import 'note_editor_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFAB(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        'My Notes',
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      centerTitle: false,
    );
  }

  Widget _buildBody() {
    return Consumer<NoteProvider>(
      builder: (context, provider, child) {
        if (provider.notes.isEmpty) {
          return _buildEmptyState();
        }
        return _buildNoteList(provider);
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notes_rounded, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'No notes yet',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteList(NoteProvider provider) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 80),
      itemCount: provider.notes.length,
      itemBuilder: (context, index) {
        final note = provider.notes[index];
        return NoteCard(
          note: note,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteEditorScreen(note: note),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFAB(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NoteEditorScreen()),
      ),
      label: const Text('Add Note', style: TextStyle(fontWeight: FontWeight.bold)),
      icon: const Icon(Icons.add_rounded),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}