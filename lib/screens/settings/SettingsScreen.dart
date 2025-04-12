import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? _selectedNavigateOption;
  bool restrictLogin = false;
  bool restrictProfileEdit = false;
  bool resignationRequest = false;
  bool atWorkTracker = false;
  bool workInfoTracking = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildCard(
              title: 'Navigate Settings',
              child: DropdownButtonFormField<String>(
                value: _selectedNavigateOption,
                items: ['General', 'General Settings'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(border: OutlineInputBorder()),
                onChanged: (value) {
                  setState(() {
                    _selectedNavigateOption = value;
                  });
                },
              ),
            ),
            _buildCard(
              title: 'Announcement Expiration',
              child: Column(
                children: [
                  _buildTextField('Default Expiration Time', '30 Days'),
                  _buildSaveButton(),
                ],
              ),
            ),
            _buildCard(
              title: 'Employee Account Restrictions',
              child: Column(
                children: [
                  SwitchListTile(
                    title: Text('Restrict Login Account'),
                    value: restrictLogin,
                    onChanged: (value) {
                      setState(() {
                        restrictLogin = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Restrict Profile Edit'),
                    value: restrictProfileEdit,
                    onChanged: (value) {
                      setState(() {
                        restrictProfileEdit = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            _buildCard(
              title: 'Resignation Requests',
              child: SwitchListTile(
                title: Text('Resignation Requests'),
                value: resignationRequest,
                onChanged: (value) {
                  setState(() {
                    resignationRequest = value;
                  });
                },
              ),
            ),
            _buildCard(
              title: 'Time Runner',
              child: SwitchListTile(
                title: Text('At-Work Tracker'),
                value: atWorkTracker,
                onChanged: (value) {
                  setState(() {
                    atWorkTracker = value;
                  });
                },
              ),
            ),
            _buildCard(
              title: 'Notice Period',
              child: Column(
                children: [
                  _buildTextField('Default Notice Period', '40 Days'),
                  _buildSaveButton(),
                ],
              ),
            ),
            _buildCard(
              title: 'Badge Prefix',
              child: Column(
                children: [
                  _buildTextField('Prefix', 'PEP'),
                  _buildTextField('Company', 'SpacECE'),
                  _buildSaveButton(),
                ],
              ),
            ),
            _buildCard(
              title: 'Encashment Redemption Conditions',
              child: Column(
                children: [
                  _buildTextField('Bonus Unit', ''),
                  _buildTextField('Leave Unit', ''),
                  _buildTextField('Amount', ''),
                  _buildSaveButton(),
                ],
              ),
            ),
            _buildCard(
              title: 'Employee History Tracking',
              child: Column(
                children: [
                  _buildTextField('Tracking Fields', 'Employee Type'),
                  _buildSaveButton(),
                ],
              ),
            ),
            _buildCard(
              title: 'Currency',
              child: SwitchListTile(
                title: Text('Work Information Tracking'),
                value: workInfoTracking,
                onChanged: (value) {
                  setState(() {
                    workInfoTracking = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*Widget _buildCard({required String title, required Widget child}) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }*/


  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFCCCCCC)), // fine gray border
        borderRadius: BorderRadius.circular(6), // optional: to match Card shape
        boxShadow: [ // optional: for subtle elevation effect like Card
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }


  Widget _buildTextField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle save logic
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange),
        ),
        child: Text('Save Changes', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
