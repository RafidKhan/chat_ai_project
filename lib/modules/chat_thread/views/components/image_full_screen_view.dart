import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:chat_on/global/widget/global_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../utils/enum.dart';
import '../../../../utils/styles/k_colors.dart';

class ImageFullScreenView extends StatefulWidget {
  final String imageUrl;
  const ImageFullScreenView({super.key,required this.imageUrl});

  @override
  State<ImageFullScreenView> createState() => _ImageFullScreenViewState();
}

class _ImageFullScreenViewState extends State<ImageFullScreenView> {
  final ReceivePort _port = ReceivePort();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      setState(() {});
    });
    FlutterDownloader.registerCallback(downloadCallback);
  }

  static void downloadCallback(String id, int status, int progress) {
    final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: KColor.gradient2.color,
      appBar: AppBar(
        backgroundColor: KColor.gradient2.color,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back,color: Colors.white,),),
        actions: [
          InkWell(
            onTap: () async{
              Directory? directory = Platform.isAndroid
                  ? await getExternalStorageDirectory() //FOR ANDROID
                  : await getApplicationSupportDirectory(); //FOR iOS
              Fluttertoast.showToast(msg: "Downloading",textColor: Colors.white);
              await FlutterDownloader.enqueue(
                url: widget.imageUrl,
                savedDir: directory!.path,
                showNotification: true,
                openFileFromNotification: true,
                saveInPublicStorage: true,
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Icon(Icons.download,color: Colors.white,),
                  GlobalText(
                    color: Colors.white,
                      fontSize: 16,
                      str: "Download")
                ],
              ),
            ),
          )
        ],
      ),
      body: GlobalImageLoader(
        height: size.height,
        width:  size.width,
        fit: BoxFit.contain,
        imageFor: ImageFor.network,
        imagePath: widget.imageUrl,
      ),
    );
  }
}
