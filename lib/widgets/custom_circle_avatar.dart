import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({required this.size, this.avatarUrl});

  final String? avatarUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: ClipOval(
          child: Image.network(
            avatarUrl ?? '',
            errorBuilder: (_, __, ___) {
              return SvgPicture.asset('assets/default-icon.svg');
            },
            fit: BoxFit.cover,
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }
}
