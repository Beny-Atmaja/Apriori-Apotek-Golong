import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = 'John Doe';
  String email = 'johndoe@example.com';
  String password = '';

  bool isEditingUsername = false;
  bool isEditingEmail = false;
  bool isEditingPassword = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameController.text = username;
    emailController.text = email;
    passwordController.text = password;
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _toggleEditUsername() {
    setState(() {
      isEditingUsername = !isEditingUsername;
      if (!isEditingUsername) {
        username = usernameController.text;
      }
    });
  }

  void _toggleEditEmail() {
    setState(() {
      isEditingEmail = !isEditingEmail;
      if (!isEditingEmail) {
        email = emailController.text;
      }
    });
  }

  void _toggleEditPassword() {
    setState(() {
      isEditingPassword = !isEditingPassword;
      if (!isEditingPassword) {
        password = passwordController.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF22411F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person),
                const SizedBox(width: 8.0),
                Expanded(
                  child: isEditingUsername
                      ? TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                  )
                      : Text(
                    username,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                IconButton(
                  icon: Icon(isEditingUsername ? Icons.done : Icons.edit),
                  onPressed: _toggleEditUsername,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Icon(Icons.email),
                const SizedBox(width: 8.0),
                Expanded(
                  child: isEditingEmail
                      ? TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  )
                      : Text(
                    email,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                IconButton(
                  icon: Icon(isEditingEmail ? Icons.done : Icons.edit),
                  onPressed: _toggleEditEmail,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.password), // Ganti dengan ikon "lock"
                const SizedBox(width: 8.0),
                Expanded(
                  child: isEditingPassword
                      ? TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  )
                      : Text(
                    password,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                IconButton(
                  icon: Icon(isEditingPassword ? Icons.done : Icons.edit),
                  onPressed: _toggleEditPassword,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
