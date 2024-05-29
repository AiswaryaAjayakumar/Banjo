// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:music_app/core/constants/color.dart';
import 'package:music_app/core/constants/db.dart';

class CustomListedPage extends StatefulWidget {
  const CustomListedPage({
    super.key,
    required this.songName,
    required this.onPressed,
  });

  final String songName;
  final VoidCallback onPressed;

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
        onTap: widget.onPressed,
        child: Container(
          height: MediaQuery.of(context).size.height / 12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(255, 130, 127, 127),
          ),
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
                          image: NetworkImage(Db.listedSongs[index]["img"]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 18),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width *
                              0.5, // Adjust width as needed
                          child: Text(
                            widget.songName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          Db.listedSongs[index]["artist"],
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorConstants.customGrey1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
              ],
            ),
          ),
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: Db.listedSongs.length,
    );
  }
}
