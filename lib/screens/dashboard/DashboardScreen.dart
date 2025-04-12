import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../models/announcement/AnnouncementData.dart';
import '../../models/employee/EmployeeWork.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<AnnouncementData> announcements = [
    AnnouncementData(message: "Announcement 1", imageUrl: ""),
    AnnouncementData(message: "Announcement 2", imageUrl: ""),
    AnnouncementData(message: "Announcement 3", imageUrl: ""),
    AnnouncementData(message: "Announcement 4", imageUrl: ""),
  ];

  final List<EmployeeWork> employees = [
    EmployeeWork(name: "Employee Name", progress: 0.3),
    EmployeeWork(name: "Employee Name", progress: 0.5),
    EmployeeWork(name: "Employee Name", progress: 0.7),
    EmployeeWork(name: "Employee Name", progress: 0.6),
  ];

  final Map<String, double> dataMap = {
    "On Track": 15,
    "Closed": 5,
    "Not Started": 80,
  };

  final colorList = <Color>[
    Colors.green.shade300,
    Colors.red.shade300,
    Colors.blue.shade300,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Announcement Section
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Announcements",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.orange),
                          onPressed: () {
                            // Add action
                          },
                        )
                      ],
                    ),
                    const Divider(),
                    ...announcements.map((item) => ListTile(
                      leading: const CircleAvatar(backgroundColor: Colors.grey),
                      title: Text(item.message),
                    )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Employee Work Information Section
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Employee Work Information",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const Divider(),
                    Row(
                      children: const [
                        Expanded(
                            child: Text("Employee", style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            child:
                            Text("Work Information", style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...employees.map((employee) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Expanded(child: Text(employee.name)),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: LinearProgressIndicator(
                                value: employee.progress,
                                backgroundColor: Colors.grey.shade300,
                                color: Colors.green,
                                minHeight: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),

            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      "Key Results Chart",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    PieChart(
                      dataMap: dataMap,
                      colorList: colorList,
                      chartType: ChartType.disc,
                      chartLegendSpacing: 32,
                      legendOptions: const LegendOptions(
                        showLegends: true,
                        legendPosition: LegendPosition.top,
                        legendTextStyle: TextStyle(fontSize: 12),
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValues: false,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
