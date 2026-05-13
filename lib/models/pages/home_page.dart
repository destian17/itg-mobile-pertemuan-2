import 'package:flutter/material.dart';
import 'package:pertemuan_2/models/pages/widget/header_widget.dart';
import 'package:pertemuan_2/models/quest_model.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  final String name, level, rank, job;
  const HomePage({super.key, required this.name, required this.level, required this.rank, required this.job});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Ganti ke Hijau Muda sesuai tema baru
        backgroundColor: const Color(0xFFC8E6C9), 
        title: const Text("Adventure Guild", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1B5E20))),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1B5E20)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(
            name: widget.name,
            level: widget.level,
            rank: widget.rank,
            job: widget.job,
          ),

          // Stats Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatItem(Icons.favorite, "HP: 80", Colors.red),
                _buildStatItem(Icons.shield, "Shield: 100", Colors.blue),
                _buildStatItem(Icons.local_fire_department, "Damage: 170", Colors.orange),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Today's Quest", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32))),
          ),

          // Quest List
          Expanded(
            child: ListView.builder(
              itemCount: questList.length,
              itemBuilder: (context, i) {
                final q = questList[i];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.green.shade100),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        // Warna background ikon diubah ke Hijau
                        color: const Color(0xFFE8F5E9), 
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        q.isTaken ? Icons.check_circle_outline : Icons.radio_button_off,
                        // Warna ikon diubah ke Hijau Tua
                        color: const Color(0xFF2E7D32), 
                      ),
                    ),
                    title: Text(q.title, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1B5E20))),
                    subtitle: Text("Rank: ${q.rank}", style: const TextStyle(color: Color(0xFF43A047))),
                    trailing: const Icon(Icons.chevron_right, color: Color(0xFF2E7D32)),
                    onTap: () async {
                      await Navigator.push(context, MaterialPageRoute(builder: (c) => DetailPage(quest: q)));
                      setState(() {}); 
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: color.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 5),
          Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: color.withOpacity(0.8))),
        ],
      ),
    );
  }
}