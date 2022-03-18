import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Riani Fitri Ibnul Malik'),
            accountEmail: Text('08123456789'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('New Group'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('New Secret Chat'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.speaker),
            title: Text('New Channel'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.contact_phone),
            title: Text('Contact'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add_card),
            title: Text('Invite Friend'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Telegram FAQ'),
            onTap: () => null,
          ),
          Divider(),
        ],
      ),
    );
  }
}
