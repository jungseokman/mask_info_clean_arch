import 'package:flutter/material.dart';
import 'package:mask_info_clean_arch/domain/entities/store.dart';

class StoreItem extends StatelessWidget {
  const StoreItem({
    super.key,
    required this.store,
  });

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(store.name),
            Text(store.address),
            Text("${store.distance / 1000.0}km"),
          ],
        ),
        Column(
          children: [
            Text(store.remainStatus),
            const Text("100개 이상"),
          ],
        ),
      ],
    );
  }
}
