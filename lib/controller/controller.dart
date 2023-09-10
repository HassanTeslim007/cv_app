import 'package:cv_app/core/models/experience.dart';
import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  String name = 'Hassan Teslim Babatunde';
  String slackUsername = 'Alpha';
  String githubUsername = 'hassanteslim007';
  String bio =
      'I am Computer Scientist and a resourceful Flutter Developer with aims of precision, growth and collective development of the tech community at large. I am detail-oriented and collaborative, a great team player and team lead and I constantly seek to stay updated with emerging technologies.';

  final List<Experience> experiences = [
    Experience(
        companyName: 'Reisty',
        position: 'Flutter Developer',
        durationInMonths: 4),
    Experience(
        companyName: 'HNG',
        position: 'Mobile Developer Intern',
        durationInMonths: 9),
    Experience(
        companyName: 'Nupat Technologies',
        position: 'FlutterDev',
        durationInMonths: 15),
  ];

  final List skills = [
    'Flutter',
    'Dart',
    'HTML',
    'CSS',
    'JavaScript',
    'Python',
    'Git',
    'Github',
    'DSA',
    'Firebase',
    'VSCode'
  ];

  void updateDetails(
      {String? name,
      String? slackUsername,
      String? githubUsername,
      String? bio}) {
    this.name = name ?? this.name;
    this.slackUsername = slackUsername ?? this.slackUsername;
    this.githubUsername = githubUsername ?? this.githubUsername;
    this.bio = bio ?? this.bio;
  }

  void addSkills(String newSkills) {
    if (newSkills.isEmpty) {
      return;
    }
    List skillsAsList = newSkills.split(',');
    skills.addAll(skillsAsList);
  }
}
