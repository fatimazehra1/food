import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:food/models/Employee.dart';
import 'package:food/models/category.dart';
import 'package:food/models/patient.dart';
import 'package:food/models/product.dart';
import 'package:food/models/student.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String Url = "http://192.168.18.9:8080/api";
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
    final String url =
        "$baseUrl/FoodLoungePatientLogin?MedicalRecordNo=$cardNo";

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

Future<List<Categories>> fetchCategories(String categoryType) async {
  final String url = "$Url/categories/all";

  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    List<Categories> categoriesList = (data['categories'] as List)
        .where((categoryJson) => categoryJson['categoryType'] == categoryType)
        .map((categoryJson) =>
            Categories.fromJson(categoryJson as Map<String, dynamic>))
        .toList();

    return categoriesList;
  } else {
    throw Exception('Failed to load categories: ${response.statusCode}');
  }
}



Future<List<Product>> fetchProducts(String categoryType) async {
  final String url = "$Url/products/all";

  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
          'Accept-Encoding': 'gzip', 
    },
  ).timeout(Duration(seconds: 60));

  print('Response status: ${response.statusCode}');
print('Response body length: ${response.body.length}');
  // print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List<dynamic> productsJson = data['products'];

    List<Product> productsList = productsJson
        .cast<Map<String, dynamic>>()
        .map((productJson) => Product.fromJson(productJson))
        .where((product) => product.itemType == categoryType)
        .toList();

    return productsList;
  } else {
    throw Exception('Failed to load products: ${response.statusCode}');
  }
}
Future<List<Product>> fetchAllProducts() async {
  final String url = "$Url/products/all";

  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ).timeout(Duration(seconds: 60));

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List<dynamic> productsJson = data['products'];

   List<Product> productsList = productsJson
        .cast<Map<String, dynamic>>()
        .map((productJson) => Product.fromJson(productJson))
        .toList();

  return productsList;

  } else {
    throw Exception('Failed to load products: ${response.statusCode}');
  }
}



Future<void> logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Remove specific keys
  await prefs.remove('name');
  await prefs.remove('mobile');
  await prefs.remove('address');
  await prefs.remove('email');
  await prefs.remove('isLoggedIn');

}

}
