import 'package:flutter/material.dart';

class ErorrTab extends StatelessWidget {
  const ErorrTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assest/images/Error_Background.png"),
          fit: BoxFit.fill
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
