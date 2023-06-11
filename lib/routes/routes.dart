import 'package:flutter/material.dart';

import '../screen/auth/login_screen.dart';
import '../screen/screen.dart';

final routes = {
  '/': (BuildContext context) => const Login(),
  '/home': (BuildContext context) => const HomeScreen(),
};