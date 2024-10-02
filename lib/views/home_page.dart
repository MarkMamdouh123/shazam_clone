import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shazam_clone/views/song_screen.dart';
import '../viewModels/home_view_model.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use ref.watch to listen to changes in the HomeViewModel
    final vm = ref.watch(homeViewModelProvider);

    // Use ref.listen to handle side effects when success changes
    ref.listen<HomeViewModel>(homeViewModelProvider, (previous, next) {
      if (next.success) {
        vm.isRecognizing = false;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SongScreen(
              song: next.currentSong,
            ),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Image.asset('assets/images/music-note.png'),
      ),
      backgroundColor: const Color(0xff00a9fd),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(height: 150),
            const Text(
              'Tap to Shazam',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            AvatarGlow(
              animate: vm.isRecognizing,
              glowRadiusFactor: 0.7,
              glowColor: Colors.white,
              child: GestureDetector(
                onTap: () async {
                  if (!vm.isRecognizing) {
                    await vm.startRecognizing(); // Start recognizing
                  } else {
                    await vm.stopRecognizing(); // Stop recognizing
                  }
                },
                child: CircleAvatar(
                  radius: 130,
                  child: Image.asset('assets/images/Shazam_icon.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
