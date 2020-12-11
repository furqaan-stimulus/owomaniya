import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: ListView.builder(
    //     physics: ScrollPhysics(),
    //     shrinkWrap: true,
    //     itemCount: snapshot.data.data?.length ?? 0,
    //     itemBuilder: (context, first) {
    //       if (snapshot.hasData) {
    //         if (snapshot.data.data[first].feedType == FeedType.QUERY) {
    //           return ListView.builder(
    //             shrinkWrap: true,
    //             physics: ScrollPhysics(),
    //             itemCount:
    //             snapshot.data.data[first].details.authordetails?.length ?? 0,
    //             itemBuilder: (context, qSecond) {
    //               if (snapshot.hasData) {
    //                 return ListView.builder(
    //                   physics: ScrollPhysics(),
    //                   shrinkWrap: true,
    //                   itemCount:
    //                   snapshot.data.data[first].details.authordetails?.length ??
    //                       0,
    //                   itemBuilder: (context, qThird) {
    //                     if (snapshot.hasData) {
    //                       return Card(
    //                         elevation: 5.0,
    //                         child: Container(
    //                           child: Padding(
    //                             padding: const EdgeInsets.all(16.0),
    //                             child: Column(
    //                               mainAxisAlignment: MainAxisAlignment.start,
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Row(
    //                                   mainAxisAlignment:
    //                                   MainAxisAlignment.spaceBetween,
    //                                   children: [
    //                                     Column(
    //                                       mainAxisAlignment: MainAxisAlignment.start,
    //                                       crossAxisAlignment:
    //                                       CrossAxisAlignment.start,
    //                                       children: [
    //                                         Row(
    //                                           children: [
    //                                             Text(
    //                                               'Query on ${snapshot.data.data[first].categorymapping[qSecond].category.category}',
    //                                               style: TextStyle(
    //                                                 fontSize: 14.0,
    //                                               ),
    //                                             ),
    //                                             SizedBox(
    //                                               width: 10.0,
    //                                             ),
    //                                             snapshot
    //                                                 .data
    //                                                 .data[first]
    //                                                 .feedqueryassigned[
    //                                             qSecond]
    //                                                 .feedStatus ==
    //                                                 "ANSWERED"
    //                                                 ? Row(
    //                                               children: [
    //                                                 SvgPicture.asset(
    //                                                   'assets/svg/check_pink.svg',
    //                                                   height: 15.0,
    //                                                   width: 15.0,
    //                                                 ),
    //                                                 SizedBox(
    //                                                   width: 10.0,
    //                                                 ),
    //                                                 Text(
    //                                                   'Answered',
    //                                                   style: TextStyle(
    //                                                       fontSize: 16.0,
    //                                                       color: Colors.pink),
    //                                                 ),
    //                                               ],
    //                                             )
    //                                                 : Text(''),
    //                                           ],
    //                                         ),
    //                                         SizedBox(
    //                                           height: 5.0,
    //                                         ),
    //                                         Text(
    //                                           DateTimeAgo.timeAgoSinceDate(
    //                                               '${snapshot.data.data[first].feedDate}'),
    //                                           style: TextStyle(
    //                                             fontSize: 11.0,
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 SizedBox(
    //                                   height: 10.0,
    //                                 ),
    //                                 Divider(
    //                                   color: Colors.grey,
    //                                 ),
    //                                 SizedBox(
    //                                   height: 10.0,
    //                                 ),
    //                                 Row(
    //                                   mainAxisAlignment:
    //                                   MainAxisAlignment.spaceBetween,
    //                                   crossAxisAlignment: CrossAxisAlignment.start,
    //                                   children: [
    //                                     Padding(
    //                                       padding: const EdgeInsets.only(
    //                                           left: 8.0, right: 8.0),
    //                                       child:
    //                                       SvgPicture.asset('assets/svg/icon.svg'),
    //                                     ),
    //                                     SizedBox(
    //                                       width: 10.0,
    //                                     ),
    //                                     Expanded(
    //                                       child: Text(
    //                                         '${snapshot.data.data[first].feedTitle}',
    //                                         overflow: TextOverflow.ellipsis,
    //                                         softWrap: false,
    //                                         maxLines: 3,
    //                                         style: TextStyle(
    //                                             fontWeight: FontWeight.bold),
    //                                       ),
    //                                     ),
    //                                     Padding(
    //                                       padding: const EdgeInsets.only(
    //                                           left: 10.0, right: 10.0),
    //                                       child: Container(
    //                                         height: 20,
    //                                         width: 20,
    //                                         child: GestureDetector(
    //                                           child: isBookmark == false
    //                                               ? SvgPicture.asset(
    //                                               "assets/svg/tag_inactive.svg")
    //                                               : SvgPicture.asset(
    //                                               "assets/svg/tag_active.svg"),
    //                                           onTap: () {
    //                                             if (sptoken.data == null) {
    //                                               Scaffold.of(context).showSnackBar(
    //                                                 SnackBar(
    //                                                   action: SnackBarAction(
    //                                                     label: 'Undo',
    //                                                     onPressed: () {},
    //                                                   ),
    //                                                   content:
    //                                                   Text('You are not Login'),
    //                                                 ),
    //                                               );
    //                                             } else {
    //                                               setState(() {
    //                                                 // toggleBookmark();
    //                                               });
    //                                             }
    //                                           },
    //                                         ),
    //                                       ),
    //                                     )
    //                                   ],
    //                                 ),
    //                                 SizedBox(height: 5.0),
    //                                 Padding(
    //                                   padding: const EdgeInsets.fromLTRB(
    //                                       14.0, 14.0, 14.0, 10.0),
    //                                   child: Text(
    //                                     '${snapshot.data.data[first].feedDetail}',
    //                                     maxLines: descTextShowFlag ? 8 : 2,
    //                                     textAlign: TextAlign.start,
    //                                   ),
    //                                 ),
    //                                 GestureDetector(
    //                                   onTap: () {
    //                                     setState(
    //                                           () {
    //                                         descTextShowFlag = !descTextShowFlag;
    //                                       },
    //                                     );
    //                                   },
    //                                   child: Padding(
    //                                     padding: const EdgeInsets.only(left: 14.0),
    //                                     child: Row(
    //                                       mainAxisAlignment: MainAxisAlignment.start,
    //                                       children: <Widget>[
    //                                         descTextShowFlag
    //                                             ? Text(
    //                                           "Show Less",
    //                                           style:
    //                                           TextStyle(color: Colors.grey),
    //                                         )
    //                                             : Text("Continue Reading",
    //                                             style:
    //                                             TextStyle(color: Colors.grey))
    //                                       ],
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 Stack(
    //                                   children: <Widget>[
    //                                     Container(
    //                                       width: double.infinity,
    //                                       margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
    //                                       padding: EdgeInsets.all(12),
    //                                       decoration: BoxDecoration(
    //                                         border: Border.all(
    //                                             color: Colors.grey, width: 0.5),
    //                                         borderRadius: BorderRadius.circular(5),
    //                                         shape: BoxShape.rectangle,
    //                                       ),
    //                                       child: Column(
    //                                         mainAxisAlignment:
    //                                         MainAxisAlignment.start,
    //                                         crossAxisAlignment:
    //                                         CrossAxisAlignment.start,
    //                                         children: <Widget>[
    //                                           Row(
    //                                             children: [
    //                                               snapshot
    //                                                   .data
    //                                                   .data[first]
    //                                                   .details
    //                                                   .authordetails[qSecond]
    //                                                   .user
    //                                                   .userImage ==
    //                                                   null
    //                                                   ? SvgPicture.asset(
    //                                                 'assets/svg/anyonmans.svg',
    //                                                 height: 50,
    //                                                 width: 50,
    //                                               )
    //                                                   : Container(
    //                                                 height: 50.0,
    //                                                 width: 50.0,
    //                                                 decoration: BoxDecoration(
    //                                                   shape: BoxShape.circle,
    //                                                   image: DecorationImage(
    //                                                     fit: BoxFit.fill,
    //                                                     image: NetworkImage(
    //                                                       snapshot
    //                                                           .data
    //                                                           .data[first]
    //                                                           .details
    //                                                           .authordetails[
    //                                                       qSecond]
    //                                                           .user
    //                                                           .userImage,
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                               Padding(
    //                                                 padding: const EdgeInsets.only(
    //                                                     left: 8.0, top: 10.0),
    //                                                 child: Column(
    //                                                   mainAxisAlignment:
    //                                                   MainAxisAlignment.start,
    //                                                   crossAxisAlignment:
    //                                                   CrossAxisAlignment.start,
    //                                                   children: [
    //                                                     Text(
    //                                                       '${snapshot.data.data[first].details.authordetails[qSecond].user.firstName == null ? '' : snapshot.data.data[first].details.authordetails[qSecond].user.firstName}' +
    //                                                           ' ${snapshot.data.data[first].details.authordetails[qSecond].user?.lastName == null ? '' : snapshot.data.data[first].details.authordetails[qSecond].user?.lastName}',
    //                                                       style: TextStyle(
    //                                                           fontWeight:
    //                                                           FontWeight.bold,
    //                                                           fontSize: 18),
    //                                                     ),
    //                                                     Text(
    //                                                         '${snapshot.data.data[first].details.authordetails[qSecond].user.expertexpertisemapping[0].parentexpertise.expertiseName == null ? '' : snapshot.data.data[first].details.authordetails[qSecond].user.expertexpertisemapping[qThird].parentexpertise.expertiseName}'),
    //                                                   ],
    //                                                 ),
    //                                               ),
    //                                             ],
    //                                           ),
    //                                           Divider(
    //                                             color: Colors.grey,
    //                                           ),
    //                                           Row(
    //                                             crossAxisAlignment:
    //                                             CrossAxisAlignment.start,
    //                                             mainAxisAlignment:
    //                                             MainAxisAlignment.spaceAround,
    //                                             children: [
    //                                               SvgPicture.asset(
    //                                                 'assets/svg/full_consultation.svg',
    //                                                 height: 15,
    //                                                 width: 15,
    //                                               ),
    //                                               SizedBox(
    //                                                 width: 5,
    //                                               ),
    //                                               Expanded(
    //                                                   child: GestureDetector(
    //                                                       onTap: () {},
    //                                                       child: Text(
    //                                                           'See Full Consultation'))),
    //                                               Container(
    //                                                   height: 30,
    //                                                   child: VerticalDivider(
    //                                                       color: Colors.grey)),
    //                                               SvgPicture.asset(
    //                                                 'assets/svg/sidebar_query.svg',
    //                                                 height: 18,
    //                                                 width: 18,
    //                                               ),
    //                                               SizedBox(
    //                                                 width: 5,
    //                                               ),
    //                                               Expanded(
    //                                                 child: GestureDetector(
    //                                                   onTap: () {},
    //                                                   child: Text(
    //                                                       'Ask ${snapshot.data.data[first].details.authordetails[qSecond].user.firstName + snapshot.data.data[first].details.authordetails[qSecond].user.lastName}'),
    //                                                 ),
    //                                               ),
    //                                             ],
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                     Positioned(
    //                                       left: 20,
    //                                       top: 2,
    //                                       child: Container(
    //                                         padding: EdgeInsets.only(
    //                                             bottom: 5, left: 10, right: 10),
    //                                         color: Colors.white,
    //                                         child: Text(
    //                                           'Expert Says',
    //                                           style: TextStyle(
    //                                               color: Colors.black, fontSize: 12),
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 SizedBox(height: 10.0),
    //                                 Padding(
    //                                   padding: const EdgeInsets.all(10.0),
    //                                   child: Row(
    //                                     crossAxisAlignment: CrossAxisAlignment.start,
    //                                     mainAxisAlignment: MainAxisAlignment.start,
    //                                     children: <Widget>[
    //                                       Text(
    //                                           '${snapshot.data.data[first].feedRelateCnt} Relate with this'),
    //                                       Padding(
    //                                         padding: const EdgeInsets.only(
    //                                             left: 8.0, right: 8.0),
    //                                         child: Text('.'),
    //                                       ),
    //                                       Text(
    //                                           '${snapshot.data.data[first].feedCommentCnt} Comment'),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 Divider(
    //                                   color: Colors.grey,
    //                                 ),
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(bottom: 8.0),
    //                                   child: Row(
    //                                     crossAxisAlignment: CrossAxisAlignment.start,
    //                                     mainAxisAlignment:
    //                                     MainAxisAlignment.spaceEvenly,
    //                                     children: <Widget>[
    //                                       Padding(
    //                                         padding: const EdgeInsets.only(top: 12.0),
    //                                         child: Row(
    //                                           children: [
    //                                             SvgPicture.asset(
    //                                               'assets/svg/relate_hand.svg',
    //                                               height: 20,
    //                                               width: 20,
    //                                             ),
    //                                             SizedBox(
    //                                               width: 10.0,
    //                                             ),
    //                                             GestureDetector(
    //                                               child: Text(
    //                                                 'I Relate',
    //                                               ),
    //                                               onTap: () async {
    //                                                 if (sptoken.data == null) {
    //                                                   Scaffold.of(context)
    //                                                       .showSnackBar(
    //                                                     SnackBar(
    //                                                       action: SnackBarAction(
    //                                                         label: 'Undo',
    //                                                         onPressed: () {},
    //                                                       ),
    //                                                       content: Text(
    //                                                           'You are not Login'),
    //                                                     ),
    //                                                   );
    //                                                 } else {}
    //                                               },
    //                                             ),
    //                                           ],
    //                                         ),
    //                                       ),
    //                                       SizedBox(
    //                                         width: 5,
    //                                       ),
    //                                       GestureDetector(
    //                                         onTap: () async {
    //                                           if (sptoken.data == null) {
    //                                             Scaffold.of(context).showSnackBar(
    //                                               SnackBar(
    //                                                 action: SnackBarAction(
    //                                                   label: 'Undo',
    //                                                   onPressed: () {},
    //                                                 ),
    //                                                 content:
    //                                                 Text('You are not Login'),
    //                                               ),
    //                                             );
    //                                           } else {
    //                                             setState(() {
    //                                               toggleVisibility();
    //                                             });
    //                                           }
    //                                         },
    //                                         child: Padding(
    //                                           padding:
    //                                           const EdgeInsets.only(top: 12.0),
    //                                           child: Row(
    //                                             crossAxisAlignment:
    //                                             CrossAxisAlignment.start,
    //                                             mainAxisAlignment:
    //                                             MainAxisAlignment.spaceEvenly,
    //                                             children: [
    //                                               SvgPicture.asset(
    //                                                 'assets/svg/comment.svg',
    //                                                 height: 20,
    //                                                 width: 20,
    //                                                 color: isVisible == false
    //                                                     ? Colors.black
    //                                                     : Colors.pink,
    //                                               ),
    //                                               SizedBox(
    //                                                 width: 10.0,
    //                                               ),
    //                                               Text(
    //                                                 'Comment',
    //                                                 style: TextStyle(
    //                                                   color: isVisible == false
    //                                                       ? Colors.black
    //                                                       : Colors.pink,
    //                                                 ),
    //                                               ),
    //                                             ],
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       SizedBox(
    //                                         width: 5,
    //                                       ),
    //                                       PopupView(),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 Visibility(
    //                                   visible: isVisible,
    //                                   child: Container(
    //                                     child: Column(
    //                                       children: [
    //                                         Divider(color: Colors.grey),
    //                                         SizedBox(
    //                                           height: 5.0,
    //                                         ),
    //                                         Row(
    //                                           mainAxisSize: MainAxisSize.max,
    //                                           mainAxisAlignment:
    //                                           MainAxisAlignment.start,
    //                                           children: [
    //                                             Text(
    //                                               'Commenting as ',
    //                                               style: TextStyle(
    //                                                 fontSize: 16,
    //                                                 color: Colors.grey,
    //                                               ),
    //                                             ),
    //                                             onChecked
    //                                                 ? Text(
    //                                               'Anonymous',
    //                                               style: TextStyle(
    //                                                 fontSize: 16,
    //                                               ),
    //                                             )
    //                                                 : Text(
    //                                               'Name',
    //                                               style: TextStyle(
    //                                                 fontSize: 16,
    //                                               ),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                         SizedBox(
    //                                           height: 10.0,
    //                                         ),
    //                                         Row(
    //                                           children: [
    //                                             Container(
    //                                               height: 30,
    //                                               width: 20,
    //                                               child: Checkbox(
    //                                                 onChanged: (newValue) {
    //                                                   setState(() {
    //                                                     onChecked = !onChecked;
    //                                                   });
    //                                                 },
    //                                                 value: onChecked,
    //                                               ),
    //                                             ),
    //                                             SizedBox(
    //                                               width: 5.0,
    //                                             ),
    //                                             Text(
    //                                               'Anonymous',
    //                                               style: TextStyle(
    //                                                 fontSize: 16,
    //                                               ),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                         SizedBox(
    //                                           height: 10.0,
    //                                         ),
    //                                         Row(
    //                                           mainAxisAlignment:
    //                                           MainAxisAlignment.start,
    //                                           crossAxisAlignment:
    //                                           CrossAxisAlignment.start,
    //                                           children: [
    //                                             Padding(
    //                                               padding: const EdgeInsets.only(
    //                                                   right: 6.0, top: 8.0),
    //                                               child: SvgPicture.asset(
    //                                                 'assets/svg/anyonmans.svg',
    //                                                 height: 40,
    //                                               ),
    //                                             ),
    //                                             Expanded(
    //                                               child: Container(
    //                                                 width: 150,
    //                                                 child: TextField(
    //                                                   decoration: InputDecoration(
    //                                                       hintText:
    //                                                       'Start typing your comment...',
    //                                                       enabledBorder:
    //                                                       OutlineInputBorder(
    //                                                         borderSide: BorderSide(
    //                                                             color: Colors.grey),
    //                                                       ),
    //                                                       focusedBorder:
    //                                                       OutlineInputBorder(
    //                                                           borderSide:
    //                                                           BorderSide(
    //                                                               color: Colors
    //                                                                   .pink))),
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                             Padding(
    //                                               padding: const EdgeInsets.only(
    //                                                   left: 6.0),
    //                                               child: GestureDetector(
    //                                                 onTap: () {},
    //                                                 child: ClipOval(
    //                                                   child: Container(
    //                                                     color: Colors.grey,
    //                                                     height: 55,
    //                                                     width: 55,
    //                                                     child: Center(
    //                                                       child: SvgPicture.asset(
    //                                                         'assets/svg/send.svg',
    //                                                         height: 25,
    //                                                         width: 25,
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                         SizedBox(
    //                                           height: 10,
    //                                         ),
    //                                         Visibility(
    //                                           visible: isProgress,
    //                                           child: CircularProgressIndicator(),
    //                                         ),
    //                                         SizedBox(
    //                                           height: 10,
    //                                         ),
    //                                         Row(
    //                                           children: [
    //                                             Padding(
    //                                               padding: const EdgeInsets.only(
    //                                                   right: 6.0),
    //                                               child: SvgPicture.asset(
    //                                                 'assets/svg/anyonmans.svg',
    //                                                 height: 40,
    //                                               ),
    //                                             ),
    //                                             // SizedBox(
    //                                             //   width: 5.0,
    //                                             // ),
    //                                             Column(
    //                                               mainAxisAlignment:
    //                                               MainAxisAlignment.start,
    //                                               crossAxisAlignment:
    //                                               CrossAxisAlignment.start,
    //                                               children: [
    //                                                 Text(
    //                                                   'Mirza',
    //                                                   style: TextStyle(
    //                                                       color: Colors.black,
    //                                                       fontSize: 16),
    //                                                 ),
    //                                                 SizedBox(
    //                                                   height: 5.0,
    //                                                 ),
    //                                                 Text(
    //                                                   'comment',
    //                                                   style: TextStyle(
    //                                                       color: Colors.blueGrey,
    //                                                       fontSize: 14),
    //                                                 ),
    //                                               ],
    //                                             ),
    //                                           ],
    //                                         ),
    //                                         SizedBox(
    //                                           height: 10,
    //                                         ),
    //                                         Divider(
    //                                           color: Colors.grey,
    //                                         ),
    //                                         SizedBox(
    //                                           height: 10,
    //                                         ),
    //                                         // GestureDetector(
    //                                         //   child: Text('load more'),
    //                                         //   onTap: isProgressing,
    //                                         // ),
    //                                         SizedBox(
    //                                           height: 20,
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                       );
    //                     } else if (snapshot.error) {
    //                       return Text('${snapshot.error}');
    //                     } else {
    //                       return Center(
    //                         child: CircularProgressIndicator(),
    //                       );
    //                     }
    //                   },
    //                 );
    //               } else if (snapshot.error) {
    //                 return Text('${snapshot.error}');
    //               } else {
    //                 return Center(
    //                   child: CircularProgressIndicator(),
    //                 );
    //               }
    //             },
    //           );
    //         } else {
    //           return ListView.builder(
    //             physics: ScrollPhysics(),
    //             shrinkWrap: true,
    //             itemCount:
    //             snapshot.data.data[first].details.authordetails?.length ?? 0,
    //             itemBuilder: (context, second) {
    //               if (snapshot.hasData) {
    //                 return ListView.builder(
    //                   physics: ScrollPhysics(),
    //                   shrinkWrap: true,
    //                   itemCount: snapshot.data.data[first].details
    //                       .authordetails[second].user.authordetails?.length ??
    //                       0,
    //                   itemBuilder: (context, third) {
    //                     if (snapshot.hasData) {
    //                       return Card(
    //                         elevation: 5.0,
    //                         child: Container(
    //                           child: Padding(
    //                             padding: const EdgeInsets.all(16.0),
    //                             child: Column(
    //                               children: [
    //                                 Row(
    //                                   mainAxisAlignment: MainAxisAlignment.start,
    //                                   crossAxisAlignment: CrossAxisAlignment.start,
    //                                   children: [
    //                                     snapshot
    //                                         .data
    //                                         .data[first]
    //                                         .details
    //                                         .authordetails[second]
    //                                         .user
    //                                         .userImage ==
    //                                         null
    //                                         ? SvgPicture.asset(
    //                                       'assets/svg/anyonmans.svg',
    //                                       height: 50,
    //                                       width: 50,
    //                                     )
    //                                         : Container(
    //                                       height: 50.0,
    //                                       width: 50.0,
    //                                       decoration: BoxDecoration(
    //                                         shape: BoxShape.circle,
    //                                         image: DecorationImage(
    //                                           fit: BoxFit.fill,
    //                                           image: NetworkImage(
    //                                             snapshot
    //                                                 .data
    //                                                 .data[first]
    //                                                 .details
    //                                                 .authordetails[second]
    //                                                 .user
    //                                                 .userImage,
    //                                           ),
    //                                         ),
    //                                       ),
    //                                     ),
    //                                     SizedBox(
    //                                       width: 10.0,
    //                                     ),
    //                                     Column(
    //                                       crossAxisAlignment:
    //                                       CrossAxisAlignment.start,
    //                                       mainAxisAlignment: MainAxisAlignment.start,
    //                                       children: [
    //                                         Text(
    //                                           '${snapshot.data.data[first].details.authordetails[second].user.firstName == null ? '' : snapshot.data.data[first].details.authordetails[second].user.firstName}' +
    //                                               ' ${snapshot.data.data[first].details.authordetails[second].user?.lastName == null ? '' : snapshot.data.data[first].details.authordetails[second].user?.lastName}',
    //                                           style: TextStyle(
    //                                               fontSize: 18.0,
    //                                               fontWeight: FontWeight.bold),
    //                                         ),
    //                                         Text(
    //                                           '${snapshot.data.data[first].details.authordetails[second].user.authordetails[third].introduction}',
    //                                           softWrap: true,
    //                                           style: TextStyle(
    //                                               fontSize: 11.0, color: Colors.grey),
    //                                         ),
    //                                         Text(
    //                                           DateTimeAgo.timeAgoSinceDate(
    //                                               '${snapshot.data.data[first].feedDate}'),
    //                                           style: TextStyle(
    //                                             fontSize: 11.0,
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 SizedBox(
    //                                   height: 10.0,
    //                                 ),
    //                                 GestureDetector(
    //                                   onTap: () {
    //                                     // model.navigateToVoicesView();
    //                                   },
    //                                   child: Container(
    //                                     decoration: BoxDecoration(
    //                                         border: Border.all(color: Colors.grey)),
    //                                     child: Column(
    //                                       crossAxisAlignment:
    //                                       CrossAxisAlignment.start,
    //                                       mainAxisAlignment: MainAxisAlignment.start,
    //                                       children: [
    //                                         Container(
    //                                           height: 250.0,
    //                                           width: 330.0,
    //                                           decoration: BoxDecoration(
    //                                             shape: BoxShape.rectangle,
    //                                             image: DecorationImage(
    //                                               fit: BoxFit.fill,
    //                                               image: NetworkImage(
    //                                                 snapshot.data.data[first]
    //                                                     .media[second].mediaPath,
    //                                               ),
    //                                             ),
    //                                           ),
    //                                         ),
    //                                         // Image.network(snapshot.data.data[first].media[second].mediaPath),
    //                                         SizedBox(
    //                                           height: 10.0,
    //                                         ),
    //                                         Padding(
    //                                           padding: const EdgeInsets.all(10.0),
    //                                           child: Row(
    //                                             crossAxisAlignment:
    //                                             CrossAxisAlignment.start,
    //                                             mainAxisAlignment:
    //                                             MainAxisAlignment.spaceBetween,
    //                                             children: [
    //                                               Text(
    //                                                 '${snapshot.data.data[first].categorymapping[second].category.category}',
    //                                               ),
    //                                               Container(
    //                                                 height: 20,
    //                                                 width: 20,
    //                                                 child: GestureDetector(
    //                                                   child: isBookmark == false
    //                                                       ? SvgPicture.asset(
    //                                                       "assets/svg/tag_inactive.svg")
    //                                                       : SvgPicture.asset(
    //                                                       "assets/svg/tag_active.svg"),
    //                                                   onTap: () {
    //                                                     if (sptoken.data == null) {
    //                                                       Scaffold.of(context)
    //                                                           .showSnackBar(
    //                                                         SnackBar(
    //                                                           action: SnackBarAction(
    //                                                             label: 'Undo',
    //                                                             onPressed: () {},
    //                                                           ),
    //                                                           content: Text(
    //                                                               'You are not Login'),
    //                                                         ),
    //                                                       );
    //                                                     } else {
    //                                                       setState(() {
    //                                                         // toggleBookmark();
    //                                                       });
    //                                                     }
    //                                                   },
    //                                                 ),
    //                                               ),
    //                                             ],
    //                                           ),
    //                                         ),
    //                                         SizedBox(
    //                                           height: 5.0,
    //                                         ),
    //                                         Padding(
    //                                           padding: const EdgeInsets.all(10.0),
    //                                           child: Text(
    //                                             '${snapshot.data.data[first].feedTitle}',
    //                                             textAlign: TextAlign.left,
    //                                             softWrap: true,
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 SizedBox(height: 10.0),
    //                                 Padding(
    //                                   padding: const EdgeInsets.all(10.0),
    //                                   child: Row(
    //                                     crossAxisAlignment: CrossAxisAlignment.start,
    //                                     mainAxisAlignment: MainAxisAlignment.start,
    //                                     children: <Widget>[
    //                                       Text(
    //                                         ' ${snapshot.data.data[first].feedLikeCnt} like',
    //                                       ),
    //                                       Padding(
    //                                         padding: const EdgeInsets.only(
    //                                             left: 8.0, right: 8.0),
    //                                         child: Text('.'),
    //                                       ),
    //                                       Text(
    //                                         '${snapshot.data.data[first].feedCommentCnt} comment',
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 Divider(
    //                                   color: Colors.grey,
    //                                 ),
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(bottom: 8.0),
    //                                   child: Row(
    //                                     crossAxisAlignment: CrossAxisAlignment.start,
    //                                     mainAxisAlignment:
    //                                     MainAxisAlignment.spaceEvenly,
    //                                     children: <Widget>[
    //                                       Padding(
    //                                         padding: const EdgeInsets.only(top: 12.0),
    //                                         child: Row(
    //                                           children: [
    //                                             SvgPicture.asset(
    //                                               'assets/svg/like_gray.svg',
    //                                               height: 20,
    //                                               width: 20,
    //                                             ),
    //                                             SizedBox(
    //                                               width: 10.0,
    //                                             ),
    //                                             GestureDetector(
    //                                               child: Text(
    //                                                 'Like',
    //                                               ),
    //                                               onTap: () {
    //                                                 if (sptoken.data == null) {
    //                                                   Scaffold.of(context)
    //                                                       .showSnackBar(
    //                                                     SnackBar(
    //                                                       action: SnackBarAction(
    //                                                         label: 'Undo',
    //                                                         onPressed: () {},
    //                                                       ),
    //                                                       content: Text(
    //                                                           'You are not Login'),
    //                                                     ),
    //                                                   );
    //                                                 } else {
    //                                                   setState(() {
    //                                                     toggleVisibility();
    //                                                   });
    //                                                 }
    //                                               },
    //                                             ),
    //                                           ],
    //                                         ),
    //                                       ),
    //                                       SizedBox(
    //                                         width: 5,
    //                                       ),
    //                                       Padding(
    //                                         padding: const EdgeInsets.only(top: 12.0),
    //                                         child: GestureDetector(
    //                                           onTap: () async {
    //                                             if (sptoken.data == null) {
    //                                               Scaffold.of(context).showSnackBar(
    //                                                 SnackBar(
    //                                                   action: SnackBarAction(
    //                                                     label: 'Undo',
    //                                                     onPressed: () {},
    //                                                   ),
    //                                                   content:
    //                                                   Text('You are not Login'),
    //                                                 ),
    //                                               );
    //                                             } else {
    //                                               setState(() {
    //                                                 toggleVisibility();
    //                                               });
    //                                             }
    //                                           },
    //                                           child: Row(
    //                                             crossAxisAlignment:
    //                                             CrossAxisAlignment.start,
    //                                             mainAxisAlignment:
    //                                             MainAxisAlignment.spaceEvenly,
    //                                             children: [
    //                                               SvgPicture.asset(
    //                                                 'assets/svg/comment.svg',
    //                                                 height: 20,
    //                                                 width: 20,
    //                                                 color: isVisible
    //                                                     ? Colors.pink
    //                                                     : Colors.black,
    //                                               ),
    //                                               SizedBox(
    //                                                 width: 10.0,
    //                                               ),
    //                                               Text(
    //                                                 'Comment',
    //                                                 style: TextStyle(
    //                                                   color: isVisible
    //                                                       ? Colors.pink
    //                                                       : Colors.black,
    //                                                 ),
    //                                               ),
    //                                             ],
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       SizedBox(
    //                                         width: 2,
    //                                       ),
    //                                       PopupView(),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 Visibility(
    //                                   visible: isVisible,
    //                                   child: Container(
    //                                     child: Column(
    //                                       children: [
    //                                         Divider(color: Colors.grey),
    //                                         SizedBox(
    //                                           height: 5.0,
    //                                         ),
    //                                         Row(
    //                                           mainAxisSize: MainAxisSize.max,
    //                                           mainAxisAlignment:
    //                                           MainAxisAlignment.start,
    //                                           children: [
    //                                             Text(
    //                                               'Commenting as ',
    //                                               style: TextStyle(
    //                                                 fontSize: 16,
    //                                                 color: Colors.grey,
    //                                               ),
    //                                             ),
    //                                             onChecked
    //                                                 ? Text(
    //                                               'Anonymous',
    //                                               style: TextStyle(
    //                                                 fontSize: 16,
    //                                               ),
    //                                             )
    //                                                 : Text(
    //                                               'Name',
    //                                               style: TextStyle(
    //                                                 fontSize: 16,
    //                                               ),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                         SizedBox(
    //                                           height: 10.0,
    //                                         ),
    //                                         Row(
    //                                           children: [
    //                                             Container(
    //                                               height: 30,
    //                                               width: 20,
    //                                               child: Checkbox(
    //                                                 onChanged: (newValue) {
    //                                                   setState(() {
    //                                                     onChecked = !onChecked;
    //                                                   });
    //                                                 },
    //                                                 value: onChecked,
    //                                               ),
    //                                             ),
    //                                             SizedBox(
    //                                               width: 5.0,
    //                                             ),
    //                                             Text(
    //                                               'Anonymous',
    //                                               style: TextStyle(
    //                                                 fontSize: 16,
    //                                               ),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                         SizedBox(
    //                                           height: 10.0,
    //                                         ),
    //                                         Row(
    //                                           mainAxisAlignment:
    //                                           MainAxisAlignment.start,
    //                                           crossAxisAlignment:
    //                                           CrossAxisAlignment.start,
    //                                           children: [
    //                                             Padding(
    //                                               padding: const EdgeInsets.only(
    //                                                   right: 6.0, top: 8.0),
    //                                               child: onChecked
    //                                                   ? SvgPicture.asset(
    //                                                 'assets/svg/anyonmans.svg',
    //                                                 height: 40,
    //                                               )
    //                                                   : Image.asset(
    //                                                 'assets/images/onboarding0.png',
    //                                                 height: 40,
    //                                               ),
    //                                             ),
    //                                             Expanded(
    //                                               child: Container(
    //                                                 width: 150,
    //                                                 child: TextField(
    //                                                   decoration: InputDecoration(
    //                                                       hintText:
    //                                                       'Start typing your comment...',
    //                                                       enabledBorder:
    //                                                       OutlineInputBorder(
    //                                                         borderSide: BorderSide(
    //                                                             color: Colors.grey),
    //                                                       ),
    //                                                       focusedBorder:
    //                                                       OutlineInputBorder(
    //                                                           borderSide:
    //                                                           BorderSide(
    //                                                               color: Colors
    //                                                                   .pink))),
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                             Padding(
    //                                               padding: const EdgeInsets.only(
    //                                                   left: 6.0),
    //                                               child: GestureDetector(
    //                                                 onTap: () {},
    //                                                 child: ClipOval(
    //                                                   child: Container(
    //                                                     color: Colors.grey,
    //                                                     height: 55,
    //                                                     width: 55,
    //                                                     child: Center(
    //                                                       child: SvgPicture.asset(
    //                                                         'assets/svg/send.svg',
    //                                                         height: 25,
    //                                                         width: 25,
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                         SizedBox(
    //                                           height: 10,
    //                                         ),
    //                                         Visibility(
    //                                           visible: isProgress,
    //                                           child: CircularProgressIndicator(),
    //                                         ),
    //                                         SizedBox(
    //                                           height: 10,
    //                                         ),
    //                                         SizedBox(
    //                                           height: 100,
    //                                           child: Column(
    //                                             children: [
    //                                               Expanded(
    //                                                 child: ListView(
    //                                                   children: [
    //                                                     Row(
    //                                                       children: [
    //                                                         Padding(
    //                                                           padding:
    //                                                           const EdgeInsets
    //                                                               .only(
    //                                                               right: 6.0),
    //                                                           child: SvgPicture.asset(
    //                                                             'assets/svg/anyonmans.svg',
    //                                                             height: 40,
    //                                                           ),
    //                                                         ),
    //                                                         SizedBox(
    //                                                           width: 5.0,
    //                                                         ),
    //                                                         Column(
    //                                                           mainAxisAlignment:
    //                                                           MainAxisAlignment
    //                                                               .start,
    //                                                           crossAxisAlignment:
    //                                                           CrossAxisAlignment
    //                                                               .start,
    //                                                           children: [
    //                                                             Text(
    //                                                               'Mirza',
    //                                                               style: TextStyle(
    //                                                                   color: Colors
    //                                                                       .black,
    //                                                                   fontSize: 16),
    //                                                             ),
    //                                                             SizedBox(
    //                                                               height: 5.0,
    //                                                             ),
    //                                                             Text(
    //                                                               'comment 1',
    //                                                               style: TextStyle(
    //                                                                   color: Colors
    //                                                                       .blueGrey,
    //                                                                   fontSize: 14),
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ],
    //                                                     ),
    //                                                     SizedBox(
    //                                                       height: 10.0,
    //                                                     ),
    //                                                     Row(
    //                                                       children: [
    //                                                         Padding(
    //                                                           padding:
    //                                                           const EdgeInsets
    //                                                               .only(
    //                                                               right: 6.0),
    //                                                           child: SvgPicture.asset(
    //                                                             'assets/svg/anyonmans.svg',
    //                                                             height: 40,
    //                                                           ),
    //                                                         ),
    //                                                         SizedBox(
    //                                                           width: 5.0,
    //                                                         ),
    //                                                         Column(
    //                                                           mainAxisAlignment:
    //                                                           MainAxisAlignment
    //                                                               .start,
    //                                                           crossAxisAlignment:
    //                                                           CrossAxisAlignment
    //                                                               .start,
    //                                                           children: [
    //                                                             Text(
    //                                                               'Mirza',
    //                                                               style: TextStyle(
    //                                                                   color: Colors
    //                                                                       .black,
    //                                                                   fontSize: 16),
    //                                                             ),
    //                                                             SizedBox(
    //                                                               height: 5.0,
    //                                                             ),
    //                                                             Text(
    //                                                               'comment 2',
    //                                                               style: TextStyle(
    //                                                                   color: Colors
    //                                                                       .blueGrey,
    //                                                                   fontSize: 14),
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ],
    //                                                     ),
    //                                                     SizedBox(
    //                                                       height: 10.0,
    //                                                     ),
    //                                                     Row(
    //                                                       children: [
    //                                                         Padding(
    //                                                           padding:
    //                                                           const EdgeInsets
    //                                                               .only(
    //                                                               right: 6.0),
    //                                                           child: SvgPicture.asset(
    //                                                             'assets/svg/anyonmans.svg',
    //                                                             height: 40,
    //                                                           ),
    //                                                         ),
    //                                                         SizedBox(
    //                                                           width: 5.0,
    //                                                         ),
    //                                                         Column(
    //                                                           mainAxisAlignment:
    //                                                           MainAxisAlignment
    //                                                               .start,
    //                                                           crossAxisAlignment:
    //                                                           CrossAxisAlignment
    //                                                               .start,
    //                                                           children: [
    //                                                             Text(
    //                                                               'Mirza',
    //                                                               style: TextStyle(
    //                                                                   color: Colors
    //                                                                       .black,
    //                                                                   fontSize: 16),
    //                                                             ),
    //                                                             SizedBox(
    //                                                               height: 5.0,
    //                                                             ),
    //                                                             Text(
    //                                                               'comment 3',
    //                                                               style: TextStyle(
    //                                                                   color: Colors
    //                                                                       .blueGrey,
    //                                                                   fontSize: 14),
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ],
    //                                                     ),
    //                                                   ],
    //                                                 ),
    //                                               ),
    //                                             ],
    //                                           ),
    //                                         ),
    //                                         SizedBox(
    //                                           height: 10,
    //                                         ),
    //                                         Divider(
    //                                           color: Colors.grey,
    //                                         ),
    //                                         SizedBox(
    //                                           height: 10,
    //                                         ),
    //                                         // GestureDetector(
    //                                         //   child: Text('load more'),
    //                                         //   onTap: isProgressing,
    //                                         // ),
    //                                         SizedBox(
    //                                           height: 20,
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                       );
    //                     } else if (snapshot.error) {
    //                       return Text('${snapshot.error}');
    //                     } else {
    //                       return Center(
    //                         child: CircularProgressIndicator(),
    //                       );
    //                     }
    //                   },
    //                 );
    //               } else if (snapshot.error) {
    //                 return Text('${snapshot.error}');
    //               } else {
    //                 return Center(
    //                   child: CircularProgressIndicator(),
    //                 );
    //               }
    //             },
    //           );
    //         }
    //       } else if (snapshot.error) {
    //         return Text('${snapshot.error}');
    //       } else {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //     },
    //   );,
    // );
  }
}
