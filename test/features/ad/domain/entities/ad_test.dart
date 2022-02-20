import 'package:flutter_test/flutter_test.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';

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
            owner: UserModel(name: '', email: ''),
          ).isValidTitle,
          false);
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 0,
            images: [''],
            category: CategoryEntity(description: ''),
            owner: UserModel(name: '', email: ''),
          ).isValidTitle,
          false);
      expect(
          AdEntity(
            title: 'New ad test',
            description: 'description',
            price: 0,
            images: [''],
            category: CategoryEntity(description: ''),
            owner: UserModel(name: '', email: ''),
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
            owner: UserModel(name: '', email: ''),
          ).isValidDescription,
          false);
      expect(
          AdEntity(
            title: 'New ad',
            description: 'teste',
            price: 0,
            images: [''],
            category: CategoryEntity(description: ''),
            owner: UserModel(name: '', email: ''),
          ).isValidDescription,
          false);
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 0,
            images: [''],
            category: CategoryEntity(description: ''),
            owner: UserModel(name: '', email: ''),
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
            owner: UserModel(name: '', email: ''),
          ).isValidPrice,
          false);
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 0,
            images: [''],
            category: CategoryEntity(description: ''),
            owner: UserModel(name: '', email: ''),
          ).isValidPrice,
          false);
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 100.00,
            images: [''],
            category: CategoryEntity(description: ''),
            owner: UserModel(name: '', email: ''),
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
            owner: UserModel(name: '', email: ''),
          ).isValidImages,
          false);
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 100.00,
            images: [''],
            category: CategoryEntity(description: ''),
            owner: UserModel(name: '', email: ''),
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
            owner: UserModel(name: '', email: ''),
          ).isValidCategory,
          false);
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 100.00,
            images: [''],
            category: CategoryEntity(description: 'new category'),
            owner: UserModel(name: '', email: ''),
          ).isValidCategory,
          true);

      // owner
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 100.00,
            images: [''],
            category: CategoryEntity(description: ''),
            owner: UserModel(name: '', email: ''),
          ).isValidOwner,
          false);
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 100.00,
            images: [''],
            category: CategoryEntity(description: ''),
            owner: UserModel(name: '', email: '', id: 'rBgI0dwu98'),
          ).isValidOwner,
          true);
    });
  });
}
