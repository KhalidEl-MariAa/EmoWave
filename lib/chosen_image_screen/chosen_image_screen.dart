// import 'package:flutter/widgets.dart';

// class AudioRecorder extends StatefulWidget {
//   @override
//   _AudioRecorderState createState() => _AudioRecorderState();
// }

// class _AudioRecorderState extends State<AudioRecorder> {
//   FlutterSoundRecorder? _audioRecorder;
//   bool _isRecording = false;
//   String _filePath = 'path_to_your_directory/recording.wav';

//   @override
//   void initState() {
//     super.initState();
//     _audioRecorder = FlutterSoundRecorder();
//     _openRecorder();
//   }

//   Future<void> _openRecorder() async {
//     var status = await Permission.microphone.request();
//     if (status != PermissionStatus.granted) {
//       throw RecordingPermissionException('Microphone permission not granted');
//     }
//     await _audioRecorder!.openAudioSession();
//   }

//   Future<void> _startRecording() async {
//     await _audioRecorder!.startRecorder(
//       toFile: _filePath,
//       codec: Codec.pcm16WAV,
//     );
//     setState(() {
//       _isRecording = true;
//     });
//   }

//   Future<void> _stopRecording() async {
//     await _audioRecorder!.stopRecorder();
//     setState(() {
//       _isRecording = false;
//     });
//   }

//   @override
//   void dispose() {
//     _audioRecorder!.closeAudioSession();
//     _audioRecorder = null;
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Audio Recorder')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _isRecording ? _stopRecording : _startRecording,
//               child: Text(_isRecording ? 'Stop Recording' : 'Start Recording'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }