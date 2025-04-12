import 'package:flutter/material.dart';

class EditFAQDialog extends StatefulWidget {
  final String initialTitle;
  final String initialDescription;
  final Function(String title, String description) onSave;

  const EditFAQDialog({
    Key? key,
    required this.initialTitle,
    required this.initialDescription,
    required this.onSave,
  }) : super(key: key);

  @override
  _EditFAQDialogState createState() => _EditFAQDialogState();
}

class _EditFAQDialogState extends State<EditFAQDialog> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.initialTitle);
    descriptionController = TextEditingController(text: widget.initialDescription);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Update FAQ Category'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // cancel
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSave(
              titleController.text,
              descriptionController.text,
            );
            Navigator.pop(context); // close dialog
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
