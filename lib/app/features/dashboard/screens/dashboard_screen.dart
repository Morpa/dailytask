library dashboard;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// binding
part '../bindings/dashboard_binding.dart';

// controller
part '../controllers/dashboard_controller.dart';

class DashboardScreen extends GetView {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('DashboardScreen'),
      ),
    );
  }
}
