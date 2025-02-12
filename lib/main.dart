// 22UG1-0791
// E.D.S.R.Edirisinghe
// CCS3351 Mobile Application Development Final project Q2. Random “Famous quote” generator

import 'dart:math';
import 'package:flutter/material.dart';
import 'quotes.dart';
import 'detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Famous Quotes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String selectedCategory;
  late List<Quote> filteredQuotes;
  Quote? currentQuote;

  @override
  void initState() {
    super.initState();
    selectedCategory = 'Motivational';
    filteredQuotes =
        quotes.where((q) => q.category == selectedCategory).toList();
    _getRandomQuote();
  }

  void _getRandomQuote() {
    if (filteredQuotes.isEmpty) {
      setState(() {
        currentQuote = null;
      });
      return;
    }
    final random = Random();
    setState(() {
      currentQuote = filteredQuotes[random.nextInt(filteredQuotes.length)];
    });
  }

  void _onCategorySelected(String? newCategory) {
    if (newCategory == null) return;
    setState(() {
      selectedCategory = newCategory;
      filteredQuotes = quotes.where((q) => q.category == newCategory).toList();
      _getRandomQuote();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = quotes.map((q) => q.category).toSet().toList();

    return Scaffold(
      appBar: AppBar(title: Text('Random Quotes')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownMenu<String>(
              initialSelection: selectedCategory,
              onSelected: _onCategorySelected,
              dropdownMenuEntries: categories
                  .map((category) =>
                      DropdownMenuEntry(value: category, label: category))
                  .toList(),
            ),
            SizedBox(height: 20),
            if (currentQuote != null)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(quote: currentQuote!),
                    ),
                  );
                },
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          currentQuote!.text,
                          style: TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '- ${currentQuote!.author}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (currentQuote == null)
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('No quotes available for this category.'),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getRandomQuote,
              child: Text('New Quote'),
            ),
          ],
        ),
      ),
    );
  }
}
