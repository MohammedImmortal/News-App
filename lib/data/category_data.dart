import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

const List<CategoryModel> categories = [
  CategoryModel(
    title: 'General',
    image: 'assets/general.jpeg',
    icon: Icons.category,
  ),
  CategoryModel(
    title: 'Science',
    image: 'assets/science.avif',
    icon: Icons.science,
  ),
  CategoryModel(
    title: 'Business',
    image: 'assets/business.jpeg',
    icon: Icons.business,
  ),
  CategoryModel(
    title: 'Technology',
    image: 'assets/technology.jpeg',
    icon: Icons.computer,
  ),
  CategoryModel(
    title: 'Health',
    image: 'assets/health.avif',
    icon: Icons.local_hospital,
  ),
  CategoryModel(
    title: 'Sports',
    image: 'assets/sports.jpg',
    icon: Icons.sports_score,
  ),
  CategoryModel(
    title: 'Entertainment',
    image: 'assets/entertainment.avif',
    icon: Icons.local_movies,
  ),
];
