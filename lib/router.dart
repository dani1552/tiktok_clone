import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/common/widgets/main_navigation_screen.dart';
import 'package:tiktok_clone/features/autentication/widgets/login_screen.dart';
import 'package:tiktok_clone/features/autentication/widgets/sign_up_screen.dart';
import 'package:tiktok_clone/features/inbox/activity_screen.dart';
import 'package:tiktok_clone/features/inbox/chat_detail_screen.dart';
import 'package:tiktok_clone/features/inbox/chats_screen.dart';
import 'package:tiktok_clone/features/onbording/interests_screen.dart';
import 'package:tiktok_clone/features/videos/video_recording_screen.dart';

final router = GoRouter(
  initialLocation: "/inbox",
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeURL,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: InterestsScreen.routeName,
      path: InterestsScreen.routeURL,
      builder: (context, state) => const InterestsScreen(),
    ),
    GoRoute(
      path: "/:tab(home|discover|inbox|profile)",
      name: MainNavigationScreen.routeName,
      builder: (context, state) {
        final tab = state.params["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
    GoRoute(
      path: ActivityScreen.routeURL,
      name: ActivityScreen.routeName,
      builder: (context, state) => const ActivityScreen(),
    ),
    GoRoute(
      path: ChatsScreen.routeURL,
      name: ChatsScreen.routeName,
      builder: (context, state) => const ChatsScreen(),
      routes: const [],
    ),
    GoRoute(
      path: ChatDetailScreen.routeURL,
      name: ChatDetailScreen.routeName,
      builder: (context, state) {
        final chatId = state.params["chatId"]!;
        return ChatDetailScreen(
          chatId: chatId,
        );
      },
    ),
    GoRoute(
      path: VideoRecordingScreen.routeURL,
      name: VideoRecordingScreen.routeName,
      builder: (context, state) => const VideoRecordingScreen(),
    ),
  ],
);