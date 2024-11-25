import 'package:doctor_doom/appui/videocallScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final roomNameProvider = StateProvider<String>((ref) => '');
final userNameProvider = StateProvider<String>((ref) => '');

class JoinMeetingScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomName = ref.watch(roomNameProvider);
    final userName = ref.watch(userNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Join Meeting'),
        backgroundColor: Colors.teal,
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/loginbackground.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  ref.read(roomNameProvider.notifier).state = value;
                },
                decoration: InputDecoration(
                  labelText: 'Room Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: (value) {
                  ref.read(userNameProvider.notifier).state = value;
                },
                decoration: InputDecoration(
                  labelText: 'Your Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  print('Room: $roomName, User: $userName');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => VideoCallScreen()),
                  );
                },
                child: Text('Join'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
