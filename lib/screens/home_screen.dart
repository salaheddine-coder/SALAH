


import 'package:salah/core/imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentImageIndex = 0;

  

  @override
  Widget build(BuildContext context) {
    var pageView = PageView.builder(
      itemCount: 3,
      onPageChanged: (index) {
        setState(() => _currentImageIndex = index);
      },
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Image.asset(
            'assets/images/Modern villa _1.jpeg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        );
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      const Text(
                        'User Name Here',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(radius: 25, backgroundColor: Colors.grey),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by zip code',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.filter_list, color: Colors.white),
                      onPressed: () {
                        // إضافة حوار الفلتر
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => const FilterScreen(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildImageIconContainer(
                      'assets/icons/maison-moderne.png',
                      Colors.purple,
                    ),
                    const SizedBox(width: 15),
                    _buildImageIconContainer(
                      'assets/icons/appartement.png',
                      Colors.purple,
                    ),
                    const SizedBox(width: 15),
                    _buildImageIconContainer(
                      'assets/icons/appartement haut standing.png',
                      Colors.purple,
                    ),
                    const SizedBox(width: 15),
                    _buildImageIconContainer(
                      'assets/icons/condominium.png',
                      Colors.purple,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'All Properties',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  TextButton(onPressed: () {}, child: const Text('See All')),
                ],
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: properties.length,
                  itemBuilder: (context, index) {
                    final property = properties[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: 200,
                                  child: PageView.builder(
                                    itemCount: property.images.length,
                                    onPageChanged: (index) {
                                      setState(() {
                                        _currentImageIndex = index;
                                      });
                                    },
                                    itemBuilder: (context, imageIndex) {
                                      return ClipRRect(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                              top: Radius.circular(15),
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
                                  bottom: 10,
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      '${_currentImageIndex + 1}/${property.images.length}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        property.name,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.favorite_border,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.grey,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        property.location,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    '${property.price.toStringAsFixed(0)} DH',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }

  
   

  Widget _buildImageIconContainer(String imagePath, Color color) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.contain),
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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filter',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          
          // Search TextField
          TextField(
            decoration: InputDecoration(
              hintText: 'Search by zip code',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[100],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Property Types
          const Text(
            'Property types',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
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

          const SizedBox(height: 20),
          
          // Bedrooms
          const Text(
            'Bedrooms',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
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

          const SizedBox(height: 20),
          
          // Property Price
          const Text(
            'Property price',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          RangeSlider(
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
          
          const Spacer(),
          
          // Buttons
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    // Reset logic
                  },
                  child: const Text('Reset'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Search logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Search',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool value) {
          setState(() {
            // Update selection logic
          });
        },
        backgroundColor: Colors.grey[100],
        selectedColor: Colors.green[100],
        checkmarkColor: Colors.green,
        labelStyle: TextStyle(
          color: isSelected ? Colors.green : Colors.black,
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
    location: 'Casablanca, Morocco',
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
      'assets/images/Bureau_6.jpeg',
      'assets/images/Bureau_7.jpeg',
      'assets/images/Bureau_8.jpeg',
      'assets/images/Bureau_9.jpeg',
      'assets/images/Bureau_10.jpeg',
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



class ImageOverlayButtons extends StatelessWidget {
  final int imageCount;

  const ImageOverlayButtons({
    super.key,
    required this.imageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Camera/Image count button
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(width: 4),
              Text(
                '$imageCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        // Layout switch button
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.grid_view,
            color: Colors.white,
            size: 18,
          ),
        ),
      ],
    );
  }
}

Widget _buildPropertyImage() {
  return Stack(
    children: [
      Image.asset(
        'assets/images/apartment.jpg',
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      ),
      Positioned(
        bottom: 12,
        left: 12,
        child: ImageOverlayButtons(imageCount: 12),
      ),
    ],
  );
}
