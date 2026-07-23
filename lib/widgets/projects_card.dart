import 'package:flutter/material.dart';
import '../data/profile_data.dart';
import '../theme/app_theme.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 1000 ? 3 : (width > 650 ? 2 : 1);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          const Text("PORTFOLIO", style: TextStyle(color: AppTheme.primary, letterSpacing: 2)),
          const SizedBox(height: 8),
          const Text("Featured Projects", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ProfileData.projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (context, index) => ProjectCard(project: ProfileData.projects[index]),
          ),
        ],
      ),
    );
  }
}

