class ProfileModel {
  final String key;
  final String name;
  final String email;
  final String mobile;
  final String dob;
  final String age;

  ProfileModel({
    this.key = '',
    this.name = '',
    this.email = '',
    this.mobile = '',
    this.dob = '',
    this.age = '',
  });

  Map<String, dynamic> toMap() => {
        'key': key,
        'name': name,
        'email': email,
        'mobile': mobile,
        'dob': dob,
        'age': age,
      };
}
