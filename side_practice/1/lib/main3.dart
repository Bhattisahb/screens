import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cash App Money Screen',
      theme: ThemeData(
        // The background color of the whole app is a very light grey
        scaffoldBackgroundColor: const Color(0xFFF3F4F6),
        fontFamily: 'Roboto', 
      ),
      home: const MoneyScreen(),
    );
  }
}

class MoneyScreen extends StatelessWidget {
  const MoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F4F6),
        elevation: 0,
        title: const Text(
          'Money',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black, size: 28),
            onPressed: () {},
          ),
          Container(
            margin: const EdgeInsets.only(right: 16, left: 8),
            // Profile picture placeholder with black border
            child: const CircleAvatar(
              backgroundColor: Colors.black,
              radius: 18,
              child: CircleAvatar(
                backgroundColor: Colors.red, // The red profile circle
                radius: 16,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              
              // 1. MAIN BALANCE CARD (Using Stack to overlap the white card on the green one)
              Stack(
                children: [
                  // Top part (Bright Green/Yellow)
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: const Color(0xFFC7FF24), // Cash App bright green
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // "Shipped" label
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.send, size: 14),
                              SizedBox(width: 4),
                              Text('Shipped', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Bottom part (White Card overlapping)
                  Container(
                    margin: const EdgeInsets.only(top: 60), // Pushes the white card down
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        const Text('Cash balance', style: TextStyle(fontWeight: FontWeight.w600)),
                        const Text(
                          '\$1.00',
                          style: TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -1.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        
                        // Account & Routing hidden numbers
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Account •• ', style: TextStyle(color: Colors.grey, fontSize: 13)),
                            Container(width: 30, height: 14, color: Colors.grey[200]),
                            const SizedBox(width: 16),
                            const Text('Routing •• ', style: TextStyle(color: Colors.grey, fontSize: 13)),
                            Container(width: 30, height: 14, color: Colors.grey[200]),
                          ],
                        ),
                        const SizedBox(height: 24),
                        
                        // Action Buttons
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[200],
                                    foregroundColor: Colors.black,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                  ),
                                  child: const Text('Add money', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[200],
                                    foregroundColor: Colors.black,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                  ),
                                  child: const Text('Withdraw', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Divider(height: 1, thickness: 1, color: Color(0xFFF0F0F0)),
                        
                        // Paychecks footer
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.check_circle_outline, color: Colors.grey[600], size: 20),
                                  const SizedBox(width: 8),
                                  const Text('Paychecks', style: TextStyle(fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Text('Ready for first paycheck', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // 2. SAVINGS CARD
              _buildListCard(
                title: 'Savings',
                amount: '\$0.00',
                subtitle: 'Up to 3.75% interest',
                trailingIcons: [
                  _buildCircleIcon(Icons.monetization_on, offset: 25), // Background icon
                  _buildCircleIcon(Icons.monetization_on, offset: 0),  // Foreground icon
                ],
              ),
              const SizedBox(height: 16),

              // 3. POOLS CARD
              _buildListCard(
                title: 'Pools',
                amount: '\$0.00',
                subtitle: '1 closed',
                trailingIcons: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: const Icon(Icons.group_work_outlined, color: Colors.black),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              const Text('More for you', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Text('\$1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Text('\$', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.grey)),
            label: 'Pay',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time, color: Colors.grey, size: 28),
            label: 'History',
          ),
        ],
      ),
    );
  }

  // Helper method to build the Savings and Pools cards
  Widget _buildListCard({
    required String title,
    required String amount,
    required String subtitle,
    required List<Widget> trailingIcons,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              const SizedBox(height: 4),
              Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
          SizedBox(
            width: trailingIcons.length > 1 ? 80 : 50,
            height: 50,
            child: Stack(
              alignment: Alignment.centerRight,
              children: trailingIcons,
            ),
          )
        ],
      ),
    );
  }

  // Helper method to build the overlapping icons for the savings card
  Widget _buildCircleIcon(IconData icon, {required double offset}) {
    return Positioned(
      right: offset,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Icon(icon, color: Colors.green),
      ),
    );
  }
}
