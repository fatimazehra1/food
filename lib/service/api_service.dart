import 'dart:convert';
import 'package:food/models/Employee.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://202.70.149.58:8182/api/FoodLounge";
  final String apiKey = 'duzh@2024';  // Your API key

  Future<Employee?> employeeLogin(String cardNo) async {
    final String url = "$baseUrl/FoodLoungeEmployeeLogin?CardNo=$cardNo";  // Correct endpoint with query param

    final response = await http.post(
      Uri.parse(url), 
       headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X_Api_Key': apiKey,  // Include the API key in headers
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

     if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Check if the response contains employee data
      if (data['employeeData'] != null) {
        return Employee.fromJson(data['employeeData']);  // Parse employee data into Employee object
      } else {
        return null;  // Return null if no employee data is found
      }
    } else {
      throw Exception('Failed to log in');
    }
  }
  // Future<Employee?> employeeLogin(String cardNo) async {
  //   final String url = "$baseUrl/FoodLoungeStudentLogin?CardNo=$cardNo";  // Correct endpoint with query param

  //   final response = await http.post(
  //     Uri.parse(url), 
  //      headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'X_Api_Key': apiKey,  // Include the API key in headers
  //     },
  //   );

  //   print('Response status: ${response.statusCode}');
  //   print('Response body: ${response.body}');

  //    if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);

  //     // Check if the response contains student data
  //     if (data['studentData'] != null) {
  //       return Employee.fromJson(data['studentData']);  // Parse student data into Employee object
  //     } else {
  //       return null;  // Return null if no student data is found
  //     }
  //   } else {
  //     throw Exception('Failed to log in');
  //   }
  // }







  Future<Employee?> patientLogin(String medicalRecordNo) async {
    final String url = "$baseUrl/FoodLoungePatientLogin?MedicalRecordNo=$medicalRecordNo";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Employee.fromJson(data);
    } else {
      throw Exception('Failed to log in');
    }
  }



  Future<Employee?> studentLogin(String cardNo) async {
    final String url = "$baseUrl/FoodLoungeStudentLogin?CardNo=$cardNo";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Employee.fromJson(data);
    } else {
      throw Exception('Failed to log in');
    }
  }

}
