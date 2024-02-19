import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Screens/Forget_Password/Request_Reset_Password.dart';
import 'package:jobsque/Screens/createAccount_Screens/CreateAccount_screen.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';
import 'package:jobsque/widget/Bottom_Navigation_Bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final FireBaseAuthSurvice _auth = FireBaseAuthSurvice();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _usernamecontroller = TextEditingController();
  bool isRmember = false;
  bool isvisible = true;
  bool passtoggle = true;
  bool repasstoggle = true;
  // final _formfield = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _usernamecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ItemLogin(),
    );
  }
}

// ignore: must_be_immutable
class ItemLogin extends StatefulWidget {
  ItemLogin({
    super.key,
  });

  @override
  State<ItemLogin> createState() => _ItemLoginState();
}

class _ItemLoginState extends State<ItemLogin> {
  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  // final TextEditingController _usernamecontroller = TextEditingController();
  bool isRmember = false;

  bool isvisible = true;

  bool passtoggle = true;

  bool repasstoggle = true;
  final _formfield = GlobalKey<FormState>();

  // final _formfield = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                height: 40,
              ),
              const Row(
                children: [
                  Text(
                    "Login",
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
                    "Please login to find your dream job",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color.fromRGBO(107, 114, 128, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailcontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  // label: const Text("User name"),
                  hintText: "User name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(51, 102, 255, 1),
                      width: 5,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _passwordcontroller,
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return "Password must be at least 8 characters";
                  }
                  return null;
                },
                obscureText: passtoggle,
                obscuringCharacter: "●",
                key: _formfield,
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
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(
                    Icons.check_box_outline_blank_outlined,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const Text(
                    "Remember me",
                    style: TextStyle(
                      color: Color.fromRGBO(31, 41, 55, 1),
                    ),
                  ),
                  const SizedBox(
                    width: 141,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RequestRestPassword(),
                        ),
                      );
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Color.fromRGBO(51, 102, 255, 1)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Color.fromRGBO(156, 163, 175, 1),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CreateAccountScreen(),
                      ));
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(51, 102, 255, 1),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (context, ref, _) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(327, 48),
                        backgroundColor: const Color.fromRGBO(51, 102, 255, 1)),
                    onPressed: () async {
                      bool islogin = await ref.watch(jobsqueprov).login(
                          _emailcontroller.text.trim(),
                          _passwordcontroller.text.trim(),
                          isRmember);
                      if (!islogin) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text("the email or password is not correct")));
                      } else {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => BootomNavigator(),
                            ),
                            (route) => false);
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Color.fromRGBO(209, 213, 219, 1),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 28, right: 28),
                    child: Text(
                      "Or Login With Account",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color.fromRGBO(107, 114, 128, 1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Color.fromRGBO(209, 213, 219, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      height: 46,
                      width: 154,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: const Color.fromRGBO(209, 213, 219, 1))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              "assets/images/icon_images/google_icon.svg"),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Google",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color.fromRGBO(54, 63, 94, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 46,
                      width: 154,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: const Color.fromRGBO(209, 213, 219, 1))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              "assets/images/icon_images/Facebook_icon.svg"),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Facebook",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color.fromRGBO(54, 63, 94, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
