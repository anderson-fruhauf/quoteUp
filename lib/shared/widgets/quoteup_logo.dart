import 'package:flutter/material.dart';

class QuoteUpLogo extends StatelessWidget {
  final double size;
  final bool showText;
  final Color? color;

  const QuoteUpLogo({
    super.key,
    this.size = 40,
    this.showText = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final logoColor = color ?? colorScheme.primary;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: logoColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.compare_arrows,
              size: size * 0.6,
              color: logoColor,
            ),
          ),
        ),
        if (showText) ...[
          const SizedBox(width: 8),
          Text(
            'QuoteUp',
            style: TextStyle(
              fontSize: size * 0.7,
              fontWeight: FontWeight.bold,
              color: logoColor,
            ),
          ),
        ],
      ],
    );
  }
}
