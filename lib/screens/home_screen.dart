import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/certificates_section.dart';
import '../widgets/contact_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey certificatesKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                SizedBox(height: 80, child: Container(key: homeKey)),
                HeroSection(
                  onViewWork: () => scrollTo(projectsKey),
                  onContact: () => scrollTo(contactKey),
                ),
                Container(key: aboutKey, child: const AboutSection()),
                Container(key: skillsKey, child: const SkillsSection()),
                Container(key: projectsKey, child: const ProjectsSection()),
                Container(key: certificatesKey, child: const CertificatesSection()),
                Container(key: contactKey, child: const ContactSection()),
              ],
            ),
          ),
          Navbar(
            onHome: () => scrollTo(homeKey),
            onAbout: () => scrollTo(aboutKey),
            onSkills: () => scrollTo(skillsKey),
            onProjects: () => scrollTo(projectsKey),
            onCertificates: () => scrollTo(certificatesKey),
            onContact: () => scrollTo(contactKey),
          ),
        ],
      ),
    );
  }
}
