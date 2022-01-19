import 'package:flutter_test/flutter_test.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';

void main() {
  group('should check if field is valid or not', () {
    test('title, description, price and images', () {
      // title
      expect(
          AdEntity(title: '', description: 'description', price: 0, images: [])
              .isValidTitle,
          false);
      expect(
          AdEntity(
              title: 'New ad',
              description: 'description',
              price: 0,
              images: ['']).isValidTitle,
          true);

      // description
      expect(
          AdEntity(title: 'New ad', description: '', price: 0, images: [''])
              .isValidDescription,
          false);
      expect(
          AdEntity(
              title: 'New ad',
              description: 'teste',
              price: 0,
              images: ['']).isValidDescription,
          false);
      expect(
          AdEntity(
              title: 'New ad',
              description: 'description',
              price: 0,
              images: ['']).isValidDescription,
          true);

      // price
      expect(
          AdEntity(
              title: 'New ad',
              description: 'description',
              price: -1,
              images: ['']).isValidPrice,
          false);
      expect(
          AdEntity(
              title: 'New ad',
              description: 'description',
              price: 0,
              images: ['']).isValidPrice,
          false);
      expect(
          AdEntity(
              title: 'New ad',
              description: 'description',
              price: 100.00,
              images: ['']).isValidPrice,
          true);

      // images
      expect(
          AdEntity(
              title: 'New ad',
              description: 'description',
              price: 100.00,
              images: []).isValidImages,
          false);
      expect(
          AdEntity(
              title: 'New ad',
              description: 'description',
              price: 100.00,
              images: ['']).isValidImages,
          true);
    });
  });
}
