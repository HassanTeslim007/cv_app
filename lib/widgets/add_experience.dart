import 'package:cv_app/controller/controller.dart';
import 'package:cv_app/core/models/experience.dart';
import 'package:flutter/material.dart';

import 'spacer.dart';

class AddExperienceDialog extends StatelessWidget {
  final Controller controller;
  final Experience? experience;
  final bool isEdited;
  const AddExperienceDialog(
      {super.key,
      required this.controller,
      this.experience,
      required this.isEdited});

  @override
  Widget build(BuildContext context) {
    final TextEditingController companyController =
        TextEditingController(text: experience?.companyName ?? '');
    final TextEditingController positionController =
        TextEditingController(text: experience?.position ?? '');
    final TextEditingController durationController = TextEditingController(
        text: experience?.durationInMonths.toString() ?? '');

    return Dialog(
      child: IntrinsicHeight(
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Add new Experience'),
              ySpace(20),
              TextField(
                controller: companyController,
                decoration: const InputDecoration(label: Text('Company Name')),
              ),
              ySpace(20),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: positionController,
                      decoration:
                          const InputDecoration(label: Text('Position')),
                    ),
                  ),
                  xSpace(20),
                  Flexible(
                    child: TextField(
                      controller: durationController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text('Duration in Months')),
                    ),
                  ),
                ],
              ),
              ySpace(60),
              Center(
                child: MaterialButton(
                  minWidth: 100,
                  onPressed: () {
                    final Experience experience = Experience(
                        companyName: companyController.text,
                        position: positionController.text,
                        durationInMonths: int.parse(durationController.text));
                    if (isEdited) {
                      Navigator.pop(context, experience);
                      return;
                    } else {
                      controller.experiences.add(experience);
                    }
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(milliseconds: 1200),
                      content: Text('Experience added'),
                    ));
                    Navigator.pop(context);
                  },
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

