// 22UG1-0791
// E.D.S.R.Edirisinghe
// CCS3351 Mobile Application Development Final project Q2. Random “Famous quote” generator

class Quote {
  final String category;
  final String text;
  final String author;
  final String details;
  final String imagePath;

  Quote({
    required this.category,
    required this.text,
    required this.author,
    required this.details,
    required this.imagePath,
  });
}

List<Quote> quotes = [
  Quote(
    category: 'Motivational',
    text: 'Be the change you wish to see in the world.',
    author: 'Mahatma Gandhi',
    details:
        'Mahatma Gandhi was an Indian lawyer, anti-colonial nationalist, and political ethicist who employed nonviolent resistance to lead the successful campaign for India\'s independence from British rule.',
    imagePath: 'assets/images/gandhi.jpg',
  ),
  Quote(
    category: 'Finance',
    text:
        'The stock market is filled with individuals who know the price of everything, but the value of nothing.',
    author: 'Warren Buffett',
    details:
        'Warren Buffett is an American investor, business tycoon, philanthropist, and the chairman and CEO of Berkshire Hathaway.',
    imagePath: 'assets/images/buffett.jpg',
  ),
  Quote(
    category: 'Success',
    text: 'Success is the sum of small efforts, repeated day in and day out',
    author: 'Warren Buffett',
    details:
        'Warren Buffett is an American investor, business tycoon, philanthropist, and the chairman and CEO of Berkshire Hathaway.',
    imagePath: 'assets/images/robert.jpg',
  ),
];
