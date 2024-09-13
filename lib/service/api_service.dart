import 'dart:convert';
import 'package:food/models/Employee.dart';
import 'package:food/models/patient.dart';
import 'package:food/models/student.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://202.70.149.58:8182/api/FoodLounge";
  final String apiKey = 'duzh@2024'; 
  

  Future<Employee?> employeeLogin(String cardNo) async {
    final String url = "$baseUrl/FoodLoungeEmployeeLogin?CardNo=$cardNo";

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X_Api_Key': apiKey,  
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['employeeData'] != null && data['employeeData'] is Map) {
        return Employee.fromJson(data['employeeData']);
      } else if (data['employeeData'] == "Invalid employee card no.") {
        print("Invalid employee card number");
        return null;  
      } else {
        print("Unexpected response: ${response.body}");
        return null;
      }
    } else {
      throw Exception('Failed to log in: ${response.statusCode}');
    }
  }


  Future<Patient?> patientLogin(String cardNo) async {
    final String url = "$baseUrl/FoodLoungePatientLogin?MedicalRecordNo=$cardNo";

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X_Api_Key': apiKey, 
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['patientData'] != null && data['patientData'] is Map) {
        return Patient.fromJson(data['patientData']);  
      } else if (data['patientData'] == "Invalid medical record no.") {
        print("Invalid employee card number");
        return null; 
      } else {
        print("Unexpected response: ${response.body}");
        return null;
      }
    } else {
      throw Exception('Failed to log in: ${response.statusCode}');
    }
  }




  Future<Student?> studentLogin(String cardNo) async {
    final String url = "$baseUrl/FoodLoungeStudentLogin?CardNo=$cardNo";

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X_Api_Key': apiKey,  
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['studentData'] != null && data['studentData'] is Map) {
        return Student.fromJson(data['studentData']);  
      } else if (data['studentData'] == "Invalid student card no.") {
        print("Invalid student card number");
        return null;
      } else {
        print("Unexpected response: ${response.body}");
        return null;
      }
    } else {
      throw Exception('Failed to log in: ${response.statusCode}');
    }
  }
}