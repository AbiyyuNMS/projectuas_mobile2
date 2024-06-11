import 'package:flutter/material.dart';
import 'package:prj_uas223_d1_24/shared/style_text.dart';

import 'package:flutter/material.dart';
// import 'package:online_shop/views/shared/appstyle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              // menampilkan gambar dri profile
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage('assets/images/profile.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.grey)),
                title: const Text(
                  'Change Profile Picture',
                  style: TextStyle(color: Colors.black),
                ),
                leading: const Icon(
                  Icons.image,
                  color: Colors.black,
                ),
                trailing: const Icon(
                  Icons.arrow_forward,
                ),
                onTap: () {
                  
                  // navigasi untuk mengubah halaman profile
                },
              ),
              const SizedBox(
                height: 10,
              ),
              // a ListTile for changing password
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.grey)),
                title: const Text(
                  'Change Password',
                  style: TextStyle(color: Colors.black),
                ),
                leading: const Icon(Icons.lock, color: Colors.black),
                trailing: const Icon(
                  Icons.arrow_forward,
                ),
                onTap: () {
                  // Navigasi untuk mengubah halaman password
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.grey)),
                title: const Text(
                  'Settings',
                  style: TextStyle(color: Colors.black),
                ),
                leading: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  // navigasi halaman pengaturan
                },
              ),
              const SizedBox(
                height: 10,
              ),
              // other list items for settings options
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.grey)),
                title: const Text(
                  'Notifications',
                  style: TextStyle(color: Colors.black),
                ),
                leading: const Icon(
                  Icons.notification_add,
                  color: Colors.black,
                ),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  // Navigasi halaman notification
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.grey)),
                title: const Text(
                  'Help Center',
                  style: TextStyle(color: Colors.black),
                ),
                leading: const Icon(
                  Icons.help,
                  color: Colors.black,
                ),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  // Navigasi untuk halaman pusat bantuan
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.grey)),
                title: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.black),
                ),
                leading: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  // Navigate  ke halaman keluar
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// class MyProfilePage extends StatefulWidget {
//   const MyProfilePage({super.key});

//   @override
//   State<MyProfilePage> createState() => _MyProfilePageState();
// }

// class _MyProfilePageState extends State<MyProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//         return Scaffold(
//       body: Center(
//         child: Text(
//           "ProfilePage",
//           style: styleapp(40, Colors.black, FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }