import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../global/widget/global_text.dart';
import '../../../../../utils/app_routes.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../utils/styles/k_colors.dart';
import '../../../../chat_thread/model/chat_thread_nav_model.dart';
import '../../../model/premium_feature_model.dart';

class FileUploaderUi extends StatefulWidget {
  final PremiumFeatureModel item;
  const FileUploaderUi({super.key,required this.item});

  @override
  State<FileUploaderUi> createState() => _FileUploaderUiState();
}

class _FileUploaderUiState extends State<FileUploaderUi> {
  String file = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.33,
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.file_present_rounded,color: Colors.white),
                IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: const Icon(Icons.close,color: Colors.white,))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GlobalText(
              str: "Upload your file",
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
              str: "It must be 30 MB max (docx,doc,xlsx & xls)",
              color: KColor.white.color,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          InkWell(
            onTap: () async{
              try{
                FlutterDocumentPickerParams params = FlutterDocumentPickerParams(
                  allowedFileExtensions: ['docx','doc','xlsx','xls'],
                );
                final doc = await FlutterDocumentPicker.openDocument(params: params);
                if(doc != null){
                  setState(() {
                    file = doc;
                  });
                }
              } catch(e){
                Fluttertoast.showToast(msg: "Please select correct file",textColor: Colors.white);
              }
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
                child: file.isEmpty ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: GlobalText(
                        str: "Chose a file",
                        color: KColor.white.color,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Icon(Icons.file_present_rounded,color: Colors.white),
                    ),
                  ],
                ) : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Icon(Icons.file_present_rounded,color: Colors.white),
                          SizedBox(width: 5),
                          GlobalText(
                            str: "File has been selected",
                            color: Colors.white,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          file = "";
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Icon(Icons.close,color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              if(file.isNotEmpty){
                Navigator.pop(context);
                File docFile = File(file);
                Navigation.push(
                  context,
                  appRoutes: AppRoutes.chatThread,
                  arguments: ChatThreadNavModel(
                      promptId: widget.item.promptId,
                      customPrompt: null,
                      imageFile: docFile,
                      aiType: widget.item.aiType
                  ),
                );
              }else{
                Fluttertoast.showToast(msg: "Please select a file",textColor: Colors.white);
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
    );
  }
}
