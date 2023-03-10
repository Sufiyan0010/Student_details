import 'package:flutter/material.dart';
import 'package:student_details/models/student_model.dart';

class SingleStudent extends StatelessWidget {
  final StudentModel data;
  const SingleStudent(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    List details = [data.name, data.age, data.email, data.phone];
    List info = ['Name : ','Age : ','Email : ','Phone : '];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: 
      Column(
        children: [
           const  SizedBox(height: 10,),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/profile.png'),
            radius: 40,
          ),
         const  SizedBox(height: 30,),
         
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => Column(
                      children: [
                       
                        Row(
                          children: [
                            Text(info[index], style: const TextStyle(fontSize: 20),),
                            Text(
                              details[index],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 4),
          ),
        ],
      ),
    );
  }
}
