import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms_app/screens/help_desk/FAQ/SubFaqListScreen.dart';
import 'package:hrms_app/utils/constants/strings.dart';
import '../../../models/faq/FAQ.dart';

import '../../../models/faq/SubFaq.dart';
import '../../../utils/constants/app_colors.dart';
import 'EditFAQDialog.dart';
import 'FAQCard.dart';


class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<FAQ> faqList = [
    FAQ(
      title: "Leave Policy",
      description: "All about leave application process.",
      subFaqList: [
        SubFaq(question: "How to apply for leave?", answer: "Use the HR portal."),
        SubFaq(question: "Max leave allowed?", answer: "30 days annually."),
      ],
    ),
    FAQ(
      title: "Recruitment",
      description: "Details about hiring process.",
      subFaqList: [
        SubFaq(question: "Where to submit resume?", answer: "Careers page."),
      ],
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showCreatePopup(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(AppStrings.faqCreate, style: TextStyle(color: AppColors.white)),
              ),
            ),
            SizedBox(height: 16),


            Expanded(
              child: ListView.builder(
                itemCount: faqList.length,
                itemBuilder: (context, index) {
                  return FAQCard(
                    faq: faqList[index],
                    onViewPressed: () {
                      print('View ${faqList[index].title}');

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubFaqListScreen(
                            subFaqList: faqList[index].subFaqList,
                          ),
                        ),
                      );
                    },
                    onEditPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return EditFAQDialog(
                            initialTitle: faqList[index].title,
                            initialDescription: faqList[index].description,
                            onSave: (String updatedTitle, String updatedDescription) {
                              setState(() {
                                // Replace the entire object
                                faqList[index] = FAQ(
                                  title: updatedTitle,
                                  description: updatedDescription, subFaqList: [],
                                );
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('FAQ updated successfully!')),
                              );
                            },
                          );
                        },
                      );
                    },
                    onDeletePressed: () {
                      print('Delete ${faqList[index].title}');
                    },
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

void _showCreatePopup(BuildContext context) {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  final ScrollController suggestionScrollController = ScrollController();

  final List<String> suggestions = ['FAQ', 'Recruitment', 'Leave', 'Allocation'];
  final List<String> selectedTags = [];

  showDialog(

    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        backgroundColor: Colors.white, // Set white background
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Rounded corners
        title:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.faqCreate,
            style: const TextStyle(
              color: AppColors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ],
      ),


        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Question Field
                TextField(
                  controller: questionController,
                  decoration: InputDecoration(
                    labelText: 'Question',
                    labelStyle: const TextStyle(color: AppColors.dark),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.dark),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.dark),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.dark),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Answer Field
                TextField(
                  controller: answerController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Answer',
                    labelStyle: const TextStyle(color: AppColors.dark),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.dark),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.dark),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.dark),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Tag Input
                TextField(
                  controller: tagController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    labelText: 'FAQ Tags',
                    labelStyle: const TextStyle(color: AppColors.dark),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.dark),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.dark),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.dark),
                    ),
                  ),
                ),

                // Suggestions
                if (tagController.text.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade100,
                    ),
                    child: SizedBox(
                      height: 120,
                      child: Scrollbar(
                        controller: suggestionScrollController,
                        thumbVisibility: true,
                        child: Builder(
                          builder: (context) {
                            final filtered = suggestions
                                .where((item) =>
                            item.toLowerCase().contains(tagController.text.toLowerCase()) &&
                                !selectedTags.contains(item))
                                .toList();

                            if (filtered.isEmpty) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('No suggestions'),
                                ),
                              );
                            }

                            return ListView.builder(
                              controller: suggestionScrollController,
                              itemCount: filtered.length,
                              itemBuilder: (context, index) {
                                final suggestion = filtered[index];
                                return ListTile(
                                  dense: true,
                                  title: Text(suggestion),
                                  onTap: () {
                                    setState(() {
                                      selectedTags.add(suggestion);
                                      tagController.clear();
                                    });
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                const SizedBox(height: 12),

                // Selected Tags
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: selectedTags
                      .map((tag) => Chip(
                    label: Text(tag),
                    deleteIcon: const Icon(Icons.close),
                    onDeleted: () {
                      setState(() {
                        selectedTags.remove(tag);
                      });
                    },
                  ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              print('Question: ${questionController.text}');
              print('Answer: ${answerController.text}');
              print('Tags: $selectedTags');
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.orange,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    ),
  );
}

