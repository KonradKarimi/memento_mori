import 'package:flutter/material.dart';
import 'package:memento_mori/screens/entry_screen.dart';
import 'package:memento_mori/screens/memento_screen.dart';
import 'package:memento_mori/services/user_data_service.dart';

class SharedPrefGate extends StatelessWidget {
  const SharedPrefGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return snapshot.data == true
                ? const MementoScreen()
                : const EntryData();
          }
          return const EntryData();
        },
        future: UserDataService().checkIfUserDataExistInSharedPref(),
      ),
    );
  }
}
