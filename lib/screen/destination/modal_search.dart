// ignore_for_file: avoid_print


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screen.dart';
class ModalSearch extends StatefulWidget {
  const ModalSearch({super.key});

  @override
  State<ModalSearch> createState() => _ModalSearchState();
}

class _ModalSearchState extends State<ModalSearch> {
  List searchResult = [];

  @override
  void initState() {
    super.initState();
  }

  void searchFromFirebase(String query) async {
    final result = (await FirebaseFirestore.instance
        .collection('province')
        .where('name', whereIn: [query])
        .get()).docs;

    setState(() {
      searchResult = result.map((e) => e.data()).toList();
      print('=== $searchResult');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // implement the search field
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        suffixIcon: const Icon(Icons.close),
                        hintText: 'Tulis Nama Tempat',
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onChanged: (query) {
                        searchFromFirebase(query.toLowerCase());
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // This button is used to close the search modal
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'))
                ],
              ),

              // display other things like search history, suggestions, search results, etc.
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: searchResult.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        print(searchResult[index]['name']);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                     DestinationScreen(location: searchResult[index]['name'],)));
                      },
                      leading: SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.asset(
                          "assets/dummy.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(searchResult[index]['name']),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}