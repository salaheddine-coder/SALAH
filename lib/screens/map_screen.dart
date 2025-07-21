import 'package:salah/core/imports.dart';
import 'package:salah/core/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool isListView = false;
  String selectedFilter = 'All';
  List<Property> filteredProperties = properties;

  GoogleMapController? mapController;
  Location location = Location();
  LocationData? currentLocation;
  Set<Marker> markers = {};
  MapType currentMapType = MapType.normal;
  final TextEditingController _searchController = TextEditingController();

  // Default location (Casablanca, Morocco)
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(33.5731, -7.5898),
    zoom: 12,
  );

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _createMarkers();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    currentLocation = await location.getLocation();
    setState(() {});
  }

  void _createMarkers() {
    markers.clear();

    // Sample locations for properties in Casablanca area
    List<LatLng> propertyLocations = [
      const LatLng(33.5731, -7.5898), // Casablanca center
      const LatLng(33.5892, -7.6036), // Casa Anfa
      const LatLng(33.5650, -7.6000), // Finance City
      const LatLng(33.5500, -7.5800), // Hay Hassani
    ];

    for (int i = 0; i < filteredProperties.length && i < propertyLocations.length; i++) {
      final property = filteredProperties[i];
      final location = propertyLocations[i];

      markers.add(
        Marker(
          markerId: MarkerId('property_$i'),
          position: location,
          infoWindow: InfoWindow(
            title: property.name,
            snippet: property.isForRent
                ? '${property.monthlyRent.toStringAsFixed(0)} DH/month'
                : '${property.price.toStringAsFixed(0)} DH',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PropertyDetailsScreen(property: property),
                ),
              );
            },
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Filter Section
            _buildFilterSection(),
            
            // Map/List Toggle and Content
            Expanded(
              child: Stack(
                children: [
                  // Map View
                  if (!isListView)
                    Container(
                      key: const ValueKey('mapView'),
                      child: _buildMapView(),
                    ),

                  // List View
                  if (isListView)
                    Container(
                      key: const ValueKey('listView'),
                      child: _buildListView(),
                    ),

                  // Search Bar (only for map view)
                  if (!isListView)
                    Container(
                      key: const ValueKey('searchBar'),
                      child: _buildMapSearchBar(),
                    ),

                  // Floating Action Buttons
                  Positioned(
                    key: const ValueKey('floatingButtons'),
                    bottom: 20,
                    right: 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Current Location Button
                        if (!isListView)
                          Container(
                            key: const ValueKey('currentLocationBtn'),
                            child: _buildCurrentLocationButton(),
                          ),
                        if (!isListView) const SizedBox(key: ValueKey('spacer1'), height: 12),
                        // Map Type Toggle Button
                        if (!isListView)
                          Container(
                            key: const ValueKey('mapTypeBtn'),
                            child: _buildMapTypeButton(),
                          ),
                        if (!isListView) const SizedBox(key: ValueKey('spacer2'), height: 12),
                        // View Toggle Button
                        Container(
                          key: const ValueKey('viewToggleBtn'),
                          child: _buildToggleButton(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 18),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            AppLocalizations.of(context)!.translate('propertiesMap'),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.search, size: 18),
              onPressed: () {
                // Search functionality
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip('All'),
            const SizedBox(width: 12),
            _buildFilterChip('Apartment'),
            const SizedBox(width: 12),
            _buildFilterChip('House'),
            const SizedBox(width: 12),
            _buildFilterChip('Villa'),
            const SizedBox(width: 12),
            _buildFilterChip('Office'),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = label;
          _filterProperties();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryBlue : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade600,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildMapView() {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: GoogleMap(
          initialCameraPosition: _initialPosition,
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
          },
          markers: markers,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          compassEnabled: true,
          trafficEnabled: false,
          buildingsEnabled: true,
          indoorViewEnabled: true,
          mapType: currentMapType,
        ),
      ),
    );
  }

  Widget _buildMapSearchBar() {
    return Positioned(
      top: 20,
      left: 20,
      right: 80,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.translate('searchLocation'),
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.primaryBlue,
            ),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {});
                    },
                  )
                : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
          ),
          onChanged: (value) {
            setState(() {});
          },
          onSubmitted: (value) {
            // Here you can implement location search functionality
            // For now, we'll just show a message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Searching for: $value'),
                backgroundColor: AppColors.primaryBlue,
              ),
            );
          },
        ),
      ),
    );
  }



  Widget _buildListView() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: filteredProperties.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildPropertyCard(filteredProperties[index]),
          );
        },
      ),
    );
  }

  Widget _buildPropertyCard(Property property) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PropertyDetailsScreen(property: property),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    property.images.isNotEmpty ? property.images[0] : 'assets/images/placeholder.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  key: ValueKey('favoriteBtn_${property.name}'),
                  top: 12,
                  right: 12,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                        size: 18,
                      ),
                      onPressed: () {
                        // Add to favorites functionality
                      },
                    ),
                  ),
                ),
                if (property.images.length > 1)
                  Positioned(
                    key: ValueKey('mapImageCount_${property.name}'),
                    bottom: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.photo_library,
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
            ),
            // Property Details
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          property.location,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    property.isForRent
                        ? '${property.monthlyRent.toStringAsFixed(0)} DH/month'
                        : '${property.price.toStringAsFixed(0)} DH',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentLocationButton() {
    return FloatingActionButton(
      heroTag: "currentLocationButton",
      mini: true,
      onPressed: () async {
        if (currentLocation != null && mapController != null) {
          await mapController!.animateCamera(
            CameraUpdate.newLatLng(
              LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
            ),
          );
        } else {
          await _getCurrentLocation();
        }
      },
      backgroundColor: Colors.white,
      child: Icon(
        Icons.my_location,
        color: AppColors.primaryBlue,
      ),
    );
  }

  Widget _buildMapTypeButton() {
    return FloatingActionButton(
      heroTag: "mapTypeButton",
      mini: true,
      onPressed: () {
        setState(() {
          currentMapType = currentMapType == MapType.normal
              ? MapType.satellite
              : MapType.normal;
        });
      },
      backgroundColor: Colors.white,
      child: Icon(
        currentMapType == MapType.normal ? Icons.satellite : Icons.map,
        color: AppColors.primaryBlue,
      ),
    );
  }

  Widget _buildToggleButton() {
    return FloatingActionButton(
      heroTag: "viewToggleButton",
      onPressed: () {
        setState(() {
          isListView = !isListView;
        });
      },
      backgroundColor: AppColors.primaryBlue,
      child: Icon(
        isListView ? Icons.map : Icons.list,
        color: Colors.white,
      ),
    );
  }

  void _filterProperties() {
    setState(() {
      if (selectedFilter == 'All') {
        filteredProperties = properties;
      } else {
        filteredProperties = properties.where((property) {
          return property.name.toLowerCase().contains(selectedFilter.toLowerCase());
        }).toList();
      }
      _createMarkers(); // Update markers when filtering
    });
  }
}
