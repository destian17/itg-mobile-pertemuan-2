class Quest {
  final String title;
  final String rank;
  final String reward;
  final String image;
  final String desc;
  bool isTaken;

  Quest({
    required this.title,
    required this.rank,
    required this.reward,
    required this.image,
    required this.desc,
    this.isTaken = false,
  });
}

List<Quest> questList = [
  Quest(
    title: "Ghost in the Library", 
    rank: "D", 
    reward: "Ancient Book & 200 Gold", 
    image: "assets/library.png", 
    desc: "Selidiki suara tangisan di perpustakaan kota saat malam hari dan tenangkan roh penunggu di sana."
  ),
  Quest(
    title: "The Cursed Merchant", 
    rank: "B", 
    reward: "Discount Coupon (Permanent) & 800 Gold", 
    image: "assets/merchant.png", 
    desc: "Seorang pedagang berubah menjadi katak! Temukan bunga penawar kutukan di rawa beracun."
  ),
  Quest(
    title: "Kraken's Awakening", 
    rank: "S", 
    reward: "Ship 'Sea Master' & 15.000 Gold", 
    image: "assets/kraken.png", 
    desc: "Lindungi kapal pengangkut logistik dari amukan tentakel Kraken di teluk utara."
  ),
  Quest(
    title: "Spying the Goblin King", 
    rank: "C", 
    reward: "Stealth Cloak & 450 Gold", 
    image: "assets/goblin.png", 
    desc: "Masuk ke kamp Goblin tanpa terdeteksi dan ambil peta rencana penyerangan mereka."
  ),
  Quest(
    title: "Sky Island Expedition", 
    rank: "A", 
    reward: "Flying Boots & 3.500 Gold", 
    image: "assets/sky_island.png", 
    desc: "Gunakan balon udara untuk mencapai pulau melayang dan ambil kristal gravitasi."
  ),
  Quest(
    title: "The Midnight Thief", 
    rank: "E", 
    reward: "Lockpick Set & 150 Gold", 
    image: "assets/thief.png", 
    desc: "Tangkap pencuri jemuran warga yang ternyata adalah seekor monyet ajaib yang suka pakaian warna-warni."
  ),
  Quest(
    title: "Trial of the Phoenix", 
    rank: "SS", 
    reward: "Rebirth Soul & 50.000 Gold", 
    image: "assets/phoenix.png", 
    desc: "Masuki kawah gunung berapi dan buktikan keberanianmu di hadapan burung legendaris Phoenix."
  ),
];