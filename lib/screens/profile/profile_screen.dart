import 'package:flutter/material.dart';

import '../../const/app_colors.dart';
import '../../entities/user.dart';
import '../../services/auth_service.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _mockUser = AppUser(
    id: 'user1',
    name: 'Kumar Adarsh',
    email: 'kumaradarsh26092005@gmail.com',
    role: 'delivery_boy',
  );

  Future<void> _handleLogout(BuildContext context) async {
    final authService = AuthService();
    await authService.signOut();
    if (!context.mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: const Color(0xFF8D6E63),
                    child: Text(
                      _mockUser.name.isNotEmpty ? _mockUser.name[0] : '?',
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _mockUser.name,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          _mockUser.email,
                          style: TextStyle(
                            color: AppColors.text.shade300,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _ProfileTile(
                icon: Icons.person_outline,
                label: 'Edit Profile',
                onTap: () {},
              ),
              _ProfileTile(
                icon: Icons.two_wheeler_outlined,
                label: 'My Deliveries',
                onTap: () {},
              ),
              _ProfileTile(
                icon: Icons.account_balance_wallet_outlined,
                label: 'Payout Details',
                onTap: () {},
              ),
              _ProfileTile(
                icon: Icons.badge_outlined,
                label: 'Vehicle & Documents',
                onTap: () {},
              ),
              _ProfileTile(
                icon: Icons.help_outline,
                label: 'Support',
                onTap: () {},
              ),
              _ProfileTile(
                icon: Icons.shield_outlined,
                label: 'Privacy Policy',
                onTap: () {},
              ),
              _ProfileTile(
                icon: Icons.description_outlined,
                label: 'Terms and Conditions',
                onTap: () {},
              ),
              const SizedBox(height: 16),
              _ProfileTile(
                icon: Icons.logout,
                label: 'Log Out',
                labelColor: Colors.red,
                iconColor: Colors.red,
                onTap: () => _handleLogout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? labelColor;
  final Color? iconColor;

  const _ProfileTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.labelColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: const Color(0xFFE9EDEB),
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Icon(icon, color: iconColor ?? AppColors.primary),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(fontSize: 15, color: labelColor),
                  ),
                ),
                Icon(Icons.chevron_right, color: AppColors.text.shade300),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
