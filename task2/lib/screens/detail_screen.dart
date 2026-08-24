import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isSaved = false;
  final TextEditingController _noteController = TextEditingController();
  List<String> _notes = ['Sample note contents...'];

  void _shareRestaurant() {
    Share.share('Check out Theodora in Brooklyn, New York on PLACES!');
  }

  Future<void> _launchWebsite() async {
    final Uri url = Uri.parse('https://example.com/theodora');
    if (!await launchUrl(url)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not open website')));
      }
    }
  }

  Future<void> _launchRoute() async {
    final Uri url = Uri.parse('https://maps.apple.com/?q=Theodora,Brooklyn,New+York');
    if (!await launchUrl(url)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not open maps')));
      }
    }
  }

  void _showReservationSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Make a Reservation', style: GoogleFonts.playfairDisplay(fontSize: 28, fontWeight: FontWeight.w600)),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Date', style: GoogleFonts.inter(fontSize: 16)),
                  Text('Tomorrow, 7:00 PM', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
              const Divider(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Party Size', style: GoogleFonts.inter(fontSize: 16)),
                  Text('2 Guests', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C6A5A),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Reservation Confirmed!')));
                },
                child: Text('Confirm Table', style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAddNoteDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFEFEDE6),
          title: Text('Add Note', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
          content: TextField(
            controller: _noteController,
            autofocus: true,
            decoration: const InputDecoration(hintText: 'What did you like here?'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: Colors.black54)),
            ),
            TextButton(
              onPressed: () {
                if (_noteController.text.isNotEmpty) {
                  setState(() {
                    _notes.insert(0, _noteController.text);
                  });
                  _noteController.clear();
                }
                Navigator.pop(context);
              },
              child: const Text('Save', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEDE6), // Match background color
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Background Image Carousel
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: double.infinity,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&q=80&w=800',
                    fit: BoxFit.cover,
                  ),
                ),
                
                // Image gradient overlay at bottom
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.35,
                  left: 0,
                  right: 0,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                      ),
                    ),
                  ),
                ),

                // Carousel Dots
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.5 - 40,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDot(true),
                      _buildDot(false),
                      _buildDot(false),
                      _buildDot(false),
                      _buildDot(false),
                    ],
                  ),
                ),

                // Top Action Buttons
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const CircleAvatar(
                            backgroundColor: Colors.black54,
                            radius: 20,
                            child: Icon(Icons.close, color: Colors.white, size: 20),
                          ),
                        ),
                        GestureDetector(
                          onTap: _shareRestaurant,
                          child: const CircleAvatar(
                            backgroundColor: Colors.black54,
                            radius: 20,
                            child: Icon(Icons.ios_share, color: Colors.white, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom Sheet Content
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEFEDE6), // Match background color
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(20, 32, 20, 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Theodora',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF222222),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.star_border, size: 24, color: Colors.black87),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Brooklyn, New York',
                            style: GoogleFonts.inter(fontSize: 16, color: const Color(0xFF555555)),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Mediterranean Restaurant • \$\$\$',
                            style: GoogleFonts.inter(fontSize: 16, color: const Color(0xFF555555)),
                          ),
                          const SizedBox(height: 16),
                          // Closed Tag
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.black12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text('Closed', style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 13)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Wrap for tags
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              _buildTag('Mentioned ↘', true),
                              _buildTag('📅 1 event ↘', true),
                              _buildTag('Dry-aged fish', false),
                              _buildTag('Wood-fired cooking', false),
                              _buildTag('Open-fire kitchen', false),
                              _buildTag('˅', false),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Mediterranean restaurant from the Miss Ada team focusing on wood-fired and dry-aged fish with open-fire cooking. Expect an inviting space with a changing, seasonal menu.',
                            style: GoogleFonts.inter(fontSize: 15, height: 1.5, color: const Color(0xFF444444)),
                          ),
                          const SizedBox(height: 32),
                          // Notes section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Notes',
                                style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600, color: const Color(0xFF222222)),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 6,
                                      height: 6,
                                      margin: const EdgeInsets.symmetric(horizontal: 2),
                                      decoration: const BoxDecoration(color: Colors.white70, shape: BoxShape.circle),
                                    ),
                                    Container(
                                      width: 4,
                                      height: 4,
                                      margin: const EdgeInsets.symmetric(horizontal: 2),
                                      decoration: const BoxDecoration(color: Colors.white38, shape: BoxShape.circle),
                                    ),
                                    Container(
                                      width: 4,
                                      height: 4,
                                      margin: const EdgeInsets.symmetric(horizontal: 2),
                                      decoration: const BoxDecoration(color: Colors.white38, shape: BoxShape.circle),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: _showAddNoteDialog,
                                child: Row(
                                  children: [
                                    const Icon(Icons.post_add, size: 16, color: Colors.black87),
                                    const SizedBox(width: 4),
                                    Text(
                                      'ADD NOTE',
                                      style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          // Displaying first note from list dynamically
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              _notes.first,
                              style: GoogleFonts.inter(color: Colors.black87),
                            ),
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ),
                
                // Floating Circular Logo
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.5 - 40, // 40 is half of radius
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFFEFEDE6), // Background border ring
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 36,
                      backgroundColor: const Color(0xFF1B1B1B),
                      child: const Icon(Icons.pets, color: Color(0xFFC5B099), size: 32), // Dragon placeholder
                    ),
                  ),
                ),

                // Floating Action Bar (Reserve, Website, Route, Save)
                Positioned(
                  bottom: 16,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF424242),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildActionButton(Icons.event_seat, 'Reserve', isPrimary: true, onTap: _showReservationSheet),
                        _buildActionButton(Icons.link, 'Website', onTap: _launchWebsite),
                        _buildActionButton(Icons.directions, 'Route', onTap: _launchRoute),
                        _buildActionButton(
                          _isSaved ? Icons.bookmark : Icons.bookmark_border, 
                          'Save', 
                          onTap: () {
                            setState(() {
                              _isSaved = !_isSaved;
                            });
                          }
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 8 : 6,
      height: isActive ? 8 : 6,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white54,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildTag(String text, bool hasIcon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black26),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (text.startsWith('📅 ')) ...[
            const Icon(Icons.calendar_today, size: 12, color: Colors.black54),
            const SizedBox(width: 4),
            Text(
              text.substring(2),
              style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF333333)),
            ),
          ] else
            Text(
              text,
              style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF333333)),
            ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, {bool isPrimary = false, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFF4C6A5A) : const Color(0xFF5A5A5A),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
