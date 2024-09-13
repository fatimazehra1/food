class Patient {
  final int? cardNo;
  final String? patientName;
  final String? mobile;
  final String? address;
  final String? email;

  Patient({
     this.cardNo,
     this.patientName,
     this.mobile, 
     this.address, 
     this.email
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      cardNo: json['cardNo'] != null ? int.tryParse(json['cardNo']) : null,
      patientName: json['patientName'],
      mobile: json['mobile'],
      address: json['address'],
      email: json['email'],
    );
  }
}
