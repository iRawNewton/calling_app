import 'package:flutter/material.dart';
import '../calling/video_call_screen.dart';

class Mytest extends StatelessWidget {
  const Mytest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Connect with Kyptronix'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        height: double.infinity,
        child: Column(children: [
          const Spacer(),
          Center(
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.75,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => const VideoCallScreen(),
                      ),
                    );
                  },
                  child: const Text('Call Now')),
            ),
          ),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
