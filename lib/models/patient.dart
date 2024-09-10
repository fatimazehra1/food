class Patient {
  final int medicalRecordNo;
  final String patientName;
  final String mobile;
  final String address;
  final String email;

  Patient({
    required this.medicalRecordNo,
    required this.patientName,
    required this.mobile, 
    required this.address, 
    required this.email
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      medicalRecordNo: json['medicalRecordNo'],
      patientName: json['patientName'],
      mobile: json['mobile'],
      address: json['address'],
      email: json['email'],
    );
  }
}
