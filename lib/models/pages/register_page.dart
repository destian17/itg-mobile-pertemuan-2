import 'package:flutter/material.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _levelCtrl = TextEditingController();
  final _rankCtrl = TextEditingController();
  final _jobCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background hijau sangat muda agar mata tetap nyaman
      backgroundColor: const Color(0xFFF1F8E9),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Judul dengan warna hijau tua dan gaya font serif
                const Text(
                  "Guard's Identification Check",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B5E20),
                    fontFamily: 'Georgia', // Memberikan kesan klasik/RPG
                  ),
                ),
                const SizedBox(height: 40),
                
                _buildInput(
                  "State Your Name", 
                  "Identify yourself, traveler..", 
                  _nameCtrl, 
                  (v) => v!.isEmpty ? "Don't stand there silent!" : null
                ),
                _buildInput(
                  "Level of Attainment", 
                  "Show us the fruits of your labor..", 
                  _levelCtrl, 
                  (v) => !RegExp(r'^[0-9]+$').hasMatch(v!) ? "Must be a number" : null
                ),
                _buildInput(
                  "Guild Rank", 
                  "Your place among adventurers?", 
                  _rankCtrl, 
                  (v) => !RegExp(r'^[a-zA-Z]+$').hasMatch(v!) ? "Letters only" : null
                ),
                _buildInput(
                  "Job Class", 
                  "Tell us your path to glory...", 
                  _jobCtrl, 
                  (v) => v!.isEmpty ? "Fill out the scroll!" : null
                ),
                
                const SizedBox(height: 30),
                
                // Tombol dengan bentuk membulat dan warna hijau solid
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Bentuk lebih membulat
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (c) => HomePage(
                            name: _nameCtrl.text, 
                            level: _levelCtrl.text, 
                            rank: _rankCtrl.text, 
                            job: _jobCtrl.text
                          )
                        )
                      );
                    }
                  },
                  child: const Text(
                    "Access the Guild", 
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 18, 
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Georgia',
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInput(String label, String hint, TextEditingController ctrl, String? Function(String?)? validator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 5),
          child: Text(
            label, 
            style: const TextStyle(
              fontWeight: FontWeight.bold, 
              color: Color(0xFF388E3C),
              fontFamily: 'Georgia',
            )
          ),
        ),
        TextFormField(
          controller: ctrl,
          style: const TextStyle(fontFamily: 'Georgia'),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.green.withOpacity(0.4)),
            filled: true,
            fillColor: Colors.white,
            // Border membulat dan berwarna hijau saat fokus
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xFFC8E6C9), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xFF43A047), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          ),
          validator: validator,
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}