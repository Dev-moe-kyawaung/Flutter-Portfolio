import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/profile_data.dart';
import '../theme/app_theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          const Text("GET IN TOUCH", style: TextStyle(color: AppTheme.primary, letterSpacing: 2)),
          const SizedBox(height: 8),
          const Text("Let's Work Together", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            "Open to freelance projects, full-time opportunities, and collaborations.",
            style: TextStyle(color: AppTheme.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _contactCard("✉️", ProfileData.email, "mailto:${ProfileData.email}", isMobile),
              _contactCard("💬", "Chat on WhatsApp", ProfileData.whatsappUrl, isMobile),
              _contactCard("🐙", "GitHub Profile", ProfileData.githubUrl, isMobile),
              _contactCard("👤", "Gravatar Profile", ProfileData.gravatarUrl, isMobile),
            ],
          ),
          const SizedBox(height: 50),
          const Divider(color: AppTheme.borderColor),
          const SizedBox(height: 16),
          Text(
            "© ${DateTime.now().year} ${ProfileData.name}. Built with Flutter Web.",
            style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _contactCard(String icon, String label, String url, bool isMobile) {
    return SizedBox(
      width: isMobile ? double.infinity : 260,
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(url)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: AppTheme.cardBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.borderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(icon, style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 10),
              Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
            ],
          ),
        ),
      ),
    );
  }
}

