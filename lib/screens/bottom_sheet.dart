import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../functions/add_student_button.dart';

final nameController = TextEditingController();
final ageController = TextEditingController();
final emailController = TextEditingController();
final phoneController = TextEditingController();
final validateKey = GlobalKey<FormState>();

class BottomSheets extends StatelessWidget {
  const BottomSheets({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.person_add),
        onPressed: () {
          bottomSheet(context);
        });
  }

   bottomSheet(context) async {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Form(
              key: validateKey,
              child: Column(
                children: [
                  // -------------- TextField 1 -------------- //
                  Padding(
                    padding: const EdgeInsets.all(10.0),
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
                    padding: const EdgeInsets.all(10.0),
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
                      keyboardType: TextInputType.emailAddress,
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
                          labelText: 'Email Address'),
                    ),
                  ),
                  // -------------- TextField 4 -------------- //
                  Padding(
                    padding: const EdgeInsets.all(10.0),
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
                          prefixStyle: const TextStyle(color: Colors.black,fontSize: 16),
                        labelText: 'Phone Number',
                          ),
                    ),
                  ),
                  // -------------- Button -------------- //
                  Padding(
                    padding: const EdgeInsets.only(top:15.0,right: 15,left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: const[
                                 Icon(Icons.arrow_back_ios,color: Colors.black,size: 17,),
                                 Text('Back',style: TextStyle(color: Colors.black,))
                              ],
                            )),
                        ElevatedButton(
                          onPressed: () {
                            if (validateKey.currentState!.validate()) {
                              addStudentButtonClick(context);
                            }
                          },
                          child: const Text("Add Student"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
