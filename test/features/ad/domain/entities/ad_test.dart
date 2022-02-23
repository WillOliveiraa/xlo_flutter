import 'package:flutter_test/flutter_test.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/address_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/city_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/uf_entity.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';

void main() {
  group('should check if field is valid or not', () {
    test('title, description, price, images, category, owner, address', () {
      // title
      expect(
          AdEntity(
            title: '',
            description: 'description',
            price: 0,
            images: [],
            category: CategoryEntity(description: ''),
            owner: UserModel(name: '', email: ''),
            address: AddressEntity(
              uf: UfEntity(initials: '', name: ''),
              city: CityEntity(name: ''),
              cep: '',
              district: '',
            ),
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
            address: AddressEntity(
              uf: UfEntity(initials: '', name: ''),
              city: CityEntity(name: ''),
              cep: '',
              district: '',
            ),
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
            address: AddressEntity(
              uf: UfEntity(initials: '', name: ''),
              city: CityEntity(name: ''),
              cep: '',
              district: '',
            ),
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
            address: AddressEntity(
              uf: UfEntity(initials: '', name: ''),
              city: CityEntity(name: ''),
              cep: '',
              district: '',
            ),
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
            address: AddressEntity(
              uf: UfEntity(initials: '', name: ''),
              city: CityEntity(name: ''),
              cep: '',
              district: '',
            ),
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
            address: AddressEntity(
              uf: UfEntity(initials: '', name: ''),
              city: CityEntity(name: ''),
              cep: '',
              district: '',
            ),
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
            address: AddressEntity(
              uf: UfEntity(initials: '', name: ''),
              city: CityEntity(name: ''),
              cep: '',
              district: '',
            ),
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
            address: AddressEntity(
              uf: UfEntity(initials: '', name: ''),
              city: CityEntity(name: ''),
              cep: '',
              district: '',
            ),
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
            address: AddressEntity(
              uf: UfEntity(initials: '', name: ''),
              city: CityEntity(name: ''),
              cep: '',
              district: '',
            ),
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
            address: AddressEntity(
              uf: UfEntity(initials: '', name: ''),
              city: CityEntity(name: ''),
              cep: '',
              district: '',
            ),
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
            address: AddressEntity(
              uf: UfEntity(initials: '', name: ''),
              city: CityEntity(name: ''),
              cep: '',
              district: '',
            ),
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
            address: AddressEntity(
              uf: UfEntity(initials: '', name: ''),
              city: CityEntity(name: ''),
              cep: '',
              district: '',
            ),
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
            address: AddressEntity(
              uf: UfEntity(initials: '', name: ''),
              city: CityEntity(name: ''),
              cep: '',
              district: '',
            ),
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
            address: AddressEntity(
              uf: UfEntity(initials: '', name: ''),
              city: CityEntity(name: ''),
              cep: '',
              district: '',
            ),
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
            address: AddressEntity(
              uf: UfEntity(initials: '', name: ''),
              city: CityEntity(name: ''),
              cep: '',
              district: '',
            ),
          ).isValidOwner,
          true);

      // address
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 100.00,
            images: [''],
            category: CategoryEntity(description: ''),
            owner: UserModel(name: '', email: ''),
            address: AddressEntity(
              uf: UfEntity(initials: '', name: ''),
              city: CityEntity(name: ''),
              cep: '',
              district: '',
            ),
          ).isValidAddress,
          false);
      expect(
          AdEntity(
            title: 'New ad',
            description: 'description',
            price: 100.00,
            images: [''],
            category: CategoryEntity(description: ''),
            owner: UserModel(name: '', email: '', id: 'rBgI0dwu98'),
            address: AddressEntity(
              uf: UfEntity(initials: 'PR', name: 'Paraná'),
              city: CityEntity(name: 'Terra Boa'),
              cep: '8724000',
              district: 'abc',
            ),
          ).isValidAddress,
          true);
    });
  });
}
