import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _shareApp() {
    Share.share('Check out this amazing restaurant I found on PLACES!');
  }

  void _showAskFollowUp() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Ask a follow up', style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 18)),
              const SizedBox(height: 16),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'e.g. Do they have outdoor seating?',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  suffixIcon: const Icon(Icons.send),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSearchBody() {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            const SizedBox(height: 16),
            // User Prompt Bubble
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE2E0D8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'Give me a recommended restaurant for brunch in menlo park',
                style: GoogleFonts.inter(fontSize: 16, color: const Color(0xFF222222)),
              ),
            ),
            const SizedBox(height: 24),
            // Assistant Response
            RichText(
              text: TextSpan(
                style: GoogleFonts.inter(fontSize: 16, height: 1.5, color: const Color(0xFF222222)),
                children: const [
                  TextSpan(text: 'Found strong brunch options in and around Menlo Park. For one clear recommendation, start with '),
                  TextSpan(text: 'Madera', style: TextStyle(decoration: TextDecoration.underline)),
                  TextSpan(text: '.'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Divider(color: Colors.black12),
            const SizedBox(height: 24),
            // Heading
            Text(
              'Brunch around Menlo\nPark',
              style: GoogleFonts.playfairDisplay(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                height: 1.1,
                color: const Color(0xFF222222),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Best fits for a proper sit-down brunch',
              style: GoogleFonts.inter(fontSize: 16, color: const Color(0xFF444444)),
            ),
            const SizedBox(height: 16),
            // Map Placeholder
            GestureDetector(
              onTap: () {
                setState(() => _selectedIndex = 1); // Switch to Map tab
              },
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4D3CD),
                      borderRadius: BorderRadius.circular(24),
                      image: const DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&q=80&w=800'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.lighten),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 16,
                      child: const Icon(Icons.open_in_full, size: 16, color: Colors.black87),
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1514933651103-005eec06c04b?auto=format&fit=crop&q=80&w=100'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Restaurant Card
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/detail');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1514933651103-005eec06c04b?auto=format&fit=crop&q=80&w=100',
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Madera',
                        style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Best overall pick for a destination-style brunch. Refined Northern California cooking, a beautiful room, and mountain views at Rosewood Sand Hill.',
                    style: GoogleFonts.inter(fontSize: 15, height: 1.4, color: const Color(0xFF444444)),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() => _selectedIndex = 1);
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Icon(Icons.map_outlined, color: Colors.black87, size: 20),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/detail'),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Icon(Icons.keyboard_arrow_down, color: Colors.black87, size: 24),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100), // Space for bottom floating bar
          ],
        ),
        // Floating Ask Bar
        Positioned(
          bottom: 16,
          left: 20,
          right: 20,
          child: GestureDetector(
            onTap: _showAskFollowUp,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Ask a follow up',
                      style: GoogleFonts.inter(color: Colors.black38, fontSize: 16),
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: Color(0xFFEBEAE4),
                    radius: 20,
                    child: Icon(Icons.mic, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: Scaffold(
              key: _scaffoldKey,
              backgroundColor: Theme.of(context).colorScheme.background,
              drawer: Drawer(
                backgroundColor: const Color(0xFFEFEDE6),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(color: Color(0xFF4C6A5A)),
                      child: Text('PLACES Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                      onTap: () => Navigator.pop(context),
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Log Out'),
                      onTap: () => Navigator.pushReplacementNamed(context, '/login'),
                    ),
                  ],
                ),
              ),
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.menu, color: Colors.black87),
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: _shareApp,
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.ios_share, color: Colors.black87),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: _showAskFollowUp,
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.edit_square, color: Colors.black87),
                      ),
                    ),
                  ),
                ],
              ),
              body: IndexedStack(
                index: _selectedIndex,
                children: [
                  _buildSearchBody(),
                  const Center(child: Text('Map View Interactive UI', style: TextStyle(fontSize: 20))),
                  const Center(child: Text('Discover Recommendations', style: TextStyle(fontSize: 20))),
                  const Center(child: Text('People & Friends', style: TextStyle(fontSize: 20))),
                  const Center(child: Text('Profile Settings', style: TextStyle(fontSize: 20))),
                ],
              ),
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.black12)),
                  color: Color(0xFFEFEDE6),
                ),
                child: BottomNavigationBar(
                  backgroundColor: const Color(0xFFEFEDE6),
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.black45,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 12),
                  unselectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 12),
                  currentIndex: _selectedIndex,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.search, size: 20)), 
                      label: 'Search'
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.map_outlined, size: 20)), 
                      label: 'Map'
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.explore_outlined, size: 20)), 
                      label: 'Discover'
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.people_outline, size: 20)), 
                      label: 'People'
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.person_outline, size: 20)), 
                      label: 'Profile'
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
