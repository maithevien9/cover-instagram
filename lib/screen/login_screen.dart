import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback show;
  LoginScreen(this.show, {super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  FocusNode emailFocus = FocusNode();
  final password = TextEditingController();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(width: 96.w, height: 100.h),
            Center(
              child: Image.asset('assets/images/logo.png',
                  width: 120.w, height: 120.h),
            ),
            SizedBox(height: 120.h),
            CustomTextField(email, Icons.email, 'Email', emailFocus),
            SizedBox(height: 10.h),
            CustomTextField(password, Icons.lock, 'Password', passwordFocus),
            SizedBox(height: 10.h),
            Forgot(),
            SizedBox(height: 20.h),
            Login(),
            SizedBox(height: 10.h),
            HaveAccount()
          ],
        ),
      ),
    );
  }

  Widget HaveAccount() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text("Don't have an account?",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold)),
        SizedBox(width: 6.w),
        GestureDetector(
          onTap: widget.show,
          child: Text("Sign up",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold)),
        )
      ]),
    );
  }

  Widget Login() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 44.h,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10.r)),
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget Forgot() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Text(
          'Forgot your password?',
          style: TextStyle(
              fontSize: 13.sp, color: Colors.blue, fontWeight: FontWeight.bold),
        ));
  }

  Widget CustomTextField(TextEditingController controller, IconData icon,
      String type, FocusNode focusNode) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Container(
          height: 44.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: TextField(
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
            ),
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: type,
              prefixIcon: Icon(icon,
                  color: focusNode.hasFocus ? Colors.black : Colors.grey),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide(color: Colors.grey, width: 2.w)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide(color: Colors.black, width: 2.w)),
            ),
          ),
        ));
  }
}
