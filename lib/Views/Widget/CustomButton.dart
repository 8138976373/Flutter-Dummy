

import 'package:flutter/material.dart';

MaterialButton CustomButton(BuildContext context, String text_string, int i) {
  return MaterialButton(
    color: Color(i),
    minWidth: MediaQuery.of(context).size.width,
    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0), onPressed: () {  },
    // onPressed: () {
    //   if (nameController.text == "abcd" && phoneController.text == "12345") {
    //     setState(() {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(builder: (context) => HomePage()),
    //       );
    //     });
    //   }
    //   else{
    //     final snackBar = SnackBar(
    //       content: Text('User name or password error!!'),
    //       action: SnackBarAction(
    //         label: 'Undo',
    //         onPressed: () {
    //           // Some code to undo the change.
    //         },
    //       ),
    //     );
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   }
    //   // child: Text('Show SnackBar'),
    //
    // },
    // child: Text(text_string,
    //     textAlign: TextAlign.center,
    //     style:
    //     style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
  );
}