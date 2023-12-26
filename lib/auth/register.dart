import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pmobile/SQLite/sqlite.dart';
import '/auth/login.dart';
import 'package:pmobile/models/note_model.dart';
import 'package:pmobile/models/users.dart';

void showSuccessMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Register successful!'), // Pesan sukses
      duration: Duration(seconds: 2), // Durasi tampilan SnackBar
    ),
  );
}

class RegisterPage extends StatelessWidget {
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();

  final formKey = GlobalKey<FormState>();
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
          child: Form(
            key: formKey,
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
                  height: 490,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 28, 28, 28),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Registration",
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
                          obscureText: false,
                          style: TextStyle(
                            color: Colors.white, // Warna teks input
                          ),
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
                          // controller: passwordController,
                          /* obscureText: true, */
                          controller: name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.white, // Warna teks input
                          ),
                          decoration: InputDecoration(
                            suffix: Icon(
                              FontAwesomeIcons.eyeSlash,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            labelText: "Name",
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
                          // controller: passwordController,
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is required";
                            }
                            return null;
                          },
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.white, // Warna teks input
                          ),
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
                        /* onTap: () {
                          showSuccessMessage(context);
                        }, */
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            final db = DatabaseHelper();
                            db
                                .signup(Users(
                              usrEmail: email.text,
                              usrName: name.text,
                              usrPassword: password.text,
                            ))
                                .then((result) {
                              // 'result' will contain the result of the signup operation
                              if (result > 0) {
                                // Signup successful, navigate to LoginApp screen
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              } else {
                                // Signup failed, handle the error or show a message
                                print("Signup failed");
                              }
                            });
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
                              'Register',
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
                                    LoginPage()), // Gantilah dengan halaman registrasi yang sesuai
                          );
                        },
                        child: Text(
                          "Have account ? Login here",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
