import 'package:diamond_cart/core/constants/constants.dart';
import 'package:diamond_cart/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Welcome to Diamond Cart', style: TextStyle(fontSize: Sizes.s24.sp)),
            SizedBox(height: Sizes.s16.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.filterPage);
              },
              child: Text('Start Shopping'),
            ),
            SizedBox(height: Sizes.s16.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.cartPage);
              },
              child: Text('View Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
