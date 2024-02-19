import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Screens/Forget_Password/CheckEmailReset.dart';
import 'package:jobsque/Screens/login_screens/login_screen.dart';

class RequestRestPassword extends StatelessWidget {
  final TextEditingController _Emailcontroller = TextEditingController();
  RequestRestPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
                    "Reset Password",
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
                    "Enter the email address you used when you ",
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
                    "joined and we’ll send you instructions to reset  ",
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
                    "your password.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color.fromRGBO(107, 114, 128, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _Emailcontroller,
                decoration: InputDecoration(
                  filled: false,
                  prefix: Icon(
                    Icons.email_rounded,
                    size: 20,
                  ),
                  hintText: "Email",
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
              Padding(
                padding: const EdgeInsets.only(top: 390),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You remember your password",
                      style: TextStyle(
                        color: Color.fromRGBO(156, 163, 175, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(51, 102, 255, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckEmailResetScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Request password reset",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(327, 48),
                    backgroundColor: const Color.fromRGBO(51, 102, 255, 1)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
