import 'dart:async';
import 'package:flutter/material.dart';
import '../data/profile_data.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onViewWork;
  final VoidCallback onContact;

  const HeroSection({super.key, required this.onViewWork, required this.onContact});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final List<String> titles = [
    "Senior Android Developer",
    "Kotlin Enthusiast",
    "Clean Architecture Advocate"
  ];
  String displayTitle = "";
  int titleIndex = 0;
  int charIndex = 0;
  bool isDeleting = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _type();
  }

  void _type() {
    timer = Timer(Duration(milliseconds: isDeleting ? 50 : 100), () {
      final current = titles[titleIndex];
      setState(() {
        displayTitle = isDeleting
            ? current.substring(0, charIndex - 1)
            : current.substring(0, charIndex + 1);
        charIndex = isDeleting ? charIndex - 1 : charIndex + 1;
      });

      if (!isDeleting && charIndex == current.length) {
        Timer(const Duration(milliseconds: 1500), () {
          isDeleting = true;
          _type();
        });
      } else if (isDeleting && charIndex == 0) {
        isDeleting = false;
        titleIndex = (titleIndex + 1) % titles.length;
        _type();
      } else {
        _type();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height - 70),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topRight,
          radius: 1.3,
          colors: [Color(0xFF2D1B4E), AppTheme.darkBg],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ProfileData.location,
              style: const TextStyle(color: AppTheme.primary, letterSpacing: 2, fontSize: 13),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [AppTheme.primary, AppTheme.secondary],
              ).createShader(bounds),
              child: const Text(
                ProfileData.name,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 32,
              child: Text(
                "$displayTitle|",
                style: const TextStyle(fontSize: 22, color: AppTheme.textSecondary),
              ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: const Text(
                ProfileData.bio,
                style: TextStyle(color: AppTheme.textSecondary, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: widget.onViewWork,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text("View My Work", style: TextStyle(color: Colors.white)),
                ),
                OutlinedButton(
                  onPressed: widget.onContact,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppTheme.primary, width: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text("Get In Touch", style: TextStyle(color: AppTheme.primary)),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 10,
              alignment: WrapAlignment.center,
              children: ProfileData.languages.map((lang) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppTheme.cardBg,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppTheme.borderColor),
                  ),
                  child: Text(lang, style: const TextStyle(fontSize: 12)),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

