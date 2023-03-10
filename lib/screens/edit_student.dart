import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_details/functions/db_functions.dart';
import 'package:student_details/models/student_model.dart';

class EditStudent extends StatelessWidget {
   EditStudent({
    super.key,
    required this.name,
    required this.age,
    required this.email,
    required this.phone,
    required this.index,
  });
  final String name;
  final String age;
  final String email;
  final String phone;
  final int index;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final formValidateKey = GlobalKey<FormState>();

  editFn() {
    nameController.text = name;
    ageController.text = age;
    emailController.text = email;
    phoneController.text = phone;
  }

  @override
  Widget build(BuildContext context) {
    editFn();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Student'),
        centerTitle: true,
      ),
      body: Form(
        key: formValidateKey,
        child: ListView(
          children: [
            Column(
              children: [
                // -------------- TextField 1 -------------- //
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Name of Student'),
                  ),
                ),
                // -------------- TextField 2 -------------- //
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Age is required';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Age'),
                  ),
                ),
                // -------------- TextField 3 -------------- //
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: emailController,
                    validator: (email) {
                      if (email != null && !EmailValidator.validate(email)) {
                        return 'Enter valid email';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Email address'),
                  ),
                ),
                // -------------- TextField 4 -------------- //
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length != 10) {
                        return 'Enter valid number';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixText: '+91',
                        prefixStyle:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        labelText: 'Phone'),
                  ),
                ),
                // -------------- Button -------------- //
                ElevatedButton(
                    onPressed: () {
                      if (formValidateKey.currentState!.validate()) {
                        final value = StudentModel(
                            name: nameController.text,
                            age: ageController.text,
                            email: emailController.text,
                            phone: phoneController.text);
                        Provider.of<DbProvider>(context, listen: false)
                            .updateStudent(index, value, context);
                      }
                    },
                    child: const Text('Update Student'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
