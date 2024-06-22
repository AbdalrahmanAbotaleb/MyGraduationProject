import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mylast2gproject/src/features/ScanningHome/presentation/pages/home.dart';

import '../controllers/chat_controller.dart';
import '../widgets/appbar.dart';

class ChatPage extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Obx(
            () => Container(
              height: MediaQuery.of(context).size.height - 85,
              child: ListView.builder(
                itemCount: chatController.chatHistory.length,
                shrinkWrap: false,
                controller: chatController.scrollController,
                padding: EdgeInsets.only(
                  top: height * 0.12,
                ),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final message = chatController.chatHistory[index];
                  final isSender = message["isSender"];
                  final messageContent = message["message"];
                  final timestamp = DateTime.parse(message["time"]);

                  return Column(
                    crossAxisAlignment: isSender
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 14, right: 14, top: 10, bottom: 0),
                        child: Align(
                          alignment:
                              isSender ? Alignment.topRight : Alignment.topLeft,
                          child: Container(
                            decoration: ShapeDecoration(
                              color: isSender
                                  ? const Color(0xff7dc452)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: isSender
                                      ? const Color(0xff7dc452)
                                      : Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(54),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            padding: const EdgeInsets.all(16),
                            child: message["isImage"]
                                ? Image.file(
                                    File(messageContent),
                                    width: 200,
                                  )
                                : Text(
                                    maxLines: 1000,
                                    // textAlign: TextAlign.justify,
                                    messageContent,
                                    style: TextStyle(
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis,
                                      color: isSender
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 14,
                          right: 14,
                          top: 4,
                        ),
                        child: Text(
                          "${timestamp.hour}:${timestamp.minute}",
                          style: TextStyle(
                            fontSize: 15,
                            color: isSender
                                ? const Color(0xff7dc452)
                                : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              height: 60,
              width: double.infinity,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, -2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: "Type a message",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                        controller: chatController.chatController,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  MaterialButton(
                    onPressed: () {
                      chatController.sendMessage();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      constraints: const BoxConstraints(
                        minWidth: 88.0,
                        minHeight: 36.0,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(Icons.send,
                          size: 30, color: Color(0xff7dc452)),
                    ),
                  )
                ],
              ),
            ),
          ),
          appBar('AI Assitant', () {
            Navigator.of(context).pop();
          },
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: chatController.clearChat,
              ),
              height,
              width),
        ],
      ),
    );
  }
}
