// ignore_for_file: use_build_context_synchronously

import 'package:cv_app/core/models/experience.dart';
import 'package:cv_app/pages/edit.dart';
import 'package:cv_app/widgets/add_experience.dart';
import 'package:cv_app/widgets/spacer.dart';
import 'package:flutter/material.dart';

import '../controller/controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 46,
                        backgroundImage: AssetImage(
                          'assets/profile-image.jpg',
                        ),
                      ),
                    ),
                    ySpace(16),
                    Text(
                      controller.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    ySpace(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Slack username: ',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          controller.slackUsername,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ySpace(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Github Handle: ',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '@${controller.githubUsername}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                )),
                ySpace(24),
                const Text(
                  'Bio',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                ySpace(16),
                Text(
                  controller.bio,
                  style: const TextStyle(fontSize: 18),
                ),
                ySpace(24),
                const Text(
                  'Experience',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                ySpace(16),
                Column(
                  children: List.generate(
                      controller.experiences.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                              title: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Company: ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      xSpace(10),
                                      Text(
                                        controller
                                            .experiences[index].companyName,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Position: ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      xSpace(10),
                                      Text(
                                        controller.experiences[index].position,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  const Text(
                                    'Duration :',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  xSpace(10),
                                  controller.experiences[index]
                                              .durationInMonths >
                                          12
                                      ? Text(
                                          '${controller.experiences[index].durationInMonths ~/ 12} ${controller.experiences[index].durationInMonths ~/ 12 > 1 ? 'Years' : 'Year'} ${controller.experiences[index].durationInMonths % 12 == 0 ? '' : controller.experiences[index].durationInMonths % 12} ${controller.experiences[index].durationInMonths % 12 == 0 ? '' : controller.experiences[index].durationInMonths % 12 == 1 ? 'Month' : 'Months'}',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text(
                                          '${controller.experiences[index].durationInMonths} Months',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )
                                ],
                              ),
                              trailing: PopupMenuButton<int>(
                                onSelected: (value) async {
                                  if (value == 1) {
                                    Experience exp =
                                        controller.experiences.elementAt(index);
                                    final experience = await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AddExperienceDialog(
                                            isEdited: true,
                                            controller: controller,
                                            experience: exp,
                                          );
                                        });
                                    controller.experiences[index] = experience;
                                  }
                                  setState(() {});
                                },
                                itemBuilder: (context) => [
                                  // popupmenu item 1
                                  PopupMenuItem(
                                    onTap: () {
                                      Experience exp = controller.experiences
                                          .elementAt(index);
                                      controller.experiences.removeAt(index);
                                      setState(() {});
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        duration:
                                            const Duration(milliseconds: 1200),
                                        content:
                                            const Text('Expereince deleted'),
                                        action: SnackBarAction(
                                            label: 'Undo',
                                            onPressed: () {
                                              controller.experiences
                                                  .insert(index, exp);
                                              setState(() {});
                                            }),
                                      ));
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.delete),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Delete Experience")
                                      ],
                                    ),
                                  ),
                                  // popupmenu item 2
                                  const PopupMenuItem(
                                    value: 1,
                                    child: Row(
                                      children: [
                                        Icon(Icons.edit),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Edit Experience")
                                      ],
                                    ),
                                  ),
                                ],
                                elevation: 2,
                              ),
                            ),
                          )),
                ),
                ySpace(24),
                const Text(
                  'Skills',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                ySpace(16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        controller.skills.length,
                        (index) => InkWell(
                              onLongPress: () {
                                String skill =
                                    controller.skills.elementAt(index);
                                controller.skills.removeAt(index);
                                setState(() {});
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  duration: const Duration(milliseconds: 1200),
                                  content: const Text('Skill removed'),
                                  action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {
                                        controller.skills.insert(index, skill);
                                        setState(() {});
                                      }),
                                ));
                              },
                              child: Tooltip(
                                triggerMode: TooltipTriggerMode.tap,
                                message: 'Long press to delete skill',
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Center(
                                    child: Text(controller.skills[index]),
                                  ),
                                ),
                              ),
                            )),
                  ),
                ),
                ySpace(50)
              ],
            ),
          ),
        )),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton.extended(
          onPressed: () async {
            Set value = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditPage(
                          controller: controller,
                        )));

            controller.updateDetails(
                name: value.elementAt(0),
                slackUsername: value.elementAt(1),
                githubUsername: value.elementAt(2),
                bio: value.elementAt(3));
            controller.addSkills(value.elementAt(4));
            setState(() {});
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(milliseconds: 1200),
              content: Text('Profile Updated'),
            ));
          },
          label: Row(
            children: [
              const Text(
                'Edit',
                style: TextStyle(fontSize: 18),
              ),
              xSpace(16),
              const Icon(Icons.edit),
            ],
          ),
        ),
      ),
    );
  }
}
