class SignUpBody{
 final String name;
 final String phone;
 final String email;
 final String password;
  SignUpBody({
    required this.name,
    required this.phone,
    required this.email,
    required this.password
  });

   factory SignUpBody.fromJson(Map<String, dynamic> json) {
  return SignUpBody(name:  json['name']??"",
   phone:  json['phone']??"", 
  email: json['email']??"",
   password: json['password']??"");
   
  }

 

  

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["phone"] = phone;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}