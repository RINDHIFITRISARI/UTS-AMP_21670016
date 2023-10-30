import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
      '/dashboard': (context) => DashboardPage(),
      '/profile': (context) => ProfileScreen(),
    },
  ));
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Selamat Datang!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Kata Sandi",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika autentikasi di sini
                Navigator.pushNamed(context, '/dashboard');
                Navigator.pushNamed(context, '/profile');
                
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Dashboard"),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 50),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Hello Rindhi!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  subtitle: Text(
                    'Good Morning',
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                  trailing: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/Rindhi.jpg'),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                ),
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard('Videos', Icons.play_arrow, Color.fromARGB(255, 128, 15, 7)),
                  itemDashboard('Analytics', Icons.analytics, Colors.green),
                  itemDashboard('Profile', Icons.person, Colors.purple),
                  itemDashboard('Comments', Icons.chat_bubble_outline, Colors.blue),
                  itemDashboard('Revenue', Icons.attach_money, Colors.indigo),
                  itemDashboard('Upload', Icons.cloud_upload, Colors.teal),
                  itemDashboard('About', Icons.info_outline, Colors.blue),
                  itemDashboard('Contact', Icons.contact_mail, Color.fromARGB(255, 73, 135, 2)),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget itemDashboard(String title, IconData iconData, Color background) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 8, 46, 77),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.blueGrey,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: background,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/fotoku.jpg'),
            ),
            const SizedBox(height: 20),
            itemProfile('Name', 'RINDHI FITRI SARI', Icons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '082325620683', Icons.phone),
            const SizedBox(height: 10),
            itemProfile('Address', 'Jl. Hiri Raya no 10', Icons.location_on),
            const SizedBox(height: 10),
            itemProfile('Email', 'rindhi02@gmail.com', Icons.mail),
          ],
        ),
      ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 192, 192, 192),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: const Color.fromARGB(255, 8, 143, 210).withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}

