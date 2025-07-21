
import 'package:salah/core/imports.dart';
import 'package:salah/core/app_localizations.dart';

class EnhancedBottomNavigation extends StatefulWidget {
  const EnhancedBottomNavigation({super.key});

  @override
  State<EnhancedBottomNavigation> createState() => _EnhancedBottomNavigationState();
}

class _EnhancedBottomNavigationState extends State<EnhancedBottomNavigation>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late PageController _pageController;
  late AnimationController _animationController;

  // قائمة الشاشات
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoritesScreen(),
    const MessagesScreen(),
    const SettingsScreen(),
  ];

  // معلومات التبويبات
  List<NavItem> _getNavItems(BuildContext context) {
    return [
      NavItem(
        icon: Icons.home_outlined,
        selectedIcon: Icons.home,
        label: AppLocalizations.of(context)!.home,
        color: Colors.blue,
      ),
      NavItem(
        icon: Icons.search_outlined,
        selectedIcon: Icons.search,
        label: AppLocalizations.of(context)!.search,
        color: Colors.green,
      ),
      NavItem(
        icon: Icons.favorite_border,
        selectedIcon: Icons.favorite,
        label: AppLocalizations.of(context)!.favorites,
        color: Colors.red,
      ),
      NavItem(
        icon: Icons.chat_bubble_outline,
        selectedIcon: Icons.chat_bubble,
        label: AppLocalizations.of(context)!.messages,
        color: Colors.purple,
      ),
      NavItem(
        icon: Icons.settings_outlined,
        selectedIcon: Icons.settings,
        label: AppLocalizations.of(context)!.settings,
        color: Colors.orange,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      // إضافة تأثير اهتزاز خفيف
      HapticFeedback.lightImpact();
      
      setState(() {
        _selectedIndex = index;
      });
      
      // تحريك الصفحة بسلاسة
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: Container(
            height: 85,
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[900] : Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                _getNavItems(context).length,
                (index) => _buildNavItem(index, isDark, context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, bool isDark, BuildContext context) {
    final isSelected = _selectedIndex == index;
    final item = _getNavItems(context)[index];

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // الأيقونة مع التأثير المتحرك
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isSelected
                    ? item.color.withValues(alpha: 0.2)
                    : Colors.transparent,
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  isSelected ? item.selectedIcon : item.icon,
                  key: ValueKey(isSelected),
                  color: isSelected
                      ? item.color
                      : (isDark ? Colors.grey[400] : Colors.grey[600]),
                  size: isSelected ? 26 : 24,
                ),
              ),
            ),
            const SizedBox(height: 4),
            // النص مع التأثير المتحرك
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                color: isSelected
                    ? item.color
                    : (isDark ? Colors.grey[400] : Colors.grey[600]),
                fontSize: isSelected ? 12 : 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
              child: Text(
                item.label,
                textAlign: TextAlign.center,
              ),
            ),
            // مؤشر الصفحة النشطة
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.only(top: 4),
              height: 3,
              width: isSelected ? 20 : 0,
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// فئة لتعريف عناصر التنقل
class NavItem {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final Color color;

  NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.color,
  });
}
