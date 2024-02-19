import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Screens/Forget_Password/Password%20changed%20succesfully_screen.dart';

class RestPassword extends StatefulWidget {
  RestPassword({super.key});

  @override
  State<RestPassword> createState() => _RestPasswordState();
}

class _RestPasswordState extends State<RestPassword> {
  final _formfield = GlobalKey<FormState>();
  final formfield = GlobalKey<FormState>();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController repasswordcontroller = TextEditingController();
  bool passtoggle = true;
  bool repasstoggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 242,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "J",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        Iconsax.search_status,
                        size: 15,
                        color: Color.fromRGBO(51, 102, 255, 1),
                      ),
                      Text(
                        "BSQUE",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  Text(
                    "Create new password",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        color: Color.fromRGBO(17, 24, 39, 1)),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    "Set your new password so you can login and",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color.fromRGBO(107, 114, 128, 1),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    "acces Jobsque",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color.fromRGBO(107, 114, 128, 1),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 45,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: passwordcontroller,
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return "Password must be at least 8 characters";
                  }
                  return null;
                },
                obscureText: passtoggle,
                obscuringCharacter: "●",
                key: formfield,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        passtoggle = !passtoggle;
                      });
                    },
                    child: Icon(
                        passtoggle ? Icons.visibility_off : Icons.visibility),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(51, 102, 255, 1),
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Password must be at least 8 characters",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(156, 163, 175, 1),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                key: _formfield,
                controller: repasswordcontroller,
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return ("Password must be at least 8 characters");
                  }
                  return null;
                },
                obscureText: repasstoggle,
                obscuringCharacter: "●",
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        repasstoggle = !repasstoggle;
                      });
                    },
                    child: Icon(
                        repasstoggle ? Icons.visibility_off : Icons.visibility),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(51, 102, 255, 1),
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Both password must match",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(156, 163, 175, 1),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 280),
                child: ElevatedButton(
                  onPressed: () async {
                    // if (!_formfield.currentState!.validate()) {
                    //   return;
                    // }
                    // if (passwordcontroller == repasswordcontroller) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PasswordchangedsuccesfullyScreen(),
                      ),
                    );
                    // } else {
                    //   var snackBar;
                    //   const SnackBar(
                    //     behavior: SnackBarBehavior.floating,
                    //     backgroundColor: Colors.red,
                    //     content: Text(
                    //       "You Dont have access in this line ",
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   );
                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // }
                  },
                  child: const Text(
                    "Reset password",
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(327, 48),
                      backgroundColor: const Color.fromRGBO(51, 102, 255, 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
