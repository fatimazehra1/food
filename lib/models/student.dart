class Student {
  final int cardNo;
  final String studentName;
  final String mobile;
  final String address;
  final String email;

  Student({
    required this.cardNo,
    required this.studentName,
    required this.mobile, 
    required this.address, 
    required this.email
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      cardNo: json['cardNo'],
      studentName: json['studentName'],
      mobile: json['mobile'],
      address: json['address'],
      email: json['email'],
    );
  }
}
