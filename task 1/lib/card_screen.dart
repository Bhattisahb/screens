import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          const SizedBox(height: 10),
          // App Bar Area
          Row(
            children: [
              const Icon(Icons.close, size: 28),
              Expanded(
                child: Center(
                  child: const Text(
                    'Card',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 28), // balance space for the close icon
            ],
          ),
          const SizedBox(height: 30),

          // Tilted Card Image/Container
          Center(
            child: Transform.rotate(
              angle: -0.05, // Slight tilt like in the screenshot
              child: Container(
                width: 320,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFFC0FF00), // Lime green
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    // Top black magnetic strip area
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF333333),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    // Eye icon
                    const Positioned(
                      top: 4,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.white24,
                        radius: 16,
                        child: Icon(Icons.remove_red_eye, color: Colors.white, size: 18),
                      ),
                    ),
                    const Positioned(
                      top: 90,
                      left: 20,
                      child: Row(
                        children: [
                          Text('••••   ••••   ••••   ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(width: 50, height: 20), // Placeholder for blurred out part
                        ],
                      ),
                    ),
                    // CVV / EXP
                    const Positioned(
                      bottom: 20,
                      left: 20,
                      child: Text(
                        'CVV •••    EXP ••/••',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black54),
                      ),
                    ),
                    // VISA Logo
                    const Positioned(
                      bottom: 20,
                      right: 20,
                      child: Text(
                        'VISA',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Action Buttons (Lock / Copy)
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.lock_outline, size: 18),
                  label: const Text('Lock'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF5F5F5),
                    foregroundColor: Colors.black,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.copy, size: 18),
                  label: const Text('Copy ••••'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          // Shipping Status
          const Text(
            'Shipping status',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Timeline
          _buildTimelineItem(
            title: 'Preparing your card',
            subtitle: 'Your card design is being reviewed',
            isActive: true,
            isLast: false,
          ),
          _buildTimelineItem(
            title: 'Shipped',
            subtitle: null,
            isActive: false,
            isLast: false,
          ),
          _buildTimelineItem(
            title: 'Delivery',
            subtitle: null,
            isActive: false,
            isLast: true,
          ),

          const SizedBox(height: 40),
          const Divider(),
          const SizedBox(height: 20),

          // Get more out of your card
          const Text(
            'Get more out of your card',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SizedBox(
              width: 50,
              child: Stack(
                children: [
                  Positioned(left: 0, child: CircleAvatar(backgroundColor: Colors.red, radius: 15)),
                  Positioned(left: 12, child: CircleAvatar(backgroundColor: Colors.purple, radius: 15)),
                  Positioned(left: 24, child: CircleAvatar(backgroundColor: Colors.pink, radius: 15)),
                ],
              ),
            ),
            title: const Text('Explore offers', style: TextStyle(fontWeight: FontWeight.w600)),
            trailing: const Icon(Icons.chevron_right),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String title,
    String? subtitle,
    required bool isActive,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? Colors.black : Colors.grey.shade300,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: isActive ? Colors.black : Colors.grey.shade300,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
                  color: isActive ? Colors.black : Colors.grey,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ],
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
