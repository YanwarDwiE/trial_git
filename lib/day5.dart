import 'package:flutter/material.dart';

class Day5 extends StatefulWidget {
  const Day5({super.key});

  @override
  State<Day5> createState() => _Day5State();
}

class _Day5State extends State<Day5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class _Day5 extends State<Day5> {
  //simulasi pengambilan data dari API
  Future<List<String>> fetchData() async {
    return ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FutureBuilder Example'),
        ),
        body: FutureBuilder<List<String>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error : ${snapshot.error}',
                ),
              );
            } else if (snapshot.hasData) {
              final items = snapshot.data!;
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      items[index],
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('Tidak ada Data.'));
            }
          },
        ));
  }
}
