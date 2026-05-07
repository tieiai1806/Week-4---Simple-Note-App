import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../providers/note_provider.dart';

class NoteEditorScreen extends StatefulWidget {
  final Note? note;
  const NoteEditorScreen({super.key, this.note});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _onSave() {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();

    if (title.isEmpty) return;

    final now = DateTime.now();
    final note = Note(
      id: widget.note?.id,
      title: title,
      content: content,
      createdAt: widget.note?.createdAt ?? now,
      updatedAt: now,
    );

    final provider = Provider.of<NoteProvider>(context, listen: false);
    if (widget.note == null) {
      provider.addNote(note);
    } else {
      provider.updateNote(note);
    }
    Navigator.pop(context);
  }

  void _onDelete() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Delete Note'),
        content: const Text('Are you sure you want to remove this note?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              Provider.of<NoteProvider>(context, listen: false).deleteNote(widget.note!.id!);
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildUI(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      actions: [
        if (widget.note != null)
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            onPressed: _onDelete,
          ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            icon: const Icon(Icons.check_circle_outline, size: 28, color: Colors.deepPurple),
            onPressed: _onSave,
          ),
        ),
      ],
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        _buildTitleInput(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Divider(thickness: 1, height: 1),
        ),
        _buildContentInput(),
      ],
    );
  }

  Widget _buildTitleInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
      child: TextField(
        controller: _titleController,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          hintText: 'Title',
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildContentInput() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: TextField(
          controller: _contentController,
          maxLines: null,
          expands: true,
          textAlignVertical: TextAlignVertical.top,
          style: const TextStyle(fontSize: 18, height: 1.6),
          decoration: const InputDecoration(
            hintText: 'Start writing...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}