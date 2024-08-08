import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback show;
  SignUpScreen(this.show, {super.key});

  @override
  State<SignUpScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<SignUpScreen> {
  final email = TextEditingController();
  FocusNode emailFocus = FocusNode();

  final password = TextEditingController();
  FocusNode passwordFocus = FocusNode();

  final bio = TextEditingController();
  FocusNode bioFocus = FocusNode();

  final username = TextEditingController();
  FocusNode usernameFocus = FocusNode();

  final passwordConfirm = TextEditingController();
  FocusNode passwordConfirmFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(width: 96.w, height: 30.h),
            Center(
              child: Image.asset('assets/images/logo.png',
                  width: 120.w, height: 120.h),
            ),
            SizedBox(height: 20.h),
            Center(
              child: CircleAvatar(
                radius: 34.r,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: AssetImage('assets/images/person.png'),
              ),
            ),
            SizedBox(height: 30.h),
            CustomTextField(email, Icons.email, 'Email', emailFocus),
            SizedBox(height: 10.h),
            CustomTextField(username, Icons.person, 'Username', usernameFocus),
            SizedBox(height: 10.h),
            CustomTextField(bio, Icons.person, 'Bio', bioFocus),
            SizedBox(height: 10.h),
            CustomTextField(password, Icons.lock, 'Password', passwordFocus),
            SizedBox(height: 10.h),
            CustomTextField(passwordConfirm, Icons.lock, 'Password Confirm',
                passwordConfirmFocus),
            SizedBox(height: 10.h),
            Forgot(),
            SizedBox(height: 20.h),
            SignUp(),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Don't have an account?",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold)),
          SizedBox(width: 6.w),
          GestureDetector(
              onTap: widget.show,
              child: Text("Login",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }

  Widget SignUp() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 44.h,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10.r)),
          child: Text(
            'Sign Up',
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
