import 'package:animate_do/animate_do.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/helpers/helpers.dart';
import 'package:music_player/src/models/audio_player_model.dart';
import 'package:music_player/src/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGround(),
          Column(
            children: [
              CustomAppBar(),
              ImagenDiscoDuration(),
              TituloPlay(),
              Expanded(
                child: Lyrics(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class BackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: screenSize.height * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [
            Color(0xff33333e),
            Color(0xff201e28),
          ],
        ),
      ),
    );
  }
}

class Lyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();
    return Container(
      child: ListWheelScrollView(
        physics: BouncingScrollPhysics(),
        itemExtent: 42,
        diameterRatio: 1.5,
        children: lyrics
            .map(
              (linea) => Text(
                linea,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(
                    0.6,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class TituloPlay extends StatefulWidget {
  @override
  _TituloPlayState createState() => _TituloPlayState();
}

class _TituloPlayState extends State<TituloPlay>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool firstTime = true;

  AnimationController playAnimation;

  //? para poder usar el paquete de musica
  /* final assetAudioPlayer = new AssetsAudioPlayer(); */

  @override
  void initState() {
    playAnimation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    this.playAnimation.dispose();
    super.dispose();
  }

  void open() {
    final audioPlayerModel =
        Provider.of<AudioPlayerModel>(context, listen: false);
    //? cargando el audio

    //assetAudioPlayer.new.open('assets/Breaking-Benjamin-Far-Away.mp3');
    audioPlayerModel.assetsAudioPlayer.open(
      Audio(
        'assets/Breaking-Benjamin-Far-Away.mp3',
      ),
    );

    audioPlayerModel.assetsAudioPlayer.currentPosition.listen((duration) {
      audioPlayerModel.current = duration;
    });

    // assetAudioPlayer.current.listen((playingAudio) {
    //   audioPlayerMode.songDuration = playingAudio.duration;
    // });
    audioPlayerModel.assetsAudioPlayer.current.listen((event) {
      audioPlayerModel.songDuration = event.audio.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    final audioPLayerModel = context.read<AudioPlayerModel>();
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 40),
      child: ListTile(
        title: Text(
          'Far Away',
          style: textTheme.headlineSmall.copyWith(
            color: Colors.white.withOpacity(
              0.8,
            ),
          ),
        ),
        subtitle: Text(
          'Breaking Benjamin',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white.withOpacity(
              0.5,
            ),
          ),
        ),

        /* Spacer(), */
        trailing: FloatingActionButton(
          elevation: 0,
          highlightElevation: 0,
          backgroundColor: Color(0xfff8cb58),
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: playAnimation,
          ),
          onPressed: () {
            if (this.isPlaying) {
              playAnimation.reverse();
              this.isPlaying = false;
              audioPLayerModel.controller.stop();
            } else {
              playAnimation.forward();
              this.isPlaying = true;
              audioPLayerModel.controller.repeat();
            }
            if (firstTime) {
              this.open();
              firstTime = false;
            } else {
              audioPLayerModel.assetsAudioPlayer.playOrPause();
            }
          },
        ),
      ),
    );
  }
}

class ImagenDiscoDuration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = context.read<AudioPlayerModel>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 70),
      child: Row(
        children: [
          ImagenDisco(),
          SizedBox(width: 17),
          BarraProgreso(audioPlayerModel: audioPlayerModel),
          SizedBox(width: 17),
        ],
      ),
    );
  }
}

class BarraProgreso extends StatelessWidget {
  final AudioPlayerModel audioPlayerModel;
  final width = 5.0;

  const BarraProgreso({
    Key key,
    @required this.audioPlayerModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: Colors.white.withOpacity(0.4));
    final audioPlayerModel = context.watch<AudioPlayerModel>();
    final porcentaje = audioPlayerModel.porcentaje;

    return Container(
      child: Column(
        children: <Widget>[
          Text('${audioPlayerModel.songTotalduration}', style: style),
          /* Stack(
            children: <Widget>[
              GestureDetector(
                onHorizontalDragUpdate: (details) {
                  RenderBox box = context.findRenderObject() as RenderBox;
                  final position = box.globalToLocal(details.globalPosition);
                  final width = box.size.width;
                  final porcentaje = (position.dx / width).clamp(0.0, 1.0);
                  audioPlayerModel.setPorcentaje = porcentaje;
                },
                child: Container(
                  width: 3,
                  height: 230,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                    width: 3,
                    height: 230 * porcentaje,
                    color: Colors.white.withOpacity(0.1)),
              )
            ],
          ), */
          RotatedBox(
            quarterTurns: 3,
            child: SliderTheme(
              data: SliderThemeData(
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
                trackHeight: 2,
              ),
              child: Slider.adaptive(
                activeColor: Color(0xfff8cb58),
                inactiveColor: Colors.white.withOpacity(0.3),
                value: porcentaje,
                onChangeEnd: (value) {
                  audioPlayerModel.setPorcentaje = value;
                  audioPlayerModel.assetsAudioPlayer.seek(
                    Duration(
                      milliseconds:
                          (value * audioPlayerModel.songDuration.inMilliseconds)
                              .round(),
                    ),
                  );
                },
                onChanged: (double value) {
                  audioPlayerModel.setPorcentaje = value;
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Text('${audioPlayerModel.currentSecond}', style: style),
        ],
      ),
    );
  }
}

class ImagenDisco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);

    return Container(
      padding: EdgeInsets.all(20),
      width: 210,
      height: 210,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              // duration: Duration(seconds: audioPlayerModel.songDuration.inSeconds),
              duration: Duration(seconds: 1),
              infinite: true,
              manualTrigger: true,
              animate: audioPlayerModel.playing,
              controller: (animationController) =>
                  audioPlayerModel.controller = animationController,
              child: Image(
                image: AssetImage('assets/aurora.jpg'),
              ),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(100)),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: Color(0xff1c1c25),
                  borderRadius: BorderRadius.circular(100)),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: LinearGradient(begin: Alignment.topLeft, colors: [
          Color(0xff484750),
          Color(0xff1e1c24),
        ]),
      ),
    );
  }
}
