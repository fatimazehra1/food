class Employee {
  final int? cardNo;  // Make cardNo nullable (int? instead of int)
  final String? employeeName;  // Make other fields nullable as well
  final String? mobile;
  final String? address;
  final String? email;

  Employee({
    this.cardNo,
    this.employeeName,
    this.mobile, 
    this.address, 
    this.email,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      cardNo: json['cardNo'] != null ? int.tryParse(json['cardNo']) : null,  // Safe parsing with fallback
      employeeName: json['employeeName'],
      mobile: json['mobile'],
      address: json['address'],
      email: json['email'],
    );
  }
}
