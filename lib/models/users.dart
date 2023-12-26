class Users {
  final int? usrId;
  final String usrEmail;
  final String? usrName; // Make usrName optional
  final String usrPassword;

  Users({
    this.usrId,
    required this.usrEmail,
    this.usrName, // Make usrName optional
    required this.usrPassword,
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        usrId: json["usrId"],
        usrEmail: json["usrEmail"],
        usrName: json["usrName"],
        usrPassword: json["usrPassword"],
      );

  Map<String, dynamic> toMap() => {
        "usrId": usrId,
        "usrEmail": usrEmail,
        "usrName": usrName,
        "usrPassword": usrPassword,
      };
}
