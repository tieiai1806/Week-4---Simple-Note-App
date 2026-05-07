import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;

  const NoteCard({super.key, required this.note, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: _buildCardContainer(),
      ),
    );
  }

  Widget _buildCardContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: _buildCardContent(),
    );
  }

  Widget _buildCardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          note.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(
          note.content,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey[600]),
        ),
        const SizedBox(height: 10),
        _buildCardFooter(),
      ],
    );
  }

  Widget _buildCardFooter() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Text(
        DateFormat('dd/MM/yyyy').format(note.updatedAt),
        style: TextStyle(fontSize: 12, color: Colors.grey[400]),
      ),
    );
  }
}