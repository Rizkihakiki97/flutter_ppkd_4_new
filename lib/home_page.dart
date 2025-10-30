import 'package:flutter/material.dart';

class HomePageMindcare extends StatelessWidget {
  const HomePageMindcare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ================= HEADER =================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
                decoration: const BoxDecoration(
                  color: Color(0xFF569ad1), // Deep Red
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Greeting & profile
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Morning",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Hi, Rizky Hakiki 👋",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(
                            "assets/image/orang1.png",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Search bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.search, color: Colors.grey),
                          hintText: "Search psychologist...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Horizontal Menu
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _menuCard(Icons.chat_bubble_outline, "Consult"),
                        _menuCard(Icons.calendar_today_outlined, "Schedule"),
                        _menuCard(Icons.favorite_border, "Tracker"),
                        _menuCard(Icons.people_outline, "Community"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ================= HOW ARE YOU FEELING SECTION =================
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "How are you feeling?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Take your mood today",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3D8BFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text("Check Now"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Image.asset(
                    //   "assets/images/mood.png",
                    //   height: 80,
                    //   width: 80,
                    // ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ================= FEATURED PSYCHOLOGISTS =================
              _sectionHeader("Featured Psychologists"),
              _psychologistCard(
                image: "assets/image/doctor1.jpg",
                name: "Dr. Sarah Johnson",
                spec: "Clinical Psychologist",
                rating: 4.9,
                exp: "8 years",
              ),
              _psychologistCard(
                image: "assets/image/doctor2.jpg",
                name: "Dr. Michael Chen",
                spec: "Cognitive Therapist",
                rating: 4.8,
                exp: "5 years",
              ),
              _psychologistCard(
                image: "assets/image/doctor3.jpg",
                name: "Dr. Emily Roberts",
                spec: "Family Therapy",
                rating: 4.7,
                exp: "7 years",
              ),

              const SizedBox(height: 25),

              // ================= MENTAL HEALTH TIPS =================
              _sectionHeader("Mental Health Tips"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: _tipCard(
                        image: "assets/image/stress1.jpg",
                        title: "Managing Stress",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _tipCard(
                        image: "assets/image/stress2.jpg",
                        title: "Better Sleep",
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ================= REUSABLE COMPONENTS =================

  static Widget _menuCard(IconData icon, String label) {
    return Container(
      width: 70,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Color(0xFF3D8BFF), size: 26),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  static Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          TextButton(onPressed: () {}, child: const Text("See All")),
        ],
      ),
    );
  }

  static Widget _psychologistCard({
    required String image,
    required String name,
    required String spec,
    required double rating,
    required String exp,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(spec, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18),
                    Text(
                      "$rating  •  $exp",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _tipCard({required String image, required String title}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              height: 90,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
