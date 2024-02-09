import 'package:aamec/pages/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomMaterialPage extends StatelessWidget {
  CustomMaterialPage({super.key});
  final List<List<String>> materials = [
    ['OOPS material', 'staff-1', 'assets/sample.pdf'],
    ['Flutter tutorial', 'staff-2', 'assets/flutter_tutorial.pdf'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          title: const Text(
            "Materials",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          elevation: 13,
          shadowColor: Colors.black,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) => MaterialContainer(
                    postedBy: materials[index][1],
                    title: materials[index][0],
                    assetPath: materials[index][2],
                  ),
                ),
              )
            ]));
  }
}

class MaterialContainer extends StatelessWidget {
  const MaterialContainer({
    super.key,
    required this.postedBy,
    required this.title,
    required this.assetPath,
  });

  final String postedBy;
  final String title;
  final String assetPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.4),
              offset: Offset(-4, 14),
              blurRadius: 10)
        ],
      ),
      height: 150,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/book-1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black.withOpacity(.6),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Title: ",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    FittedBox(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      "Posted By ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      postedBy,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            splashFactory: Myclass()),
                        // style: ButtonStyle(
                        //     splashFactory:
                        //         InkSparkle.constantTurbulenceSeedSplashFactory,
                        //     shadowColor:
                        //         MaterialStatePropertyAll(HexColor("#FC6736"))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                PdfViewerPage(assetPath: assetPath),
                          ));
                        },
                        child: const Text("Click To View")),
                    SizedBox(
                      width: 8,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Myclass extends InteractiveInkFeatureFactory {
  @override
  InteractiveInkFeature create(
      {required MaterialInkController controller,
      required RenderBox referenceBox,
      required Offset position,
      required Color color,
      required TextDirection textDirection,
      bool containedInkWell = false,
      RectCallback? rectCallback,
      BorderRadius? borderRadius,
      ShapeBorder? customBorder,
      double? radius,
      VoidCallback? onRemoved}) {
    // TODO: implement create
    throw UnimplementedError();
  }
}
