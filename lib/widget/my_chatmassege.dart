import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:whatsap/enume/enum.dart';
import '../color.dart';
import '../widget/Displyfillemasage.dart';

class MyMessageCard extends StatelessWidget {
  final String message;
  final String date;
  final MessageEnum messageEnum;
  final String username;
  final String replytex;
  final VoidCallback leaftswipe;
  final MessageEnum replaymassegetype;
  final bool isSeen;

  const MyMessageCard({Key? key, required this.message, required this.date,required this.messageEnum,required this.leaftswipe,required this.username, required this.replytex, required this.replaymassegetype, required this.isSeen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isreply = replytex.isNotEmpty;
    return SwipeTo(
      onLeftSwipe:(details) =>leaftswipe,
      child: Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: messageColor,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 30,
                    top: 5,
                    bottom: 25,
                  ),
                 child: Column(
                   children: [
                     if(isreply)...[
                       Text(username,style: TextStyle(fontWeight: FontWeight.bold),),
                       displyfillemassage(massage: replytex, massegeEnum: replaymassegetype)
                     ],
                     displyfillemassage(massage: message,massegeEnum: messageEnum,),
                   ],
                 )
                ),
                Positioned(
                  bottom: 4,
                  right: 10,
                  child: Row(
                    children: [
                      Text(
                        date,
                        style:const TextStyle(
                          fontSize: 13,
                          color: Colors.white60,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                       Icon(
                       isSeen ? Icons.done_all : Icons.done,
                        size: 20,
                        color:isSeen ? Colors.blue : Colors.white60,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}