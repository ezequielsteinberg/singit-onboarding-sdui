import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    // Use addPostFrameCallback or Future.microtask if calling immediately in initState causing issues,
    // but usually read works fine if just triggering action.
    Future.microtask(() => ref.read(homeProvider.notifier).getPhotos());
  }

  @override
  Widget build(BuildContext context) {
    // Watch the state
    final state = ref.watch(homeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Photos')),
      body: state.when(
        initial: () => const Center(child: Text('Press button to load photos')),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (message) => Center(child: Text('Error: $message')),
        success: (photos) => ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context, index) {
            final photo = photos[index];
            return ListTile(
              leading: Image.network(photo.thumbnailUrl),
              title: Text(photo.title),
              subtitle: Text(photo.url),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(homeProvider.notifier).getPhotos();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
