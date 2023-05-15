import 'package:flutter/material.dart';

import '../screen/auth/login_screen.dart';
import '../screen/home_screen.dart';

final routes = {
  '/': (BuildContext context) => const Login(),
  '/home': (BuildContext context) => const HomeScreen(),
};