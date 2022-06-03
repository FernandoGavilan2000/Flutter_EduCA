import 'package:flutter_educa/providers/Course.dart';
import 'package:flutter_educa/widgets/HeaderCard.dart';
import 'package:flutter_educa/widgets/MenuNavBar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_educa/services/remote_service.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';
import '../models/videos.dart';

class VideosScreen extends StatefulWidget {
  final String course;
  const VideosScreen({Key? key, required this.course}) : super(key: key);
  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  List<Videos>? videos;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    //Fetch Data Videos
    getVideosAPI();
  }

  getVideosAPI() async {
    videos = await RemoteService().getVideos(widget.course);
    if (videos != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //String courseName = Provider.of<CourseProvider>(context).courseName;
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(69, 84, 255, 1),
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/whiteVector.png'))),
        child: Scaffold(
          drawer: const MenuNavBar(),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        HeaderCard(
                          educaColor: Colors.white,
                          message: false,
                          imageSize: 78,
                        ),
                        CustomSubTitle(
                          text: '¡Aprendamos viendo!',
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        CustomSubTitle(
                          color: Colors.white,
                          text: 'Videos',
                          bold: true,
                          fontSize: 40,
                        ),
                        SizedBox(height: 20),
                      ]),
                ),
                Visibility(
                  visible: isLoaded,
                  replacement: const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: ListVideos(videos)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<CardVideo> ListVideos(List<Videos>? videos) {
  List<CardVideo> list_videos = [];
  if (videos != null) {
    for (var item in videos) {
      list_videos.add(CardVideo(
        thumbnail: item.imagen,
        title: item.titulo,
        url: item.url,
      ));
    }
  }
  return list_videos;
}

class CardVideo extends StatelessWidget {
  const CardVideo({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.url,
  }) : super(key: key);

  final String thumbnail;
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final pathVideo = Uri.parse(url).path;
        final httpsUri =
            Uri(scheme: "https", host: "youtu.be", path: pathVideo);
        if (await canLaunchUrl(httpsUri)) {
          await launchUrl(httpsUri);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(thumbnail)),
            borderRadius: BorderRadius.circular(20)),
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        height: 200,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 255, 253, 253).withOpacity(.1),
                  Color.fromARGB(255, 0, 0, 0).withOpacity(.8)
                ]),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 40,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(69, 84, 255, 1),
                ),
              ),
              SizedBox(height: 27),
              CustomSubTitle(
                fontSize: 17,
                text: title,
                color: Colors.white,
              )
            ],
          )),
        ),
      ),
    );
  }
}
