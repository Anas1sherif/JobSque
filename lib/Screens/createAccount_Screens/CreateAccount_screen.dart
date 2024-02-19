import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Screens/createAccount_Screens/Work_Interested_Screen.dart';
import 'package:jobsque/Screens/createAccount_Screens/choosejob_screen.dart';
import 'package:jobsque/Screens/login_screens/login_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _usernamecontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _usernamecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ItemCreateAccount(),
    );
  }
}

class ItemCreateAccount extends StatefulWidget {
  const ItemCreateAccount({
    super.key,
  });

  @override
  State<ItemCreateAccount> createState() => _ItemCreateAccountState();
}

class _ItemCreateAccountState extends State<ItemCreateAccount> {
  bool passtoggle = true;

  bool repasstoggle = true;
  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  final TextEditingController _usernamecontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                height: 40,
              ),
              const Row(
                children: [
                  Text(
                    "Create Account",
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
                    "Please create an account to find your dream job",
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
                controller: _usernamecontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  hintText: "User name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
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
                keyboardType: TextInputType.emailAddress,
                controller: _emailcontroller,
                decoration: InputDecoration(
                  filled: false,
                  prefixIcon: const Icon(Iconsax.sms),
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
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.length <= 8) {
                      return 'Password must be at least 8 characters ';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: _passwordcontroller,
                  obscureText: true,
                  obscuringCharacter: ".",
                  decoration: InputDecoration(
                    filled: false,
                    prefixIcon: Icon(Iconsax.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passtoggle != passtoggle;
                        });
                      },
                      child: Icon(
                          passtoggle ? Icons.visibility_off : Icons.visibility),
                    ),
                    hintText: "Password",
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
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
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
                        builder: (context) => const LoginScreen(),
                      ));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(51, 102, 255, 1),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(327, 48),
                    backgroundColor: const Color.fromRGBO(51, 102, 255, 1)),
                onPressed: () {
                  signUp(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChooseJobScreen(),
                      ));
                },
                child: const Text(
                  "Create account",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
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
                      "Or Sign up With Account",
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

  Future signUp(BuildContext context) async {
    String name = _usernamecontroller.text;
    String password = _passwordcontroller.text;
    String email = _emailcontroller.text;
    Dio dio = Dio();

    final response =
        await dio.post("https://project2.amit-learning.com/api/auth/register",
            data: {
              "name": name,
              'email': email,
              'password': password,
            },
            options: Options(validateStatus: (_) => true)
            // options: Options(headers: {
            //   "Accept": "application/json",
            // }, validateStatus: (_) => true),
            );
    if (!response.data['status']) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("the username, email or password is not correct")));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const WorkInterestedScreen(),
      ));
    }
  }
}
