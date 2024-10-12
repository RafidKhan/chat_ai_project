import 'dart:io';
import 'package:chat_on/global/widget/global_image_loader.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../global/widget/global_text.dart';
import '../../../../../utils/app_routes.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../utils/styles/k_colors.dart';
import '../../../../chat_thread/model/chat_thread_nav_model.dart';
import '../../../model/premium_feature_model.dart';

class YoutubeLinkInput extends StatefulWidget {
  final PremiumFeatureModel item;
  const YoutubeLinkInput({super.key,required this.item});

  @override
  State<YoutubeLinkInput> createState() => _YoutubeLinkInputState();
}

class _YoutubeLinkInputState extends State<YoutubeLinkInput> {
  TextEditingController urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          //height: size.height * 0.34,
          width: size.width,
          decoration: BoxDecoration(
              color: KColor.gradient2.color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const GlobalImageLoader(
                        height: 25,
                        width: 25,
                        imagePath: "assets/images/youtube.png"),
                    IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.close,color: Colors.white,))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GlobalText(
                  str: "Enter Youtube URL",
                  color: KColor.white.color,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GlobalText(
                  str: "Past the url to summarize",
                  color: KColor.white.color,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GlobalText(
                  str: "make sure video has subtitle",
                  color: KColor.white.color,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2,),
              InkWell(
                onTap: () async{

                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                  child: Container(
                    height: 45,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white,width: 2)
                    ),
                    child: TextField(
                      controller: urlController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.link,color: Colors.white,),
                        hintText: "Enter youtube url",
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding: EdgeInsets.only(top: 5,left: 5),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  if(urlController.text.isNotEmpty){
                    Navigator.pop(context);
                    Navigation.push(
                      context,
                      appRoutes: AppRoutes.chatThread,
                      arguments: ChatThreadNavModel(
                          promptId: widget.item.promptId,
                          customPrompt: "What is the video give me the summarization",
                          imageFile: null,
                          url: urlController.text,
                          aiType: widget.item.aiType
                      ),
                    );
                  }else{
                    Fluttertoast.showToast(msg: "Please enter youtube url",textColor: Colors.white);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                  child: Container(
                    height: 45,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: GlobalText(
                        str: "Continue",
                        color: KColor.black.color,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}