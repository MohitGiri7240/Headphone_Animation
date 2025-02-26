
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController =
      TextEditingController(text: "Vipin Sharma");
  final TextEditingController jobController =
      TextEditingController(text: "UI/UX Developer");
  final TextEditingController addressController =
      TextEditingController(text: "Vaibhav Korea");
  final TextEditingController ageController =
      TextEditingController(text: "56");
  final TextEditingController emailController =
      TextEditingController(text: "vipinbsharma@nwaytech.com");
  final TextEditingController phoneController =
      TextEditingController(text: "+91-9755089854");
  final TextEditingController dobController =
      TextEditingController(text: "28-02-1990");
  final TextEditingController bloodGroupController =
      TextEditingController(text: "A positive");

  void _saveProfile() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Profile Saved"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${nameController.text}"),
            Text("Job Title: ${jobController.text}"),
            Text("Address: ${addressController.text}"),
            Text("Age: ${ageController.text}"),
            Text("Email: ${emailController.text}"),
            Text("Phone: ${phoneController.text}"),
            Text("Date of Birth: ${dobController.text}"),
            Text("Blood Group: ${bloodGroupController.text}"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/banner.jpg"), // Change as needed
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -40,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage("assets/profile.jpg"), // Change as needed
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt, size: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              nameController.text,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              jobController.text,
              style: const TextStyle(fontSize: 16, color: Colors.orange),
            ),
            const SizedBox(height: 20),
            _buildProfileField(Icons.location_on, "Address", addressController),
            _buildProfileField(Icons.person, "Age", ageController),
            _buildProfileField(Icons.email, "Email", emailController),
            _buildProfileField(Icons.phone, "Phone", phoneController),
            _buildProfileField(Icons.calendar_today, "Date of Birth", dobController),
            _buildProfileField(Icons.bloodtype, "Blood Group", bloodGroupController),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: const Text("SAVE", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: const Text("CLOSE", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(IconData icon, String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
