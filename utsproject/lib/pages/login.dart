import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:utsproject/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = true;
  TextEditingController userC = TextEditingController();
  TextEditingController passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logodepan.png", height: 150, width: 150,),
              SizedBox(height:20),
              Text("Jadwalku",
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.greenAccent[700],
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                )
              ),
              ),
              SizedBox(height: 40),
              Text("SELAMAT DATANG",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.greenAccent[400],
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              SizedBox(height: 4.0),
              Text("Jihad Fisabilillah - 4122034",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.greenAccent[400],
                        fontSize: 18,
                    )
                ),
              ),
              SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 500,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.people,
                          color: Colors.blueGrey,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: userC,
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Username',
                                hintStyle: TextStyle(color: Colors.blueGrey)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 500,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.key,
                          color: Colors.blueGrey,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: passC,
                            autocorrect: false,
                            obscureText: isHidden,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.blueGrey),
                                suffixIcon: IconButton(onPressed: () {
                                  if (isHidden == true) {
                                    isHidden = false;
                                  } else {
                                    isHidden = true;
                                  }
                                  setState(() {});
                                }, icon: Icon(Icons.remove_red_eye)),
                                hintText: "Password"
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage(),)
                    );
                  },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                          backgroundColor: Colors.greenAccent[400],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          )
                      ),
                      child: Text("Login",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),)),
                ],
              ),
              SizedBox(height: 30,),
              Text("Or",
              style: TextStyle(
                fontSize: 15,
                color: Colors.greenAccent[400]
              ),
              ),
              SizedBox(height: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton.icon(onPressed: () {},
                    icon: Icon(SimpleIcons.google, color: Colors.grey,),
                    label: Text("Sign in with google account",style: TextStyle(color: Colors.grey),),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        )
                    ),),
                  SizedBox(height: 20,),
                  ElevatedButton.icon(onPressed: () {},
                    icon: Icon(SimpleIcons.apple, color: Colors.grey,),
                    label: Text("Sign in with Apple ID",style: TextStyle(color: Colors.grey),),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        )
                    ),)
                ],
              )
            ],
          ),
          ),
        ),
      ),
    );
  }
}
