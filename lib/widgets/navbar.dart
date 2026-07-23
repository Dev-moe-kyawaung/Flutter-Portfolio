import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/profile_data.dart';
import '../theme/app_theme.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onHome, onAbout, onSkills, onProjects, onCertificates, onContact;

  const Navbar({
    super.key,
    required this.onHome,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onCertificates,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: AppTheme.darkBg.withOpacity(0.9),
        border: const Border(bottom: BorderSide(color: AppTheme.borderColor)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onHome,
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  children: [
                    TextSpan(text: "MKA"),
                    TextSpan(text: ".", style: TextStyle(color: AppTheme.primary)),
                  ],
                ),
              ),
            ),
            if (!isMobile)
              Row(
                children: [
                  _navItem("Home", onHome),
                  _navItem("About", onAbout),
                  _navItem("Skills", onSkills),
                  _navItem("Projects", onProjects),
                  _navItem("Certificates", onCertificates),
                  _navItem("Contact", onContact),
                ],
              ),
            ElevatedButton(
              onPressed: () => launchUrl(Uri.parse(ProfileData.whatsappUrl)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text("💬 WhatsApp", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String label, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: onTap,
        child: Text(label, style: const TextStyle(color: Colors.white70)),
      ),
    );
  }
}

