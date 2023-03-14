import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_details/database/functions/add_student_button.dart';


import '../models/student_model.dart';

class DbProvider with ChangeNotifier {
  final List<StudentModel> _studentListNotifier = [];

  List<StudentModel> get studentListNotifier => _studentListNotifier;
  Future<void> addStudent(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>("student_db");
    await studentDB.add(value);
    getAllStudents();
  }

  Future<void> getAllStudents() async {
    final studentDB = await Hive.openBox<StudentModel>("student_db");
    _studentListNotifier.clear();
    _studentListNotifier.addAll(studentDB.values);
    notifyListeners();
  }

  Future<void> deleteStudent(int id, ctx) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.deleteAt(id);
    getAllStudents();
    snackBar(ctx, 'Deleted');
    Navigator.pop(ctx);
  }

  Future<void> updateStudent(int id, StudentModel value, ctx) async {
    final studentDB = await Hive.openBox<StudentModel>('student_DB');
    await studentDB.putAt(id, value);
    getAllStudents();
    Navigator.pop(ctx);
    snackBar(ctx, 'updated');
  }
}
