import 'package:flutter/material.dart';

class ChatbotPage extends StatelessWidget {
<<<<<<< HEAD
  const ChatbotPage({super.key});

=======
>>>>>>> 45427cc8754c814ef53a8e282fcb86ea67be52eb
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: const Text(
=======
        title: Text(
>>>>>>> 45427cc8754c814ef53a8e282fcb86ea67be52eb
          'Chatbot',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
<<<<<<< HEAD
        backgroundColor: const Color(0xFF0077B6),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 182, 215, 254),
=======
        backgroundColor: Color(0xFF0077B6),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 182, 215, 254),
>>>>>>> 45427cc8754c814ef53a8e282fcb86ea67be52eb
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
<<<<<<< HEAD
              const Icon(
=======
              Icon(
>>>>>>> 45427cc8754c814ef53a8e282fcb86ea67be52eb
                Icons.chat_bubble,
                size: 100,
                color: Color(0xFF0077B6),
              ),
<<<<<<< HEAD
              const SizedBox(height: 20),
              const Text(
=======
              SizedBox(height: 20),
              Text(
>>>>>>> 45427cc8754c814ef53a8e282fcb86ea67be52eb
                'How can I assist you today?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0077B6),
                ),
              ),
<<<<<<< HEAD
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0077B6),
=======
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0077B6),
>>>>>>> 45427cc8754c814ef53a8e282fcb86ea67be52eb
                ),
                onPressed: () {
                  // Implement chatbot functionality here
                },
<<<<<<< HEAD
                child: const Text('Start Chat'),
=======
                child: Text('Start Chat'),
>>>>>>> 45427cc8754c814ef53a8e282fcb86ea67be52eb
              ),
            ],
          ),
        ),
      ),
    );
  }
}
