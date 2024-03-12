import 'package:flutter/material.dart';

void main() {
  runApp(FibonacciApp());
}

class FibonacciApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fibonacci Calculator',
      home: FibonacciScreen(),
    );
  }
}

class FibonacciScreen extends StatefulWidget {
  @override
  _FibonacciScreenState createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen> {
  int fibonacci(int n) {
    if (n == 0) {
      return 0;
    } else if (n == 1) {
      return 1;
    } else {
      return fibonacci(n - 1) + fibonacci(n - 2);
    }
  }

  int _result = 0;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fibonacci Calculator'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter position',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    int position = int.parse(_controller.text);
                    _result = fibonacci(position);
                  });
                },
                child: Text('Calculate'),
              ),
              SizedBox(height: 20),
              Text(
                'Fibonacci value: $_result',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
