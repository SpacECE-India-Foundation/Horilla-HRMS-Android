import 'package:flutter/material.dart';

import '../../../models/faq/SubFaq.dart';

class SubFaqListScreen extends StatefulWidget {
  final List<SubFaq> subFaqList;

  const SubFaqListScreen({super.key, required this.subFaqList});

  @override
  State<SubFaqListScreen> createState() => _SubFaqListScreenState();
}

class _SubFaqListScreenState extends State<SubFaqListScreen> {
  late List<SubFaq> subFaqs;

  @override
  void initState() {
    super.initState();
    subFaqs = List.from(widget.subFaqList); // Make a mutable copy
  }

  void _editFaq(int index) {
    final TextEditingController questionController =
    TextEditingController(text: subFaqs[index].question);
    final TextEditingController answerController =
    TextEditingController(text: subFaqs[index].answer);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Sub FAQ'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: questionController,
              decoration: const InputDecoration(labelText: 'Question'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: answerController,
              decoration: const InputDecoration(labelText: 'Answer'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                subFaqs[index].question = questionController.text;
                subFaqs[index].answer = answerController.text;
              });
              Navigator.pop(context);
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  void _deleteFaq(int index) {
    setState(() {
      subFaqs.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange, // Set the color of the top bar
        elevation: 6,
        title: Row(
          children: [
            // Back Arrow
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            // Logo
            Image.asset(
              'assets/images/logo_image-removebg-preview.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 8),
            // Title
            const Text(
              "FAQs",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Body Content
            Expanded(
              child: subFaqs.isEmpty
                  ? const Center(child: Text("No Sub FAQs available"))
                  : ListView.builder(
                itemCount: subFaqs.length,
                itemBuilder: (context, index) {
                  final faq = subFaqs[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      title: Text(faq.question),
                      subtitle: Text(faq.answer),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'edit') {
                            _editFaq(index);
                          } else if (value == 'delete') {
                            _deleteFaq(index);
                          }
                        },
                        itemBuilder: (context) => const [
                          PopupMenuItem(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                          PopupMenuItem(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
