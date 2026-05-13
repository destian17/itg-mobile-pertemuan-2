import 'package:flutter/material.dart';
import 'package:pertemuan_2/models/quest_model.dart';

class DetailPage extends StatefulWidget {
  final Quest quest;

  const DetailPage({super.key, required this.quest});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFC8E6C9),
        elevation: 0, // Membuat tampilan lebih bersih
        title: const Text(
          "Detail Quest", 
          style: TextStyle(color: Color(0xFF1B5E20), fontWeight: FontWeight.bold)
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF2E7D32)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Area Gambar
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: widget.quest.image.isEmpty 
                ? const Center(
                    child: Icon(Icons.image, size: 50, color: Color(0xFFC8E6C9))
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset( // Menggunakan asset sesuai list quest baru
                      widget.quest.image, 
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Center(
                        child: Text("Image Not Found", style: TextStyle(color: Colors.red))
                      ),
                    ),
                  ),
            ),
            const SizedBox(height: 20),

            // Tag Judul & Rank
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    widget.quest.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1B5E20)),
                  ),
                ),
                Text(
                  "Rank: ${widget.quest.rank}",
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Bagian Deskripsi dan Reward dengan ScrollView untuk mencegah Overflow
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F8E9),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green.shade100),
                ),
                child: SingleChildScrollView( // SOLUSI OVERFLOW: Membungkus isi agar bisa di-scroll
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Description", 
                        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2E7D32))
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.quest.desc, 
                        style: const TextStyle(color: Colors.black87, height: 1.5)
                      ),
                      const SizedBox(height: 25), // Memberi jarak tetap daripada Spacer()
                      const Text(
                        "Reward", 
                        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2E7D32))
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.quest.reward, 
                        style: const TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold, 
                          color: Color(0xFF388E3C)
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol Ambil Quest
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.quest.isTaken ? Colors.grey : const Color(0xFF2E7D32),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                onPressed: widget.quest.isTaken 
                  ? null 
                  : () {
                      setState(() {
                        widget.quest.isTaken = true;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${widget.quest.title} diambil!")),
                      );
                      Navigator.pop(context);
                    },
                child: Text(
                  widget.quest.isTaken ? "Quest Sudah Diambil" : "Ambil Quest",
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}