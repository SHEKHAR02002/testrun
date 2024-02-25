import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motion/motion.dart';
import 'package:testrun/pages/memepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Motion.instance.initialize();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //call our first widget means page
      home: const MyHomePage(),
    );
  }
}

// this is over first login page UI
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // First Widget Scffold it is basically over white backround screen
    // In Scaffold we have appbar and body
    return Scaffold(
      // SafeArea is used to give some padding to the screen
      body: SafeArea(
        // SingleChildScrollView is used to scroll the screen
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30),
                // Motion is used to animate the image
                child: Motion(
                  // ClipRRect is used to make the image circular
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      // Image.asset is used to load the image from the assets
                      // also we can use Image.network to load the image from the internet
                      child: Image.asset("assets/profile.jpg")),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text is used to display the text
                      const Text(
                        'Login-In',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const Text("Email",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      // TextField is used to enter the text
                      const TextField(
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const Text("Password",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const TextField(
                        // obscureText is used to hide the text
                        obscureText: true,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Align is used to align the text
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text("Forget password?",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade500)),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColor),
          onPressed: () {
            // Navigator.push is used to navigate to the next page
            // there are many types of Navigator.push like Navigator.pushNamed and Navigator.pushNamedAndRemoveUntil etc
            // getjokeapi();
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => const MemePage()));
          },
          child: const Text("Login"),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
