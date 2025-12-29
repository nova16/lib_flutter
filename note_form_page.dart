import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'note.dart';
import 'note_db.dart';

class NoteFormPage extends StatefulWidget {
  final Note? note;
  const NoteFormPage({super.key, this.note});

  @override
  State<NoteFormPage> createState() => _NoteFormPageState();
}

class _NoteFormPageState extends State<NoteFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleC = TextEditingController();
  final _contentC = TextEditingController();

  DateTime? _deadline;

  bool get _isEdit => widget.note != null;

  @override
  Widget build(BuildContext context) {
    final deadlineText = _deadline == null
        ? 'Tanpa deadline (Non-priority)'
        : DateFormat('dd MMM yyyy').format(_deadline!);

    final previewColor = noteColorByDeadline(_deadline);

    return Scaffold(
      appBar: AppBar(title: Text(_isEdit ? 'Edit Note' : 'Tambah Note')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: previewColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Preview warna (berdasarkan deadline)',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _titleC,
                decoration: const InputDecoration(
                  labelText: 'Judul',
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Judul wajib' : null,
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _contentC,
                decoration: const InputDecoration(
                  labelText: 'Isi',
                  border: OutlineInputBorder(),
                ),
                minLines: 4,
                maxLines: 8,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Isi wajib' : null,
              ),
              const SizedBox(height: 16),

              Text('Deadline: $deadlineText'),
              const SizedBox(height: 8),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: null,
                      child: const Text('Pilih Deadline'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: null,
                      child: const Text('Hapus Deadline'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),
              ElevatedButton(onPressed: null, child: const Text('Simpan')),
            ],
          ),
        ),
      ),
    );
  }
}
