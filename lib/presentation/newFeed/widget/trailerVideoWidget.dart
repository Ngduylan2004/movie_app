import 'package:flutter/widgets.dart';
import 'package:movie_app/domain/entities/trailer_entities.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerVideoWidget extends StatelessWidget {
  final TrailerEntities trailer;

  const TrailerVideoWidget({super.key, required this.trailer});

  @override
  Widget build(BuildContext context) {
    final videoId = trailer.key; // Lấy key từ TrailerEntities

    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      ),
      showVideoProgressIndicator: true,
    );
  }
}
