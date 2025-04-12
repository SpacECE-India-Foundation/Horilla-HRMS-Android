import 'package:flutter/material.dart';
import 'package:hrms_app/models/tickets/TicketData.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/strings.dart';

class TicketsScreen extends StatefulWidget {
  @override
  _TicketsScreenState createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  List<TicketData> tickets = [
    TicketData(
      id: 'WDR11111',
      title: 'Lorem Ipsum Dolor...',
      ownerName: 'Alice Johnson',
      ownerImage: 'assets/images/logo_image.png',
      type: 'Login Issue',
      forwardTo: 'IT Department',
      assignedToName: 'Mark Spencer',
      assignedToImage: 'assets/images/logo_image.png',
    ),
    TicketData(
      id: 'WDR22222',
      title: 'Unable to process request',
      ownerName: 'Bob Smith',
      ownerImage: 'assets/images/logo_image.png',
      type: 'Transaction Error',
      forwardTo: 'Finance Team',
      assignedToName: 'Jessica Lee',
      assignedToImage: 'assets/images/logo_image.png',
    ),
    TicketData(
      id: 'WDR33333',
      title: 'Data mismatch in records',
      ownerName: 'Clara Wells',
      ownerImage: 'assets/images/logo_image.png',
      type: 'Data Integrity',
      forwardTo: 'Records Department',
      assignedToName: 'Derek Tan',
      assignedToImage: 'assets/images/logo_image.png',
    ),
  ];

  bool _showMoreOptions = false;
  int? expandedIndex;

  int selectedTicketOption = 0; // 0 = My Tickets, 1 = Suggested, 2 = All

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // More options, create
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showMoreOptions = !_showMoreOptions;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _showMoreOptions ? AppStrings.lessOptions : AppStrings.moreOptions,
                          style: TextStyle(color: AppColors.white),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          _showMoreOptions ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                ),


                SizedBox(width: 8),

                Expanded(
                child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                Icon(Icons.add, color: AppColors.white, size: 20), // Plus icon
                SizedBox(width: 5),
    Text(
    AppStrings.create,
    style: TextStyle(color: AppColors.white),
    ),
    ],
    ),
    ),
    ),

              ],
            ),

            // Filter, GroupBy, Actions
            if (_showMoreOptions) ...[
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Filter Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.filter_alt_outlined, color: AppColors.white, size: 20),
                          const SizedBox(width: 6),
                          Text(AppStrings.filter, style: TextStyle(color: AppColors.white)),
                          const SizedBox(width: 6),
                          Icon(Icons.arrow_drop_down, color: AppColors.white, size: 20),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 8),

                  // Group By Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppStrings.groupBy, style: TextStyle(color: AppColors.white)),
                          const SizedBox(width: 6),
                          Icon(Icons.arrow_drop_down, color: AppColors.white, size: 20),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 8),

                  // Actions Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppStrings.actions, style: TextStyle(color: AppColors.white)),
                          const SizedBox(width: 6),
                          Icon(Icons.arrow_drop_down, color: AppColors.white, size: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],



            // Divider after Filter, GroupBy, Actions
            SizedBox(height: 10),
            Container(
              height: 1,
              color: Color(0xFFCCCCCC),
              margin: const EdgeInsets.symmetric(horizontal: 5),
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(3, (index) {
                final options = ['My Tickets', 'Suggested Tickets', 'All Tickets'];
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: index == 1 ? 4 : 0),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          selectedTicketOption = index;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: selectedTicketOption == index
                            ? AppColors.orange
                            : Colors.white,
                        side: BorderSide(color: AppColors.orange),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6), // control height and spacing
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          options[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: selectedTicketOption == index
                                ? Colors.white
                                : AppColors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),




            // Ticket List
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: tickets.length,
              itemBuilder: (BuildContext context, int index) {
                final ticket = tickets[index];
                final isExpanded = expandedIndex == index;

                return Card(
                  elevation: 2,

                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Color(0xFFCCCCCC), width: 1), // border added here
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Ticket ID: ${ticket.id}'),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(ticket.ownerImage),
                        ),
                        trailing: Icon(
                          isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                          size: 25,
                        ),
                        onTap: () {
                          setState(() {
                            expandedIndex = isExpanded ? null : index;
                          });
                        },
                      ),

                      // Divider after ListTile
                      Container(
                        height: 1,
                        color: Color(0xFFCCCCCC),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                      ),

                      if (isExpanded)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Title: ${ticket.title}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildInfoColumn('Owner', ticket.ownerName, ticket.ownerImage),
                                  _buildInfoColumn('Type', ticket.type),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildInfoColumn('Forward To', ticket.forwardTo),
                                  _buildInfoColumn('Assigned To', ticket.assignedToName, ticket.assignedToImage),
                                ],
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                );

              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value, [String? imagePath]) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        if (imagePath != null)
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(imagePath),
          ),
        if (imagePath != null) const SizedBox(height: 4),
        Text(value),
      ],
    );
  }
}
