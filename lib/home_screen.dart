// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                          builder: (context) => FilterBottomSheet(),
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
                                    '\$${property.price.toStringAsFixed(0)}',
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
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

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filter Properties',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text('Price Range'),
          RangeSlider(
            values: const RangeValues(0, 1000000),
            max: 1000000,
            divisions: 10,
            labels: const RangeLabels('\DH0', '\DH1M'),
            onChanged: (RangeValues values) {},
          ),
          const SizedBox(height: 10),
          const Text('Property Type'),
          Wrap(
            spacing: 8,
            children: [
              FilterChip(
                label: const Text('House'),
                onSelected: (bool value) {},
                selected: false,
              ),
              FilterChip(
                label: const Text('Apartment'),
                onSelected: (bool value) {},
                selected: false,
              ),
              FilterChip(
                label: const Text('Villa'),
                onSelected: (bool value) {},
                selected: false,
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Apply Filters'),
            ),
          ),
        ],
      ),
    );
  }
}

class Property {
  final String name;
  final String location;
  final double price;
  final List<String> images;

  Property({
    required this.name,
    required this.location,
    required this.price,
    required this.images,
  });
}

List<Property> properties = [
  Property(
    name: 'Luxury Villa',
    location: 'Casablanca, Morocco',
    price: 14000000,
    
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
    name: 'Modern Apartment',
    location: 'Casablanca, Finance City, Morocco',
    price: 2200000,
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
];

class Dhs {}
