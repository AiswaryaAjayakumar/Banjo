// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:banjo/core/constants/color.dart';
import 'package:banjo/core/constants/texts.dart';
import 'package:banjo/global_widgets/bottom_nav.dart';
import 'package:banjo/presentation/add_playlist_screen/view/add_play_list_screen.dart';
import 'package:banjo/presentation/play_list_screen/contrller/playlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({super.key});

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController t1 = TextEditingController();
  final PlaylistController playlistController = Get.put(PlaylistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNav(),
                  ));
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorConstants.customWhite1,
            )),
        backgroundColor: ColorConstants.blackColorLogo1,
        title: Center(
          child: Text(
            "Playlist",
            style: MytextStyle.customWhiteHeadings8,
          ),
        ),
      ),
      backgroundColor: ColorConstants.blackColorLogo1,
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(ColorConstants.customWhite)),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: ColorConstants.copperColorLogo2,
                          title: Text("Give your playlist a name"),
                          actions: [
                            Form(
                              key: _formKey,
                              child: TextFormField(
                                controller: t1,
                                validator: (value) {
                                  //var snakBar=SnackBar(content: Text("Name is required!!!.."));
                                  if (t1.text.isNotEmpty) {
                                    return null;
                                  } else {
                                    return "Name is required!!..";
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel")),
                                TextButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        playlistController.addPlaylist(t1.text);
                                        t1.clear();
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: Text("Create"))
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("New playlist"))),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: playlistController.playlists.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => AddPlayListScreen(
                        
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border(
                              bottom: BorderSide(
                                  color: ColorConstants.copperColorLogo2))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(playlistController.playlists[index],
                                style: MytextStyle.customWhiteHeadings5),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.more_vert_outlined,
                                  color: ColorConstants.customGrey3,
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                  // ListTile(

                  //     title: Text(playlistController.playlists[index],
                  //         style: MytextStyle.customWhiteHeadings5),
                  //     trailing: IconButton(
                  //       onPressed: () {},
                  //       icon: Icon(
                  //         Icons.more_vert_outlined,
                  //         color: ColorConstants.customGrey3,
                  //       ),
                  //     ));
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
