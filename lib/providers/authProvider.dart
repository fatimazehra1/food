import 'package:flutter/material.dart';
import 'package:food/models/Employee.dart';
import 'package:food/service/api_service.dart';

class AuthProvider with ChangeNotifier {
    final ApiService _apiService = ApiService();  // Create an instance of ApiService

  Employee? _employee;
  bool _isLoading = false;

  Employee? get employee => _employee;
  bool get isLoading => _isLoading;

   Future<Employee?> employeeLogin(String cardNo) {
    return _apiService.employeeLogin(cardNo);  // Call the method from ApiService
  }
}
