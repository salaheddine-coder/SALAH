import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah/core/app_colors.dart';
import 'package:salah/core/language_provider.dart';
import 'package:salah/core/app_localizations.dart';
import 'package:salah/screens/language_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildSettingItem(
                  context,
                  icon: Icons.language,
                  title: AppLocalizations.of(context)!.language,
                  subtitle: languageProvider.getCurrentLanguageName(),
                  trailing: languageProvider.getCurrentLanguageFlag(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LanguageScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildSettingItem(
                  context,
                  icon: Icons.notifications,
                  title: AppLocalizations.of(context)!.translate('notifications'),
                  subtitle: AppLocalizations.of(context)!.translate('manageNotifications'),
                  onTap: () {
                    // TODO: Navigate to notifications settings
                  },
                ),
                const SizedBox(height: 16),
                _buildSettingItem(
                  context,
                  icon: Icons.privacy_tip,
                  title: AppLocalizations.of(context)!.translate('privacy'),
                  subtitle: AppLocalizations.of(context)!.translate('privacyAndSecurity'),
                  onTap: () {
                    // TODO: Navigate to privacy settings
                  },
                ),
                const SizedBox(height: 16),
                _buildSettingItem(
                  context,
                  icon: Icons.help,
                  title: AppLocalizations.of(context)!.translate('helpAndSupport'),
                  subtitle: AppLocalizations.of(context)!.translate('getHelp'),
                  onTap: () {
                    // TODO: Navigate to help screen
                  },
                ),
                const SizedBox(height: 16),
                _buildSettingItem(
                  context,
                  icon: Icons.info,
                  title: AppLocalizations.of(context)!.translate('aboutApp'),
                  subtitle: AppLocalizations.of(context)!.translate('appInfoAndVersion'),
                  onTap: () {
                    // TODO: Navigate to about screen
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    String? trailing,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primaryBlue,
                  size: 24,
                ),
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
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null)
                Text(
                  trailing,
                  style: const TextStyle(fontSize: 24),
                )
              else
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.textSecondary,
                  size: 16,
                ),
            ],
          ),
        ),
      ),
    );
  }
}