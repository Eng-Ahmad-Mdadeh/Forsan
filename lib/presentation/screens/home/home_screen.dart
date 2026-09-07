import 'package:flutter/material.dart';

import 'widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeHeader(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF5C3F9C), Color(0xFF342260)]),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.auto_awesome_rounded, color: Color(0xFFFEC327), size: 32),
                SizedBox(height: 20),
                Text('كل خدماتك في مكان واحد', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
                SizedBox(height: 8),
                Text('تابع طلباتك ومستنداتك بسهولة وأمان.', style: TextStyle(color: Color(0xFFE7E2F0), fontSize: 15)),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const Text('الخدمات السريعة', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800)),
          const SizedBox(height: 14),
          const Row(
            children: [
              Expanded(child: _QuickAction(icon: Icons.add_task_rounded, label: 'طلب جديد')),
              SizedBox(width: 12),
              Expanded(child: _QuickAction(icon: Icons.upload_file_rounded, label: 'رفع مستند')),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
      child: Column(children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 30),
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
      ]),
    ),
  );
}
