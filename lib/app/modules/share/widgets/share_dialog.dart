import 'package:flutter/material.dart';
import 'package:getx_pronunciation_checker/app/common/extensions/text.dart';

class ShareDialog extends StatelessWidget {
  final VoidCallback? onShare;
  final VoidCallback? onMaybeLater;

  const ShareDialog({
    Key? key,
    this.onShare,
    this.onMaybeLater,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade900.withOpacity(0.7),
              Colors.black.withOpacity(0.7),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 0.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'New achievement',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Congratulations!\nYou correctly pronounced 10 words.\nDo you like to share it with friends?\nYou will motivate them to learn English.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: onMaybeLater,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    foregroundColor: Colors.white,
                    visualDensity: VisualDensity(horizontal: 2, vertical: 2),
                  ),
                  child: const Text('Maybe later').withStyle(fontSize: 18),
                ),
                FilledButton(
                  onPressed: onShare,
                  style: FilledButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.white.withValues(alpha: 0.15),
                    visualDensity: VisualDensity(horizontal: 2, vertical: 2),
                  ),
                  child: const Text('Share').withStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
