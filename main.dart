import 'package:flutter/material.dart';

void main() {
  // Prevent black/blank screen crashes by catching layout errors gracefully
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Error: ${details.exception}',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  };
  runApp(const CampusDashboardApp());
}

class CampusDashboardApp extends StatelessWidget {
  const CampusDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Dashboard',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light, // Locks Light Mode against OS overrides
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Enrolled Courses List
  final List<String> enrolledCourses = const [
    'Software Engineering',
    'Artificial Intelligence',
    'Database Systems',
    'Computer Networks',
    'Mobile App Development',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),

      // 1. HEADER & NAVIGATION (Scaffold, AppBar, Search Icon & Title)
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
        title: const Text(
          'Campus Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 24, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      // 1. DRAWER WIDGET (Profile Links)
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF2563EB),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 36, color: Color(0xFF2563EB)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Muhammad Aatir Saleem',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Software Engineering • 5th Sem',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline, color: Color(0xFF475569)),
              title: const Text('My Profile', style: TextStyle(fontWeight: FontWeight.w500)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.school_outlined, color: Color(0xFF475569)),
              title: const Text('Grades & CGPA', style: TextStyle(fontWeight: FontWeight.w500)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet_outlined, color: Color(0xFF475569)),
              title: const Text('Fee Status', style: TextStyle(fontWeight: FontWeight.w500)),
              onTap: () {},
            ),
            const Divider(indent: 16, endIndent: 16),
            ListTile(
              leading: const Icon(Icons.logout_rounded, color: Colors.redAccent),
              title: const Text('Logout', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w500)),
              onTap: () {},
            ),
          ],
        ),
      ),

      // MAIN BODY
      body: SafeArea(
        child: Column(
          children: [
            // 2 & 3. PROFILE & ID CARD (Card, Container, CircleAvatar, Stack, Column & Row)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF1E3A8A),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      // Stack Widget for Profile Image + Green Active Dot Overlay
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 34,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 40,
                              color: Color(0xFF1E3A8A),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: const Color(0xFF22C55E),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16), // Visual Spacing

                      // Student Details (Column & Row)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Muhammad Aatir Saleem',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 6),
                            _buildInfoRow(Icons.badge_outlined, 'FA24-BSE-062'),
                            const SizedBox(height: 2),
                            _buildInfoRow(Icons.school_outlined, 'Dept: Software Engineering'),
                            const SizedBox(height: 2),
                            _buildInfoRow(Icons.calendar_today_outlined, 'Semester: 5th'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 4),

            // 4. COURSES LIST HEADER & BUILDER (ListView.builder & ListTile)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enrolled Courses (${enrolledCourses.length})',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: enrolledCourses.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 1,
                    margin: const EdgeInsets.only(bottom: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFFEFF6FF),
                        child: Icon(
                          Icons.menu_book_rounded,
                          color: Color(0xFF2563EB),
                          size: 20,
                        ),
                      ),
                      title: Text(
                        enrolledCourses[index],
                        style: const TextStyle(
                          color: Color(0xFF1E293B),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      subtitle: const Text(
                        'Credits: 3',
                        style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                        color: Color(0xFF94A3B8),
                      ),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),

            // 5. QUICK NOTES / SEARCH INPUT (TextField & ElevatedButton)
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Color(0xFF1E293B)),
                      decoration: InputDecoration(
                        hintText: 'Add a quick note...',
                        hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                        prefixIcon: const Icon(Icons.note_add, color: Color(0xFF2563EB)),
                        filled: true,
                        fillColor: const Color(0xFFF8FAFC),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Add',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.white70),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}