// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductEntityAdapter extends TypeAdapter<ProductEntity> {
  @override
  final int typeId = 1;

  @override
  ProductEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductEntity(
      name: fields[0] as String,
      code: fields[1] as String,
      description: fields[2] as String,
      price: fields[3] as num,
      imageUrl: fields[4] as String?,
      isFeatured: fields[6] as bool,
      isOrganic: fields[7] as bool,
      expirationMonths: fields[5] as int,
      numberOfCalories: fields[8] as int,
      unitAmount: fields[11] as int,
      reviews: (fields[12] as List).cast<ReviewEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductEntity obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.expirationMonths)
      ..writeByte(6)
      ..write(obj.isFeatured)
      ..writeByte(7)
      ..write(obj.isOrganic)
      ..writeByte(8)
      ..write(obj.numberOfCalories)
      ..writeByte(9)
      ..write(obj.avgRating)
      ..writeByte(10)
      ..write(obj.ratingCount)
      ..writeByte(11)
      ..write(obj.unitAmount)
      ..writeByte(12)
      ..write(obj.reviews);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
