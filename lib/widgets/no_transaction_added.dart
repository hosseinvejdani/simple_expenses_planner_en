import 'package:flutter/material.dart';

class NoTransactionAdded extends StatelessWidget {
  const NoTransactionAdded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            'No Transaction Added Yet!',
            style: TextStyle(
              color: Colors.grey[800],
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 125, top: 50),
            child: Image.asset('assets/images/waiting.png'),
          ),
        ),
      ],
    );
  }
}
