import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPage extends StatefulWidget {
  final String url;
  const VideoPage({super.key, required this.url});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoId videoId;
  late YoutubePlayerController _controller;
  //  WebViewController controller = WebViewController()
  // ..setJavaScriptMode(JavaScriptMode.unrestricted)
  // // ..setNavigationDelegate(
  // //   NavigationDelegate(
  // //     onProgress: (int progress) {
  // //       // Update loading bar.
  // //     },
  // //     onPageStarted: (String url) {},
  // //     onPageFinished: (String url) {},
  // //     onHttpError: (HttpResponseError error) {},
  // //     onWebResourceError: (WebResourceError error) {},
  // //     onNavigationRequest: (NavigationRequest request) {
  // //       if (request.url.startsWith('https://www.youtube.com/')) {
  // //         return NavigationDecision.prevent;
  // //       }
  // //       return NavigationDecision.navigate;
  // //     },
  // //   ),
  // // )
  // ..loadRequest(Uri.parse('https://flutter.dev'));
  @override
  void initState() {
    videoId = VideoId(widget.url);
    _controller = YoutubePlayerController.fromVideoId(
      videoId: videoId.value,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: YoutubePlayerScaffold(
          controller: _controller,
          // aspectRatio: 20 / 13,
          builder: (context, player) {
            return Column(
              children: [
                player,
                ElevatedButton(
                    onPressed: () {
                      _controller.exitFullScreen();
                      Get.back();
                    },
                    child: const Text('Go back')),
                // ElevatedButton(
                //     onPressed: () {}, child: const Text('Visit Channel')),
              ],
            );
          },
        ),
      ),
    );
    //   return Scaffold(
    //   appBar: AppBar(title: const Text('Flutter Simple Example')),
    //   body: WebViewWidget(controller: controller),
    // );
  }
}
