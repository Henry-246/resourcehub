import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:ionicons/ionicons.dart';

class LectureResourcePage extends StatefulWidget {
  final List lectureResource;
  const LectureResourcePage({
    super.key,
    required this.lectureResource,
  });

  @override
  State<LectureResourcePage> createState() => _LectureResourcePageState();
}

class _LectureResourcePageState extends State<LectureResourcePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const PDF().fromUrl(
            'https://drive.usercontent.google.com/download?id=1wcvVBCO38YwOuh3JVflHRMUThfmG_O-u&export=download&authuser=0&confirm=t&uuid=415fa710-31bf-4b6f-a29f-a9acb15d00cb&at=APZUnTXHv5t82FThOMHib3Dk6ghZ:1720112178712'));
    // return Scaffold(
    //   body: ListView.builder(
    //     itemCount: widget.lectureResource.length,
    //     itemBuilder: (context, index) {
    //       var lecture = widget.lectureResource[index];
    //       return Column(
    //         children: [
    //           ListTile(
    //             title: Text(
    //               lecture['name'],
    //               style: TextStyle(
    //                 fontSize: 25,
    //               ),
    //             ),
    //             leading: Icon(Ionicons.document, size: 35),
    //           ),
    //           Divider(
    //             color: Colors.black38,
    //             thickness: 2,
    //           )
    //         ],
    //       );
    //     },
    //   ),
    // );
  }
}
