import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/autentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/users/repos/videos_repo.dart';
import 'package:tiktok_clone/features/users/view_models/users_view_model.dart';
import 'package:tiktok_clone/features/videos/models/video_model.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideosRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.read(videosRepo);
  }

  Future<void> uploadVideo(File video, BuildContext context) async {
    final user = ref.read(authRepo).user;
    final userProfile = ref.read(usersProvider).value;
    if (userProfile != null) {
      state = const AsyncValue.loading();
      state = const AsyncValue.guard(
        () async {
          final task = await _repository.uploadVideoFile(
            video,
            user!.uid,
          );
          if (task.metadata != null) {
            await _repository.saveVideo(
              VideoModel(
                description: "Hell yeah!",
                fileUrl: await task.ref.getDownloadURL(),
                thumbnailUrl: "",
                likes: 0,
                comments: 0,
                creatorUid: user.uid,
                creator: userProfile.name,
                createdAt: DateTime.now().millisecondsSinceEpoch,
                title: "From Flutter!",
              ),
            );
            context.pushReplacement("/home");
          }
        },
      );
    }
  }
}

final UploadVideoProvider = AsyncNotifierProvider<UploadVideoViewModel, void>(
  () => UploadVideoViewModel(),
);
