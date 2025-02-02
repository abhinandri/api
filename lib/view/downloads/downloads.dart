import 'package:amazone_prime_clone/view/bottom_navigation.dart';
import 'package:amazone_prime_clone/view/custome_text_gride.dart';
import 'package:flutter/material.dart';

class Downloads extends StatelessWidget {
  const Downloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: CustomText(text: 'Downloads'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Glowing Box Container
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.blue[900]?.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Icon(
                Icons.download,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),

            // No Downloads Text
            const Text(
              'No Downloads Available',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Description Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Explore and download your favourite movies and shows to watch on the go',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Go to Home Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bottom_navigation()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Go to Home',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
