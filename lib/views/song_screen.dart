import 'package:flutter/material.dart';

import '../models/shazam_song_model.dart';

class SongScreen extends StatelessWidget {
  final ShazamSongModel? song; // Declare final to ensure immutability

  // Constructor
  SongScreen({super.key, required this.song}); // Use `required` for clarity

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff042442),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            return Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: song != null
                      ? NetworkImage(song!.album!.coverMedium!)
                      : AssetImage('assets/images/question.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      child: Column(
                        children: [
                          Expanded(
                            child: Text(
                              song?.title ?? 'Unknown Title',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      song?.artist?.name ?? 'Unknown Artist',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
