import 'package:flutter/material.dart';
import 'package:kanna_note/core/network/download.dart';
import '../../constants.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _progress;

  Future<void> _startUpdate() async {
    setState(() {
      _progress = 0;
    });
    await updatePcrDatabase(
      Area.cn,
      onProgress: (rec, total) {
        setState(() {
          _progress = rec / total;
        });
      },
    );
    setState(() {
      _progress = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kanna Note')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Home (Phase 0 Scaffold)'),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => context.go(AppRoutes.settings),
              child: const Text('Go Settings'),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: _progress == null ? _startUpdate : null,
              child: const Text('更新数据库'),
            ),
            if (_progress != null) ...[
              const SizedBox(height: 16),
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(value: _progress),
              ),
              const SizedBox(height: 8),
              Text('${(_progress! * 100).toStringAsFixed(1)}%'),
            ],
          ],
        ),
      ),
    );
  }
}
