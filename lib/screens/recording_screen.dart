import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pronounce_kiswahili/components/button.dart';
import 'package:pronounce_kiswahili/services/send_audio_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pronounce_kiswahili/screens/result_screen.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({Key? key}) : super(key: key);

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  @override
  void initState() {
    initRecorder();
    super.initState();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  final recorder = FlutterSoundRecorder();
  final player = AudioPlayer();
  late bool isPlaying = false;
  late String audioPath = "";
  late File file;
  bool _isLoading = false;

  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Permission not granted';
    }
    await recorder.openRecorder();
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  Future startRecord() async {
    await recorder.startRecorder(toFile: "audio");
  }

  Future stopRecorder() async {
    final filePath = await recorder.stopRecorder();
    // final file = File(filePath!);
    setState(() {
      file = File(filePath!);
    });
    setState(() {
      audioPath = filePath!;
    });
    print('Recorded file path: $filePath');
  }

  playAudio(String pathToAudio) async {
    await player.setFilePath(pathToAudio);
    player.play();
  }

  stopAudio() {
    player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.greenAccent,
        title: const Text(
          "Pronounce Kiswahili",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Record your self speaking one of the following Kiswahili words:",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const Text(
              "\"ndio\", \"hapana\", \"moja\", \"mbili\", \"tatu\", \"nne\", \"tano\", \"sita\", \"saba\", \"nane\", \"tisa\", \"kumi\"",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const Text(
              "Press evalaute to get a score of how well you pronounced the word",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            StreamBuilder<RecordingDisposition>(
              builder: (context, snapshot) {
                final duration =
                    snapshot.hasData ? snapshot.data!.duration : Duration.zero;

                String twoDigits(int n) => n.toString().padLeft(2, '0');

                final twoDigitMinutes =
                    twoDigits(duration.inMinutes.remainder(60));
                final twoDigitSeconds =
                    twoDigits(duration.inSeconds.remainder(60));

                return Text(
                  '$twoDigitMinutes:$twoDigitSeconds',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
              stream: recorder.onProgress,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (recorder.isRecording) {
                  await stopRecorder();
                  setState(() {});
                } else {
                  await startRecord();
                  setState(() {});
                }
              },
              child: Icon(
                recorder.isRecording ? Icons.stop : Icons.mic,
                size: 100,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                if (isPlaying) {
                  stopAudio();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  await playAudio(audioPath);
                  setState(() {
                    isPlaying = true;
                  });
                }
              },
              child: Icon(isPlaying ? Icons.stop : Icons.play_arrow,
                  size: 100, color: Colors.black),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              child: _isLoading? SpinKitWave(color: Colors.greenAccent, size: 50.0) : MyButton(buttonText: "Evaluate", onButtonPressed: () async{
              setState((){
                _isLoading = true;
              });
                await Provider.of<SendAudioService>(context, listen: false).uploadAudio(file,"moja").then((value){
                print(value);
                setState((){
                  _isLoading = false;
                });
                Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return ResultScreen(phonemeForText: value['phoneme_text'], phonemeForWord: value['phoneme_word'], pronunciationResult: value['result']);
                              }));
                

                });

            }),
            ),
          ],
        ),
      ),
    );
  }
}
