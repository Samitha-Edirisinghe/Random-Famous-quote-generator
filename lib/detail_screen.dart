// 22UG1-0791
// E.D.S.R.Edirisinghe
// CCS3351 Mobile Application Development Final project Q2. Random “Famous quote” generator

import 'package:flutter/material.dart';
import 'quotes.dart';

class DetailScreen extends StatelessWidget {
  final Quote quote;

  DetailScreen({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(quote.author)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(quote.imagePath),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                quote.details,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
