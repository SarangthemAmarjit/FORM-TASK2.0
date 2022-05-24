import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'personal.dart';

class PreferencesServices {
  Future finalsave(Savedata savedata) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setStringList('post', savedata.post);
    await preferences.setString('username', savedata.username);
    await preferences.setString('email', savedata.email);
    await preferences.setString('password', savedata.password);
    await preferences.setString('phone_number', savedata.phonenumber);
    await preferences.setString('address', savedata.address);
    await preferences.setStringList('qualification', savedata.qualification);

    await preferences.setInt('gender', savedata.gen.index);

    print('Save Data Successfully');
  }

  Future<Savedata> getSavedata() async {
    final preferences = await SharedPreferences.getInstance();
    final post = preferences.getStringList('post') ?? ['Select Post'];
    final username = preferences.getString('username') ?? 'Enter your username';
    final email = preferences.getString('email') ?? 'Enter your email';
    final password = preferences.getString('password') ?? 'Enter your password';
    final phone_number =
        preferences.getString('phone_number') ?? 'Enter your Number';
    final address = preferences.getString('address') ?? 'Enter your Address';
    final qualification =
        preferences.getStringList('qualification') ?? ['Select Qualification'];
    final gender1 = gender.values[preferences.getInt('gender') ?? 0];

    return Savedata(
        post: post,
        username: username,
        email: email,
        password: password,
        phonenumber: phone_number,
        address: address,
        qualification: qualification,
        gen: gender1);
  }
}
