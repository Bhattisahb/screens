import 'package:flutter/material.dart';

class MoneyScreen extends StatelessWidget {
  const MoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          const SizedBox(height: 10),
          // App Bar Area
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Money',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Icon(Icons.search, size: 28),
                  const SizedBox(width: 16),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          // Main Balance Card Stack
          Stack(
            children: [
              // Green background peek
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFC0FF00), // Bright lime green
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(Icons.send, size: 16),
                        SizedBox(width: 4),
                        Text('Shipped'),
                      ],
                    ),
                  ),
                ),
              ),
              // White foreground card
              Container(
                margin: const EdgeInsets.only(top: 40), // Push down to reveal green
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Cash balance',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '\$1.00',
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Account ••••', style: TextStyle(color: Colors.grey[600])),
                        const SizedBox(width: 16),
                        Text('Routing ••••', style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF0F0F0),
                              foregroundColor: Colors.black,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: const Text('Add money', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF0F0F0),
                              foregroundColor: Colors.black,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: const Text('Withdraw', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.check_circle_outline, color: Colors.grey[600]),
                            const SizedBox(width: 8),
                            const Text('Paychecks', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Text('Ready for first paycheck', style: TextStyle(color: Colors.grey[600])),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Savings Card
          _buildInfoCard(
            title: 'Savings',
            amount: '\$0.00',
            subtitle: 'Up to 3.75% interest',
            iconWidget: const Row(
              children: [
                CircleAvatar(backgroundColor: Colors.white, radius: 16, child: Icon(Icons.money, color: Colors.green)),
                SizedBox(width: 4),
                CircleAvatar(backgroundColor: Colors.white, radius: 16, child: Icon(Icons.money, color: Colors.green)),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Pools Card
          _buildInfoCard(
            title: 'Pools',
            amount: '\$0.00',
            subtitle: '1 closed',
            iconWidget: CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 20,
              child: const Icon(Icons.group_work, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String amount,
    required String subtitle,
    required Widget iconWidget,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(amount, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
            ],
          ),
          iconWidget,
        ],
      ),
    );
  }
}
