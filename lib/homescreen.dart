import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phone = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
 RegExp regex = new RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white54,
          margin: const EdgeInsets.only(top: 150, left: 30, right: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Username',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: screenWidth - 60,
                  height: 55,
                  child: TextFormField( validator:(value) {
                    if (value!.isEmpty) {
                    return "Enter correct email";
                  } else {
                    return null;
                  }},
                    controller: _username,
                    decoration: InputDecoration(
                      hintText: 'Your username',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(228, 229, 229, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(228, 229, 229, 1),
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: screenWidth - 60,
                  height: 55,
                  child: TextFormField(validator: (value){
                    if (value!.isEmpty) {
                    return "Enter correct email";
                  } else if (!regex.hasMatch(value)) {
                    return "Please provide a valid emal address";
                  } else {
                    return null;
                  }
                  },
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: 'Your email',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(228, 229, 229, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(228, 229, 229, 1),
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: screenWidth - 60,
                  height: 55,
                  child: TextFormField( validator: (value) {   if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                           }
                 if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                    }
                    return null;
                         },
                    autofocus: false,
                    obscureText: !_isPasswordVisible,
                    controller: _password,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      hintText: 'Your Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(227, 229, 229, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(227, 229, 229, 1),
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Phone',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: screenWidth - 60,
                  height: 55,
                  child: TextFormField(validator:(value) 
                  {if (value == null || value.isEmpty) {
                         return 'Please enter a phone number';
                                           }
               final RegExp phoneRegExp = RegExp(r'^\+\d{1,2}\s\d{10}$');
                if (!phoneRegExp.hasMatch(value)) {
                return 'Invalid phone number';
                        }
                         return null;
                         },
                    controller: _phone,
                    decoration: InputDecoration(
                      hintText: 'Your Phone number',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(227, 229, 229, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(227, 229, 229, 1),
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 327,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                       if (_formKey.currentState!.validate()) {
                              print('Form submitted');
                            }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 70),
                    const Text(
                      'Already have an account ?',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 2),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}