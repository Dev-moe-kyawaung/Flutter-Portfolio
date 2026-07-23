class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String githubUrl;
  final bool isNew;

  Project({
    required this.title,
    required this.description,
    required this.tags,
    required this.githubUrl,
    this.isNew = false,
  });
}

class Skill {
  final String name;
  final String icon;

  Skill({required this.name, required this.icon});
}

class ProfileData {
  static const String name = "Moe Kyaw Aung";
  static const String nameMM = "မိုးကျော်အောင်";
  static const String title = "Senior Android Developer";
  static const String location = "Tachileik, Myanmar 🇲🇲 ↔ Bangkok, Thailand 🇹🇭";

  static const List<String> languages = ["Burmese 🇲🇲", "English 🌐", "Kotlin ☕"];

  static const String bio =
      "Passionate Android Developer focused on building performant, "
      "well-architected mobile applications using Kotlin and modern Android tooling. "
      "I enjoy solving real-world problems through clean, maintainable code.";

  static const String email = "moekyawaung@programmer.net";
  static const String whatsappUrl = "https://wa.me/959666000050";
  static const String githubUrl = "https://github.com/Dev-moe-kyawaung";
  static const String gravatarUrl = "https://gravatar.com/moekyawaung2026";
  static const String certificatesUrl =
      "https://dev-moe-kyawaung.github.io/Moekyawaung-Certificates/";

  static const String currentlyBuilding = "MoekyawTranslator — AI Translation App";
  static const String philosophy = "Code with culture. Build with purpose.";

  static const Map<String, String> focus = {
    "Mobile": "Kotlin · Jetpack Compose · MVVM · Clean Architecture",
    "Backend": "Firebase · REST APIs · Python",
    "Security": "Ethical Hacking · Cybersecurity",
    "AI / ML": "Claude API · TFLite · On-Device ML",
  };

  static const String yearsExperience = "3+";
  static const String projectsBuilt = "20+";
  static const String certifications = "40+";

  static final List<Skill> skills = [
    Skill(name: "Kotlin", icon: "🤖"),
    Skill(name: "Jetpack Compose", icon: "🎨"),
    Skill(name: "Java", icon: "☕"),
    Skill(name: "JavaScript", icon: "🟨"),
    Skill(name: "Python", icon: "🐍"),
    Skill(name: "Firebase", icon: "🔥"),
    Skill(name: "REST APIs", icon: "🌐"),
    Skill(name: "Room DB", icon: "🗄️"),
    Skill(name: "Git", icon: "📦"),
    Skill(name: "Docker", icon: "🐳"),
    Skill(name: "Cybersecurity", icon: "🔐"),
  ];

  static final List<Project> projects = [
    Project(
      title: "Video Player App",
      description: "Feature-rich media player with custom controls and playlist management",
      tags: ["Kotlin", "ExoPlayer", "Android"],
      githubUrl: "https://github.com/moekyawaung-tech/video-player",
    ),
    Project(
      title: "Social Dashboard",
      description: "Analytics dashboard for social media metrics tracking",
      tags: ["React", "Chart.js", "REST API"],
      githubUrl: "https://github.com/moekyawaung-tech/social-dashboard",
      isNew: true,
    ),
    Project(
      title: "POS Ultimate Pro Max",
      description: "Full-featured Point of Sale system with inventory & sales analytics",
      tags: ["JavaScript", "Node.js", "SQLite"],
      githubUrl: "https://github.com/moekyawaung-tech/POS-Ultimate-Pro-Max",
    ),
    Project(
      title: "Job Portal App",
      description: "Job listing platform with search, filters, and application tracking",
      tags: ["React", "Node.js", "MongoDB"],
      githubUrl: "https://github.com/moekyawaung-tech/Job-Portal-App",
    ),
    Project(
      title: "PWA App",
      description: "Progressive Web App demonstrating offline-first architecture",
      tags: ["JavaScript", "Service Workers", "PWA"],
      githubUrl: "https://github.com/moekyawaung-tech/pwa-app",
    ),
    Project(
      title: "Game Collection",
      description: "Multi-game arcade hub including Snake and classic browser games",
      tags: ["JavaScript", "Canvas API", "HTML5"],
      githubUrl: "https://github.com/moekyawaung-tech/game-collection",
    ),
    Project(
      title: "Weather App",
      description: "Real-time weather forecasting with location-based data",
      tags: ["JavaScript", "Weather API", "CSS3"],
      githubUrl: "https://github.com/moekyawaung-tech/Weather-app",
    ),
    Project(
      title: "Daily Planner App",
      description: "Task and schedule management app with reminders",
      tags: ["JavaScript", "LocalStorage", "PWA"],
      githubUrl: "https://github.com/moekyawaung-tech/Daily-planner-app",
    ),
  ];
}

