
import 'package:hive_flutter/adapters.dart';
part 'student_model.g.dart';



@HiveType(typeId: 1)
class StudentModel {

  @HiveField(0)
  final String name;

   @HiveField(1)
  final String age;

   @HiveField(2)
  final String email;

   @HiveField(3)
  final String phone;

  StudentModel(
      {required this.name,
      required this.age,
      required this.email,
      required this.phone});
}
