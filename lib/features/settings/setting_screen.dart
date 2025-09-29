import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> 
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));
    
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      child: SafeArea(
        child:FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){context.router.pop(context);}, icon: Icon(Icons.arrow_back_ios)),
                  SizedBox(height: 10,),
                  _buildHeader(),
                  const SizedBox(height: 32),
              
                  _buildSettingsSection(
                    title: 'Legal',
                    children: [
                      _buildAnimatedSettingsTile(
                        context: context,
                        icon: CupertinoIcons.hand_raised_fill,
                        title: 'Privacy Policy',
                        subtitle: 'Read our privacy policy',
                        gradient: const [Color(0xFF667eea), Color(0xFF764ba2)],
                        delay: 0,
                        onTap: () => _launchURL('https://travel-outfit-planne.com/privacy'),
                      ),
                      const SizedBox(height: 12),
                      _buildAnimatedSettingsTile(
                        context: context,
                        icon: CupertinoIcons.doc_text_fill,
                        title: 'Terms of Use',
                        subtitle: 'Read our terms and conditions',
                        gradient: const [Color(0xFFf093fb), Color(0xFFf5576c)],
                        delay: 100,
                        onTap: () => _launchURL('https://travel-outfit-planne/terms'),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  _buildSettingsSection(
                    title: 'Support',
                    children: [
                      _buildAnimatedSettingsTile(
                        context: context,
                        icon: CupertinoIcons.star_fill,
                        title: 'Rate App',
                        subtitle: 'Rate us on the App Store',
                        gradient: const [Color(0xFFffecd2), Color(0xFFfcb69f)],
                        delay: 200,
                        onTap: () => _rateApp(),
                      ),
                      const SizedBox(height: 12),
                      _buildAnimatedSettingsTile(
                        context: context,
                        icon: CupertinoIcons.mail,
                        title: 'Contact Support',
                        subtitle: 'Get help or send feedback',
                        gradient: const [Color(0xFFa8edea), Color(0xFFfed6e3)],
                        delay: 300,
                        onTap: () => _openSupport(),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 20),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF667eea), Color(0xFF764ba2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Settings',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Manage your app preferences and get support',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: const Color(0xFF718096),
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2D3748),
          ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

 

  Widget _buildAnimatedSettingsTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required List<Color> gradient,
    required int delay,
    required VoidCallback onTap,
  }) {
    return AnimatedBuilder(
      animation: _fadeController,
      builder: (context, child) {
        return _buildSettingsTile(
          context: context,
          icon: icon,
          title: title,
          subtitle: subtitle,
          gradient: gradient,
          onTap: onTap,
        );
      },
    );
  }

  Widget _buildSettingsTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required List<Color> gradient,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: gradient[0].withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          color: const Color(0xFF2D3748),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: GoogleFonts.inter(
                          color: const Color(0xFF718096),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7FAFC),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    CupertinoIcons.chevron_right,
                    color: const Color(0xFF718096),
                    size: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _rateApp() async {
    if (await InAppReview.instance.isAvailable()) {
      InAppReview.instance.requestReview();
    }
  }
  
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  Future<void> _openSupport() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'support@travel-outfit-planner.com',
      query: 'subject=Travel Outfit Planner Support&body=Hi, I need help with...',
    );
    
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      debugPrint('Could not launch email client');
    }
  }
}






