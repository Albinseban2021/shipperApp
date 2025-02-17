import 'package:get/get.dart';

class TruckFilterVariablesForPostLoad {
  List truckTypeTextList = [
    // 'Open Body',
    'openbody'.tr,
    // 'Flatbed',
    'flatbed'.tr,
    // 'Trailer Dala Body',
    'trailerbody'.tr,
    // 'Standard Container',
    'standardcontainer'.tr,
    // 'High Cube Container'
    'highcontainer'.tr,
    'Tanker',
    'Tipper',
    'Bulker',
    'LCV Open Body',
    'LCV Container',
    'Mini / Pickup Truck'
  ];

  List truckTypeValueList = [
    // 'OPEN_HALF_BODY',
    'OPEN_BODY',
    'FLATBED',
    // 'HALF_BODY_TRAILER',
    'TRAILER_BODY',
    'STANDARD_CONTAINER',
    'HIGH_CUBE_CONTAINER',
    'Tanker',
    'Tipper',
    'Bulker',
    'LCV_Open_Body',
    'LCV_Container',
    'Mini_Pickup_Truck'
  ];

  Map<String, List<int>> passingWeightList = {
    // 'OPEN_HALF_BODY': [7, 8, 9, 15, 16, 18, 19, 20, 21, 24, 25, 30, 0],
    'OPEN_BODY': [7, 8, 9, 15, 16, 18, 19, 20, 21, 24, 25, 30, 0],
    'FLATBED': [16, 21, 24, 30, 32, 33, 34, 40, 0],
    // 'HALF_BODY_TRAILER': [
    //   27,
    //   28,
    //   29,
    //   30,
    //   31,
    //   32,
    //   33,
    //   34,
    //   35,
    //   36,
    //   37,
    //   38,
    //   39,
    //   40,
    //   41,
    //   42,
    //   0
    // ],
    'TRAILER_BODY': [
      27,
      28,
      29,
      30,
      31,
      32,
      33,
      34,
      35,
      36,
      37,
      38,
      39,
      40,
      41,
      42,
      0
    ],
    'STANDARD_CONTAINER': [6, 7, 9, 15, 18, 0],
    'HIGH_CUBE_CONTAINER': [6, 7, 9, 15, 18, 0],

    'Tanker': [
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25,
      26,
      27,
      28,
      29,
      30,
      31,
      32,
      33,
      34,
      35,
      36
    ],
    'Tipper': [
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25,
      26,
      27,
      28,
      29,
      30
    ],
    'Bulker': [21, 22, 23, 24, 25, 26, 27, 28, 29, 30],
    'LCV_Open_Body': [2, 3, 4, 5, 6, 7],
    'LCV_Container': [6, 7],
    'Mini_Pickup_Truck': [6, 8, 10],
  };

  Map<String, List<int>> totalTyresList = {
    // 'OPEN_HALF_BODY': [6, 8, 10, 12, 14, 16, 18, 20, 22,],
    'OPEN_BODY': [
      6,
      8,
      10,
      12,
      14,
      16,
      18,
      20,
      22,
    ],
    'FLATBED': [
      6,
      8,
      10,
      12,
      14,
      16,
      18,
      20,
      22,
    ],
    // 'HALF_BODY_TRAILER': [6, 8, 10, 12, 14, 16, 18, 20, 22,],
    'TRAILER_BODY': [
      6,
      8,
      10,
      12,
      14,
      16,
      18,
      20,
      22,
    ],
    'STANDARD_CONTAINER': [
      6,
      8,
      10,
      12,
      14,
      16,
      18,
      20,
      22,
    ],
    'HIGH_CUBE_CONTAINER': [
      6,
      8,
      10,
      12,
      14,
      16,
      18,
      20,
      22,
    ],
    'Tanker': [
      6,
      8,
      10,
      12,
      14,
      16,
      18,
      20,
      22,
    ],
    'Tipper': [
      6,
      8,
      10,
      12,
      14,
      16,
      18,
      20,
      22,
    ],
    'Bulker': [
      6,
      8,
      10,
      12,
      14,
      16,
      18,
      20,
      22,
    ],
    'LCV_Open_Body': [
      6,
      8,
      10,
      12,
      14,
      16,
      18,
      20,
      22,
    ],
    'LCV_Container': [
      6,
      8,
      10,
      12,
      14,
      16,
      18,
      20,
      22,
    ],
    'Mini_Pickup_Truck': [
      6,
      8,
      10,
      12,
      14,
      16,
      18,
      20,
      22,
    ],
  };

  Map<String, List<int>> truckLengthList = {
    'OPEN_HALF_BODY': [40, 10, 0],
    'FLATBED': [10, 20, 50, 0],
    'HALF_BODY_TRAILER': [20, 40, 0],
    'STANDARD_CONTAINER': [10, 60, 0],
    'HIGH_CUBE_CONTAINER': [40, 50, 60, 0],
    'Tanker': [0, 0],
    'Tipper': [0, 0],
    'Bulker': [0, 0],
    'LCV_Open_Body': [0, 0],
    'LCV_Container': [0, 0],
    'Mini_Pickup_Truck': [0, 0],
  };
}
