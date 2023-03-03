import 'dart:html';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AgoraClient _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: 'ca4965423ab548ce96e8dffeccb44663',
      channelName: 'private',
      tempToken:
          '007eJxTYHgh8OGG0jUdCa9VFuqJp8Tr/jF/uerdkL5/w/oVZzy+7pipwJCcaGJpZmpiZJyYZGpikZxqaZZqkZKWlpqcnGRiYmZm/O4zY0pDICPDMkNjRkYGCATx2RkKijLLEktSGRgANl0imA==',
    ),
  );

  @override
  void initState() {
    _initAgora();
    super.initState();
  }

  Future<void> _initAgora() async {
    await _client.initialize();
  }

  // test() async {
  //   final RtcEngine engine = createAgoraRtcEngine();
  // }
  // RtcEngine engine = RtcEngine

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
            child: Stack(
          children: [
            AgoraVideoViewer(
              client: _client,
              layoutType: Layout.floating,
              // showNumberOfUsers: true,
            ),
            Column(
              children: [
                const Spacer(),
                AgoraVideoButtons(
                  client: _client,
                  enabledButtons: const [
                    BuiltInButtons.toggleCamera,
                    BuiltInButtons.toggleMic,
                    BuiltInButtons.switchCamera
                  ],
                ),
                const SizedBox(height: 10),
                AgoraVideoButtons(
                  client: _client,
                  enabledButtons: const [BuiltInButtons.callEnd],
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
