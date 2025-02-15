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
        scaffoldBackgroundColor: Colors.grey[200], // Background color
        textTheme: TextTheme(
          bodyMedium: TextStyle(
              fontSize: 18, color: Colors.black), // Font size & text color
        ),
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
                          textAlign: TextAlign.center, // Align text to center
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '- ${currentQuote!.author}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
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
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: _getRandomQuote,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 8, 8, 8), // Button background color
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12), // Adjust padding if needed
                textStyle: TextStyle(
                  fontSize: 18, // Font size
                  fontWeight: FontWeight.bold, // Optional: Make text bold
                ),
              ),
              child: Text('New Quote'),
            ),
          ],
        ),
      ),
    );
  }
}
