import 'package:b2b/repository/data.dart';
import 'package:b2b/ui/brand_screen.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController retailerCodeController = TextEditingController();
  final List<TextEditingController> otpControllers =
      List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retailer Login'),
       
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: retailerCodeController,
                decoration:   InputDecoration(
                  labelText: 'Retailer Code',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    )
                  )
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    width: 60,
                    child: TextField(
                      controller: otpControllers[index],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 1,color: Colors.pink
                          )
                        ),
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Add your login logic here
                  String retailerCode = retailerCodeController.text;
                  String otp = otpControllers.map((controller) {
                    controller.text = "1";
                  }).join();
                  const CircularProgressIndicator();
                  Future.delayed(const Duration(seconds: 2));
                  // Validate retailer code and OTP
                  if (retailerCode.isNotEmpty && otp.isNotEmpty) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BrandListPage()));
                    // Perform login action
                    // Replace this with your own login logic
                    print('Retailer Code: $retailerCode');
                    print('OTP: $otp');
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Please fill in all fields.'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text(
                    otpControllers.first.text.isEmpty ? 'Get Otp' : "Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
