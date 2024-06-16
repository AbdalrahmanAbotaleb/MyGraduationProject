import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylast2gproject/src/core/widgets/widgets.dart';
import 'package:mylast2gproject/src/features/ScanningHome/presentation/widgets/diseases_details.dart';
import '../controllers/scan_controller.dart';

class ScanPage extends StatelessWidget {
  final ScanController controller = Get.put(ScanController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff2c2e29),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Obx(
            () => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  controller.loading
                      ? Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: height * 0.4,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage('assets/images/1.png')),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              (controller.image != null)
                                  ?
                              ScanFrame.ScanFrame(width: width, height: height, controller: controller)

                                  : Container(
                                      height: height * 0.4,
                                      width: width * 0.9,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: const DecorationImage(
                                            fit: BoxFit.contain,
                                            image: AssetImage(
                                                'assets/images/1.png')),
                                      ),
                                    ),
                              const SizedBox(height: 10),
                              if (controller.diagnosisList.isNotEmpty)
                                Text(
                                  controller.diagnosisList.last['disease'] ??
                                      '',
                                  style: GoogleFonts.robotoCondensed(
                                      fontSize: 20, color: Colors.white),
                                ),
                            ],
                          ),
                        ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(-0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [
                            Color(0xFF6CF642),
                            Color(0xFF72CE3E),
                            Color(0xFF40731D)
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 21,
                            offset: Offset(0, 20),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      height: 50,
                      width: width * 0.55,
                      child: MaterialButton(
                        onPressed: controller.loadImageCamera,
                        color: Colors.transparent,
                        child: const Text(
                          'Capture Image',
                          style: TextStyle(color: Color(0xffffffff)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(-0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [
                            Color(0xFF6CF642),
                            Color(0xFF72CE3E),
                            Color(0xFF40731D)
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 21,
                            offset: Offset(0, 20),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      height: 50,
                      width: width * 0.55,
                      child: MaterialButton(
                        onPressed: controller.loadImageGallery,
                        color: Colors.transparent,
                        child: const Text(
                          'Pick Image from Gallery',
                          style: TextStyle(color: Color(0xffffffff)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.diagnosisList.length,
                      itemBuilder: (context, index) {
                        final Key itemKey = UniqueKey();
                        return FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: width * 0.9,
                              height: height * 0.12,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [
                                    Color(0xFF1E1E1E),
                                    Color(0x7F353933)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x33000000),
                                    blurRadius: 36,
                                    offset: Offset(0, 15),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: ListTile(
                                key: itemKey,
                                leading: Image.file(
                                  controller.diagnosisList[index]['image'],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: width * 0.35,
                                      child: Text(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        controller.diagnosisList[index]
                                                ['disease'] ??
                                            '',
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                    customButton(() {
                                      Get.to(() => DiagnosisDetailsPage(
                                            image: controller
                                                .diagnosisList[index]['image'],
                                            disease:
                                                controller.diagnosisList[index]
                                                    ['disease'],
                                          ));
                                    })
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    controller.removeDiagnosis(index);
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget customButton(VoidCallback func) {
  return InkWell(
    onTap: func,
    child: Container(
      width: 28,
      height: 27,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-0.00, -2.00),
          end: Alignment(0, 1),
          colors: [Color(0xFFD5EBCB), Color(0xFF9CED6B), Color(0xFF579133)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 21,
            offset: Offset(0, 20),
            spreadRadius: 0,
          )
        ],
      ),
      child: const Icon(
        Icons.arrow_forward_sharp,
        color: Colors.white,
      ),
    ),
  );
}
