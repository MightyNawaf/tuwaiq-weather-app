// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:weather_api/screens/home_screen.dart';

// import '../main.dart';

// class BackgroundVideoState extends State<BackgroundVideo> {
//   late VideoPlayerController controller;

//   @override
//   void initState() {
//     super.initState();

//     controller = VideoPlayerController.asset("backgrounds/cloudy_bg.mp4")
//       ..initialize().then((_) {
//         controller.play();
//         controller.setLooping(true);

//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
// 	  darkTheme: ThemeData.dark(),
//       home: SafeArea(
//         child: Scaffold(
//           body: Stack(
//             children: <Widget>[
//               SizedBox.expand(
//                 child: FittedBox(
//                   fit: BoxFit.fill,
//                   child: SizedBox(
//                     width: controller.value.size.width,
//                     height: controller.value.size.height,
//                     child: VideoPlayer(controller),
//                   ),
//                 ),
//               ),
//               const HomeScreen()
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//   }
// }
