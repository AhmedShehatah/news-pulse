import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  ContactUs({super.key});

  static const String routeName = "/contact-us-page";

  final email = TextEditingController();
  final report = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 47, 47),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.grey,
          ),
        ),
      ),
      body: Form(
        child: Column(
          children: [
            Image.asset("assets/images/logo.png"),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                hintText: "Email",
                border: InputBorder.none,
              ),
            ),
            TextFormField(
              controller: report,
              decoration: const InputDecoration(
                hintText: "Message",
                border: InputBorder.none,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Submit",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 25, 23, 23)),
            )
          ],
        ),
      ),
    );
  }
}
