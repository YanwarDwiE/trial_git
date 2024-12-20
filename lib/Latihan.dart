import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class Latihan extends StatefulWidget {
  const Latihan({super.key});

  @override
  State<Latihan> createState() => _LatihanState();
}

class _LatihanState extends State<Latihan> {
  List<Map<String, dynamic>> detailMobil = [
    {'type': 'Yaris', 'roda': 4, 'pintu': 4},
    {'type': 'Vios', 'roda': 4, 'pintu': 4},
    {'type': 'Innova', 'roda': 4, 'pintu': 4},
    {'type': 'Sienta', 'roda': 4, 'pintu': 4},
  ];

  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10)), //Box decoration
                  child: Image.asset(
                      'assets/images/Toyota_logo.png') //memanggil gambar
                  ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Nama Kendaraan',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Tombol 1");
                      setState(() {
                        isActive = true;
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Center(
                        child: Text("Show Data"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      print("Tombol 2");
                      setState(() {
                        isActive = false;
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Center(
                        child: Text("Delete"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      print("Tombol 3");
                      setState(() {
                        isActive = true;
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Center(
                        child: Text("Show"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (isActive == true) ...{
                ListView.separated(
                    shrinkWrap: true,
                    itemCount: detailMobil.length,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemBuilder: (context, Index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Image.asset('assets/images/Altis.png'),
                          Text(
                            "Type :${detailMobil[Index]['type']}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Roda : ${detailMobil[Index]['roda']}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Pintu :${detailMobil[Index]['pintu']}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    })
              }
            ],
          ),
        ),
      ),
    );
  }
}

class AweseomSnackBarExample extends StatelessWidget {
  const AweseomSnackBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('Show Awesome SnackBar'),
              onPressed: () {
                const snackBar = SnackBar(
                  /// need to set following properties for best effect of awesome_snackbar_content
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: 'On Snap!',
                    message:
                        'This is an example error message that will be shown in the body of snackbar!',

                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: ContentType.failure,
                  ),
                );

                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Show Awesome Material Banner'),
              onPressed: () {
                const materialBanner = MaterialBanner(
                  /// need to set following properties for best effect of awesome_snackbar_content
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  forceActionsBelow: true,
                  content: AwesomeSnackbarContent(
                    title: 'Oh Hey!!',
                    message:
                        'This is an example error message that will be shown in the body of materialBanner!',

                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: ContentType.success,
                    // to configure for material banner
                    inMaterialBanner: true,
                  ),
                  actions: [SizedBox.shrink()],
                );

                ScaffoldMessenger.of(context)
                  ..hideCurrentMaterialBanner()
                  ..showMaterialBanner(materialBanner);
              },
            ),
          ],
        ),
      ),
    );
  }
}
