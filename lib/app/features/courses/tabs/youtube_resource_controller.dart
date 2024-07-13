import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeResourceController extends GetxController{
  late List youtubeResource;
  RxList videos = [].obs;
  var isLoading = false.obs;

  YoutubeExplode youtubeExplode = YoutubeExplode();

  YoutubeResourceController({required this.youtubeResource});
  

  //  void fetchVideo() async {
  //   videoData = await YoutubeData.getData(
  //       'https://www.youtube.com/watch?v=GQyWIur03aw');
  //   setState(() {});
  // }
  @override
  void onInit() {
    fetchVideo();
    super.onInit();
  }

  @override
  void onClose() {
    youtubeExplode.close();
    super.onClose();
  }


  void fetchVideo() async{
    isLoading.value = true;
    try {
      for (var element in youtubeResource) {
      var videoId = VideoId(element);
      var video = await youtubeExplode.videos.get(videoId);
      videos.add({
        "title" : video.title,
        "thumbnail": video.thumbnails,
        "url": video.url,
      });
      print(video.url);
    }
    }catch (e) {
      Get.snackbar('Error', 'Failed to load courses');
    } finally {
      isLoading.value = false;
    }
  }
}