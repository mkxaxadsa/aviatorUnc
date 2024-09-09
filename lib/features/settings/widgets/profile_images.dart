import 'package:flutter/cupertino.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/db/prefs.dart';

class ProfileImages extends StatefulWidget {
  const ProfileImages({super.key, required this.onImage});

  final void Function(int) onImage;

  @override
  State<ProfileImages> createState() => _ProfileImagesState();
}

class _ProfileImagesState extends State<ProfileImages> {
  int imageID = 1;

  void selectImage(int id) async {
    widget.onImage(id);
    setState(() {
      imageID = id;
    });
  }

  @override
  void initState() {
    super.initState();
    imageID = profileImageID;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(),
      child: ListView(
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 24),
          _Image(
            id: 1,
            active: imageID == 1,
            onPressed: selectImage,
          ),
          _Image(
            id: 2,
            active: imageID == 2,
            onPressed: selectImage,
          ),
          _Image(
            id: 3,
            active: imageID == 3,
            onPressed: selectImage,
          ),
          _Image(
            id: 4,
            active: imageID == 4,
            onPressed: selectImage,
          ),
          _Image(
            id: 5,
            active: imageID == 5,
            onPressed: selectImage,
          ),
          _Image(
            id: 6,
            active: imageID == 6,
            onPressed: selectImage,
          ),
          _Image(
            id: 7,
            active: imageID == 7,
            onPressed: selectImage,
          ),
          _Image(
            id: 8,
            active: imageID == 8,
            onPressed: selectImage,
          ),
          _Image(
            id: 9,
            active: imageID == 9,
            onPressed: selectImage,
          ),
          _Image(
            id: 10,
            active: imageID == 10,
            onPressed: selectImage,
          ),
          _Image(
            id: 11,
            active: imageID == 11,
            onPressed: selectImage,
          ),
          _Image(
            id: 12,
            active: imageID == 12,
            onPressed: selectImage,
          ),
          const SizedBox(width: 21),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    required this.id,
    required this.active,
    required this.onPressed,
  });

  final int id;
  final bool active;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.only(right: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: active
            ? Border.all(
                width: 3,
                color: AppColors.main,
              )
            : null,
      ),
      child: CupertinoButton(
        onPressed: () {
          onPressed(id);
        },
        padding: EdgeInsets.zero,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              'assets/p$id.png',
              height: 64,
              width: 64,
            ),
          ),
        ),
      ),
    );
  }
}
