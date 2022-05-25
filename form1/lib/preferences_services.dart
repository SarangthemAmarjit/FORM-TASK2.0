import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'personal.dart';

class PreferencesServices {
  Future finalsave(Savedata savedata) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('post', savedata.post);
    await preferences.setString('username', savedata.username);
    await preferences.setString('email', savedata.email);
    await preferences.setString('password', savedata.password);
    await preferences.setString('phone_number', savedata.phonenumber);
    await preferences.setString('address', savedata.address);
    await preferences.setString('qualification', savedata.qualification);

    await preferences.setInt('gender', savedata.gen.index);

    print('Save Data Successfully');
  }

  Future<Savedata> getSavedata() async {
    final preferences = await SharedPreferences.getInstance();
    final post = preferences.getString('post');

    final username = preferences.getString('username');
    final email = preferences.getString('email');
    final password = preferences.getString('password');
    final phone_number = preferences.getString('phone_number');
    final address = preferences.getString('address');
    final qualification = preferences.getString('qualification');

    final gender1 = gender.values[preferences.getInt('gender') ?? 0];

    return Savedata(
        post: post!,
        username: username!,
        email: email!,
        password: password!,
        phonenumber: phone_number!,
        address: address!,
        qualification: qualification!,
        gen: gender1);
  }
}
