class Student {
  final int? cardNo;
  final String? studentName;
  final String? mobile;
  final String? address;
  final String? email;

  Student({
     this.cardNo,
     this.studentName,
     this.mobile, 
     this.address, 
     this.email
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      cardNo: json['cardNo'] != null ? int.tryParse(json['cardNo']) : null,
      studentName: json['studentName'],
      mobile: json['mobile'],
      address: json['address'],
      email: json['email'],
    );
  }
}
