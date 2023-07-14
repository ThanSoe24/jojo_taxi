import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';

import '../../../components/app_bar/app_bar_with_back.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(3.175423581184881, 101.6604333138204),
    zoom: 30,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(
          onBack: () => {Navigator.pop(context)}, title: "Map View"),
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              myLocationButtonEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 230,
                decoration: BoxDecoration(
                  color: ColorManager.black.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)
                  )
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                          width: MediaQuery.of(context).size.width / 2.4,
                          decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  JoJoText("Earnings", style: getBoldStyle(color: ColorManager.grey1,fontSize: 14)),
                                  const SizedBox(height: 5,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      JoJoText("RM", style: getBoldStyle(color: ColorManager.grey1)),
                                      JoJoText("0.00", style: getBoldStyle(color: ColorManager.grey1,fontSize: 18))
                                    ],
                                  )
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios,size: 20,)
                            ],
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                          width: MediaQuery.of(context).size.width / 2.4,
                          decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  JoJoText("Credit Wallet", style: getBoldStyle(color: ColorManager.grey1,fontSize: 14)),
                                  const SizedBox(height: 5,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      JoJoText("RM", style: getBoldStyle(color: ColorManager.grey1)),
                                      JoJoText("305.50", style: getBoldStyle(color: ColorManager.grey1,fontSize: 18))
                                    ],
                                  )
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios,size: 20,)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
