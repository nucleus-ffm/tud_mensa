String checkFoodTyp(String svg) {
  //print(svg);
  String vegan_schwein =
      "M46.712,39.239c0,0,0.774-2.669,4.078-3.373c0,0,14.752-2.878,19.953-10.255c0,0,4.213-4.917,8.007-5.761";
  String vegan =
      "M44.162,94.582c0,0,2.086,8.959,2.502,12.918h8.645c0,0,0.734-21.045,13.438-53.758c0,0,1.148-3.957,6.049-5.002";
  String vegetarisch =
      "M39.611,94.217c-0.195-1.359-0.625-2.689-0.809-4.051c-0.332-2.598-0.521-5.219-0.857-7.814";
  String gefluegel =
      "M61.57,25.496l-3.566-5.328c-1.227-1.783-2.456-2.668-3.686-2.668c-4.141,0-7.278,1.263-9.427,3.805";
  String schwein =
      "M16.818,70.541c0.086-0.809-0.027-1.58-0.189-2.059c-0.301-0.893-1.549-1.418-2.355-1.221";
  String rind =
      "M11.588,64.559c0,0,0.396,3.15,0.166,4.016c-0.225,0.863,0.088,1.846,0.402,2.719c0.314,0.871,0.514,2.283,0.514,2.283";
  String kalb =
      "M18.479,71.177c0.949,2.273,2,4.518,2.81,6.845c0.331,0.943,0.583,2.336,0.128,3.064c-1.984,3.191-0.586,6.438-0.497,9.655";
  String lamm_schaf =
      "M14.871,48.791c5.109-10.245,20.402-8.984,20.402-8.984s29.256,0.221,39.722,0.221c8.331,0,8.678-2.938,11.999-6.861";
  String wild =
      "M105.193,65.251c-0.362-0.168-0.724-0.336-1.086-0.506c-2.022,2.162-4.047,4.324-6.446,6.889";
  String fisch =
      "M103.08,61.025c1.709,0.131,3.197-1.146,3.328-2.854s-1.146-3.197-2.854-3.328s-3.197,1.148-3.328,2.855";
  String schwein_gefluegel =
      "M98.422,64.103l-0.133-0.42l0.221-0.381c0.027-0.047,0.057-0.099,0.08-0.16c0.352-0.975,0.484-1.499,0.289-1.823";
  String schwein_fisch =
      "M92.666,79.2l8.072-10.285c-1.537,0.035-4.516,0.287-6.846,1.459c-1.664,0.832-3.139,2.102-4.371,3.279";
  String rind_schwein =
      "M117.674,79.048c-0.467-0.301-1.088-0.168-1.391,0.299c-0.017,0.023-1.674,2.49-3.662,2.178";
  String gefluegel_fisch =
      "M20.308,40.923c1.281,0.383,1.574,1.076,1.553,2.185c-0.082,4.248-0.125,8.502-0.281,12.747";

  if (svg.substring(0, 10) == vegan_schwein.substring(0, 10)) {
    return "Vegan & Schwein";
  } else if (svg.substring(0, 10) == vegan.substring(0, 10)) {
    return "Vegan";
  } else if (svg.substring(0, 10) == vegetarisch.substring(0, 10)) {
    return "Vegetarisch";
  } else if (svg.substring(0, 10) == gefluegel.substring(0, 10)) {
    return "Geflügel";
  } else if (svg.substring(0, 10) == schwein.substring(0, 10)) {
    return "Schwein";
  } else if (svg.substring(0, 10) == rind.substring(0, 10)) {
    return "Rind";
  } else if (svg.substring(0, 10) == kalb.substring(0, 10)) {
    return "Kalb";
  } else if (svg.substring(0, 10) == lamm_schaf.substring(0, 10)) {
    return "Lamm & Schaf";
  } else if (svg.substring(0, 10) == wild.substring(0, 10)) {
    return "Wild";
  } else if (svg.substring(0, 10) == fisch.substring(0, 10)) {
    return "Fisch";
  } else if (svg.substring(0, 10) == schwein_gefluegel.substring(0, 10)) {
    return "Schwein & Geflügel";
  } else if (svg.substring(0, 10) == schwein_fisch.substring(0, 10)) {
    return "Schwein & Fisch";
  } else if (svg.substring(0, 10) == rind_schwein.substring(0, 10)) {
    return "Rind & Schwein";
  } else if (svg.substring(0, 10) == gefluegel_fisch.substring(0, 10)) {
    return "Geflügel & Fisch";
  } else {
    return "Überraschung (err)";
  }
}
