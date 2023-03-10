import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_details/functions/db_functions.dart';
import 'package:student_details/functions/student_list.dart';
import 'package:student_details/screens/bottom_sheet.dart';
import 'package:student_details/screens/search_field.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<DbProvider>(context, listen: false).getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students Record'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchField());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: const StudentList(),
      floatingActionButton: const BottomSheets(),
    );
  }
}
