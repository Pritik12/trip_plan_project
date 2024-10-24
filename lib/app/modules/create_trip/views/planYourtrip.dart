import 'package:flutter/material.dart';

class PlanYourTrip extends StatefulWidget {
  const PlanYourTrip({super.key});

  @override
  State<PlanYourTrip> createState() => _PlanYourTripState();
}

class _PlanYourTripState extends State<PlanYourTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Expanded(
          child: SizedBox(
            width: 40,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: const Color(0xFF56694B),
                  onPressed: () {
                    Navigator.pop(context);
                    // Back action
                  },
                ),
              ],
            ),
          ),
        ),
        title: const Center(
          child: Text(
            'Plan Your Trip',
            style: TextStyle(
              color: Color(0xFF32392F),
              fontFamily: "Semibold",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share),
            color: const Color(0xFF56694B),
            onPressed: () {
              // Share action
            },
          ),
        ],
        backgroundColor: const Color(0xFFFFFFFF).withOpacity(0.85),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Top Image with Taj Mahal
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://s3-alpha-sig.figma.com/img/3188/7e63/bfdbed415cbce224902dd890043e5e98?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Ygu49SH5Ccx6abGOCwwl6M8xBC4-xQ0Es8-r~KSZuFtz9Ou~U54Tl4yn8zaKFN6Dx5N-~p7gcp0XDZpWhdp78YoVqn-ottvnMNy3vmNhsUNZZ6qh1Gc57J-DGxIDbYFTrRXMpBD8-HblOZz034qbhOg3W0X4~xRpxm0pqdL~BmtNT1MVU5OpZUh0kJs3yRQvF4PV9RwBFdlv~Boi5CF4OQfqrZGV62ixIBTBw4jiZER9vWy8mUv0steXNAxiYOxEfErTPmoOaSsdwdmshcxenbAFsTXc8WjjS0WW2AlXj2VK-ddQKSj4bch9QoqoYoTnwZmAorjST4dd-nFwGbOonQ__'), // Taj Mahal image
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Add space below the image
              const SizedBox(height: 20),

              // Trip details section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Card(
                        color: const Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              const Text(
                                "8-days agra trip",
                                style: TextStyle(
                                  fontSize: 21,
                                  fontFamily: "Semibold",
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF32392F),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today,
                                      size: 20,
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.55)),
                                  const SizedBox(width: 8),
                                  Text("23 Oct 2024- 31 Oct 2024",
                                      style: TextStyle(
                                          fontFamily: "Regular",
                                          color: const Color(0xFF555555)
                                              .withOpacity(0.85))),
                                ],
                              ),
                              const SizedBox(height: 8),

                              // Your Budget with icon
                              Row(
                                children: [
                                  Icon(Icons.account_balance_wallet_outlined,
                                      size: 20,
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.55)),
                                  const SizedBox(width: 8),
                                  Text('Your Budget is ₹ 20,000',
                                      style: TextStyle(
                                          fontFamily: "Regular",
                                          color: const Color(0xFF555555)
                                              .withOpacity(0.85))),
                                ],
                              ),
                              const SizedBox(height: 8),

                              // Location with icon
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined,
                                      size: 20,
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.55)),
                                  const SizedBox(width: 8),
                                  Text("Agra, Uttar Pradesh",
                                      style: TextStyle(
                                          fontFamily: "Regular",
                                          color: const Color(0xFF555555)
                                              .withOpacity(0.85))),
                                ],
                              ),
                              const SizedBox(height: 8),

                              // People with icon
                              Row(
                                children: [
                                  Icon(Icons.people_alt_outlined,
                                      size: 20,
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.55)),
                                  const SizedBox(width: 8),
                                  Text("8 Peoples",
                                      style: TextStyle(
                                          fontFamily: "Regular",
                                          color: const Color(0xFF555555)
                                              .withOpacity(0.85))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // New Card for Description
              const SizedBox(height: 10), // Space between the two cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  color: const Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'description',
                          style: TextStyle(
                            color: Color(0XFF32392F),
                            fontSize: 20,
                            fontFamily: "Medium",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Agra is renowned for the Taj Mahal and Agra Fort, offering a rich glimpse into Mughal history and architecture.',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Regular",
                              color: const Color(0xFF555555).withOpacity(0.85)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // See Trip Overview Button (fixed at the bottom)
          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                // Your button action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F832D), // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 16), // Adjust button height
              ),
              child: const Text(
                'Create Trip',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Medium",
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
