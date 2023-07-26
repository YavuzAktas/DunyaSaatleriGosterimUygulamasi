import 'package:flutter/material.dart';
import 'package:world_clock_case/theme/app_theme.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 10),
        ],
        borderRadius: BorderRadius.circular(24), // Make the container oval
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(24), // Make the TextField oval
              ),
              child: Center(
                child: TextField(
                  autofocus: false,
                  onSubmitted: (value) {},
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove the border
                    hintText: 'Arama',
                    prefixIcon: Icon(Icons.search_rounded),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
