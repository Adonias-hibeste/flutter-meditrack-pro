import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SymptomCheckerPage extends StatelessWidget {
  const SymptomCheckerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildTriageHeader(),
          Expanded(child: _buildChatArea()),
          _buildActionSection(),
          _buildInputSection(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(icon: const Icon(LucideIcons.chevronLeft, color: Colors.blue), onPressed: () => Navigator.pop(context)),
      centerTitle: true,
      title: const Text('Symptom Analyzer', style: TextStyle(color: Color(0xFF1E293B), fontSize: 16, fontWeight: FontWeight.bold)),
      actions: [
        IconButton(icon: const Icon(LucideIcons.shieldCheck, color: Colors.blue, size: 20), onPressed: () {}),
      ],
    );
  }

  Widget _buildTriageHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.blue.withOpacity(0.1))),
      child: Row(
        children: [
          const Icon(LucideIcons.activity, color: Colors.blue, size: 20),
          const SizedBox(width: 16),
          const Expanded(child: Text('Secure symptom conversation', style: TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.w600))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: Colors.blue.withOpacity(0.05), borderRadius: BorderRadius.circular(8)),
            child: const Text('Online', style: TextStyle(color: Colors.blue, fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildChatArea() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        _buildAiBubble('Hi, I can help organize your symptoms before you speak with a clinician. What are you feeling today?'),
        const SizedBox(height: 16),
        _buildSuggestions(['Headache', 'Fever', 'Nausea', 'Fatigue']),
        const SizedBox(height: 16),
        _buildUserBubble('I have a headache, mild fever, and feel tired since this morning.'),
        const SizedBox(height: 16),
        _buildAiBubble('Thanks. I am reviewing those symptoms and preparing a few follow-up questions about pain level, temperature, and hydration.'),
        const SizedBox(height: 24),
        Row(
          children: [
            Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle)),
            const SizedBox(width: 4),
            Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.blue.withOpacity(0.3), shape: BoxShape.circle)),
            const SizedBox(width: 4),
            Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), shape: BoxShape.circle)),
          ],
        ),
      ],
    );
  }

  Widget _buildAiBubble(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.blue.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(LucideIcons.stethoscope, color: Colors.blue, size: 14),
                const SizedBox(width: 8),
                const Text('MediAssist AI', style: TextStyle(color: Colors.black38, fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            Text(text, style: const TextStyle(color: Color(0xFF1E293B), fontSize: 14, height: 1.5)),
          ],
        ),
      ),
    );
  }

  Widget _buildUserBubble(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
        ),
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.5)),
      ),
    );
  }

  Widget _buildSuggestions(List<String> items) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items.map((item) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.blue.withOpacity(0.1))),
        child: Text(item, style: const TextStyle(color: Colors.blue, fontSize: 13, fontWeight: FontWeight.bold)),
      )).toList(),
    );
  }

  Widget _buildActionSection() {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.blue.withOpacity(0.05))),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.blue.withOpacity(0.05), shape: BoxShape.circle),
            child: const Icon(LucideIcons.link, color: Colors.blue, size: 18),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Suggested next step', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text('Continue symptom intake or connect to urgent care.', style: TextStyle(color: Colors.black38, fontSize: 11)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white, elevation: 0, padding: const EdgeInsets.symmetric(horizontal: 20), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: const Text('Review', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildInputSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(32), border: Border.all(color: Colors.blue.withOpacity(0.1))),
        child: Row(
          children: [
            const SizedBox(width: 16),
            const Icon(LucideIcons.plusCircle, color: Colors.blue, size: 24),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(decoration: InputDecoration(hintText: 'Describe your symptoms...', hintStyle: TextStyle(color: Colors.black26, fontSize: 14), border: InputBorder.none)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              child: const Icon(LucideIcons.arrowUp, color: Colors.white, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
