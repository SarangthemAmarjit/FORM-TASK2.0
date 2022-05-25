enum gender { Male, Female, Other }

class Savedata {
  final String post;
  final String username;
  final String email;
  final String password;
  final String phonenumber;
  final String address;
  final String qualification;

  final gender gen;

  Savedata(
      {required this.post,
      required this.username,
      required this.email,
      required this.password,
      required this.phonenumber,
      required this.address,
      required this.qualification,
      required this.gen});
}
