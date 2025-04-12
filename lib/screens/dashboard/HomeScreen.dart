
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms_app/screens/dashboard/CheckInButton.dart';
import 'package:hrms_app/screens/dashboard/DashboardScreen.dart';
import 'package:hrms_app/screens/help_desk/FAQ/FAQScreen.dart';
import 'package:hrms_app/screens/help_desk/Ticket/TicketsScreen.dart';
import 'package:hrms_app/screens/recruitment/RecruitmentDashboardScreen.dart';

import '../attendance/Attendance.dart';
import '../attendance/AttendanceActivities.dart';
import '../attendance/AttendanceDashboard.dart';
import '../attendance/AttendanceRequests.dart';
import '../attendance/BioMetricDevices.dart';
import '../attendance/HourAccount.dart';
import '../attendance/LateComeEarlyOut.dart';
import '../attendance/MyAttendance.dart';
import '../attendance/WorkRecords.dart';
import '../companies/CompaniesScreen.dart';
import '../employees/EmployeeDisciplinaryActions.dart';
import '../employees/EmployeeDocumentRequest.dart';
import '../employees/EmployeeOrganizationChart.dart';
import '../employees/EmployeePolicies.dart';
import '../employees/EmployeeProfileScreen.dart';
import '../employees/EmployeeRotatingShiftAssign.dart';
import '../employees/EmployeeRotatingWorkTypeAssign.dart';
import '../employees/EmployeeScreen.dart';
import '../employees/EmployeeShiftRequestsScreen.dart';
import '../employees/EmployeeWorkTypeRequests.dart';
import '../languages/LanguagesScreen.dart';
import '../leaves/AssignedLeave.dart';
import '../leaves/CompensatoryLeaveRequests.dart';
import '../leaves/LeaveAllocationRequests.dart';
import '../leaves/LeaveDashboard.dart';
import '../leaves/LeaveRequests.dart';
import '../leaves/LeaveTypes.dart';
import '../leaves/MyLeaveRequests.dart';
import '../notification/NotificationScreen.dart';
import '../onboarding/CandidatesViewScreen.dart';
import '../onboarding/OnboardingViewScreen.dart';
import '../recruitment/RecruitmentCandidatesScreen.dart';
import '../recruitment/RecruitmentInterviewsScreen.dart';
import '../recruitment/RecruitmentOpenJobsScreen.dart';
import '../recruitment/RecruitmentSkillZoneScreen.dart';
import '../recruitment/RecruitmentStagesScreen.dart';
import '../recruitment/RecruitmentSurveyScreen.dart';
import '../recruitment/RecruitmrntPipelineScreen.dart';
import '../settings/SettingsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedIndex;
  int? subMenuIndex;

  int? expandedIndex;

  String appBarTitle = 'Dashboard';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  // Screens for navigation


  // Sample menu items with submenus and icons
  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'Dashboard',
      'default_icon': 'assets/icons/dashboard.png',
      'selected_icon': 'assets/icons/dashboard_selected.png',
      'subMenu': []
    },
   {
      'title': 'Recruitment',
      'default_icon': 'assets/icons/recruitment.png',
      'selected_icon': 'assets/icons/recruitment_selected.png',
      'subMenu': [
        'Dashboard',
        'Recruitment Pipeline',
        'Recruitment Survey',
        'Candidates',
        'Interviews',
        'Recruitment',
        'Open Jobs',
        'Stages',
        'Skill Zone'
      ]
    },
    {
      'title': 'Onboarding',
      'default_icon': 'assets/icons/onboarding.png',
      'selected_icon': 'assets/icons/onboarding_selected.png',
      'subMenu': ['Onboarding View', 'Candidates View']
    },
    {
      'title': 'Employee',
      'default_icon': 'assets/icons/employee.png',
      'selected_icon': 'assets/icons/employee_selected.png',
      'subMenu': [
        'Profile',
        'Employees',
        'Document Requests',
        'Shift Requests',
        'Work Type Requests',
        'Rotating Shift Assign',
        'Rotating Work Type Assign',
        'Disciplinary Actions',
        'Policies',
        'Organization Chart'
      ]
    },
    {
      'title': 'Attendance',
      'default_icon': 'assets/icons/attendance.png',
      'selected_icon': 'assets/icons/attendance_selected.png',
      'subMenu': [
        'Dashboard',
        'Bio-Metric Devices',
        'Attendance',
        'Attendance Requests',
        'Hour Account',
        'Work Records',
        'Attendance Activities',
        'Late-Come Early-Out',
        'My Attendance'
      ]
    },
    {
      'title': 'Leaves',
      'default_icon': 'assets/icons/leaves.png',
      'selected_icon': 'assets/icons/leaves_selected.png',
      'subMenu': [
        'Dashboard',
        'My Leave Requests',
        'Leave Requests',
        'Leave Types',
        'Assigned Leave',
        'Leave Allocation Requests',
        'Compensatory Leave Requests'
      ]
    },
    {
      'title': 'Payroll',
      'default_icon': 'assets/icons/payroll.png',
      'selected_icon': 'assets/icons/payroll_selected.png',
      'subMenu': [
        'Dashboard',
        'Contracts',
        'Allowances',
        'Deductions',
        'Payslips',
        'Loan/Advanced Salary',
        'Encashments & Reimbursements',
        'Federal Tax'
      ]
    },
    {
      'title': 'Performance',
      'default_icon': 'assets/icons/performance.png',
      'selected_icon': 'assets/icons/performance_selected.png',
      'subMenu': [
        'Dashboard',
        'Objectives',
        '360 Feedback',
        'Meetings',
        'Key Results',
        'Employee Bonus Points',
        'Period',
        'Question Template'
      ]
    },
    {
      'title': 'Off-Boarding',
      'default_icon': 'assets/icons/offboarding.png',
      'selected_icon': 'assets/icons/offboarding_selected.png',
      'subMenu': ['Exit Process', 'Resignation Letters']
    },
    {
      'title': 'Assets',
      'default_icon': 'assets/icons/assets.png',
      'selected_icon': 'assets/icons/assets_selected.png',
      'subMenu': [
        'Dashboard',
        'Asset View',
        'Asset Batches',
        'Request & Allocation',
        'Asset History'
      ]
    },
    {
      'title': 'Help Desk',
      'default_icon': 'assets/icons/helpdesk.png',
      'selected_icon': 'assets/icons/helpdesk_selected.png',
      'subMenu': ['FAQs', 'Tickets']
    },
    {
      'title': 'Configuration',
      'default_icon': 'assets/icons/configuration.png',
      'selected_icon': 'assets/icons/configuration_selected.png',
      'subMenu': [
        'Multiple Approvals',
        'Mail Templates',
        'Mail Automation',
        'Holidays',
        'Company Leaves',
        'Restrict Leaves'
      ]
    },
    {
      'title': 'Settings',
      'default_icon': 'assets/icons/settings.png',
      'selected_icon': 'assets/icons/settings_selected.png',
      'subMenu': []
    },
    {
      'title': 'Notifications',
      'default_icon': 'assets/icons/notifications.png',
      'selected_icon': 'assets/icons/notifications_selected.png',
      'subMenu': []
    },
    {
      'title': 'Languages',
      'default_icon': 'assets/icons/languages.png',
      'selected_icon': 'assets/icons/languages_selected.png',
      'subMenu': []
    },
    {
      'title': 'Companies',
      'default_icon': 'assets/icons/companies.png',
      'selected_icon': 'assets/icons/companies_selected.png',
      'subMenu': []
    },

  ];




/*void onMenuItemTapped(int index) {
  setState(() {
    selectedIndex = index;
    subMenuIndex = null; // Reset submenu selection
    appBarTitle = menuItems[index]['title'];
  });

  // Check if the selected menu item has no sub-menu items
  if (menuItems[index]['subMenu'].isEmpty) {
    // If no sub-menu, close the drawer
    Navigator.of(context).pop(); // Close the drawer
  }
}*/

/*  void onMenuItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      subMenuIndex = null;
      appBarTitle = menuItems[index]['title'];

      if (menuItems[index]['subMenu'].isNotEmpty) {
        expandedIndex = expandedIndex == index ? null : index; // Toggle expansion
      } else {
        expandedIndex = null; // Close all expanded menus
        Navigator.of(context).pop(); // Close drawer if no submenu
      }
    });
  }*/

  /*void onMenuItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      subMenuIndex = null;
      appBarTitle = menuItems[index]['title'];

      if (menuItems[index]['subMenu'].isNotEmpty) {
        expandedIndex = expandedIndex == index ? null : index; // Toggle submenu
      } else {
        expandedIndex = null; // Close all submenus if no submenu exists
        _scaffoldKey.currentState?.closeEndDrawer(); // Close drawer after selection
      }
    });
  }*/

  void onMenuItemTapped(int index) {
    setState(() {
      selectedIndex = index; // Track selected menu item
      subMenuIndex = null; // Reset sub-menu selection
      appBarTitle = menuItems[index]['title']; // Update AppBar title

      if (menuItems[index]['subMenu'].isNotEmpty) {
        expandedIndex = expandedIndex == index ? null : index; // Toggle submenu
      } else {
        expandedIndex = null; // Close all submenus if no submenu exists
        _scaffoldKey.currentState?.closeEndDrawer(); // Close drawer after selection
      }
    });
  }



/*void onSubMenuTapped(int index) {
    setState(() {
      subMenuIndex = index;
    });
  }*/

void onSubMenuTapped(int index) {
  setState(() {
    subMenuIndex = index;
    appBarTitle =
    menuItems[selectedIndex!]['subMenu'][index]; // Update appBar title
  });
  Navigator.of(context).pop(); // Close drawer
}

void updateTitle(String newTitle) {
  setState(() {
    appBarTitle = newTitle;
  });
}






  Widget getSelectedScreen() {
    print("Selected Index: $selectedIndex");

    switch (selectedIndex) {
      case 0://Dashboard
        return DashboardScreen();
      case 1://Recruitment
        return getSubMenuScreen(1, {
          'Dashboard': RecruitmentDashboardscreen(),
          'Recruitment Pipeline': RecruitmentPipelineScreen(),
          'Recruitment Survey': RecruitmentSurveyScreen(),
          'Candidates': RecruitmentCandidatesScreen(),
          'Interviews': RecruitmentInterviewsScreen(),
          'Open Jobs': RecruitmentOpenJobsScreen(),
          'Stages': RecruitmentStagesScreen(),
          'Skill Zone': RecruitmentSkillZoneScreen(),
        });
      case 2://onboarding
        return getSubMenuScreen(2, {
          'Onboarding View': OnboardingViewScreen(),
          'Candidates View': CandidatesViewScreen(),
        });
      case 3: //Employee
        return getSubMenuScreen(2, {
        'Profile': EmployeeProfileScreen(),
        'Employees': EmployeeScreen(),
        'Document Requests': EmployeeDocumentRequest(),
        'Shift Requests': EmployeeShiftRequestsScreen(),
        'Work Type Requests': EmployeeWorkTypeRequests(),
        'Rotating Shift Assign': EmployeeRotatingShiftAssign(),
        'Rotating Work Type Assign': EmployeeRotatingWorkTypeAssign(),
        'Disciplinary Actions': EmployeeDisciplinaryActions(),
        'Policies': EmployeePolicies(),
        'Organization Chart': EmployeeOrganizationChart(),
      });
      case 4://Attendance
        return getSubMenuScreen(4, {
          'Dashboard': AttendanceDashboard(),
          'Bio-Metric Devices': BioMetricDevices(),
          'Attendance':Attendance(),
          'Attendance Requests':AttendanceRequests(),
          'Hour Account':HourAccount(),
          'Work Records':WorkRecords(),
          'Attendance Activities':AttendanceActivities(),
          'Late-Come Early-Out':LateComeEarlyOut(),
          'My Attendance':MyAttendance(),
      });


      case 5 : //Leave
    return getSubMenuScreen(4, {
      'Dashboard': LeaveDashboard(),
      'My Leave Requests': MyLeaveRequests(),
      'Leave Requests': LeaveRequests(),
      'Leave Types': LeaveTypes(),
      'Assigned Leave': AssignedLeave(),
      'Leave Allocation Requests': LeaveAllocationRequests(),
      'Compensatory Leave Requests': CompensatoryLeaveRequests(),
    });
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      return getSubMenuScreen(10, {
        'FAQs': FAQScreen(),
        'Tickets': TicketsScreen(),
      });

      case 11: //configuration
        return getSubMenuScreen(11, {
          'Onboarding View': OnboardingViewScreen(),
          'Candidates View': CandidatesViewScreen(),
        });
      case 12:
        return SettingsScreen();
      case 13:
        return NotificationScreen();
      case 14://Languages
        return LanguagesScreen();
      case 15://Companies
        return CompaniesScreen();
      default:
        return DashboardScreen();
       // return Center(child: Text("No valid menu selected"));
    }
  }




Widget getSubMenuScreen(int menuIndex, Map<String, Widget> subMenuMap) {
    if (subMenuIndex != null) {
      String subMenuItem = menuItems[menuIndex]['subMenu'][subMenuIndex!];
      return subMenuMap[subMenuItem] ?? Center(child: Text("Unknown Sub Menu"));
    } else {
      return Center(child: Text("Select a sub-menu item from ${menuItems[menuIndex]['title']}"));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: SafeArea(

        child: Scaffold(


          key: _scaffoldKey,


            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: Material(
                elevation: 6, // Card effect
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)), // Rounded bottom corners
                color: Colors.white, // Background color
                child: Container(
                  height: 70,
                  alignment: Alignment.center, // Ensures vertical centering
                  padding: EdgeInsets.symmetric(horizontal: 10), // Small padding on both sides
                  child: Row(
                    children: [
                      // Logo at the Start
                      Image.asset(
                        'assets/images/logo_image-removebg-preview.png',
                        width: 50,
                        height: 50,
                      ),

                      // Small spacing between Logo & Title
                      SizedBox(width: 8),

                      // App Bar Title
                      Text(
                        appBarTitle,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
                      ),

                      // Push everything else to the right (Menu Icon)
                      Spacer(),

                      // Menu Icon
                      IconButton(
                        icon: Image.asset(
                          'assets/images/navigation_drawer_menu.png',
                          width: 40,
                          height: 40,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          body: getSelectedScreen(),
          endDrawer: Drawer(
            child: Container(
              padding: EdgeInsets.all(5),
              width: 250,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckInButton(),
                        IconButton(
                          icon: Image.asset('assets/images/navigation_close_button.png',width: 34,height: 34,),
                          onPressed: () {
                            _scaffoldKey.currentState?.closeEndDrawer();
                          },
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        final item = menuItems[index];
                        final hasSubMenu = item['subMenu'].isNotEmpty;
                        final isExpanded = expandedIndex == index;

                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () => onMenuItemTapped(index),
                              child: Container(
                                margin: EdgeInsets.only(left: 10, bottom: 5,right: 10, top:3),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: selectedIndex == index
                                        ? Colors.orange
                                        : Colors.grey,
                                    width: 2,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      selectedIndex == index
                                          ? item['selected_icon']
                                          : item['default_icon'],
                                      width: 24,
                                      height: 24,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      item['title'],
                                      style: TextStyle(
                                        color: selectedIndex == index
                                            ? Colors.orange
                                            : Colors.grey,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Spacer(),
                                    if (hasSubMenu)
                                    Icon(
                        expandedIndex == index || selectedIndex == index // Check if expanded or selected
                        ? Icons.expand_less
                            : Icons.expand_more,
                        color: expandedIndex == index || selectedIndex == index // Make icon orange if selected or expanded
                        ? Colors.orange
                            : Colors.grey,
                        ),

                                  ],
                                ),
                              ),
                            ),
                            if (isExpanded)
                              Column(
                                children: List.generate(
                                  item['subMenu'].length,
                                      (subIndex) => GestureDetector(
                                    onTap: () => onSubMenuTapped(subIndex),
                                    child: Container(
                                      margin:
                                       EdgeInsets.only(left: 30, bottom: 5,right: 10, top:3),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: subMenuIndex == subIndex
                                              ? Colors.orange
                                              : Colors.grey,
                                          width: 2,
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 10),
                                          Text(
                                            item['subMenu'][subIndex],
                                            style: TextStyle(
                                              color: subMenuIndex == subIndex
                                                  ? Colors.orange
                                                  : Colors.grey,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }









}





