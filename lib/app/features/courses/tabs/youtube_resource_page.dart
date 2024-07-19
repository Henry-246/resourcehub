import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resource/app/features/courses/tabs/videopage.dart';
import 'package:resource/app/features/courses/tabs/youtube_resource_controller.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeResourcePage extends StatefulWidget {
  final List youtubeResource;
  const YoutubeResourcePage({super.key, required this.youtubeResource});

  @override
  State<YoutubeResourcePage> createState() => _YoutubeResourcePageState();
}

class _YoutubeResourcePageState extends State<YoutubeResourcePage> {
  // late YoutubeResourceController controller;
  @override
  void initState() {
    // controller = Get.put(
    //     YoutubeResourceController(youtubeResource: widget.youtubeResource));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.youtubeResource.isEmpty
            ? const Center(child: Text("No Videos at the moment"))
            : ListView.builder(
                itemCount: widget.youtubeResource.length,
                itemBuilder: (context, index) {
                  var video = widget.youtubeResource[index];
                  return ListTile(
                    title: Text(video['name']),
                    onTap: () {
                      Get.to(() => VideoPage(url: video['link']));
                    },
                  );
                },
              ));
  }
}
