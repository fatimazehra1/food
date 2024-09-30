import 'package:flutter/material.dart';
import 'package:food/models/Employee.dart';
import 'package:food/models/patient.dart';
import 'package:food/models/student.dart';
import 'package:food/service/api_service.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();  

  Employee? _employee;
  Patient? _patient;
  Student? _student;
  bool _isLoading = false;

  Employee? get employee => _employee;
  Patient? get patient => _patient;
  Student? get student => _student;
  bool get isLoading => _isLoading;

  Future<Employee?> employeeLogin(String cardNo) {
    return _apiService.employeeLogin(cardNo);  
  }

  Future<Patient?> patientLogin(String cardNo) {
    return _apiService.patientLogin(cardNo); 
  }

  Future<Student?> studentLogin(String cardNo) {
    return _apiService.studentLogin(cardNo);  
  }
}
