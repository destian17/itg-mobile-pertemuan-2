import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String name;
  final String level;
  final String rank;
  final String job;

  const HeaderWidget({
    super.key,
    required this.name,
    required this.level,
    required this.rank,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // Latar belakang hijau sangat muda
        color: const Color(0xFFE8F5E9), 
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFC8E6C9), width: 1),
      ),
      child: Row(
        children: [
          // Avatar dengan Inisial dan Level
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CircleAvatar(
                radius: 40,
                // Lingkaran inisial hijau muda
                backgroundColor: const Color(0xFFC8E6C9), 
                child: Text(
                  name.isNotEmpty ? name[0].toUpperCase() : "D",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    // Teks inisial hijau tua
                    color: Color(0xFF2E7D32), 
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  // Badge level hijau solid
                  color: const Color(0xFF43A047), 
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Level $level",
                  style: const TextStyle(
                    color: Colors.white, 
                    fontSize: 11, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          // Info Nama dan Job
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold, 
                    // Nama dengan warna hijau gelap agar kontras
                    color: Color(0xFF1B5E20) 
                  ),
                ),
                Text(
                  job, 
                  style: const TextStyle(
                    color: Color(0xFF66BB6A)
                  )
                ),
              ],
            ),
          ),
          // Rank Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              // Kotak rank hijau terang
              color: const Color(0xFFA5D6A7), 
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              rank,
              style: const TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
                // Huruf rank hijau tua
                color: Color(0xFF1B5E20) 
              ),
            ),
          )
        ],
      ),
    );
  }
}