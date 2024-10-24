import 'package:flutter/material.dart';

class PlanDetailsScreen extends StatefulWidget {
  @override
  _PlanDetailsScreenState createState() => _PlanDetailsScreenState();
}

class _PlanDetailsScreenState extends State<PlanDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedDay = 1;

  // Dummy itinerary JSON data
  final Map<String, dynamic> itineraryData = {
    "Day 1": [
      {
        "time": "11:00 AM - 12:00 PM",
        "title": "Ampera Bridge",
        "location": "1 hour in location",
        "price": "\$10.00 (Foreigner)"
      },
      {
        "time": "12:00 PM - 01:00 PM",
        "title": "Great Mosque of Palembang",
        "location": "1 hour in location",
        "price": "\$5.00 (Foreigner)"
      }
    ],
    "Day 2": [
      {
        "time": "10:00 AM - 11:00 AM",
        "title": "Museum Sultan Mahmud Badaruddin II",
        "location": "1 hour in location",
        "price": "\$8.00 (Foreigner)"
      },
      {
        "time": "11:30 AM - 12:30 PM",
        "title": "Kemaro Island",
        "location": "1 hour in location",
        "price": "\$7.00 (Foreigner)"
      }
    ],
    // Add more days as needed
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'AI Plan Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.blueAccent,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blueAccent,
          tabs: [
            Tab(text: 'Itinerary'),
            Tab(text: 'Budget Breakdown'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Itinerary Tab
          _buildItineraryTab(),
          // Budget Breakdown Tab (Placeholder for now)
          _buildBudgetBreakdownTab(),
        ],
      ),
    );
  }

  // Itinerary Tab UI
  Widget _buildItineraryTab() {
    return Column(
      children: [
        _buildDayButtons(),
        Expanded(
          child: _buildDayItinerary(),
        ),
      ],
    );
  }

  // Widget to switch between Day 1, Day 2, etc.
  Widget _buildDayButtons() {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: List.generate(4, (index) {
          int day = index + 1;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ChoiceChip(
              label: Text('Day $day'),
              selected: selectedDay == day,
              onSelected: (bool selected) {
                setState(() {
                  selectedDay = day;
                });
              },
              selectedColor: Colors.blueAccent.withOpacity(0.2),
              backgroundColor: Colors.grey[200],
              labelStyle: TextStyle(
                color: selectedDay == day ? Colors.blueAccent : Colors.black,
              ),
            ),
          );
        }),
      ),
    );
  }

  // Itinerary content for the selected day
  Widget _buildDayItinerary() {
    String dayKey = "Day $selectedDay";
    List<dynamic> activities = itineraryData[dayKey] ?? [];

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return _buildItineraryItem(
          time: activity['time'],
          title: activity['title'],
          location: activity['location'],
          price: activity['price'],
        );
      },
    );
  }

  // Widget to display each itinerary item
  Widget _buildItineraryItem({
    required String time,
    required String title,
    required String location,
    required String price,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 8),
            Text(
              time,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                location,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Start from $price',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  // Budget Breakdown Tab Placeholder
  Widget _buildBudgetBreakdownTab() {
    return Center(
      child: Text(
        'Budget Breakdown Coming Soon!',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}

class EditablePlanDetailsScreen extends StatefulWidget {
  @override
  _EditablePlanDetailsScreenState createState() =>
      _EditablePlanDetailsScreenState();
}

class _EditablePlanDetailsScreenState extends State<EditablePlanDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedDay = 1;

  // Dummy itinerary JSON data
  final Map<String, dynamic> itineraryData = {
    "Day 1": [
      {
        "time": "11:00 AM - 12:00 PM",
        "title": "Ampera Bridge",
        "location": "1 hour in location",
        "price": "\$10.00 (Foreigner)"
      },
      {
        "time": "12:00 PM - 01:00 PM",
        "title": "Great Mosque of Palembang",
        "location": "1 hour in location",
        "price": "\$5.00 (Foreigner)"
      }
    ],
    "Day 2": [
      {
        "time": "10:00 AM - 11:00 AM",
        "title": "Museum Sultan Mahmud Badaruddin II",
        "location": "1 hour in location",
        "price": "\$8.00 (Foreigner)"
      },
      {
        "time": "11:30 AM - 12:30 PM",
        "title": "Kemaro Island",
        "location": "1 hour in location",
        "price": "\$7.00 (Foreigner)"
      }
    ],
    "Day 3": [
      {
        "time": "10:00 AM - 11:00 AM",
        "title": "Museum Sultan Mahmud Badaruddin II",
        "location": "1 hour in location",
        "price": "\$8.00 (Foreigner)"
      },
      {
        "time": "11:30 AM - 12:30 PM",
        "title": "Kemaro Island",
        "location": "1 hour in location",
        "price": "\$7.00 (Foreigner)"
      }
    ],
    "Day 4": [
      {
        "time": "10:00 AM - 11:00 AM",
        "title": "Museum Sultan Mahmud Badaruddin II",
        "location": "1 hour in location",
        "price": "\$8.00 (Foreigner)"
      },
      {
        "time": "11:30 AM - 12:30 PM",
        "title": "Kemaro Island",
        "location": "1 hour in location",
        "price": "\$7.00 (Foreigner)"
      }
    ],
    // Add more days as needed
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _editActivity(int index, String dayKey) {
    final activity = itineraryData[dayKey]![index];
    showDialog(
      context: context,
      builder: (context) {
        return _ActivityForm(
          title: activity['title'],
          note: activity['note'],
          hour: activity['hour'],
          min: activity['minute'],
          ampm: activity['am/pm'],
          hour2: activity['hour'],
          min2: activity['minute'],
          ampm2: activity['am/pm'],
          onSave: (
            String title,
            String note,
            String hour,
            String minute,
            String am,
            String hour2,
            String minute2,
            String am2,
          ) {
            setState(() {
              itineraryData[dayKey]![index] = {
                "title": title,
                "note": note,
                "hour": hour,
                "minute": minute,
                "am/pm": am,
                "hour2": hour2,
                "minute2": minute2,
                "am/pm2": am2,
              };
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _addActivity(String dayKey) {
    showDialog(
      context: context,
      builder: (context) {
        return _ActivityForm(
          onSave: (String title, String note, String hour, String minute,
              String am, String hour2, String minute2, String am2) {
            setState(() {
              itineraryData[dayKey]!.add({
                "title": title,
                "note": note,
                "hour": hour,
                "minute": minute,
                "am/pm": am,
                "hour2": hour2,
                "minute2": minute2,
                "am/pm2": am2,
              });
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _removeActivity(int index, String dayKey) {
    setState(() {
      itineraryData[dayKey]!.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Color(0XFFF6F6F6),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0XFF56694B)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'AI Plan Details',
          style: TextStyle(
            color: Color(0XFF32392F),
            fontFamily: 'SemiBold',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    color: Color(0XFFF5FEE3),
                    borderRadius: BorderRadius.circular(13)),
                child: TabBar(
                  tabs: const [
                    Tab(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Icon(
                            Icons.currency_rupee,
                            size: 16,
                          ),
                          Text(
                            'Budget',
                            style: TextStyle(fontFamily: 'Medium'),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Icon(
                            Icons.cable_outlined,
                            size: 16,
                          ),
                          Text(
                            "Itinerary",
                            style: TextStyle(fontFamily: 'Medium'),
                          ),
                        ],
                      ),
                    ),
                  ],
                  controller: _tabController,
                  dividerColor: Color(0XFFF6F6F6),
                  labelColor: Color(0XFFFFFFFF),
                  unselectedLabelColor: Color(0XFF000000),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFF4F832D)),
                  indicatorPadding: EdgeInsets.symmetric(horizontal: -14),
                ),
              ),
              Divider(
                thickness: 2,
                // Thickness of the divider
                color: Color(0XFFB2B2B2),
                // Color of the divider
                indent: 0,
                // No indentation, full-width
                endIndent: 0,
                // No indentation, full-width
                height: 15, // Adjust height if needed
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Budget Breakdown Tab (Placeholder for now)
          _buildBudgetBreakdownTab(),
          // Itinerary Tab
          _buildItineraryTab(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle Save action (e.g., send data to server or save locally)
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Color(0XFF4F832D),
          ),
          child: Text(
            'Save Itinerary',
            style: TextStyle(
                color: Color(0XFFFFFFFF), fontSize: 14, fontFamily: 'Medium'),
          ),
        ),
      ),
    );
  }

  // Itinerary Tab UI
  Widget _buildItineraryTab() {
    String dayKey = "Day $selectedDay";
    List<dynamic> activities = itineraryData[dayKey] ?? [];

    return Column(
      children: [
        _buildDayButtons(),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: activities.length,
            itemBuilder: (context, index) {
              final activity = activities[index];
              return _buildItineraryItem(
                time: activity['time'],
                title: activity['title'],
                location: activity['location'],
                price: activity['price'],
                onEdit: () => _editActivity(index, dayKey),
                onRemove: () => _removeActivity(index, dayKey),
              );
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 350),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0XFF4F832D), shape: BoxShape.circle),
              child: IconButton(
                onPressed: () {
                  _addActivity(dayKey);
                },
                icon: Icon(
                  size: 30,
                  Icons.add,
                  color: Color(0XFFFFFFFF),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget to switch between Day 1, Day 2, etc.
  Widget _buildDayButtons() {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: List.generate(4, (index) {
          int day = index + 1;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ChoiceChip(
              label: Text(
                'Day $day',
                style: TextStyle(
                  color: Color(0XFF4F832D),
                ),
              ),
              selected: selectedDay == day,
              onSelected: (bool selected) {
                setState(() {
                  selectedDay = day;
                });
              },
              showCheckmark: false,
              backgroundColor: Color(0XFFF6F6F6),
              selectedColor: Color(0XFFF6F6F6),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: selectedDay == day ? Colors.green : Colors.transparent,
                  // Line color when selected
                  width: 2, // Thickness of the bottom line
                ),
                borderRadius: BorderRadius.circular(
                    0), // Remove any rounding for the line effect
              ),
              // Remove any rounding for the line effect
              labelPadding: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.symmetric(horizontal: 18),
            ),
          );
        }),
      ),
    );
  }

  // Itinerary content for the selected day
  Widget _buildItineraryItem({
    required String time,
    required String title,
    required String location,
    required String price,
    required VoidCallback onEdit,
    required VoidCallback onRemove,
    bool isLast = false, // Add a flag for the last item to manage the line
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline dots and line
        Column(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Color(0XFF4F832D), // Green dot
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 240,
                color: Color(0XFF4F832D), // Vertical line color
              ),
          ],
        ),
        SizedBox(width: 12), // Adjusted the gap between dot and content
        // Itinerary content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Time Container
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0XFF4F832D), width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  time,
                  style: const TextStyle(
                    fontFamily: 'Medium',
                    fontSize: 16,
                    color: Color(0XFF495139),
                  ),
                ),
              ),
              SizedBox(height: 8),
              // Main Content Box
              Container(
                height: 200,
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0XFFEDF3EA),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0XFF4F832D),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Medium',
                            ),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: onEdit,
                          icon: const Icon(
                            Icons.edit_note_outlined,
                            color: Color(0XFF56694B),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0XFF3B502F).withOpacity(0.85),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Start from $price',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0XFF3B502F).withOpacity(0.85),
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: onRemove,
                        child: Text(
                          'Remove',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  // Budget Breakdown Tab Placeholder
  Widget _buildBudgetBreakdownTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                buildCostCard(
                  title: 'Travelling cost',
                  costRange: '2500 - 3500',
                  items: [
                    CostItem('Car rent', '1000-1200', 'assets/car.png'),
                    CostItem('Fuel cost', '1000-1200', 'assets/fuel.png'),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                buildCostCard(
                  title: 'Accommodation',
                  costRange: '2500 - 3500',
                  items: [
                    CostItem('Accommodation', '2500-3000', 'assets/bed.png'),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                buildCostCard(
                  title: 'Food',
                  costRange: '500 - 700',
                  items: [
                    CostItem('Food (B,L,D)', '500-700', 'assets/food.png'),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                buildCostCard(
                  title: 'Activities',
                  costRange: '500 - 1000',
                  items: [
                    CostItem('Activities', '500-1000', 'assets/travel.png'),
                  ],
                ),
              ],
            ),
          ),

          // Total Estimate
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.2),
              //     spreadRadius: 3,
              //     blurRadius: 5,
              //   ),
              // ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Estimate For the Trip',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF536751),
                    fontSize: 20,
                  ),
                ),
                Text(
                  "₹ 10,000 - ₹14,700",
                  style: TextStyle(
                      color: Color(0XFF3D6339),
                      fontFamily: 'Medium',
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 340),
            decoration:
                BoxDecoration(color: Color(0XFF4F832D), shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {
                _showAddSectionDialog(context);
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build cost cards
  Widget buildCostCard({
    required String title,
    required String costRange,
    required List<CostItem> items,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF56694B),
                      fontFamily: 'Medium'),
                ),
                Text(
                  costRange,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF56694B),
                      fontFamily: 'Medium'),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Column(
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            item.imagepath,
                            // Image path from the CostItem class
                            width: 42, // You can adjust the size of the image
                            height: 42,
                            fit: BoxFit.cover, // Fit the image properly
                          ),
                          const SizedBox(width: 8),
                          Text(
                            item.name,
                            style: TextStyle(
                                color: Color(0XFF555555).withOpacity(0.85),
                                fontFamily: 'Medium',
                                fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        item.cost,
                        style: TextStyle(
                            color: Color(0XFF555555).withOpacity(0.85),
                            fontFamily: 'Medium',
                            fontSize: 15),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            IconButton(
              onPressed: () {
                _showAddSectionDialog(context);
              },
              icon: Icon(Icons.edit_note_outlined,color: Color(0XFF56694B),),
            )
          ],
        ),
      ),
    );
  }
}

class CostItem {
  final String name;
  final String cost;
  final String imagepath;

  CostItem(this.name, this.cost, this.imagepath);
}

// Form for editing/adding an activity
class _ActivityForm extends StatefulWidget {
  final String? title;
  final String? note;
  final String? hour;
  final String? min;
  final String? ampm;
  final String? hour2;
  final String? min2;
  final String? ampm2;
  final Function(String, String, String, String, String, String, String, String)
      onSave;

  const _ActivityForm({
    Key? key,
    this.title,
    this.note,
    this.hour,
    this.min,
    this.ampm,
    this.hour2,
    this.min2,
    this.ampm2,
    required this.onSave,
  }) : super(key: key);

  @override
  _ActivityFormState createState() => _ActivityFormState();
}

class _ActivityFormState extends State<_ActivityForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _minController = TextEditingController();
  final TextEditingController _ampmController = TextEditingController();
  final TextEditingController _hour2Controller = TextEditingController();
  final TextEditingController _min2Controller = TextEditingController();
  final TextEditingController _ampm2Controller = TextEditingController();

  // final TextEditingController _locationController = TextEditingController();
  // final TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.title ?? '';
    _noteController.text = widget.note ?? '';
    _hourController.text = widget.hour ?? '';
    _minController.text = widget.min ?? '';
    _ampmController.text = widget.ampm ?? '';
    _hour2Controller.text = widget.hour ?? '';
    _min2Controller.text = widget.min ?? '';
    _ampm2Controller.text = widget.ampm ?? '';
    // _locationController.text = widget.location ?? '';
    // _priceController.text = widget.price ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0XFFF6F6F6),
      title: Row(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 5),
            width: 50,
            height: 40,
            decoration:
                BoxDecoration(color: Color(0XFFD5FFB9), shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.remove,
                  size: 30,
                )),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            widget.title == null ? 'Add Section' : 'Edit Section',
            style: TextStyle(fontFamily: 'SemiBold', color: Color(0XFF32392F)),
          ),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Activity",
            style: TextStyle(color: Color(0XFF3F434E), fontFamily: 'Medium'),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Enter Activity',
                border: InputBorder.none,
                labelStyle: TextStyle(
                    color: Color(0XFF555555).withOpacity(0.85),
                    fontFamily: "Medium"),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, bottom: 60),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: _noteController,
              decoration: InputDecoration(
                labelText: 'NOTE',
                border: InputBorder.none,
                labelStyle: TextStyle(
                    color: Color(0XFF555555).withOpacity(0.85),
                    fontFamily: "Medium"),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Start Time",
            style: TextStyle(color: Color(0XFF3F434E), fontFamily: 'Medium'),
          ),
          Row(
            children: [
              Container(
                child: Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _hourController,
                      decoration: InputDecoration(
                        labelText: 'Hour',
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                            color: Color(0XFF555555).withOpacity(0.85),
                            fontFamily: "Medium"),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _minController,
                    decoration: InputDecoration(
                      labelText: 'Minute',
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                          color: Color(0XFF555555).withOpacity(0.85),
                          fontFamily: "Medium"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _ampmController,
                    decoration: InputDecoration(
                      labelText: 'Am,Pm',
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                          color: Color(0XFF555555).withOpacity(0.85),
                          fontFamily: "Medium"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "End Time",
            style: TextStyle(
              color: Color(0XFF3F434E),
              fontFamily: 'Medium',
            ),
          ),
          Row(
            children: [
              Container(
                child: Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _hour2Controller,
                      decoration: InputDecoration(
                        labelText: 'Hour',
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                            color: Color(0XFF555555).withOpacity(0.85),
                            fontFamily: "Medium"),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _min2Controller,
                    decoration: InputDecoration(
                      labelText: 'Minute',
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                          color: Color(0XFF555555).withOpacity(0.85),
                          fontFamily: "Medium"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _ampm2Controller,
                    decoration: InputDecoration(
                      labelText: 'Am,Pm',
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                          color: Color(0XFF555555).withOpacity(0.85),
                          fontFamily: "Medium"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // TextField(
          //   controller: _locationController,
          //   decoration: InputDecoration(
          //       labelText: 'Location', border: InputBorder.none),
          // ),
          // TextField(
          //   controller: _priceController,
          //   decoration:
          //       InputDecoration(labelText: 'Price', border: InputBorder.none),
          //   keyboardType: TextInputType.number,
          // ),
        ],
      ),
      actions: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.symmetric(horizontal: 130),
          decoration: BoxDecoration(
              color: Color(0XFF4F832D),
              borderRadius: BorderRadius.circular(20)),
          child: TextButton(
            onPressed: () {
              widget.onSave(
                  _titleController.text,
                  _noteController.text,
                  _hourController.text,
                  _minController.text,
                  _ampmController.text,
                  _hour2Controller.text,
                  _min2Controller.text,
                  _ampm2Controller.text);
            },
            child: Text(
              'Save',
              style: TextStyle(color: Color(0XFFFFFFFF)),
            ),
          ),
        ),
      ],
    );
  }
}

void _showAddSectionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0XFFF6F6F6),
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Space to align with close button
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0XFFD5FFB9), shape: BoxShape.circle),
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Text(
                    'Add section',
                    style: TextStyle(
                      fontFamily: 'SemiBold',
                      color: Color(0XFF32392F),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 30),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                        fontFamily: 'SemiBold',
                        color: Color(0XFF3F434E),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: Color(0XFFFFFFFF),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter category',
                        labelStyle: TextStyle(
                            color: Color(0XFF555555).withOpacity(0.85),
                            fontFamily: 'Medium'),
                        hintText: 'Enter category',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Add item 1',
                    style: TextStyle(
                        fontFamily: 'SemiBold',
                        color: Color(0XFF3F434E),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: Color(0XFFFFFFFF),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Item name',
                        labelStyle: TextStyle(
                            color: Color(0XFF555555).withOpacity(0.85),
                            fontFamily: 'Medium'),
                        hintText: 'Enter category',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: Color(0XFFFFFFFF),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        labelStyle: TextStyle(
                            color: Color(0XFF555555).withOpacity(0.85),
                            fontFamily: 'Medium'),
                        hintText: 'Enter category',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0XFF1E4E01), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Logic to add more items
                      },
                      child: Text(
                        'Enter more Item',
                        style: TextStyle(
                          color: Color(0XFF5F8C3F),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 13),
                    padding: EdgeInsets.symmetric(horizontal: 90),
                    decoration: BoxDecoration(
                        color: Color(0XFF4F832D),
                        borderRadius: BorderRadius.circular(30)),
                    child: TextButton(
                      onPressed: () {
                        // Logic to handle add action
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
