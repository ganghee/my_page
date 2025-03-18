import 'package:flutter/material.dart';

class BakingVo {
  final String name;
  final String imageUrl;
  final String description;
  final Color color;

  BakingVo({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.color,
  });
}

List<BakingVo> bakings = [
  BakingVo(name: '크로와상', imageUrl: '', description: '', color: Colors.red),
  BakingVo(name: '크로와상', imageUrl: '', description: '', color: Colors.blue),
  BakingVo(name: '크로와상', imageUrl: '', description: '', color: Colors.green),
  BakingVo(name: '크로와상', imageUrl: '', description: '', color: Colors.pinkAccent),
  BakingVo(name: '크로와상', imageUrl: '', description: '', color: Colors.white),
];
