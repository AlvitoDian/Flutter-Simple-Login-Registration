import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pmobile/SQLite/sqlite.dart';
import '/auth/register.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pmobile/models/note_model.dart';
import 'package:pmobile/models/users.dart';
import '../home.dart';

void showSuccessMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Login successful!'), // Pesan sukses
      duration: Duration(seconds: 2), // Durasi tampilan SnackBar
    ),
  );
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  bool isLoginTrue = false;

  final formKey = GlobalKey<FormState>();

  final db = DatabaseHelper();

  login() async {
    var response =
        await db.login(Users(usrEmail: email.text, usrPassword: password.text));
    if (response == true) {
      //If login is correct, then goto notes
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      //If not, true the bool value to show error message
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/tanjidor.jpg"),
              fit: BoxFit.cover, // Adjust this based on your requirement
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 325,
                height: 420,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 28, 28, 28),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Welcome to hyakunime",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 260,
                        height: 60,
                        child: TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email is required";
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.white, // Warna teks input
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            suffix: Icon(
                              FontAwesomeIcons.envelope,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: Colors.white, // Warna teks
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors
                                    .white, // Warna border saat tidak dalam fokus
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 161, 161,
                                    161), // Warna border saat dalam fokus
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 260,
                        height: 60,
                        child: TextFormField(
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is required";
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.white, // Warna teks input
                          ),
                          // controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            suffix: Icon(
                              FontAwesomeIcons.eyeSlash,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Colors.white, // Warna teks
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors
                                    .white, // Warna border saat tidak dalam fokus
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 161, 161,
                                    161), // Warna border saat dalam fokus
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        // onTap: () {
                        //   // Pindah ke halaman lain (gantilah dengan halaman yang sesuai)
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => HomePage()),
                        //   );
                        // },
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            // Login Method
                            login();
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 260,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFF181818),
                            border: Border.all(
                              color: Colors.white, // Warna border putih
                              width: 1.0, // Lebar border
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 47,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Pindah ke halaman lain (gantilah dengan halaman yang sesuai)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RegisterPage()), // Gantilah dengan halaman registrasi yang sesuai
                          );
                        },
                        child: Text(
                          "Don't have Account",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      isLoginTrue
                          ? const Text(
                              "Username or passowrd is incorrect",
                              style: TextStyle(color: Colors.red),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
