import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion/motion.dart';
import 'package:testrun/pages/loginpage.dart';
import 'package:testrun/pages/memepage.dart';
import 'package:testrun/theme/color_schemes.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Motion.instance.initialize();
  Motion.instance.setUpdateInterval(60.fps);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter KC Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),

      //call our first widget means page
      home: const LoginPage(),
    );
  }
}
