import 'package:flutter/material.dart';

class OrderForm extends StatefulWidget {
  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String mobile = '';
  String email = '';
  String countryCode = ''; 
 List selectedCountry =[];
  int quantity = 1; // Default quantity
  String notes = '';
  bool _isSubmitted = false; // Track form submission state

  // Sample country codes (ensure unique codes)
  final List<List<String>> countries = [
    ['United States', '+1'],
    ['Canada', '+1'],
    ['United Kingdom', '+44'],
    ['Australia', '+61'],
    ['India', '+91'],
    ['Germany', '+49'],
    ['France', '+33'],
    ['China', '+86'],
    ['Japan', '+81'],
    ['Mexico', '+52'],
    ['Brazil', '+55'],
    ['South Africa', '+27'],
    ['Russia', '+7'],
    ['Italy', '+39'],
    ['Spain', '+34'],
    ['Netherlands', '+31'],
    ['Sweden', '+46'],
    ['New Zealand', '+64'],
    ['Singapore', '+65'],
    ['South Korea', '+82'],
    ['Switzerland', '+41'],
    ['Argentina', '+54'],
    ['Nigeria', '+234'],
    ['Egypt', '+20'],
    ['Saudi Arabia', '+966'],
    ['Turkey', '+90'],
    ['United Arab Emirates', '+971'],
    ['Malaysia', '+60'],
    ['Indonesia', '+62'],
    ['Thailand', '+66'],
    ['Philippines', '+63'],
    ['Pakistan', '+92'],
    ['Bangladesh', '+880'],
    ['Vietnam', '+84'],
    ['Israel', '+972'],
    ['Norway', '+47'],
    ['Denmark', '+45'],
    ['Finland', '+358'],
    ['Belgium', '+32'],
    ['Austria', '+43'],
    ['Portugal', '+351'],
    ['Greece', '+30'],
    ['Poland', '+48'],
    ['Czech Republic', '+420'],
    ['Hungary', '+36'],
    ['Romania', '+40'],
    ['Ireland', '+353'],
    ['Iceland', '+354'],
    ['Luxembourg', '+352'],
    ['Bulgaria', '+359'],
    ['Croatia', '+385'],
    ['Slovakia', '+421'],
    ['Slovenia', '+386'],
    ['Ukraine', '+380'],
    ['Chile', '+56'],
    ['Colombia', '+57'],
    ['Peru', '+51'],
    ['Venezuela', '+58'],
    ['Morocco', '+212'],
    ['Kenya', '+254'],
    ['Tanzania', '+255'],
    ['Ethiopia', '+251']
]
;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the data
      print('Name: $name');
      print('Mobile:$countryCode$mobile');
      print('Email: $email');
      print('Country Code: $countryCode'); // Print country code
      print('Quantity: $quantity');
      print('Notes: $notes');

      // Change form submission state to true
      setState(() {
        _isSubmitted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _isSubmitted // Conditional rendering based on submission state
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Your order is submitted, our team will contact you soon.',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Place Your Order',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                      SizedBox(height: 20),

                      // Use a LayoutBuilder to determine the screen size

                      _buildTextField(
                        label: 'Name',
                        onChanged: (value) => name = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      _buildMobileField(),
                      SizedBox(height: 16),
                      // Add Email field
                      _buildTextField(
                        label: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => email = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      SizedBox(height: 16),

                      // Add Quantity field
                      _buildTextField(
                        label: 'Quantity',
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          quantity = int.tryParse(value) ?? 1;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the quantity';
                          } else if (int.tryParse(value) == null ||
                              int.parse(value) <= 0) {
                            return 'Please enter a valid quantity';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // Additional Notes field
                      _buildTextField(
                        label: 'Additional Notes',
                        maxLines: 3,
                        onChanged: (value) => notes = value,
                      ),
                      SizedBox(height: 20),

                      // Submit button
                      Center(
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 12),
                            backgroundColor: Color(0xFF1d2636),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Submit Order',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildMobileField() {
    return Column(
      children: [
        Container(
         width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<List>(
              value: selectedCountry.isEmpty
                  ? null
                  : selectedCountry, 
          
              items: countries.map((selectedCo) {
                return DropdownMenuItem<List>(
                  value:selectedCo,
                  child: Text('${selectedCo[0]} (${selectedCo[1]})'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry=value!;
                  countryCode = value[1]; 
                });
              },
            ),
          ),
        ),
        SizedBox(height: 8,),
        _buildTextField(
          label: 'Mobile',
          keyboardType: TextInputType.phone,
          onChanged: (value) => mobile = value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your mobile number';
            } else if (value.length<9 || value.length>15) {
              return 'Please enter a valid mobile number';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required Function(String) onChanged,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
    );
  }
}
