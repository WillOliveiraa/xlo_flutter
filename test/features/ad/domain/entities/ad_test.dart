import 'package:flutter_test/flutter_test.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';

void main() {
  group('should check if field is valid or not', () {
    test('title, description, price, images, category', () {
      // title
      expect(
          AdEntity(
            title: '',
            description: 'description',
            price: 0,
            images: [],
            category: CategoryEntity(description: ''),
          ).isValidTitle,
          false);
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 0,
            images: [''],
            category: CategoryEntity(description: ''),
          ).isValidTitle,
          false);
      expect(
          AdEntity(
            title: 'New ad test',
            description: 'description',
            price: 0,
            images: [''],
            category: CategoryEntity(description: ''),
          ).isValidTitle,
          true);

      // description
      expect(
          AdEntity(
            title: 'New ad',
            description: '',
            price: 0,
            images: [''],
            category: CategoryEntity(description: ''),
          ).isValidDescription,
          false);
      expect(
          AdEntity(
            title: 'New ad',
            description: 'teste',
            price: 0,
            images: [''],
            category: CategoryEntity(description: ''),
          ).isValidDescription,
          false);
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 0,
            images: [''],
            category: CategoryEntity(description: ''),
          ).isValidDescription,
          true);

      // price
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: -1,
            images: [''],
            category: CategoryEntity(description: ''),
          ).isValidPrice,
          false);
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 0,
            images: [''],
            category: CategoryEntity(description: ''),
          ).isValidPrice,
          false);
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 100.00,
            images: [''],
            category: CategoryEntity(description: ''),
          ).isValidPrice,
          true);

      // images
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 100.00,
            images: [],
            category: CategoryEntity(description: ''),
          ).isValidImages,
          false);
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 100.00,
            images: [''],
            category: CategoryEntity(description: ''),
          ).isValidImages,
          true);

      // category
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 100.00,
            images: [''],
            category: CategoryEntity(description: ''),
          ).isValidCategory,
          false);
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 100.00,
            images: [''],
            category: CategoryEntity(description: 'new category'),
          ).isValidCategory,
          true);
    });
  });
}
