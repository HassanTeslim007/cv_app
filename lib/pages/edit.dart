import 'package:cv_app/controller/controller.dart';
import 'package:cv_app/widgets/add_experience.dart';
import 'package:cv_app/widgets/spacer.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  final Controller controller;
  const EditPage({
    super.key,
    required this.controller,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  // final widget.controller = Controller();
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: widget.controller.name);
    final slackUserNameController =
        TextEditingController(text: widget.controller.slackUsername);
    final githunUserNameController =
        TextEditingController(text: widget.controller.githubUsername);
    final bioController = TextEditingController(text: widget.controller.bio);
    final skillController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              setState(() {});
              Navigator.pop(context, {
                nameController.text,
                slackUserNameController.text,
                githunUserNameController.text,
                bioController.text,
              });
            },
            child: const Icon(Icons.arrow_back_ios)),
        title: const Text('Edit Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Full Name'),
              ySpace(10),
              TextField(
                controller: nameController,
              ),
              ySpace(30),
              const Text('Slack UserName'),
              ySpace(10),
              TextField(
                controller: slackUserNameController,
              ),
              ySpace(30),
              const Text('Github Username'),
              ySpace(10),
              TextField(
                controller: githunUserNameController,
              ),
              ySpace(30),
              const Text('Bio'),
              ySpace(10),
              TextField(
                controller: bioController,
                maxLines: 4,
              ),
              ySpace(30),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AddExperienceDialog(
                          isEdited: false,
                          controller: widget.controller,
                        );
                      });
                },
                child: Row(
                  children: [
                    const Text('Add Experience'),
                    xSpace(20),
                    const Icon(Icons.add)
                  ],
                ),
              ),
              ySpace(30),
              const Text('Skills'),
              // ySpace(10),
              TextField(
                controller: skillController,
                decoration: const InputDecoration(
                    hintText: 'Add New Skills separated by comma '),
              ),
              ySpace(60),
              Center(
                child: MaterialButton(
                  minWidth: 200,
                  height: 60,
                  onPressed: () {
                    widget.controller.updateDetails();
                    setState(() {});
                    Navigator.pop(context, {
                      nameController.text,
                      slackUserNameController.text,
                      githunUserNameController.text,
                      bioController.text,
                      skillController.text
                    });
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
