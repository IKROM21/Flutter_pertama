import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'dart:math';

void main() {
  runApp(const MyApp());
}

// Data Models
class Participant {
  final String name;
  final String address;

  Participant({required this.name, required this.address});
}

class Prize {
  final String name;
  final IconData icon;
  final Color color;

  Prize({required this.name, required this.icon, required this.color});
}

class Winner {
  final String participantName;
  final String prizeName;
  final DateTime date;

  Winner({
    required this.participantName,
    required this.prizeName,
    required this.date,
  });
}

// Global Data Storage
class AppData {
  static final List<Participant> participants = [
    Participant(name: 'Galang', address: 'Bandung'),
    Participant(name: 'Anam', address: 'Jakarta'),
    Participant(name: 'Reyhan', address: 'Surabaya'),
    Participant(name: 'Bintang', address: 'Semarang'),
    Participant(name: 'Hami', address: 'Yogyakarta'),
    Participant(name: 'Nanda', address: 'Malang'),
    Participant(name: 'Jamaluddin', address: 'Medan'),
    Participant(name: 'Faosi', address: 'Makassar'),
    Participant(name: 'Rizal', address: 'Palembang'),
    Participant(name: 'Zahrud', address: 'Bogor'),
    Participant(name: 'ansori', address: 'Bogor'),

  ];
  static final List<Winner> winners = [];
  static final List<Prize> prizes = [
    Prize(name: 'Sepeda', icon: Icons.directions_bike, color: Colors.blue),
    Prize(name: 'TV', icon: Icons.tv, color: Colors.purple),
    Prize(name: 'Kulkas', icon: Icons.kitchen, color: Colors.green),
    Prize(name: 'Kipas Angin', icon: Icons.wind_power, color: Colors.orange),
  ];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Kuis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6C63FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
        ),
        useMaterial3: true,
      ),
      home: const RegistrationPage(),
=======

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi TA Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
>>>>>>> 97d6f24424e8f17616614a76293933666d4f11f3
    );
  }
}

<<<<<<< HEAD
// Registration Page
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      AppData.participants.add(
        Participant(
          name: _nameController.text,
          address: _addressController.text,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: 450,
                padding: const EdgeInsets.all(32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.card_giftcard,
                        size: 64,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'FORM PENDAFTARAN',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Daftar untuk mengikuti kuis berhadiah',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Nama Lengkap',
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama harus diisi';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          labelText: 'Alamat',
                          prefixIcon: const Icon(Icons.home),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Alamat harus diisi';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _register,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'DAFTAR',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Dashboard Page
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  void _randomizeWinner() {
    if (AppData.participants.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Belum ada peserta yang terdaftar!')),
      );
      return;
    }

    // Navigate to Vertical List Roulette
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const VerticalListRoulette(),
      ),
    ).then((_) {
      setState(() {}); // Refresh after returning
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Undian Berhadiah Online'),
        backgroundColor: const Color(0xFFE91E63),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.language, color: Colors.white),
            label: const Text(
              'Website',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 16),
          const CircleAvatar(
            backgroundColor: Colors.teal,
            child: Text('A', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          const Text(
            'Undian Berhadiah Online',
            style: TextStyle(color: Colors.white),
          ),
          const Icon(Icons.arrow_drop_down, color: Colors.white),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Dashboard Cards
            Row(
              children: [
                Expanded(
                  child: _buildDashboardCard(
                    title: 'PESERTA',
                    count: AppData.participants.length.toString(),
                    icon: Icons.people,
                    color: const Color(0xFF3EC1D3),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDashboardCard(
                    title: 'HADIAH',
                    count: AppData.prizes.length.toString(),
                    icon: Icons.card_giftcard,
                    color: const Color(0xFFE91E63),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrizeListPage(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDashboardCard(
                    title: 'PEMENANG',
                    count: AppData.winners.length.toString(),
                    icon: Icons.photo_library,
                    color: const Color(0xFF7B68EE),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WinnerListPage(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDashboardCard(
                    title: 'PENGUNJUNG',
                    count: AppData.participants.length.toString(),
                    icon: Icons.trending_up,
                    color: const Color(0xFFFFC107),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Random Winner Button
            Center(
              child: ElevatedButton.icon(
                onPressed: _randomizeWinner,
                icon: const Icon(Icons.casino, size: 32),
                label: const Text(
                  'ACAK PEMENANG',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 48,
                    vertical: 24,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard({
    required String title,
    required String count,
    required IconData icon,
    required Color color,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color, color.withOpacity(0.7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    count,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    icon,
                    size: 48,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Prize List Page
class PrizeListPage extends StatelessWidget {
  const PrizeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Hadiah'),
        backgroundColor: const Color(0xFFE91E63),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: AppData.prizes.length,
          itemBuilder: (context, index) {
            final prize = AppData.prizes[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [prize.color, prize.color.withOpacity(0.6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      prize.icon,
                      size: 64,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      prize.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Vertical List Roulette Page
class VerticalListRoulette extends StatefulWidget {
  const VerticalListRoulette({super.key});

  @override
  State<VerticalListRoulette> createState() => _VerticalListRouletteState();
}

class _VerticalListRouletteState extends State<VerticalListRoulette>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  bool _isSpinning = false;
  int? _winnerIndex;
  Prize? _selectedPrize;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _startRoulette() async {
    if (_isSpinning) return;

    setState(() {
      _isSpinning = true;
      _winnerIndex = null;
    });

    final random = Random();
    final prize = AppData.prizes[random.nextInt(AppData.prizes.length)];

    // Create extended list for smooth scrolling
    final itemHeight = 108.0; // 100px height + 8px margin total
    final totalItems = AppData.participants.length;

    // Scroll animation - multiple rounds + random offset
    final rounds = 5;
    final randomOffset = random.nextInt(totalItems);
    final targetScroll = (rounds * totalItems + randomOffset) * itemHeight;

    // Animate scroll
    await _scrollController.animateTo(
      targetScroll,
      duration: const Duration(seconds: 5),
      curve: Curves.easeOutCubic,
    );

    // Wait a bit for scroll to settle
    await Future.delayed(const Duration(milliseconds: 100));

    // Calculate actual winner based on scroll position
    // The red line is at 250px from top of the container
    final currentScrollOffset = _scrollController.offset;
    final redLinePosition = currentScrollOffset + 250.0; // 250px is center of 500px container
    
    // Find which item is at the red line
    final itemAtRedLine = (redLinePosition / itemHeight).floor();
    final actualWinnerIndex = itemAtRedLine % totalItems;

    // Show winner
    setState(() {
      _isSpinning = false;
      _winnerIndex = actualWinnerIndex;
      _selectedPrize = prize;
    });

    // Add to winners list
    AppData.winners.add(
      Winner(
        participantName: AppData.participants[actualWinnerIndex].name,
        prizeName: prize.name,
        date: DateTime.now(),
      ),
    );

    // Show winner dialog
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      _showWinnerDialog(AppData.participants[actualWinnerIndex], prize);
    }
  }

  void _showWinnerDialog(Participant participant, Prize prize) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Column(
          children: [
            Icon(
              Icons.emoji_events,
              size: 80,
              color: Colors.amber[600],
            ),
            const SizedBox(height: 16),
            const Text(
              '🎉 SELAMAT! 🎉',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
=======
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Rencana TA Mahasiswa"),
        centerTitle: true,
        
      ),

       backgroundColor: const Color.fromARGB(213, 35, 46, 137),
    
      body: SingleChildScrollView( // biar bisa di-scroll
        child: Column(
          children: [
  

            // Card 1
            Card(
              color: const Color.fromARGB(255, 244, 225, 254), // warna background card
              elevation: 4,
              margin: EdgeInsets.all(12),
              child: ListTile(
                leading: Icon(Icons.school, color: Colors.blue),
                title: Text(
                  "Aplikasi TA Mahasiswa",
                  style: TextStyle(color: Colors.blue),
                ),
                subtitle: Text(
                  "pemetaan jalan rusak di kec.waru",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),

            // Card 2
            Card(
              color: Colors.lightBlue[50],
              elevation: 4,
              margin: EdgeInsets.all(12),
              child: ListTile(
                leading: Icon(Icons.school, color: Colors.green),
                title: Text(
                  "Aplikasi TA Mahasiswa",
                  style: TextStyle(color: Colors.green),
                ),
                subtitle: Text(
                  "pusat pengaduan jaringan wifi",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),

            // Card 3
            Card(
              color: Colors.lightBlue[50],
              elevation: 4,
              margin: EdgeInsets.all(12),
              child: ListTile(
                leading: Icon(Icons.school, color: Colors.red),
                title: Text(
                  "Aplikasi TA Mahasiswa",
                  style: TextStyle(color: Colors.red),
                ),
                subtitle: Text(
                  "Perancangan E-Commerce Toko Madura",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),

            // Card 4
            Card(
              color: Colors.lightBlue[50],
              elevation: 4,
              margin: EdgeInsets.all(12),
              child: ListTile(
                leading: Icon(Icons.school, color: Colors.purple),
                title: Text(
                  "Aplikasi TA Mahasiswa",
                  style: TextStyle(color: Colors.purple),
                ),
                subtitle: Text(
                  "pemetaan jaringan jalan rusak",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),

            // Card 5
            Card(
              color: Colors.lightBlue[50],
              elevation: 4,
              margin: EdgeInsets.all(12),
              child: ListTile(
                leading: Icon(Icons.school, color: Colors.orange),
                title: Text(
                  "Aplikasi TA Mahasiswa",
                  style: TextStyle(color: Colors.orange),
                ),
                subtitle: Text(
                  "Sistem Pendukung Keputusan Pemilihan Vendor",
                  style: TextStyle(color: Colors.black87),
                ),
>>>>>>> 97d6f24424e8f17616614a76293933666d4f11f3
              ),
            ),
          ],
        ),
<<<<<<< HEAD
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: prize.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: prize.color, width: 2),
              ),
              child: Column(
                children: [
                  Text(
                    participant.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Mendapatkan hadiah',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Icon(
                    prize.icon,
                    size: 60,
                    color: prize.color,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    prize.name,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: prize.color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Return to dashboard
            },
            child: const Text(
              'KEMBALI KE DASHBOARD',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Create extended list for infinite scroll effect
    final extendedList = List.generate(
      100,
      (index) => AppData.participants[index % AppData.participants.length],
    );

    return Scaffold(
      backgroundColor: const Color(0xFF1a1a2e),
      appBar: AppBar(
        title: const Text(
          'Vertical List Roulette',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF16213e),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Title
          const Text(
            'UNDIAN PEMENANG',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 30),
          // Roulette Container
          Expanded(
            child: Center(
              child: Container(
                width: 400,
                height: 500,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.purple.shade900,
                      Colors.blue.shade900,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.5),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Scrollable list
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: ListView.builder(
                        controller: _scrollController,
                        physics: _isSpinning
                            ? const NeverScrollableScrollPhysics()
                            : const ClampingScrollPhysics(),
                        itemCount: extendedList.length,
                        itemBuilder: (context, index) {
                          final participant = extendedList[index];
                          final actualIndex = index % AppData.participants.length;
                          final isWinner = !_isSpinning &&
                              _winnerIndex != null &&
                              actualIndex == _winnerIndex;

                          return Container(
                            height: 100,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: isWinner
                                  ? Colors.amber
                                  : Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isWinner
                                    ? Colors.amber.shade700
                                    : Colors.white.withOpacity(0.3),
                                width: isWinner ? 3 : 1,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    participant.name,
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: isWinner ? Colors.black : Colors.white,
                                    ),
                                  ),
                                  if (!_isSpinning)
                                    Text(
                                      'Index: $actualIndex',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: isWinner ? Colors.black54 : Colors.white54,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          // Spin Button
          ElevatedButton(
            onPressed: _isSpinning ? null : _startRoulette,
            style: ElevatedButton.styleFrom(
              backgroundColor: _isSpinning
                  ? Colors.grey
                  : const Color(0xFF4CAF50),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 24,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 10,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _isSpinning ? Icons.hourglass_bottom : Icons.casino,
                  size: 32,
                ),
                const SizedBox(width: 12),
                Text(
                  _isSpinning ? 'MENGACAK...' : 'MULAI ACAK',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
=======
>>>>>>> 97d6f24424e8f17616614a76293933666d4f11f3
      ),
    );
  }
}
<<<<<<< HEAD

// Winner List Page
class WinnerListPage extends StatelessWidget {
  const WinnerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pemenang'),
        backgroundColor: const Color(0xFF7B68EE),
      ),
      body: AppData.winners.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.emoji_events_outlined,
                    size: 100,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Belum ada pemenang',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: AppData.winners.length,
              itemBuilder: (context, index) {
                final winner = AppData.winners[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFF7B68EE),
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      winner.participantName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      'Hadiah: ${winner.prizeName}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(Icons.emoji_events, color: Colors.amber),
                        Text(
                          '${winner.date.day}/${winner.date.month}/${winner.date.year}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
=======
>>>>>>> 97d6f24424e8f17616614a76293933666d4f11f3
