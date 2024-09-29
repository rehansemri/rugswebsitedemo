import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDetailsWidget extends StatefulWidget {
  final String productId;

  ProductDetailsWidget({required this.productId});

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  late List<String> _imageUrls = [];
  String? _selectedImage; // Local state variable for the selected image

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('recentProduct')
          .doc(widget.productId)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Center(child: Text("Product not found."));
        }

        var productData = snapshot.data!.data() as Map<String, dynamic>;
        _imageUrls = List<String>.from(productData['image']);

        // Set the initial image to the first image in the list
        if (_imageUrls.isNotEmpty) {
          _selectedImage ??= _imageUrls[0]; // Initialize _selectedImage only if it's null
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding:  EdgeInsets.all(constraints.maxWidth > 800?32.0:10),
              child: constraints.maxWidth > 800
                  ? _buildWebLayout(productData)
                  : _buildMobileLayout(productData),
            );
          },
        );
      },
    );
  }

  Widget _buildWebLayout(Map<String, dynamic> productData) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: _buildImageDisplay(),
        ),
        SizedBox(width: 32),
        Expanded(
          flex: 1,
          child: _buildProductDetails(productData),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(Map<String, dynamic> productData) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildImageDisplay(),
           SizedBox(height: 16),
          _buildProductDetails(productData),
        ],
      ),
    );
  }

  Widget _buildImageDisplay() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Show full-screen image when tapped
            if (_selectedImage != null) {
              _showFullScreenImage(_selectedImage!);
            }
          },
          child: Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: _selectedImage != null
                  ? Image.network(
                      _selectedImage!,
                      fit: BoxFit.cover,
                    )
                  : Container(),
            ),
          ),
        ),
        SizedBox(height: 16),
        _buildImageThumbnails(),
        
      ],
    );
  }

  Widget _buildImageThumbnails() {
    return Container(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                // Update the selected image when a thumbnail is tapped
                _selectedImage = _imageUrls[index];
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  _imageUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showFullScreenImage(String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  minScale: 0.1, // Minimum zoom out
                  maxScale: 4.0, // Maximum zoom in
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog when tapped
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProductDetails(Map<String, dynamic> productData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
   
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productData['name'],
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Price: INR ${productData['price']}",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Size: ${productData['size']}",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Description:",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            productData['description'],
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Additional Information:",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            productData['additionalInfo'],
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
