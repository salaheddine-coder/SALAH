import 'package:salah/core/imports.dart';
import 'package:salah/core/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              _buildHeader(),
              const SizedBox(height: 24),
              // Search Section
              _buildSearchSection(),
              const SizedBox(height: 32),
              // Categories Section
              _buildCategoriesSection(),
              const SizedBox(height: 32),
              // Properties Header
              _buildPropertiesHeader(),
              const SizedBox(height: 20),

              // Properties List
              Expanded(
                child: _buildPropertiesList(),
              ),
            ],
          ),
        ),
      ),
      
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.welcome,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'User Name Here',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            // Maps Button
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.map_outlined,
                  color: AppColors.primaryBlue,
                  size: 24,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MapScreen(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            // User Avatar
            Container(
              decoration: BoxDecoration(
                gradient: AppColors.blueGradient,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchSection() {
    return Row(
      children: [
        Expanded(
          child: Container(
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
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by zip code',
                hintStyle: TextStyle(color: AppColors.textHint),
                prefixIcon: Icon(Icons.search, color: AppColors.primaryBlue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.transparent,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            gradient: AppColors.blueGradient,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryBlue.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.tune, color: Colors.white),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const FilterScreen(),
              );
            },
          ),
        ),
      ],
    );
  }



  Widget _buildCategoriesSection() {
    final categories = [
      {'icon': 'assets/icons/maison-moderne.png', 'label': AppLocalizations.of(context)!.villa},
      {'icon': 'assets/icons/appartement.png', 'label': AppLocalizations.of(context)!.apartment},
      {'icon': 'assets/icons/appartement haut standing.png', 'label': AppLocalizations.of(context)!.luxury},
      {'icon': 'assets/icons/condominium.png', 'label': AppLocalizations.of(context)!.office},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: _buildCategoryItem(
              category['icon']!,
              category['label']!,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryItem(String iconPath, String label) {
    return GestureDetector(
      onTap: () {
        // Handle category selection
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.blueShade50,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.blueShade200,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Image.asset(
                iconPath,
                width: 32,
                height: 32,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertiesHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.translate('allProperties'),
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See All',
            style: TextStyle(
              color: AppColors.primaryBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPropertiesList() {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 20),
      itemCount: properties.length,
      itemBuilder: (context, index) {
        final property = properties[index];
        return _buildPropertyCard(property, index);
      },
    );
  }

  Widget _buildPropertyCard(Property property, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PropertyDetailsScreen(property: property),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPropertyImage(property, index),
            _buildPropertyInfo(property),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyImage(Property property, int index) {
    return Stack(
      key: ValueKey('propertyImageStack_${index}_${property.name}'),
      children: [
        SizedBox(
          height: 220,
          child: PageView.builder(
            key: ValueKey('pageView_${index}_${property.name}'),
            itemCount: property.images.length,
            onPageChanged: (index) {
              // تم إزالة تتبع الفهرس لأننا نعرض العدد الإجمالي الآن
            },
            itemBuilder: (context, imageIndex) {
              return ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Image.asset(
                  property.images[imageIndex],
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        Positioned(
          key: ValueKey('favoriteBtn_${index}_${property.name}'),
          top: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        // Action Buttons (Bottom Left)
        Positioned(
          key: ValueKey('actionButtons_${index}_${property.name}'),
          bottom: 16,
          left: 16,
          child: Row(
            children: [
              // Photos Button
              _buildImageActionButton(
                icon: Icons.camera_alt,
                onTap: () => _showPropertyPhotos(property),
              ),
              const SizedBox(width: 8),
              // Map Button
              _buildImageActionButton(
                icon: Icons.map,
                onTap: () => _showPropertyMap(property),
              ),
            ],
          ),
        ),
        // Image Counter (Bottom Right)
        Positioned(
          key: ValueKey('imageCounter_${index}_${property.name}'),
          bottom: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 14,
                ),
                const SizedBox(width: 4),
                Text(
                  '${property.images.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPropertyInfo(Property property) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            property.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: AppColors.primaryBlue,
                size: 18,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  property.location,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildPropertyFeature(Icons.square_foot, '${property.area.toInt()} ${AppLocalizations.of(context)!.translate('sqm')}'),
              const SizedBox(width: 16),
              _buildPropertyFeature(Icons.bed, '${property.bedrooms} ${AppLocalizations.of(context)!.translate('bed')}'),
              const SizedBox(width: 16),
              _buildPropertyFeature(Icons.bathroom, '${property.bathrooms} ${AppLocalizations.of(context)!.translate('bath')}'),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: AppColors.blueGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              property.isForRent
                  ? '${property.monthlyRent.toStringAsFixed(0)} DH/month'
                  : '${property.price.toStringAsFixed(0)} DH',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageActionButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  void _showPropertyPhotos(Property property) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildPropertyPhotosSheet(property),
    );
  }

  void _showPropertyMap(Property property) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildPropertyMapSheet(property),
    );
  }

  Widget _buildPropertyPhotosSheet(Property property) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  '${property.name} ${AppLocalizations.of(context)!.photos}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          // Photos Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemCount: property.images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Show full screen image
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => _buildFullScreenImage(property.images[index]),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(property.images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyMapSheet(Property property) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  '${property.name} Location',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          // Map Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Map Placeholder
                    Container(
                      width: double.infinity,
                      height: 300, // Fixed height for map container
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.map,
                            size: 60,
                            color: Colors.blue.shade600,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Property Location Map',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            property.location,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Location Details
                    _buildLocationDetail(
                      Icons.location_on,
                      'Address',
                      property.location,
                      Colors.red.shade600,
                    ),
                    const SizedBox(height: 12),
                    _buildLocationDetail(
                      Icons.directions,
                      'Get Directions',
                      'Open in Maps app',
                      Colors.blue.shade600,
                      onTap: () => _openMapsForDirections(property.location),
                    ),
                    const SizedBox(height: 12),
                    _buildLocationDetail(
                      Icons.near_me,
                      'Distance',
                      'Calculate from your location',
                      Colors.green.shade600,
                      onTap: () => _calculateDistance(property.location),
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

  Widget _buildLocationDetail(IconData icon, String title, String description, Color color, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: color,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openMapsForDirections(String address) async {
    // تنظيف العنوان وتحويله لصيغة مناسبة للخرائط
    final encodedAddress = Uri.encodeComponent(address);

    // روابط مختلفة لتطبيقات الخرائط
    final googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$encodedAddress';
    final appleMapsUrl = 'https://maps.apple.com/?q=$encodedAddress';

    try {
      // محاولة فتح Google Maps أولاً
      if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
        await launchUrl(Uri.parse(googleMapsUrl), mode: LaunchMode.externalApplication);
      }
      // إذا لم يعمل، جرب Apple Maps (على iOS)
      else if (await canLaunchUrl(Uri.parse(appleMapsUrl))) {
        await launchUrl(Uri.parse(appleMapsUrl), mode: LaunchMode.externalApplication);
      }
      // إذا لم يعمل أي منهما، اعرض رسالة خطأ
      else {
        _showErrorMessage('لا يمكن فتح تطبيق الخرائط');
      }
    } catch (e) {
      _showErrorMessage('حدث خطأ في فتح تطبيق الخرائط');
    }
  }

  void _calculateDistance(String address) {
    // في التطبيق الحقيقي، يمكن استخدام location package لحساب المسافة الفعلية
    // هنا سنعرض رسالة تفيد بأن الميزة قيد التطوير
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.translate('calculateDistance')),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${AppLocalizations.of(context)!.translate('address')}: $address'),
            const SizedBox(height: 16),
            Text(AppLocalizations.of(context)!.translate('featureUnderDevelopment')),
            const SizedBox(height: 8),
            Text(AppLocalizations.of(context)!.translate('youWillBeAbleTo')),
            Text(AppLocalizations.of(context)!.translate('seeDistanceFromCurrentLocation')),
            Text(AppLocalizations.of(context)!.translate('knowExpectedArrivalTime')),
            Text(AppLocalizations.of(context)!.translate('choosePreferredTransport')),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.ok),
          ),
        ],
      ),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Widget _buildFullScreenImage(String imagePath) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyFeature(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.primaryBlue,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedPropertyType = 'Apartment';
  String selectedBedrooms = 'No min';
  RangeValues priceRange = const RangeValues(125000, 250000);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.grey300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.translate('filterProperties'),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Search TextField
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by zip code',
                        hintStyle: TextStyle(color: AppColors.textHint),
                        prefixIcon: Icon(Icons.search, color: AppColors.primaryBlue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Property Types
                  Text(
                    'Property types',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterChip('Apartment', true),
                        _buildFilterChip('House', false),
                        _buildFilterChip('Land', false),
                        _buildFilterChip('Commercial', false),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Bedrooms
                  Text(
                    'Bedrooms',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterChip('No min', true),
                        _buildFilterChip('Studio', false),
                        _buildFilterChip('1 bedroom', false),
                        _buildFilterChip('2 bedrooms', false),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Property Price
                  Text(
                    'Property price',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: AppColors.primaryBlue,
                      inactiveTrackColor: AppColors.grey200,
                      thumbColor: AppColors.primaryBlue,
                      overlayColor: AppColors.primaryBlue.withValues(alpha: 0.2),
                    ),
                    child: RangeSlider(
                      values: priceRange,
                      min: 0,
                      max: 1000000,
                      divisions: 20,
                      labels: RangeLabels(
                        '${priceRange.start.round()} DH',
                        '${priceRange.end.round()} DH',
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          priceRange = values;
                        });
                      },
                    ),
                  ),

                  const Spacer(),

                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // Reset logic
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.primaryBlue),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Reset',
                            style: TextStyle(color: AppColors.primaryBlue),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryBlue,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Apply Filter',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        key: ValueKey('filterChip_${label}_$isSelected'),
        onTap: () {
          setState(() {
            // Update selection logic
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryBlue : AppColors.grey100,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: isSelected ? AppColors.primaryBlue : AppColors.grey300,
              width: 1,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.textSecondary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class Property {
  final String name;
  final String location;
  final double price;
  final List<String> images;
  final double area; // المساحة بالمتر المربع
  final int bedrooms; // عدد الغرف
  final int bathrooms; // عدد الحمامات
  final String neighborhood; // الحي
  final bool isForRent;
  final double monthlyRent;


  Property({
    required this.name,
    required this.location,
    required this.price,
    required this.images,
    required this.area,
    required this.bedrooms,
    required this.bathrooms,
    required this.neighborhood,
    this.isForRent = false,
    this.monthlyRent = 6000,
  });
}

List<Property> properties = [
  Property(
    name: 'Luxury Villa',
    location: 'Casablanca, Anfa, Morocco',
    price: 14000000,
    area: 873.0,
    bedrooms: 6,
    bathrooms: 4,
    neighborhood: 'Casa Anfa',
    images: [
      'assets/images/Modern villa _1.jpeg',
      'assets/images/Modern villa _2.jpeg',
      'assets/images/Modern villa _1.jpeg',
      'assets/images/Modern villa _4.jpeg',
      'assets/images/Modern villa _5.jpeg',
      'assets/images/Modern villa _6.jpeg',
      'assets/images/Modern villa _7.jpeg',
      'assets/images/Modern villa _8.jpeg',
      'assets/images/Modern villa _9.jpeg',
      'assets/images/Modern villa _10.jpeg',
    ],
  ),
  Property(
    name: 'Modern Apartment',
    location: 'Casablanca, Finance City, Morocco',
    price: 2200000,
    area: 137.0,
    bedrooms: 2,
    bathrooms: 1,
    neighborhood: 'Casa Finance City',
    images: [
      'assets/images/Appartment_1.jpg',
      'assets/images/Appartment_2.jpg',
      'assets/images/Appartment_3.jpg',
      'assets/images/Appartment_4.jpg',
      'assets/images/Appartment_5.jpg',
      'assets/images/Appartment_6.jpg',
      'assets/images/Appartment_7.jpg',
      'assets/images/Appartment_8.jpg',
      'assets/images/Appartment_9.jpg',
      'assets/images/Appartment_10.jpg',
      'assets/images/Appartment_11.jpg',
    ],
  ),
  Property(
    name: 'Office Rental',
    location: 'Casablanca, Hay Hassani, Morocco',
    price: 6000,
    area: 37.0,
    bedrooms: 0,
    bathrooms: 1,
    neighborhood: 'Hay Hassani',
    isForRent: true,
    monthlyRent: 6000,
    images: [
      'assets/images/Bureau_1.jpeg',
      'assets/images/Bureau_2.jpeg',
      'assets/images/Bureau_3.jpeg',
      'assets/images/Bureau_4.jpeg',
      'assets/images/Bureau_5.jpeg',
      'assets/images/Studio_1.jpeg',
    ],
  ),
  Property(
    name: 'Cozy Studio',
    location: 'Casablanca, Maarif, Morocco',
    price: 14990,
    area: 45.0,
    bedrooms: 2,
    bathrooms: 2,
    neighborhood: 'Maarif',
    isForRent: true,
    monthlyRent: 14990,
    images: [
      'assets/images/Studio_1.jpeg',
      
    ],
  ),
];

String formatPrice(double price) {
  // تنسيق الرقم بإضافة فواصل للآلاف
  final formatted = price
      .toStringAsFixed(0)
      .replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );
  return '$formatted Dhs';
}




