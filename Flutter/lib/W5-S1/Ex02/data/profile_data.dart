import 'package:flutter/material.dart';
import '../model/profile_tile_model.dart';
 
ProfileData ronanProfile = ProfileData(
    name: "Sok Sothy",
    position: "Flutter Developer",
    avatarUrl: 'assets/w4-s2/amine.jpg',
    tiles: [
      TileData( icon: Icons.phone, title: "Phone Number", value: "+855 967374728 "),
      TileData(icon: Icons.location_on, title: "Address", value: "st12 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "soksothy@cadt.edu"),
    ]);
