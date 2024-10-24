import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jotrip/app/modules/create_trip/views/ai_loading.dart';
import 'package:jotrip/app/modules/create_trip/views/my%20trip.dart';
import '../controllers/create_trip_controller.dart';

class CreateTripView extends GetView<CreateTripController> {
  const CreateTripView({super.key});
  @override
  Widget build(BuildContext context) {
    return CreateTripScreen();
  }
}

class CreateTripScreen extends StatefulWidget {
  const CreateTripScreen({super.key});

  @override
  _CreateTripScreenState createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends State<CreateTripScreen> {
  // Controllers for form fields
  TextEditingController tripNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  TextEditingController peopleCountController = TextEditingController();

  String selectedDestination = 'Palembang'; // Default value
  DateTimeRange selectedDates = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(const Duration(days: 5)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Container(
                color: const Color(0XFFF6F6F6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: Image.network(
                            "https://powertraveller.com/wp-content/uploads/2024/10/1_taj-mahal-private-tour-with-multiple-option.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Positioned(
                        //   top: 140,
                        //   left: 180,
                        //   // child: const CircleAvatar(
                        //   //   radius: 18,
                        //   //   backgroundColor: Color.fromARGB(255, 96, 95, 95),
                        //   //   child: Icon(
                        //   //     Icons.camera_alt_outlined,
                        //   //     size: 22,
                        //   //     color: Color.fromARGB(255, 245, 237, 237),
                        //   //   ),
                        //   // ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const Text(
                        "Trip name",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF3F434E)),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Trip Name
                    _buildTextField(tripNameController, "", "enter trip title"),
                    const SizedBox(height: 20),

                    // Description
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF3F434E)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildTextField(
                      descriptionController,
                      "",
                      "enter trip description",
                    ),
                    const SizedBox(height: 16),

                    // Travel Destination (Dropdown)
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const Text("Travel Destination",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFF3F434E))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        _showDestinationBottomSheet(context);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            margin: const EdgeInsets.only(left: 12),
                            child: InputDecorator(
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                    Icons.keyboard_arrow_down_rounded),
                                labelText: '',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 18.0, horizontal: 16.0),
                              ),
                              child: const Text("from"),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            margin: const EdgeInsets.only(left: 12),
                            child: InputDecorator(
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                    Icons.keyboard_arrow_down_rounded),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 18.0, horizontal: 16.0),
                              ),
                              child: const Text("to"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Trip Dates
                    _buildDatePicker(context),
                    const SizedBox(height: 16),

                    // Budget and People in a single row
                    SizedBox(
                      width: 375,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  child: const Text(
                                    'Total Cost',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0XFF3F434E)),
                                  ),
                                ),
                                const SizedBox(
                                    height:
                                        8), // Space between label and text field
                                _buildTextField(
                                    budgetController, "", "your budget"),
                              ],
                            ),
                          ),
                          const SizedBox(width: 0), // Space between fields
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  child: const Text(
                                    'No. of Person',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0XFF3F434E)),
                                  ),
                                ),
                                const SizedBox(
                                    height:
                                        8), // Space between label and text field
                                _buildTextField(
                                    peopleCountController, "", "no. of person"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0XFF77AB00),
                              const Color(0XFF80B900).withOpacity(0.71),
                              const Color(0XFF72A400),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            _showPlanSelectionBottomSheet(context);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 100),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          child: const Text(
                            'Create Trip',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
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

  Widget _buildTextField(
      TextEditingController controller, String label, String hint,
      {int minLines = 1, int maxLines = 1}) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.only(left: 12),
      child: TextField(
        controller: controller,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          hintStyle:
              TextStyle(color: const Color(0XFF555555).withOpacity(0.85)),
          labelStyle:
              TextStyle(color: const Color(0XFF555555).withOpacity(0.85)),
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Container(
      width: 360,
      margin: const EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5),
            child: const Text(
              'Trip Dates',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF3F434E)),
            ),
          ),
          const SizedBox(height: 8), // Space between label and picker
          GestureDetector(
            onTap: () async {
              DateTimeRange? picked = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                initialDateRange: selectedDates,
                builder: (BuildContext context, Widget? child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                        textScaler: const TextScaler.linear(
                            1.0)), // Adjusts the text scale factor
                    child: Dialog(
                      child: SizedBox(
                        width: MediaQuery.of(context)
                            .size
                            .width, // Full width of the screen
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Custom title
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: const Text(
                                'Select Trip Dates', // Custom title
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                                child:
                                    child!), // Original date range picker content
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
              if (picked != null && picked != selectedDates) {
                setState(() {
                  selectedDates = picked;
                });
              }
            },
            child: Container(
              child: InputDecorator(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 16.0),
                ),
                child: Text(
                  selectedDates.start == selectedDates.end
                      ? "Select Date" // Placeholder text
                      : "${selectedDates.start.toLocal().toString().split(' ')[0]} - "
                          "${selectedDates.end.toLocal().toString().split(' ')[0]}",
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Show bottom sheet for destination
  void _showDestinationBottomSheet(BuildContext context) async {
    String? destination = await showModalBottomSheet<String>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return TravelDestinationBottomSheet();
      },
    );

    if (destination != null) {
      setState(() {
        selectedDestination = destination;
      });
    }
  }

  // Show plan selection bottom sheet
  void _showPlanSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return PlanSelectionBottomSheet();
      },
    );
  }
}

class TravelDestinationBottomSheet extends StatelessWidget {
  final List<Map<String, String>> destinations = [
    {"name": "Lucknow", "location": "Uttar Pradesh", "type": "City"},
    {"name": "Jaipur", "location": "Rajasthan", "type": "City"},
    {"name": "Pune", "location": "Maharashtra", "type": "City"},
    {"name": "Chandigarh", "location": "Punjab", "type": "City"},
    {"name": "Indore", "location": "Madhya Pradesh", "type": "City"},
    {"name": "Bhopal", "location": "Madhya Pradesh", "type": "City"},
    {"name": "Patna", "location": "Bihar", "type": "City"},
    {"name": "Mumbai", "location": "Maharashtra", "type": "City"},
  ];

  TravelDestinationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image with blur effect
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/background_image.jpg'), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Apply BackdropFilter for blur effect only to the background
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: Colors.transparent, // No overlay color
          ),
        ),
        // Main content without blur
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(
                0.9), // Optional: add a background to the content for better contrast
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20)), // Optional: Rounded top corners
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(0XFFD5FFB9), // Background color
                      shape: BoxShape.circle, // Make it circular
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      iconSize: 16,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 75),
                    child: const Text(
                      'Travel Destination',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            Color(0XFF32392F), // Changed to black for contrast
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // "Where to?" TextField
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  hintText: 'Where to?',
                  hintStyle: TextStyle(
                      color: const Color(0XFF555555).withOpacity(0.85)),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 252, 251, 251),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Destination List
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: destinations.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Colors.green, Colors.black],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: Text(
                          destinations[index]["name"]!,
                          style: const TextStyle(
                            color: Color(
                                0XFF2B6502), // Set to any color, won't be visible due to ShaderMask
                          ),
                        ),
                      ),
                      subtitle: Text(
                        destinations[index]["location"]!,
                        style: TextStyle(
                            color: const Color(0XFF000000).withOpacity(
                                0.55)), // Changed to black for contrast
                      ),
                      trailing: Container(
                        width: 50, // Adjust width as needed
                        height: 30, // Adjust height as needed
                        decoration: BoxDecoration(
                          color: destinations[index]["type"] == "City"
                              ? const Color(0XFFD5FFB9) // Color for City
                              : const Color(0XFFD5FFB9), // Color for Area
                          borderRadius: BorderRadius.circular(
                              20), // Circular border radius
                        ),
                        child: Center(
                          child: Text(
                            destinations[index]["type"]!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87, // Text color
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context, destinations[index]["name"]!);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PlanSelectionBottomSheet extends StatelessWidget {
  const PlanSelectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        color: Color(0XFFF6F6F6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'create your plan with',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // AI Help Option inside a Card with increased width
                _buildOptionCard(
                  context: context,
                  icon: Icons.auto_awesome,
                  label: "Manually",
                  imageUrl:
                      'https://s3-alpha-sig.figma.com/img/04ea/7ede/30dfa22718dd2b4bb1b2b4637f7ef078?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=KmDUpZnggYVJUlZrQlfIPJ81OpzehAKO4-Sngv-2~Y9TaMVrq-z8ud9Ad9damDZ-epuC3lYnntEpVQa2kMensMmnzW-0ZYbiW1pp5y~yoO9nS7XtanQ~U-saB4StG3yEuEkCtncJgXCL9Vr7CPqt~wGwhaGIRQwPxUYCtAfhlixIi9pylS3aQzg5lHZQu~qR7q1iKhxtvZIuD258maEucyT~GFxyV1Xppsuh1TDXSN~I53fVQJkx8DXV3YqIafQ8bdfQRGc2--XjWyopHIXpOuBBMqK-i7X7AWoKghiUxLUJ78NOKHsyC3S4fUK31-uxEn7v6jRZHzYL0hSvbcW9cw__',
                  onTap: () {
                    Get.to(const MyTrip());
                    // Handle AI Help option
                  },
                ),

                // Manually Option inside a Card with increased width
                _buildOptionCard(
                  context: context,
                  icon: Icons.edit,
                  label: "AI Help",
                  imageUrl:
                      'https://s3-alpha-sig.figma.com/img/285a/258c/2942148f4fbc08271d06c5c039cfd188?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ENsPUsTH-oFHN0-7u2D3Bw-qHwN~4EtkSZIN~MxUNYNj9CEAd1QPeeQ663xManZkT1e6FoOsoLfwJeFxOfjs8n8~uERrjv0CiCO-d6SQtvr1WoSnHHuOIRhDFfHdBMHIUeVgUcJlB9dBMawbFV2DvjfYPYgMrr74EWWOhxJsbVHIL5t-h3wHeMyIbbcAlHobGELBLVxHozL2Gleb18w3Ze8Fr2Qjsvi0nTCY6MIUqJs9XgU5BmtR~oSmkxAtGSgUf6LoPCh87~ORzCFW~NkJ5goRfRkAPNDegeHgkq2oeEjg6IRNX2KlmmyW7CfUyqTDO6UbRUwWNQ0iiuyYK5b1aw__',
                  onTap: () {
                    // Handle Manual option
                    Get.to(const AiLoading());
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Widget for creating option cards with increased width
  Widget _buildOptionCard({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String imageUrl, // Add image URL parameter for each option
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.43,
      height: 140, // Set the width to 40% of the screen width
      child: Card(
        elevation: 4.0, // Adds shadow to give card effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0XFFFFFFFF),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0), // Adds padding inside the card
            child: GestureDetector(
              onTap: onTap,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue[50],
                    backgroundImage: NetworkImage(
                        imageUrl), // Use the image URL for each option
                  ),
                  const SizedBox(height: 8),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
