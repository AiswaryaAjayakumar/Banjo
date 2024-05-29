// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/core/constants/color.dart';
import 'package:music_app/core/constants/db.dart';
import 'package:music_app/global_widgets/selected_song.dart';

class CustomListedPage extends StatefulWidget {
  const CustomListedPage({super.key});

  @override
  State<CustomListedPage> createState() => _CustomListedPageState();
}

class _CustomListedPageState extends State<CustomListedPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                //final player = AudioCache();
              

               
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectedSongScreen(),
                    ));
              },
              child: Container(
                height: MediaQuery.sizeOf(context).height / 12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 130, 127, 127)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        Db.listedSongs[index]["img"]),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Db.listedSongs[index]["name"],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                Db.listedSongs[index]["artist"],
                                style: TextStyle(
                                    fontSize: 14,
                                    color: ColorConstants.customGrey1),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                    ],
                  ),
                ),
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
        itemCount: Db.listedSongs.length);
  }
}
