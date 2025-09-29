// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TripsTable extends Trips with TableInfo<$TripsTable, Trip> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TripsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _destinationMeta =
      const VerificationMeta('destination');
  @override
  late final GeneratedColumn<String> destination = GeneratedColumn<String>(
      'destination', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, destination, startDate, endDate, description, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trips';
  @override
  VerificationContext validateIntegrity(Insertable<Trip> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('destination')) {
      context.handle(
          _destinationMeta,
          destination.isAcceptableOrUnknown(
              data['destination']!, _destinationMeta));
    } else if (isInserting) {
      context.missing(_destinationMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Trip map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Trip(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      destination: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}destination'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TripsTable createAlias(String alias) {
    return $TripsTable(attachedDatabase, alias);
  }
}

class Trip extends DataClass implements Insertable<Trip> {
  final int id;
  final String name;
  final String destination;
  final DateTime startDate;
  final DateTime endDate;
  final String? description;
  final DateTime createdAt;
  const Trip(
      {required this.id,
      required this.name,
      required this.destination,
      required this.startDate,
      required this.endDate,
      this.description,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['destination'] = Variable<String>(destination);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TripsCompanion toCompanion(bool nullToAbsent) {
    return TripsCompanion(
      id: Value(id),
      name: Value(name),
      destination: Value(destination),
      startDate: Value(startDate),
      endDate: Value(endDate),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory Trip.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Trip(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      destination: serializer.fromJson<String>(json['destination']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'destination': serializer.toJson<String>(destination),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Trip copyWith(
          {int? id,
          String? name,
          String? destination,
          DateTime? startDate,
          DateTime? endDate,
          Value<String?> description = const Value.absent(),
          DateTime? createdAt}) =>
      Trip(
        id: id ?? this.id,
        name: name ?? this.name,
        destination: destination ?? this.destination,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        description: description.present ? description.value : this.description,
        createdAt: createdAt ?? this.createdAt,
      );
  Trip copyWithCompanion(TripsCompanion data) {
    return Trip(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      destination:
          data.destination.present ? data.destination.value : this.destination,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Trip(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('destination: $destination, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, destination, startDate, endDate, description, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Trip &&
          other.id == this.id &&
          other.name == this.name &&
          other.destination == this.destination &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class TripsCompanion extends UpdateCompanion<Trip> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> destination;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  const TripsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.destination = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TripsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String destination,
    required DateTime startDate,
    required DateTime endDate,
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : name = Value(name),
        destination = Value(destination),
        startDate = Value(startDate),
        endDate = Value(endDate);
  static Insertable<Trip> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? destination,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (destination != null) 'destination': destination,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TripsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? destination,
      Value<DateTime>? startDate,
      Value<DateTime>? endDate,
      Value<String?>? description,
      Value<DateTime>? createdAt}) {
    return TripsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      destination: destination ?? this.destination,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (destination.present) {
      map['destination'] = Variable<String>(destination.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TripsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('destination: $destination, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ClothingItemsTable extends ClothingItems
    with TableInfo<$ClothingItemsTable, ClothingItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClothingItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<String> size = GeneratedColumn<String>(
      'size', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
      'brand', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, category, color, size, brand, imagePath, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clothing_items';
  @override
  VerificationContext validateIntegrity(Insertable<ClothingItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size']!, _sizeMeta));
    }
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand']!, _brandMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClothingItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClothingItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      size: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}size']),
      brand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brand']),
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ClothingItemsTable createAlias(String alias) {
    return $ClothingItemsTable(attachedDatabase, alias);
  }
}

class ClothingItem extends DataClass implements Insertable<ClothingItem> {
  final int id;
  final String name;
  final String category;
  final String? color;
  final String? size;
  final String? brand;
  final String? imagePath;
  final DateTime createdAt;
  const ClothingItem(
      {required this.id,
      required this.name,
      required this.category,
      this.color,
      this.size,
      this.brand,
      this.imagePath,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || size != null) {
      map['size'] = Variable<String>(size);
    }
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ClothingItemsCompanion toCompanion(bool nullToAbsent) {
    return ClothingItemsCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      size: size == null && nullToAbsent ? const Value.absent() : Value(size),
      brand:
          brand == null && nullToAbsent ? const Value.absent() : Value(brand),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      createdAt: Value(createdAt),
    );
  }

  factory ClothingItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClothingItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      color: serializer.fromJson<String?>(json['color']),
      size: serializer.fromJson<String?>(json['size']),
      brand: serializer.fromJson<String?>(json['brand']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'color': serializer.toJson<String?>(color),
      'size': serializer.toJson<String?>(size),
      'brand': serializer.toJson<String?>(brand),
      'imagePath': serializer.toJson<String?>(imagePath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ClothingItem copyWith(
          {int? id,
          String? name,
          String? category,
          Value<String?> color = const Value.absent(),
          Value<String?> size = const Value.absent(),
          Value<String?> brand = const Value.absent(),
          Value<String?> imagePath = const Value.absent(),
          DateTime? createdAt}) =>
      ClothingItem(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        color: color.present ? color.value : this.color,
        size: size.present ? size.value : this.size,
        brand: brand.present ? brand.value : this.brand,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        createdAt: createdAt ?? this.createdAt,
      );
  ClothingItem copyWithCompanion(ClothingItemsCompanion data) {
    return ClothingItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      color: data.color.present ? data.color.value : this.color,
      size: data.size.present ? data.size.value : this.size,
      brand: data.brand.present ? data.brand.value : this.brand,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClothingItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('color: $color, ')
          ..write('size: $size, ')
          ..write('brand: $brand, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, category, color, size, brand, imagePath, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClothingItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.color == this.color &&
          other.size == this.size &&
          other.brand == this.brand &&
          other.imagePath == this.imagePath &&
          other.createdAt == this.createdAt);
}

class ClothingItemsCompanion extends UpdateCompanion<ClothingItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> category;
  final Value<String?> color;
  final Value<String?> size;
  final Value<String?> brand;
  final Value<String?> imagePath;
  final Value<DateTime> createdAt;
  const ClothingItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.color = const Value.absent(),
    this.size = const Value.absent(),
    this.brand = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ClothingItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String category,
    this.color = const Value.absent(),
    this.size = const Value.absent(),
    this.brand = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : name = Value(name),
        category = Value(category);
  static Insertable<ClothingItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? color,
    Expression<String>? size,
    Expression<String>? brand,
    Expression<String>? imagePath,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (color != null) 'color': color,
      if (size != null) 'size': size,
      if (brand != null) 'brand': brand,
      if (imagePath != null) 'image_path': imagePath,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ClothingItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? category,
      Value<String?>? color,
      Value<String?>? size,
      Value<String?>? brand,
      Value<String?>? imagePath,
      Value<DateTime>? createdAt}) {
    return ClothingItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      color: color ?? this.color,
      size: size ?? this.size,
      brand: brand ?? this.brand,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (size.present) {
      map['size'] = Variable<String>(size.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClothingItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('color: $color, ')
          ..write('size: $size, ')
          ..write('brand: $brand, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TripDaysTable extends TripDays with TableInfo<$TripDaysTable, TripDay> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TripDaysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tripIdMeta = const VerificationMeta('tripId');
  @override
  late final GeneratedColumn<int> tripId = GeneratedColumn<int>(
      'trip_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES trips (id)'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _weatherMeta =
      const VerificationMeta('weather');
  @override
  late final GeneratedColumn<String> weather = GeneratedColumn<String>(
      'weather', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _temperatureMeta =
      const VerificationMeta('temperature');
  @override
  late final GeneratedColumn<double> temperature = GeneratedColumn<double>(
      'temperature', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _activitiesMeta =
      const VerificationMeta('activities');
  @override
  late final GeneratedColumn<String> activities = GeneratedColumn<String>(
      'activities', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, tripId, date, weather, temperature, activities, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trip_days';
  @override
  VerificationContext validateIntegrity(Insertable<TripDay> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('trip_id')) {
      context.handle(_tripIdMeta,
          tripId.isAcceptableOrUnknown(data['trip_id']!, _tripIdMeta));
    } else if (isInserting) {
      context.missing(_tripIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('weather')) {
      context.handle(_weatherMeta,
          weather.isAcceptableOrUnknown(data['weather']!, _weatherMeta));
    }
    if (data.containsKey('temperature')) {
      context.handle(
          _temperatureMeta,
          temperature.isAcceptableOrUnknown(
              data['temperature']!, _temperatureMeta));
    }
    if (data.containsKey('activities')) {
      context.handle(
          _activitiesMeta,
          activities.isAcceptableOrUnknown(
              data['activities']!, _activitiesMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TripDay map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TripDay(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tripId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}trip_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      weather: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}weather']),
      temperature: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}temperature']),
      activities: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}activities']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $TripDaysTable createAlias(String alias) {
    return $TripDaysTable(attachedDatabase, alias);
  }
}

class TripDay extends DataClass implements Insertable<TripDay> {
  final int id;
  final int tripId;
  final DateTime date;
  final String? weather;
  final double? temperature;
  final String? activities;
  final String? notes;
  const TripDay(
      {required this.id,
      required this.tripId,
      required this.date,
      this.weather,
      this.temperature,
      this.activities,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['trip_id'] = Variable<int>(tripId);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || weather != null) {
      map['weather'] = Variable<String>(weather);
    }
    if (!nullToAbsent || temperature != null) {
      map['temperature'] = Variable<double>(temperature);
    }
    if (!nullToAbsent || activities != null) {
      map['activities'] = Variable<String>(activities);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  TripDaysCompanion toCompanion(bool nullToAbsent) {
    return TripDaysCompanion(
      id: Value(id),
      tripId: Value(tripId),
      date: Value(date),
      weather: weather == null && nullToAbsent
          ? const Value.absent()
          : Value(weather),
      temperature: temperature == null && nullToAbsent
          ? const Value.absent()
          : Value(temperature),
      activities: activities == null && nullToAbsent
          ? const Value.absent()
          : Value(activities),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory TripDay.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TripDay(
      id: serializer.fromJson<int>(json['id']),
      tripId: serializer.fromJson<int>(json['tripId']),
      date: serializer.fromJson<DateTime>(json['date']),
      weather: serializer.fromJson<String?>(json['weather']),
      temperature: serializer.fromJson<double?>(json['temperature']),
      activities: serializer.fromJson<String?>(json['activities']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tripId': serializer.toJson<int>(tripId),
      'date': serializer.toJson<DateTime>(date),
      'weather': serializer.toJson<String?>(weather),
      'temperature': serializer.toJson<double?>(temperature),
      'activities': serializer.toJson<String?>(activities),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  TripDay copyWith(
          {int? id,
          int? tripId,
          DateTime? date,
          Value<String?> weather = const Value.absent(),
          Value<double?> temperature = const Value.absent(),
          Value<String?> activities = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      TripDay(
        id: id ?? this.id,
        tripId: tripId ?? this.tripId,
        date: date ?? this.date,
        weather: weather.present ? weather.value : this.weather,
        temperature: temperature.present ? temperature.value : this.temperature,
        activities: activities.present ? activities.value : this.activities,
        notes: notes.present ? notes.value : this.notes,
      );
  TripDay copyWithCompanion(TripDaysCompanion data) {
    return TripDay(
      id: data.id.present ? data.id.value : this.id,
      tripId: data.tripId.present ? data.tripId.value : this.tripId,
      date: data.date.present ? data.date.value : this.date,
      weather: data.weather.present ? data.weather.value : this.weather,
      temperature:
          data.temperature.present ? data.temperature.value : this.temperature,
      activities:
          data.activities.present ? data.activities.value : this.activities,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TripDay(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('date: $date, ')
          ..write('weather: $weather, ')
          ..write('temperature: $temperature, ')
          ..write('activities: $activities, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, tripId, date, weather, temperature, activities, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TripDay &&
          other.id == this.id &&
          other.tripId == this.tripId &&
          other.date == this.date &&
          other.weather == this.weather &&
          other.temperature == this.temperature &&
          other.activities == this.activities &&
          other.notes == this.notes);
}

class TripDaysCompanion extends UpdateCompanion<TripDay> {
  final Value<int> id;
  final Value<int> tripId;
  final Value<DateTime> date;
  final Value<String?> weather;
  final Value<double?> temperature;
  final Value<String?> activities;
  final Value<String?> notes;
  const TripDaysCompanion({
    this.id = const Value.absent(),
    this.tripId = const Value.absent(),
    this.date = const Value.absent(),
    this.weather = const Value.absent(),
    this.temperature = const Value.absent(),
    this.activities = const Value.absent(),
    this.notes = const Value.absent(),
  });
  TripDaysCompanion.insert({
    this.id = const Value.absent(),
    required int tripId,
    required DateTime date,
    this.weather = const Value.absent(),
    this.temperature = const Value.absent(),
    this.activities = const Value.absent(),
    this.notes = const Value.absent(),
  })  : tripId = Value(tripId),
        date = Value(date);
  static Insertable<TripDay> custom({
    Expression<int>? id,
    Expression<int>? tripId,
    Expression<DateTime>? date,
    Expression<String>? weather,
    Expression<double>? temperature,
    Expression<String>? activities,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tripId != null) 'trip_id': tripId,
      if (date != null) 'date': date,
      if (weather != null) 'weather': weather,
      if (temperature != null) 'temperature': temperature,
      if (activities != null) 'activities': activities,
      if (notes != null) 'notes': notes,
    });
  }

  TripDaysCompanion copyWith(
      {Value<int>? id,
      Value<int>? tripId,
      Value<DateTime>? date,
      Value<String?>? weather,
      Value<double?>? temperature,
      Value<String?>? activities,
      Value<String?>? notes}) {
    return TripDaysCompanion(
      id: id ?? this.id,
      tripId: tripId ?? this.tripId,
      date: date ?? this.date,
      weather: weather ?? this.weather,
      temperature: temperature ?? this.temperature,
      activities: activities ?? this.activities,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tripId.present) {
      map['trip_id'] = Variable<int>(tripId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (weather.present) {
      map['weather'] = Variable<String>(weather.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<double>(temperature.value);
    }
    if (activities.present) {
      map['activities'] = Variable<String>(activities.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TripDaysCompanion(')
          ..write('id: $id, ')
          ..write('tripId: $tripId, ')
          ..write('date: $date, ')
          ..write('weather: $weather, ')
          ..write('temperature: $temperature, ')
          ..write('activities: $activities, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $DayClothingItemsTable extends DayClothingItems
    with TableInfo<$DayClothingItemsTable, DayClothingItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayClothingItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dayIdMeta = const VerificationMeta('dayId');
  @override
  late final GeneratedColumn<int> dayId = GeneratedColumn<int>(
      'day_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES trip_days (id)'));
  static const VerificationMeta _clothingItemIdMeta =
      const VerificationMeta('clothingItemId');
  @override
  late final GeneratedColumn<int> clothingItemId = GeneratedColumn<int>(
      'clothing_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES clothing_items (id)'));
  static const VerificationMeta _isWornMeta = const VerificationMeta('isWorn');
  @override
  late final GeneratedColumn<bool> isWorn = GeneratedColumn<bool>(
      'is_worn', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_worn" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, dayId, clothingItemId, isWorn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'day_clothing_items';
  @override
  VerificationContext validateIntegrity(Insertable<DayClothingItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('day_id')) {
      context.handle(
          _dayIdMeta, dayId.isAcceptableOrUnknown(data['day_id']!, _dayIdMeta));
    } else if (isInserting) {
      context.missing(_dayIdMeta);
    }
    if (data.containsKey('clothing_item_id')) {
      context.handle(
          _clothingItemIdMeta,
          clothingItemId.isAcceptableOrUnknown(
              data['clothing_item_id']!, _clothingItemIdMeta));
    } else if (isInserting) {
      context.missing(_clothingItemIdMeta);
    }
    if (data.containsKey('is_worn')) {
      context.handle(_isWornMeta,
          isWorn.isAcceptableOrUnknown(data['is_worn']!, _isWornMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DayClothingItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayClothingItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      dayId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_id'])!,
      clothingItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}clothing_item_id'])!,
      isWorn: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_worn'])!,
    );
  }

  @override
  $DayClothingItemsTable createAlias(String alias) {
    return $DayClothingItemsTable(attachedDatabase, alias);
  }
}

class DayClothingItem extends DataClass implements Insertable<DayClothingItem> {
  final int id;
  final int dayId;
  final int clothingItemId;
  final bool isWorn;
  const DayClothingItem(
      {required this.id,
      required this.dayId,
      required this.clothingItemId,
      required this.isWorn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['day_id'] = Variable<int>(dayId);
    map['clothing_item_id'] = Variable<int>(clothingItemId);
    map['is_worn'] = Variable<bool>(isWorn);
    return map;
  }

  DayClothingItemsCompanion toCompanion(bool nullToAbsent) {
    return DayClothingItemsCompanion(
      id: Value(id),
      dayId: Value(dayId),
      clothingItemId: Value(clothingItemId),
      isWorn: Value(isWorn),
    );
  }

  factory DayClothingItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayClothingItem(
      id: serializer.fromJson<int>(json['id']),
      dayId: serializer.fromJson<int>(json['dayId']),
      clothingItemId: serializer.fromJson<int>(json['clothingItemId']),
      isWorn: serializer.fromJson<bool>(json['isWorn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dayId': serializer.toJson<int>(dayId),
      'clothingItemId': serializer.toJson<int>(clothingItemId),
      'isWorn': serializer.toJson<bool>(isWorn),
    };
  }

  DayClothingItem copyWith(
          {int? id, int? dayId, int? clothingItemId, bool? isWorn}) =>
      DayClothingItem(
        id: id ?? this.id,
        dayId: dayId ?? this.dayId,
        clothingItemId: clothingItemId ?? this.clothingItemId,
        isWorn: isWorn ?? this.isWorn,
      );
  DayClothingItem copyWithCompanion(DayClothingItemsCompanion data) {
    return DayClothingItem(
      id: data.id.present ? data.id.value : this.id,
      dayId: data.dayId.present ? data.dayId.value : this.dayId,
      clothingItemId: data.clothingItemId.present
          ? data.clothingItemId.value
          : this.clothingItemId,
      isWorn: data.isWorn.present ? data.isWorn.value : this.isWorn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayClothingItem(')
          ..write('id: $id, ')
          ..write('dayId: $dayId, ')
          ..write('clothingItemId: $clothingItemId, ')
          ..write('isWorn: $isWorn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dayId, clothingItemId, isWorn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayClothingItem &&
          other.id == this.id &&
          other.dayId == this.dayId &&
          other.clothingItemId == this.clothingItemId &&
          other.isWorn == this.isWorn);
}

class DayClothingItemsCompanion extends UpdateCompanion<DayClothingItem> {
  final Value<int> id;
  final Value<int> dayId;
  final Value<int> clothingItemId;
  final Value<bool> isWorn;
  const DayClothingItemsCompanion({
    this.id = const Value.absent(),
    this.dayId = const Value.absent(),
    this.clothingItemId = const Value.absent(),
    this.isWorn = const Value.absent(),
  });
  DayClothingItemsCompanion.insert({
    this.id = const Value.absent(),
    required int dayId,
    required int clothingItemId,
    this.isWorn = const Value.absent(),
  })  : dayId = Value(dayId),
        clothingItemId = Value(clothingItemId);
  static Insertable<DayClothingItem> custom({
    Expression<int>? id,
    Expression<int>? dayId,
    Expression<int>? clothingItemId,
    Expression<bool>? isWorn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dayId != null) 'day_id': dayId,
      if (clothingItemId != null) 'clothing_item_id': clothingItemId,
      if (isWorn != null) 'is_worn': isWorn,
    });
  }

  DayClothingItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? dayId,
      Value<int>? clothingItemId,
      Value<bool>? isWorn}) {
    return DayClothingItemsCompanion(
      id: id ?? this.id,
      dayId: dayId ?? this.dayId,
      clothingItemId: clothingItemId ?? this.clothingItemId,
      isWorn: isWorn ?? this.isWorn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dayId.present) {
      map['day_id'] = Variable<int>(dayId.value);
    }
    if (clothingItemId.present) {
      map['clothing_item_id'] = Variable<int>(clothingItemId.value);
    }
    if (isWorn.present) {
      map['is_worn'] = Variable<bool>(isWorn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayClothingItemsCompanion(')
          ..write('id: $id, ')
          ..write('dayId: $dayId, ')
          ..write('clothingItemId: $clothingItemId, ')
          ..write('isWorn: $isWorn')
          ..write(')'))
        .toString();
  }
}

class $TripTemplatesTable extends TripTemplates
    with TableInfo<$TripTemplatesTable, TripTemplate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TripTemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _destinationMeta =
      const VerificationMeta('destination');
  @override
  late final GeneratedColumn<String> destination = GeneratedColumn<String>(
      'destination', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _seasonMeta = const VerificationMeta('season');
  @override
  late final GeneratedColumn<String> season = GeneratedColumn<String>(
      'season', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<String> duration = GeneratedColumn<String>(
      'duration', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, destination, season, duration, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trip_templates';
  @override
  VerificationContext validateIntegrity(Insertable<TripTemplate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('destination')) {
      context.handle(
          _destinationMeta,
          destination.isAcceptableOrUnknown(
              data['destination']!, _destinationMeta));
    }
    if (data.containsKey('season')) {
      context.handle(_seasonMeta,
          season.isAcceptableOrUnknown(data['season']!, _seasonMeta));
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TripTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TripTemplate(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      destination: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}destination']),
      season: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}season']),
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}duration']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TripTemplatesTable createAlias(String alias) {
    return $TripTemplatesTable(attachedDatabase, alias);
  }
}

class TripTemplate extends DataClass implements Insertable<TripTemplate> {
  final int id;
  final String name;
  final String? description;
  final String? destination;
  final String? season;
  final String? duration;
  final DateTime createdAt;
  const TripTemplate(
      {required this.id,
      required this.name,
      this.description,
      this.destination,
      this.season,
      this.duration,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || destination != null) {
      map['destination'] = Variable<String>(destination);
    }
    if (!nullToAbsent || season != null) {
      map['season'] = Variable<String>(season);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<String>(duration);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TripTemplatesCompanion toCompanion(bool nullToAbsent) {
    return TripTemplatesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      destination: destination == null && nullToAbsent
          ? const Value.absent()
          : Value(destination),
      season:
          season == null && nullToAbsent ? const Value.absent() : Value(season),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      createdAt: Value(createdAt),
    );
  }

  factory TripTemplate.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TripTemplate(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      destination: serializer.fromJson<String?>(json['destination']),
      season: serializer.fromJson<String?>(json['season']),
      duration: serializer.fromJson<String?>(json['duration']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'destination': serializer.toJson<String?>(destination),
      'season': serializer.toJson<String?>(season),
      'duration': serializer.toJson<String?>(duration),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TripTemplate copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> destination = const Value.absent(),
          Value<String?> season = const Value.absent(),
          Value<String?> duration = const Value.absent(),
          DateTime? createdAt}) =>
      TripTemplate(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        destination: destination.present ? destination.value : this.destination,
        season: season.present ? season.value : this.season,
        duration: duration.present ? duration.value : this.duration,
        createdAt: createdAt ?? this.createdAt,
      );
  TripTemplate copyWithCompanion(TripTemplatesCompanion data) {
    return TripTemplate(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      destination:
          data.destination.present ? data.destination.value : this.destination,
      season: data.season.present ? data.season.value : this.season,
      duration: data.duration.present ? data.duration.value : this.duration,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TripTemplate(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('destination: $destination, ')
          ..write('season: $season, ')
          ..write('duration: $duration, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, description, destination, season, duration, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TripTemplate &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.destination == this.destination &&
          other.season == this.season &&
          other.duration == this.duration &&
          other.createdAt == this.createdAt);
}

class TripTemplatesCompanion extends UpdateCompanion<TripTemplate> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> destination;
  final Value<String?> season;
  final Value<String?> duration;
  final Value<DateTime> createdAt;
  const TripTemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.destination = const Value.absent(),
    this.season = const Value.absent(),
    this.duration = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TripTemplatesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.destination = const Value.absent(),
    this.season = const Value.absent(),
    this.duration = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<TripTemplate> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? destination,
    Expression<String>? season,
    Expression<String>? duration,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (destination != null) 'destination': destination,
      if (season != null) 'season': season,
      if (duration != null) 'duration': duration,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TripTemplatesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? destination,
      Value<String?>? season,
      Value<String?>? duration,
      Value<DateTime>? createdAt}) {
    return TripTemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      destination: destination ?? this.destination,
      season: season ?? this.season,
      duration: duration ?? this.duration,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (destination.present) {
      map['destination'] = Variable<String>(destination.value);
    }
    if (season.present) {
      map['season'] = Variable<String>(season.value);
    }
    if (duration.present) {
      map['duration'] = Variable<String>(duration.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TripTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('destination: $destination, ')
          ..write('season: $season, ')
          ..write('duration: $duration, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TemplateClothingItemsTable extends TemplateClothingItems
    with TableInfo<$TemplateClothingItemsTable, TemplateClothingItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TemplateClothingItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _templateIdMeta =
      const VerificationMeta('templateId');
  @override
  late final GeneratedColumn<int> templateId = GeneratedColumn<int>(
      'template_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES trip_templates (id)'));
  static const VerificationMeta _clothingItemIdMeta =
      const VerificationMeta('clothingItemId');
  @override
  late final GeneratedColumn<int> clothingItemId = GeneratedColumn<int>(
      'clothing_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES clothing_items (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns =>
      [id, templateId, clothingItemId, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'template_clothing_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<TemplateClothingItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('template_id')) {
      context.handle(
          _templateIdMeta,
          templateId.isAcceptableOrUnknown(
              data['template_id']!, _templateIdMeta));
    } else if (isInserting) {
      context.missing(_templateIdMeta);
    }
    if (data.containsKey('clothing_item_id')) {
      context.handle(
          _clothingItemIdMeta,
          clothingItemId.isAcceptableOrUnknown(
              data['clothing_item_id']!, _clothingItemIdMeta));
    } else if (isInserting) {
      context.missing(_clothingItemIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TemplateClothingItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TemplateClothingItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      templateId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}template_id'])!,
      clothingItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}clothing_item_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
    );
  }

  @override
  $TemplateClothingItemsTable createAlias(String alias) {
    return $TemplateClothingItemsTable(attachedDatabase, alias);
  }
}

class TemplateClothingItem extends DataClass
    implements Insertable<TemplateClothingItem> {
  final int id;
  final int templateId;
  final int clothingItemId;
  final int quantity;
  const TemplateClothingItem(
      {required this.id,
      required this.templateId,
      required this.clothingItemId,
      required this.quantity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['template_id'] = Variable<int>(templateId);
    map['clothing_item_id'] = Variable<int>(clothingItemId);
    map['quantity'] = Variable<int>(quantity);
    return map;
  }

  TemplateClothingItemsCompanion toCompanion(bool nullToAbsent) {
    return TemplateClothingItemsCompanion(
      id: Value(id),
      templateId: Value(templateId),
      clothingItemId: Value(clothingItemId),
      quantity: Value(quantity),
    );
  }

  factory TemplateClothingItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TemplateClothingItem(
      id: serializer.fromJson<int>(json['id']),
      templateId: serializer.fromJson<int>(json['templateId']),
      clothingItemId: serializer.fromJson<int>(json['clothingItemId']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'templateId': serializer.toJson<int>(templateId),
      'clothingItemId': serializer.toJson<int>(clothingItemId),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  TemplateClothingItem copyWith(
          {int? id, int? templateId, int? clothingItemId, int? quantity}) =>
      TemplateClothingItem(
        id: id ?? this.id,
        templateId: templateId ?? this.templateId,
        clothingItemId: clothingItemId ?? this.clothingItemId,
        quantity: quantity ?? this.quantity,
      );
  TemplateClothingItem copyWithCompanion(TemplateClothingItemsCompanion data) {
    return TemplateClothingItem(
      id: data.id.present ? data.id.value : this.id,
      templateId:
          data.templateId.present ? data.templateId.value : this.templateId,
      clothingItemId: data.clothingItemId.present
          ? data.clothingItemId.value
          : this.clothingItemId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TemplateClothingItem(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('clothingItemId: $clothingItemId, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, templateId, clothingItemId, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TemplateClothingItem &&
          other.id == this.id &&
          other.templateId == this.templateId &&
          other.clothingItemId == this.clothingItemId &&
          other.quantity == this.quantity);
}

class TemplateClothingItemsCompanion
    extends UpdateCompanion<TemplateClothingItem> {
  final Value<int> id;
  final Value<int> templateId;
  final Value<int> clothingItemId;
  final Value<int> quantity;
  const TemplateClothingItemsCompanion({
    this.id = const Value.absent(),
    this.templateId = const Value.absent(),
    this.clothingItemId = const Value.absent(),
    this.quantity = const Value.absent(),
  });
  TemplateClothingItemsCompanion.insert({
    this.id = const Value.absent(),
    required int templateId,
    required int clothingItemId,
    this.quantity = const Value.absent(),
  })  : templateId = Value(templateId),
        clothingItemId = Value(clothingItemId);
  static Insertable<TemplateClothingItem> custom({
    Expression<int>? id,
    Expression<int>? templateId,
    Expression<int>? clothingItemId,
    Expression<int>? quantity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (templateId != null) 'template_id': templateId,
      if (clothingItemId != null) 'clothing_item_id': clothingItemId,
      if (quantity != null) 'quantity': quantity,
    });
  }

  TemplateClothingItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? templateId,
      Value<int>? clothingItemId,
      Value<int>? quantity}) {
    return TemplateClothingItemsCompanion(
      id: id ?? this.id,
      templateId: templateId ?? this.templateId,
      clothingItemId: clothingItemId ?? this.clothingItemId,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<int>(templateId.value);
    }
    if (clothingItemId.present) {
      map['clothing_item_id'] = Variable<int>(clothingItemId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemplateClothingItemsCompanion(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('clothingItemId: $clothingItemId, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }
}

class $OutfitPhotosTable extends OutfitPhotos
    with TableInfo<$OutfitPhotosTable, OutfitPhoto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OutfitPhotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageDataMeta =
      const VerificationMeta('imageData');
  @override
  late final GeneratedColumn<Uint8List> imageData = GeneratedColumn<Uint8List>(
      'image_data', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, tags, imageData, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'outfit_photos';
  @override
  VerificationContext validateIntegrity(Insertable<OutfitPhoto> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('image_data')) {
      context.handle(_imageDataMeta,
          imageData.isAcceptableOrUnknown(data['image_data']!, _imageDataMeta));
    } else if (isInserting) {
      context.missing(_imageDataMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OutfitPhoto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OutfitPhoto(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags']),
      imageData: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}image_data'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $OutfitPhotosTable createAlias(String alias) {
    return $OutfitPhotosTable(attachedDatabase, alias);
  }
}

class OutfitPhoto extends DataClass implements Insertable<OutfitPhoto> {
  final int id;
  final String name;
  final String? description;
  final String? tags;
  final Uint8List imageData;
  final DateTime createdAt;
  const OutfitPhoto(
      {required this.id,
      required this.name,
      this.description,
      this.tags,
      required this.imageData,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    map['image_data'] = Variable<Uint8List>(imageData);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  OutfitPhotosCompanion toCompanion(bool nullToAbsent) {
    return OutfitPhotosCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      imageData: Value(imageData),
      createdAt: Value(createdAt),
    );
  }

  factory OutfitPhoto.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OutfitPhoto(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      tags: serializer.fromJson<String?>(json['tags']),
      imageData: serializer.fromJson<Uint8List>(json['imageData']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'tags': serializer.toJson<String?>(tags),
      'imageData': serializer.toJson<Uint8List>(imageData),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  OutfitPhoto copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> tags = const Value.absent(),
          Uint8List? imageData,
          DateTime? createdAt}) =>
      OutfitPhoto(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        tags: tags.present ? tags.value : this.tags,
        imageData: imageData ?? this.imageData,
        createdAt: createdAt ?? this.createdAt,
      );
  OutfitPhoto copyWithCompanion(OutfitPhotosCompanion data) {
    return OutfitPhoto(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      tags: data.tags.present ? data.tags.value : this.tags,
      imageData: data.imageData.present ? data.imageData.value : this.imageData,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OutfitPhoto(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('tags: $tags, ')
          ..write('imageData: $imageData, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, tags,
      $driftBlobEquality.hash(imageData), createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OutfitPhoto &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.tags == this.tags &&
          $driftBlobEquality.equals(other.imageData, this.imageData) &&
          other.createdAt == this.createdAt);
}

class OutfitPhotosCompanion extends UpdateCompanion<OutfitPhoto> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> tags;
  final Value<Uint8List> imageData;
  final Value<DateTime> createdAt;
  const OutfitPhotosCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.tags = const Value.absent(),
    this.imageData = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  OutfitPhotosCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.tags = const Value.absent(),
    required Uint8List imageData,
    this.createdAt = const Value.absent(),
  })  : name = Value(name),
        imageData = Value(imageData);
  static Insertable<OutfitPhoto> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? tags,
    Expression<Uint8List>? imageData,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
      if (imageData != null) 'image_data': imageData,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  OutfitPhotosCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? tags,
      Value<Uint8List>? imageData,
      Value<DateTime>? createdAt}) {
    return OutfitPhotosCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      imageData: imageData ?? this.imageData,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (imageData.present) {
      map['image_data'] = Variable<Uint8List>(imageData.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutfitPhotosCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('tags: $tags, ')
          ..write('imageData: $imageData, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $OutfitClothingItemsTable extends OutfitClothingItems
    with TableInfo<$OutfitClothingItemsTable, OutfitClothingItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OutfitClothingItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _outfitPhotoIdMeta =
      const VerificationMeta('outfitPhotoId');
  @override
  late final GeneratedColumn<int> outfitPhotoId = GeneratedColumn<int>(
      'outfit_photo_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES outfit_photos (id)'));
  static const VerificationMeta _clothingItemIdMeta =
      const VerificationMeta('clothingItemId');
  @override
  late final GeneratedColumn<int> clothingItemId = GeneratedColumn<int>(
      'clothing_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES clothing_items (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, outfitPhotoId, clothingItemId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'outfit_clothing_items';
  @override
  VerificationContext validateIntegrity(Insertable<OutfitClothingItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('outfit_photo_id')) {
      context.handle(
          _outfitPhotoIdMeta,
          outfitPhotoId.isAcceptableOrUnknown(
              data['outfit_photo_id']!, _outfitPhotoIdMeta));
    } else if (isInserting) {
      context.missing(_outfitPhotoIdMeta);
    }
    if (data.containsKey('clothing_item_id')) {
      context.handle(
          _clothingItemIdMeta,
          clothingItemId.isAcceptableOrUnknown(
              data['clothing_item_id']!, _clothingItemIdMeta));
    } else if (isInserting) {
      context.missing(_clothingItemIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OutfitClothingItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OutfitClothingItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      outfitPhotoId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}outfit_photo_id'])!,
      clothingItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}clothing_item_id'])!,
    );
  }

  @override
  $OutfitClothingItemsTable createAlias(String alias) {
    return $OutfitClothingItemsTable(attachedDatabase, alias);
  }
}

class OutfitClothingItem extends DataClass
    implements Insertable<OutfitClothingItem> {
  final int id;
  final int outfitPhotoId;
  final int clothingItemId;
  const OutfitClothingItem(
      {required this.id,
      required this.outfitPhotoId,
      required this.clothingItemId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['outfit_photo_id'] = Variable<int>(outfitPhotoId);
    map['clothing_item_id'] = Variable<int>(clothingItemId);
    return map;
  }

  OutfitClothingItemsCompanion toCompanion(bool nullToAbsent) {
    return OutfitClothingItemsCompanion(
      id: Value(id),
      outfitPhotoId: Value(outfitPhotoId),
      clothingItemId: Value(clothingItemId),
    );
  }

  factory OutfitClothingItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OutfitClothingItem(
      id: serializer.fromJson<int>(json['id']),
      outfitPhotoId: serializer.fromJson<int>(json['outfitPhotoId']),
      clothingItemId: serializer.fromJson<int>(json['clothingItemId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'outfitPhotoId': serializer.toJson<int>(outfitPhotoId),
      'clothingItemId': serializer.toJson<int>(clothingItemId),
    };
  }

  OutfitClothingItem copyWith(
          {int? id, int? outfitPhotoId, int? clothingItemId}) =>
      OutfitClothingItem(
        id: id ?? this.id,
        outfitPhotoId: outfitPhotoId ?? this.outfitPhotoId,
        clothingItemId: clothingItemId ?? this.clothingItemId,
      );
  OutfitClothingItem copyWithCompanion(OutfitClothingItemsCompanion data) {
    return OutfitClothingItem(
      id: data.id.present ? data.id.value : this.id,
      outfitPhotoId: data.outfitPhotoId.present
          ? data.outfitPhotoId.value
          : this.outfitPhotoId,
      clothingItemId: data.clothingItemId.present
          ? data.clothingItemId.value
          : this.clothingItemId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OutfitClothingItem(')
          ..write('id: $id, ')
          ..write('outfitPhotoId: $outfitPhotoId, ')
          ..write('clothingItemId: $clothingItemId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, outfitPhotoId, clothingItemId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OutfitClothingItem &&
          other.id == this.id &&
          other.outfitPhotoId == this.outfitPhotoId &&
          other.clothingItemId == this.clothingItemId);
}

class OutfitClothingItemsCompanion extends UpdateCompanion<OutfitClothingItem> {
  final Value<int> id;
  final Value<int> outfitPhotoId;
  final Value<int> clothingItemId;
  const OutfitClothingItemsCompanion({
    this.id = const Value.absent(),
    this.outfitPhotoId = const Value.absent(),
    this.clothingItemId = const Value.absent(),
  });
  OutfitClothingItemsCompanion.insert({
    this.id = const Value.absent(),
    required int outfitPhotoId,
    required int clothingItemId,
  })  : outfitPhotoId = Value(outfitPhotoId),
        clothingItemId = Value(clothingItemId);
  static Insertable<OutfitClothingItem> custom({
    Expression<int>? id,
    Expression<int>? outfitPhotoId,
    Expression<int>? clothingItemId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (outfitPhotoId != null) 'outfit_photo_id': outfitPhotoId,
      if (clothingItemId != null) 'clothing_item_id': clothingItemId,
    });
  }

  OutfitClothingItemsCompanion copyWith(
      {Value<int>? id, Value<int>? outfitPhotoId, Value<int>? clothingItemId}) {
    return OutfitClothingItemsCompanion(
      id: id ?? this.id,
      outfitPhotoId: outfitPhotoId ?? this.outfitPhotoId,
      clothingItemId: clothingItemId ?? this.clothingItemId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (outfitPhotoId.present) {
      map['outfit_photo_id'] = Variable<int>(outfitPhotoId.value);
    }
    if (clothingItemId.present) {
      map['clothing_item_id'] = Variable<int>(clothingItemId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutfitClothingItemsCompanion(')
          ..write('id: $id, ')
          ..write('outfitPhotoId: $outfitPhotoId, ')
          ..write('clothingItemId: $clothingItemId')
          ..write(')'))
        .toString();
  }
}

class $WeatherPlansTable extends WeatherPlans
    with TableInfo<$WeatherPlansTable, WeatherPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeatherPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _weatherTypeMeta =
      const VerificationMeta('weatherType');
  @override
  late final GeneratedColumn<String> weatherType = GeneratedColumn<String>(
      'weather_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _temperatureMeta =
      const VerificationMeta('temperature');
  @override
  late final GeneratedColumn<int> temperature = GeneratedColumn<int>(
      'temperature', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, location, weatherType, temperature, description, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weather_plans';
  @override
  VerificationContext validateIntegrity(Insertable<WeatherPlan> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('weather_type')) {
      context.handle(
          _weatherTypeMeta,
          weatherType.isAcceptableOrUnknown(
              data['weather_type']!, _weatherTypeMeta));
    } else if (isInserting) {
      context.missing(_weatherTypeMeta);
    }
    if (data.containsKey('temperature')) {
      context.handle(
          _temperatureMeta,
          temperature.isAcceptableOrUnknown(
              data['temperature']!, _temperatureMeta));
    } else if (isInserting) {
      context.missing(_temperatureMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeatherPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeatherPlan(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
      weatherType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}weather_type'])!,
      temperature: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}temperature'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $WeatherPlansTable createAlias(String alias) {
    return $WeatherPlansTable(attachedDatabase, alias);
  }
}

class WeatherPlan extends DataClass implements Insertable<WeatherPlan> {
  final int id;
  final String name;
  final String location;
  final String weatherType;
  final int temperature;
  final String? description;
  final DateTime createdAt;
  const WeatherPlan(
      {required this.id,
      required this.name,
      required this.location,
      required this.weatherType,
      required this.temperature,
      this.description,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['location'] = Variable<String>(location);
    map['weather_type'] = Variable<String>(weatherType);
    map['temperature'] = Variable<int>(temperature);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  WeatherPlansCompanion toCompanion(bool nullToAbsent) {
    return WeatherPlansCompanion(
      id: Value(id),
      name: Value(name),
      location: Value(location),
      weatherType: Value(weatherType),
      temperature: Value(temperature),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory WeatherPlan.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeatherPlan(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      location: serializer.fromJson<String>(json['location']),
      weatherType: serializer.fromJson<String>(json['weatherType']),
      temperature: serializer.fromJson<int>(json['temperature']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'location': serializer.toJson<String>(location),
      'weatherType': serializer.toJson<String>(weatherType),
      'temperature': serializer.toJson<int>(temperature),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  WeatherPlan copyWith(
          {int? id,
          String? name,
          String? location,
          String? weatherType,
          int? temperature,
          Value<String?> description = const Value.absent(),
          DateTime? createdAt}) =>
      WeatherPlan(
        id: id ?? this.id,
        name: name ?? this.name,
        location: location ?? this.location,
        weatherType: weatherType ?? this.weatherType,
        temperature: temperature ?? this.temperature,
        description: description.present ? description.value : this.description,
        createdAt: createdAt ?? this.createdAt,
      );
  WeatherPlan copyWithCompanion(WeatherPlansCompanion data) {
    return WeatherPlan(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      location: data.location.present ? data.location.value : this.location,
      weatherType:
          data.weatherType.present ? data.weatherType.value : this.weatherType,
      temperature:
          data.temperature.present ? data.temperature.value : this.temperature,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeatherPlan(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('location: $location, ')
          ..write('weatherType: $weatherType, ')
          ..write('temperature: $temperature, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, location, weatherType, temperature, description, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherPlan &&
          other.id == this.id &&
          other.name == this.name &&
          other.location == this.location &&
          other.weatherType == this.weatherType &&
          other.temperature == this.temperature &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class WeatherPlansCompanion extends UpdateCompanion<WeatherPlan> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> location;
  final Value<String> weatherType;
  final Value<int> temperature;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  const WeatherPlansCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.location = const Value.absent(),
    this.weatherType = const Value.absent(),
    this.temperature = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  WeatherPlansCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String location,
    required String weatherType,
    required int temperature,
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : name = Value(name),
        location = Value(location),
        weatherType = Value(weatherType),
        temperature = Value(temperature);
  static Insertable<WeatherPlan> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? location,
    Expression<String>? weatherType,
    Expression<int>? temperature,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (location != null) 'location': location,
      if (weatherType != null) 'weather_type': weatherType,
      if (temperature != null) 'temperature': temperature,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  WeatherPlansCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? location,
      Value<String>? weatherType,
      Value<int>? temperature,
      Value<String?>? description,
      Value<DateTime>? createdAt}) {
    return WeatherPlansCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      weatherType: weatherType ?? this.weatherType,
      temperature: temperature ?? this.temperature,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (weatherType.present) {
      map['weather_type'] = Variable<String>(weatherType.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<int>(temperature.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeatherPlansCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('location: $location, ')
          ..write('weatherType: $weatherType, ')
          ..write('temperature: $temperature, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TripsTable trips = $TripsTable(this);
  late final $ClothingItemsTable clothingItems = $ClothingItemsTable(this);
  late final $TripDaysTable tripDays = $TripDaysTable(this);
  late final $DayClothingItemsTable dayClothingItems =
      $DayClothingItemsTable(this);
  late final $TripTemplatesTable tripTemplates = $TripTemplatesTable(this);
  late final $TemplateClothingItemsTable templateClothingItems =
      $TemplateClothingItemsTable(this);
  late final $OutfitPhotosTable outfitPhotos = $OutfitPhotosTable(this);
  late final $OutfitClothingItemsTable outfitClothingItems =
      $OutfitClothingItemsTable(this);
  late final $WeatherPlansTable weatherPlans = $WeatherPlansTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        trips,
        clothingItems,
        tripDays,
        dayClothingItems,
        tripTemplates,
        templateClothingItems,
        outfitPhotos,
        outfitClothingItems,
        weatherPlans
      ];
}

typedef $$TripsTableCreateCompanionBuilder = TripsCompanion Function({
  Value<int> id,
  required String name,
  required String destination,
  required DateTime startDate,
  required DateTime endDate,
  Value<String?> description,
  Value<DateTime> createdAt,
});
typedef $$TripsTableUpdateCompanionBuilder = TripsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> destination,
  Value<DateTime> startDate,
  Value<DateTime> endDate,
  Value<String?> description,
  Value<DateTime> createdAt,
});

final class $$TripsTableReferences
    extends BaseReferences<_$AppDatabase, $TripsTable, Trip> {
  $$TripsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TripDaysTable, List<TripDay>> _tripDaysRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tripDays,
          aliasName: $_aliasNameGenerator(db.trips.id, db.tripDays.tripId));

  $$TripDaysTableProcessedTableManager get tripDaysRefs {
    final manager = $$TripDaysTableTableManager($_db, $_db.tripDays)
        .filter((f) => f.tripId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tripDaysRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TripsTableFilterComposer extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> tripDaysRefs(
      Expression<bool> Function($$TripDaysTableFilterComposer f) f) {
    final $$TripDaysTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tripDays,
        getReferencedColumn: (t) => t.tripId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripDaysTableFilterComposer(
              $db: $db,
              $table: $db.tripDays,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TripsTableOrderingComposer
    extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$TripsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> tripDaysRefs<T extends Object>(
      Expression<T> Function($$TripDaysTableAnnotationComposer a) f) {
    final $$TripDaysTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tripDays,
        getReferencedColumn: (t) => t.tripId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripDaysTableAnnotationComposer(
              $db: $db,
              $table: $db.tripDays,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TripsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TripsTable,
    Trip,
    $$TripsTableFilterComposer,
    $$TripsTableOrderingComposer,
    $$TripsTableAnnotationComposer,
    $$TripsTableCreateCompanionBuilder,
    $$TripsTableUpdateCompanionBuilder,
    (Trip, $$TripsTableReferences),
    Trip,
    PrefetchHooks Function({bool tripDaysRefs})> {
  $$TripsTableTableManager(_$AppDatabase db, $TripsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TripsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TripsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TripsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> destination = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime> endDate = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TripsCompanion(
            id: id,
            name: name,
            destination: destination,
            startDate: startDate,
            endDate: endDate,
            description: description,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String destination,
            required DateTime startDate,
            required DateTime endDate,
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TripsCompanion.insert(
            id: id,
            name: name,
            destination: destination,
            startDate: startDate,
            endDate: endDate,
            description: description,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TripsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({tripDaysRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tripDaysRefs) db.tripDays],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tripDaysRefs)
                    await $_getPrefetchedData<Trip, $TripsTable, TripDay>(
                        currentTable: table,
                        referencedTable:
                            $$TripsTableReferences._tripDaysRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TripsTableReferences(db, table, p0).tripDaysRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.tripId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TripsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TripsTable,
    Trip,
    $$TripsTableFilterComposer,
    $$TripsTableOrderingComposer,
    $$TripsTableAnnotationComposer,
    $$TripsTableCreateCompanionBuilder,
    $$TripsTableUpdateCompanionBuilder,
    (Trip, $$TripsTableReferences),
    Trip,
    PrefetchHooks Function({bool tripDaysRefs})>;
typedef $$ClothingItemsTableCreateCompanionBuilder = ClothingItemsCompanion
    Function({
  Value<int> id,
  required String name,
  required String category,
  Value<String?> color,
  Value<String?> size,
  Value<String?> brand,
  Value<String?> imagePath,
  Value<DateTime> createdAt,
});
typedef $$ClothingItemsTableUpdateCompanionBuilder = ClothingItemsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> category,
  Value<String?> color,
  Value<String?> size,
  Value<String?> brand,
  Value<String?> imagePath,
  Value<DateTime> createdAt,
});

final class $$ClothingItemsTableReferences
    extends BaseReferences<_$AppDatabase, $ClothingItemsTable, ClothingItem> {
  $$ClothingItemsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DayClothingItemsTable, List<DayClothingItem>>
      _dayClothingItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.dayClothingItems,
              aliasName: $_aliasNameGenerator(
                  db.clothingItems.id, db.dayClothingItems.clothingItemId));

  $$DayClothingItemsTableProcessedTableManager get dayClothingItemsRefs {
    final manager = $$DayClothingItemsTableTableManager(
            $_db, $_db.dayClothingItems)
        .filter((f) => f.clothingItemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_dayClothingItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TemplateClothingItemsTable,
      List<TemplateClothingItem>> _templateClothingItemsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.templateClothingItems,
          aliasName: $_aliasNameGenerator(
              db.clothingItems.id, db.templateClothingItems.clothingItemId));

  $$TemplateClothingItemsTableProcessedTableManager
      get templateClothingItemsRefs {
    final manager = $$TemplateClothingItemsTableTableManager(
            $_db, $_db.templateClothingItems)
        .filter((f) => f.clothingItemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_templateClothingItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$OutfitClothingItemsTable,
      List<OutfitClothingItem>> _outfitClothingItemsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.outfitClothingItems,
          aliasName: $_aliasNameGenerator(
              db.clothingItems.id, db.outfitClothingItems.clothingItemId));

  $$OutfitClothingItemsTableProcessedTableManager get outfitClothingItemsRefs {
    final manager = $$OutfitClothingItemsTableTableManager(
            $_db, $_db.outfitClothingItems)
        .filter((f) => f.clothingItemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_outfitClothingItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ClothingItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ClothingItemsTable> {
  $$ClothingItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get size => $composableBuilder(
      column: $table.size, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> dayClothingItemsRefs(
      Expression<bool> Function($$DayClothingItemsTableFilterComposer f) f) {
    final $$DayClothingItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dayClothingItems,
        getReferencedColumn: (t) => t.clothingItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DayClothingItemsTableFilterComposer(
              $db: $db,
              $table: $db.dayClothingItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> templateClothingItemsRefs(
      Expression<bool> Function($$TemplateClothingItemsTableFilterComposer f)
          f) {
    final $$TemplateClothingItemsTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.templateClothingItems,
            getReferencedColumn: (t) => t.clothingItemId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TemplateClothingItemsTableFilterComposer(
                  $db: $db,
                  $table: $db.templateClothingItems,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> outfitClothingItemsRefs(
      Expression<bool> Function($$OutfitClothingItemsTableFilterComposer f) f) {
    final $$OutfitClothingItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.outfitClothingItems,
        getReferencedColumn: (t) => t.clothingItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OutfitClothingItemsTableFilterComposer(
              $db: $db,
              $table: $db.outfitClothingItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ClothingItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ClothingItemsTable> {
  $$ClothingItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get size => $composableBuilder(
      column: $table.size, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$ClothingItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClothingItemsTable> {
  $$ClothingItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> dayClothingItemsRefs<T extends Object>(
      Expression<T> Function($$DayClothingItemsTableAnnotationComposer a) f) {
    final $$DayClothingItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dayClothingItems,
        getReferencedColumn: (t) => t.clothingItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DayClothingItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.dayClothingItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> templateClothingItemsRefs<T extends Object>(
      Expression<T> Function($$TemplateClothingItemsTableAnnotationComposer a)
          f) {
    final $$TemplateClothingItemsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.templateClothingItems,
            getReferencedColumn: (t) => t.clothingItemId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TemplateClothingItemsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.templateClothingItems,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> outfitClothingItemsRefs<T extends Object>(
      Expression<T> Function($$OutfitClothingItemsTableAnnotationComposer a)
          f) {
    final $$OutfitClothingItemsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.outfitClothingItems,
            getReferencedColumn: (t) => t.clothingItemId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$OutfitClothingItemsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.outfitClothingItems,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ClothingItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ClothingItemsTable,
    ClothingItem,
    $$ClothingItemsTableFilterComposer,
    $$ClothingItemsTableOrderingComposer,
    $$ClothingItemsTableAnnotationComposer,
    $$ClothingItemsTableCreateCompanionBuilder,
    $$ClothingItemsTableUpdateCompanionBuilder,
    (ClothingItem, $$ClothingItemsTableReferences),
    ClothingItem,
    PrefetchHooks Function(
        {bool dayClothingItemsRefs,
        bool templateClothingItemsRefs,
        bool outfitClothingItemsRefs})> {
  $$ClothingItemsTableTableManager(_$AppDatabase db, $ClothingItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClothingItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClothingItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClothingItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<String?> size = const Value.absent(),
            Value<String?> brand = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ClothingItemsCompanion(
            id: id,
            name: name,
            category: category,
            color: color,
            size: size,
            brand: brand,
            imagePath: imagePath,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String category,
            Value<String?> color = const Value.absent(),
            Value<String?> size = const Value.absent(),
            Value<String?> brand = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ClothingItemsCompanion.insert(
            id: id,
            name: name,
            category: category,
            color: color,
            size: size,
            brand: brand,
            imagePath: imagePath,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ClothingItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {dayClothingItemsRefs = false,
              templateClothingItemsRefs = false,
              outfitClothingItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (dayClothingItemsRefs) db.dayClothingItems,
                if (templateClothingItemsRefs) db.templateClothingItems,
                if (outfitClothingItemsRefs) db.outfitClothingItems
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dayClothingItemsRefs)
                    await $_getPrefetchedData<ClothingItem, $ClothingItemsTable,
                            DayClothingItem>(
                        currentTable: table,
                        referencedTable: $$ClothingItemsTableReferences
                            ._dayClothingItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ClothingItemsTableReferences(db, table, p0)
                                .dayClothingItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.clothingItemId == item.id),
                        typedResults: items),
                  if (templateClothingItemsRefs)
                    await $_getPrefetchedData<ClothingItem, $ClothingItemsTable,
                            TemplateClothingItem>(
                        currentTable: table,
                        referencedTable: $$ClothingItemsTableReferences
                            ._templateClothingItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ClothingItemsTableReferences(db, table, p0)
                                .templateClothingItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.clothingItemId == item.id),
                        typedResults: items),
                  if (outfitClothingItemsRefs)
                    await $_getPrefetchedData<ClothingItem, $ClothingItemsTable,
                            OutfitClothingItem>(
                        currentTable: table,
                        referencedTable: $$ClothingItemsTableReferences
                            ._outfitClothingItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ClothingItemsTableReferences(db, table, p0)
                                .outfitClothingItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.clothingItemId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ClothingItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ClothingItemsTable,
    ClothingItem,
    $$ClothingItemsTableFilterComposer,
    $$ClothingItemsTableOrderingComposer,
    $$ClothingItemsTableAnnotationComposer,
    $$ClothingItemsTableCreateCompanionBuilder,
    $$ClothingItemsTableUpdateCompanionBuilder,
    (ClothingItem, $$ClothingItemsTableReferences),
    ClothingItem,
    PrefetchHooks Function(
        {bool dayClothingItemsRefs,
        bool templateClothingItemsRefs,
        bool outfitClothingItemsRefs})>;
typedef $$TripDaysTableCreateCompanionBuilder = TripDaysCompanion Function({
  Value<int> id,
  required int tripId,
  required DateTime date,
  Value<String?> weather,
  Value<double?> temperature,
  Value<String?> activities,
  Value<String?> notes,
});
typedef $$TripDaysTableUpdateCompanionBuilder = TripDaysCompanion Function({
  Value<int> id,
  Value<int> tripId,
  Value<DateTime> date,
  Value<String?> weather,
  Value<double?> temperature,
  Value<String?> activities,
  Value<String?> notes,
});

final class $$TripDaysTableReferences
    extends BaseReferences<_$AppDatabase, $TripDaysTable, TripDay> {
  $$TripDaysTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TripsTable _tripIdTable(_$AppDatabase db) => db.trips
      .createAlias($_aliasNameGenerator(db.tripDays.tripId, db.trips.id));

  $$TripsTableProcessedTableManager get tripId {
    final $_column = $_itemColumn<int>('trip_id')!;

    final manager = $$TripsTableTableManager($_db, $_db.trips)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tripIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$DayClothingItemsTable, List<DayClothingItem>>
      _dayClothingItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.dayClothingItems,
              aliasName: $_aliasNameGenerator(
                  db.tripDays.id, db.dayClothingItems.dayId));

  $$DayClothingItemsTableProcessedTableManager get dayClothingItemsRefs {
    final manager =
        $$DayClothingItemsTableTableManager($_db, $_db.dayClothingItems)
            .filter((f) => f.dayId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_dayClothingItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TripDaysTableFilterComposer
    extends Composer<_$AppDatabase, $TripDaysTable> {
  $$TripDaysTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get weather => $composableBuilder(
      column: $table.weather, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get activities => $composableBuilder(
      column: $table.activities, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$TripsTableFilterComposer get tripId {
    final $$TripsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableFilterComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> dayClothingItemsRefs(
      Expression<bool> Function($$DayClothingItemsTableFilterComposer f) f) {
    final $$DayClothingItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dayClothingItems,
        getReferencedColumn: (t) => t.dayId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DayClothingItemsTableFilterComposer(
              $db: $db,
              $table: $db.dayClothingItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TripDaysTableOrderingComposer
    extends Composer<_$AppDatabase, $TripDaysTable> {
  $$TripDaysTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get weather => $composableBuilder(
      column: $table.weather, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get activities => $composableBuilder(
      column: $table.activities, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$TripsTableOrderingComposer get tripId {
    final $$TripsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableOrderingComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TripDaysTableAnnotationComposer
    extends Composer<_$AppDatabase, $TripDaysTable> {
  $$TripDaysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get weather =>
      $composableBuilder(column: $table.weather, builder: (column) => column);

  GeneratedColumn<double> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => column);

  GeneratedColumn<String> get activities => $composableBuilder(
      column: $table.activities, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$TripsTableAnnotationComposer get tripId {
    final $$TripsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tripId,
        referencedTable: $db.trips,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripsTableAnnotationComposer(
              $db: $db,
              $table: $db.trips,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> dayClothingItemsRefs<T extends Object>(
      Expression<T> Function($$DayClothingItemsTableAnnotationComposer a) f) {
    final $$DayClothingItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dayClothingItems,
        getReferencedColumn: (t) => t.dayId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DayClothingItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.dayClothingItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TripDaysTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TripDaysTable,
    TripDay,
    $$TripDaysTableFilterComposer,
    $$TripDaysTableOrderingComposer,
    $$TripDaysTableAnnotationComposer,
    $$TripDaysTableCreateCompanionBuilder,
    $$TripDaysTableUpdateCompanionBuilder,
    (TripDay, $$TripDaysTableReferences),
    TripDay,
    PrefetchHooks Function({bool tripId, bool dayClothingItemsRefs})> {
  $$TripDaysTableTableManager(_$AppDatabase db, $TripDaysTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TripDaysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TripDaysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TripDaysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> tripId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String?> weather = const Value.absent(),
            Value<double?> temperature = const Value.absent(),
            Value<String?> activities = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              TripDaysCompanion(
            id: id,
            tripId: tripId,
            date: date,
            weather: weather,
            temperature: temperature,
            activities: activities,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int tripId,
            required DateTime date,
            Value<String?> weather = const Value.absent(),
            Value<double?> temperature = const Value.absent(),
            Value<String?> activities = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              TripDaysCompanion.insert(
            id: id,
            tripId: tripId,
            date: date,
            weather: weather,
            temperature: temperature,
            activities: activities,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TripDaysTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {tripId = false, dayClothingItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (dayClothingItemsRefs) db.dayClothingItems
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (tripId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tripId,
                    referencedTable: $$TripDaysTableReferences._tripIdTable(db),
                    referencedColumn:
                        $$TripDaysTableReferences._tripIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dayClothingItemsRefs)
                    await $_getPrefetchedData<TripDay, $TripDaysTable,
                            DayClothingItem>(
                        currentTable: table,
                        referencedTable: $$TripDaysTableReferences
                            ._dayClothingItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TripDaysTableReferences(db, table, p0)
                                .dayClothingItemsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.dayId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TripDaysTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TripDaysTable,
    TripDay,
    $$TripDaysTableFilterComposer,
    $$TripDaysTableOrderingComposer,
    $$TripDaysTableAnnotationComposer,
    $$TripDaysTableCreateCompanionBuilder,
    $$TripDaysTableUpdateCompanionBuilder,
    (TripDay, $$TripDaysTableReferences),
    TripDay,
    PrefetchHooks Function({bool tripId, bool dayClothingItemsRefs})>;
typedef $$DayClothingItemsTableCreateCompanionBuilder
    = DayClothingItemsCompanion Function({
  Value<int> id,
  required int dayId,
  required int clothingItemId,
  Value<bool> isWorn,
});
typedef $$DayClothingItemsTableUpdateCompanionBuilder
    = DayClothingItemsCompanion Function({
  Value<int> id,
  Value<int> dayId,
  Value<int> clothingItemId,
  Value<bool> isWorn,
});

final class $$DayClothingItemsTableReferences extends BaseReferences<
    _$AppDatabase, $DayClothingItemsTable, DayClothingItem> {
  $$DayClothingItemsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TripDaysTable _dayIdTable(_$AppDatabase db) =>
      db.tripDays.createAlias(
          $_aliasNameGenerator(db.dayClothingItems.dayId, db.tripDays.id));

  $$TripDaysTableProcessedTableManager get dayId {
    final $_column = $_itemColumn<int>('day_id')!;

    final manager = $$TripDaysTableTableManager($_db, $_db.tripDays)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dayIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ClothingItemsTable _clothingItemIdTable(_$AppDatabase db) =>
      db.clothingItems.createAlias($_aliasNameGenerator(
          db.dayClothingItems.clothingItemId, db.clothingItems.id));

  $$ClothingItemsTableProcessedTableManager get clothingItemId {
    final $_column = $_itemColumn<int>('clothing_item_id')!;

    final manager = $$ClothingItemsTableTableManager($_db, $_db.clothingItems)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clothingItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DayClothingItemsTableFilterComposer
    extends Composer<_$AppDatabase, $DayClothingItemsTable> {
  $$DayClothingItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isWorn => $composableBuilder(
      column: $table.isWorn, builder: (column) => ColumnFilters(column));

  $$TripDaysTableFilterComposer get dayId {
    final $$TripDaysTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dayId,
        referencedTable: $db.tripDays,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripDaysTableFilterComposer(
              $db: $db,
              $table: $db.tripDays,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ClothingItemsTableFilterComposer get clothingItemId {
    final $$ClothingItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clothingItemId,
        referencedTable: $db.clothingItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClothingItemsTableFilterComposer(
              $db: $db,
              $table: $db.clothingItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DayClothingItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $DayClothingItemsTable> {
  $$DayClothingItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isWorn => $composableBuilder(
      column: $table.isWorn, builder: (column) => ColumnOrderings(column));

  $$TripDaysTableOrderingComposer get dayId {
    final $$TripDaysTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dayId,
        referencedTable: $db.tripDays,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripDaysTableOrderingComposer(
              $db: $db,
              $table: $db.tripDays,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ClothingItemsTableOrderingComposer get clothingItemId {
    final $$ClothingItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clothingItemId,
        referencedTable: $db.clothingItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClothingItemsTableOrderingComposer(
              $db: $db,
              $table: $db.clothingItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DayClothingItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DayClothingItemsTable> {
  $$DayClothingItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isWorn =>
      $composableBuilder(column: $table.isWorn, builder: (column) => column);

  $$TripDaysTableAnnotationComposer get dayId {
    final $$TripDaysTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dayId,
        referencedTable: $db.tripDays,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripDaysTableAnnotationComposer(
              $db: $db,
              $table: $db.tripDays,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ClothingItemsTableAnnotationComposer get clothingItemId {
    final $$ClothingItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clothingItemId,
        referencedTable: $db.clothingItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClothingItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.clothingItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DayClothingItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DayClothingItemsTable,
    DayClothingItem,
    $$DayClothingItemsTableFilterComposer,
    $$DayClothingItemsTableOrderingComposer,
    $$DayClothingItemsTableAnnotationComposer,
    $$DayClothingItemsTableCreateCompanionBuilder,
    $$DayClothingItemsTableUpdateCompanionBuilder,
    (DayClothingItem, $$DayClothingItemsTableReferences),
    DayClothingItem,
    PrefetchHooks Function({bool dayId, bool clothingItemId})> {
  $$DayClothingItemsTableTableManager(
      _$AppDatabase db, $DayClothingItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DayClothingItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DayClothingItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DayClothingItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> dayId = const Value.absent(),
            Value<int> clothingItemId = const Value.absent(),
            Value<bool> isWorn = const Value.absent(),
          }) =>
              DayClothingItemsCompanion(
            id: id,
            dayId: dayId,
            clothingItemId: clothingItemId,
            isWorn: isWorn,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int dayId,
            required int clothingItemId,
            Value<bool> isWorn = const Value.absent(),
          }) =>
              DayClothingItemsCompanion.insert(
            id: id,
            dayId: dayId,
            clothingItemId: clothingItemId,
            isWorn: isWorn,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DayClothingItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({dayId = false, clothingItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (dayId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.dayId,
                    referencedTable:
                        $$DayClothingItemsTableReferences._dayIdTable(db),
                    referencedColumn:
                        $$DayClothingItemsTableReferences._dayIdTable(db).id,
                  ) as T;
                }
                if (clothingItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.clothingItemId,
                    referencedTable: $$DayClothingItemsTableReferences
                        ._clothingItemIdTable(db),
                    referencedColumn: $$DayClothingItemsTableReferences
                        ._clothingItemIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DayClothingItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DayClothingItemsTable,
    DayClothingItem,
    $$DayClothingItemsTableFilterComposer,
    $$DayClothingItemsTableOrderingComposer,
    $$DayClothingItemsTableAnnotationComposer,
    $$DayClothingItemsTableCreateCompanionBuilder,
    $$DayClothingItemsTableUpdateCompanionBuilder,
    (DayClothingItem, $$DayClothingItemsTableReferences),
    DayClothingItem,
    PrefetchHooks Function({bool dayId, bool clothingItemId})>;
typedef $$TripTemplatesTableCreateCompanionBuilder = TripTemplatesCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<String?> destination,
  Value<String?> season,
  Value<String?> duration,
  Value<DateTime> createdAt,
});
typedef $$TripTemplatesTableUpdateCompanionBuilder = TripTemplatesCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> destination,
  Value<String?> season,
  Value<String?> duration,
  Value<DateTime> createdAt,
});

final class $$TripTemplatesTableReferences
    extends BaseReferences<_$AppDatabase, $TripTemplatesTable, TripTemplate> {
  $$TripTemplatesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TemplateClothingItemsTable,
      List<TemplateClothingItem>> _templateClothingItemsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.templateClothingItems,
          aliasName: $_aliasNameGenerator(
              db.tripTemplates.id, db.templateClothingItems.templateId));

  $$TemplateClothingItemsTableProcessedTableManager
      get templateClothingItemsRefs {
    final manager = $$TemplateClothingItemsTableTableManager(
            $_db, $_db.templateClothingItems)
        .filter((f) => f.templateId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_templateClothingItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TripTemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $TripTemplatesTable> {
  $$TripTemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get season => $composableBuilder(
      column: $table.season, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> templateClothingItemsRefs(
      Expression<bool> Function($$TemplateClothingItemsTableFilterComposer f)
          f) {
    final $$TemplateClothingItemsTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.templateClothingItems,
            getReferencedColumn: (t) => t.templateId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TemplateClothingItemsTableFilterComposer(
                  $db: $db,
                  $table: $db.templateClothingItems,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TripTemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $TripTemplatesTable> {
  $$TripTemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get season => $composableBuilder(
      column: $table.season, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$TripTemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TripTemplatesTable> {
  $$TripTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get destination => $composableBuilder(
      column: $table.destination, builder: (column) => column);

  GeneratedColumn<String> get season =>
      $composableBuilder(column: $table.season, builder: (column) => column);

  GeneratedColumn<String> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> templateClothingItemsRefs<T extends Object>(
      Expression<T> Function($$TemplateClothingItemsTableAnnotationComposer a)
          f) {
    final $$TemplateClothingItemsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.templateClothingItems,
            getReferencedColumn: (t) => t.templateId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TemplateClothingItemsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.templateClothingItems,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TripTemplatesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TripTemplatesTable,
    TripTemplate,
    $$TripTemplatesTableFilterComposer,
    $$TripTemplatesTableOrderingComposer,
    $$TripTemplatesTableAnnotationComposer,
    $$TripTemplatesTableCreateCompanionBuilder,
    $$TripTemplatesTableUpdateCompanionBuilder,
    (TripTemplate, $$TripTemplatesTableReferences),
    TripTemplate,
    PrefetchHooks Function({bool templateClothingItemsRefs})> {
  $$TripTemplatesTableTableManager(_$AppDatabase db, $TripTemplatesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TripTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TripTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TripTemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> destination = const Value.absent(),
            Value<String?> season = const Value.absent(),
            Value<String?> duration = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TripTemplatesCompanion(
            id: id,
            name: name,
            description: description,
            destination: destination,
            season: season,
            duration: duration,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> destination = const Value.absent(),
            Value<String?> season = const Value.absent(),
            Value<String?> duration = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TripTemplatesCompanion.insert(
            id: id,
            name: name,
            description: description,
            destination: destination,
            season: season,
            duration: duration,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TripTemplatesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({templateClothingItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (templateClothingItemsRefs) db.templateClothingItems
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (templateClothingItemsRefs)
                    await $_getPrefetchedData<TripTemplate, $TripTemplatesTable,
                            TemplateClothingItem>(
                        currentTable: table,
                        referencedTable: $$TripTemplatesTableReferences
                            ._templateClothingItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TripTemplatesTableReferences(db, table, p0)
                                .templateClothingItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.templateId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TripTemplatesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TripTemplatesTable,
    TripTemplate,
    $$TripTemplatesTableFilterComposer,
    $$TripTemplatesTableOrderingComposer,
    $$TripTemplatesTableAnnotationComposer,
    $$TripTemplatesTableCreateCompanionBuilder,
    $$TripTemplatesTableUpdateCompanionBuilder,
    (TripTemplate, $$TripTemplatesTableReferences),
    TripTemplate,
    PrefetchHooks Function({bool templateClothingItemsRefs})>;
typedef $$TemplateClothingItemsTableCreateCompanionBuilder
    = TemplateClothingItemsCompanion Function({
  Value<int> id,
  required int templateId,
  required int clothingItemId,
  Value<int> quantity,
});
typedef $$TemplateClothingItemsTableUpdateCompanionBuilder
    = TemplateClothingItemsCompanion Function({
  Value<int> id,
  Value<int> templateId,
  Value<int> clothingItemId,
  Value<int> quantity,
});

final class $$TemplateClothingItemsTableReferences extends BaseReferences<
    _$AppDatabase, $TemplateClothingItemsTable, TemplateClothingItem> {
  $$TemplateClothingItemsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TripTemplatesTable _templateIdTable(_$AppDatabase db) =>
      db.tripTemplates.createAlias($_aliasNameGenerator(
          db.templateClothingItems.templateId, db.tripTemplates.id));

  $$TripTemplatesTableProcessedTableManager get templateId {
    final $_column = $_itemColumn<int>('template_id')!;

    final manager = $$TripTemplatesTableTableManager($_db, $_db.tripTemplates)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_templateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ClothingItemsTable _clothingItemIdTable(_$AppDatabase db) =>
      db.clothingItems.createAlias($_aliasNameGenerator(
          db.templateClothingItems.clothingItemId, db.clothingItems.id));

  $$ClothingItemsTableProcessedTableManager get clothingItemId {
    final $_column = $_itemColumn<int>('clothing_item_id')!;

    final manager = $$ClothingItemsTableTableManager($_db, $_db.clothingItems)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clothingItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TemplateClothingItemsTableFilterComposer
    extends Composer<_$AppDatabase, $TemplateClothingItemsTable> {
  $$TemplateClothingItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  $$TripTemplatesTableFilterComposer get templateId {
    final $$TripTemplatesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.templateId,
        referencedTable: $db.tripTemplates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripTemplatesTableFilterComposer(
              $db: $db,
              $table: $db.tripTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ClothingItemsTableFilterComposer get clothingItemId {
    final $$ClothingItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clothingItemId,
        referencedTable: $db.clothingItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClothingItemsTableFilterComposer(
              $db: $db,
              $table: $db.clothingItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TemplateClothingItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $TemplateClothingItemsTable> {
  $$TemplateClothingItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  $$TripTemplatesTableOrderingComposer get templateId {
    final $$TripTemplatesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.templateId,
        referencedTable: $db.tripTemplates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripTemplatesTableOrderingComposer(
              $db: $db,
              $table: $db.tripTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ClothingItemsTableOrderingComposer get clothingItemId {
    final $$ClothingItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clothingItemId,
        referencedTable: $db.clothingItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClothingItemsTableOrderingComposer(
              $db: $db,
              $table: $db.clothingItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TemplateClothingItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TemplateClothingItemsTable> {
  $$TemplateClothingItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  $$TripTemplatesTableAnnotationComposer get templateId {
    final $$TripTemplatesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.templateId,
        referencedTable: $db.tripTemplates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TripTemplatesTableAnnotationComposer(
              $db: $db,
              $table: $db.tripTemplates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ClothingItemsTableAnnotationComposer get clothingItemId {
    final $$ClothingItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clothingItemId,
        referencedTable: $db.clothingItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClothingItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.clothingItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TemplateClothingItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TemplateClothingItemsTable,
    TemplateClothingItem,
    $$TemplateClothingItemsTableFilterComposer,
    $$TemplateClothingItemsTableOrderingComposer,
    $$TemplateClothingItemsTableAnnotationComposer,
    $$TemplateClothingItemsTableCreateCompanionBuilder,
    $$TemplateClothingItemsTableUpdateCompanionBuilder,
    (TemplateClothingItem, $$TemplateClothingItemsTableReferences),
    TemplateClothingItem,
    PrefetchHooks Function({bool templateId, bool clothingItemId})> {
  $$TemplateClothingItemsTableTableManager(
      _$AppDatabase db, $TemplateClothingItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TemplateClothingItemsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$TemplateClothingItemsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TemplateClothingItemsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> templateId = const Value.absent(),
            Value<int> clothingItemId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
          }) =>
              TemplateClothingItemsCompanion(
            id: id,
            templateId: templateId,
            clothingItemId: clothingItemId,
            quantity: quantity,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int templateId,
            required int clothingItemId,
            Value<int> quantity = const Value.absent(),
          }) =>
              TemplateClothingItemsCompanion.insert(
            id: id,
            templateId: templateId,
            clothingItemId: clothingItemId,
            quantity: quantity,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TemplateClothingItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {templateId = false, clothingItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (templateId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.templateId,
                    referencedTable: $$TemplateClothingItemsTableReferences
                        ._templateIdTable(db),
                    referencedColumn: $$TemplateClothingItemsTableReferences
                        ._templateIdTable(db)
                        .id,
                  ) as T;
                }
                if (clothingItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.clothingItemId,
                    referencedTable: $$TemplateClothingItemsTableReferences
                        ._clothingItemIdTable(db),
                    referencedColumn: $$TemplateClothingItemsTableReferences
                        ._clothingItemIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TemplateClothingItemsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $TemplateClothingItemsTable,
        TemplateClothingItem,
        $$TemplateClothingItemsTableFilterComposer,
        $$TemplateClothingItemsTableOrderingComposer,
        $$TemplateClothingItemsTableAnnotationComposer,
        $$TemplateClothingItemsTableCreateCompanionBuilder,
        $$TemplateClothingItemsTableUpdateCompanionBuilder,
        (TemplateClothingItem, $$TemplateClothingItemsTableReferences),
        TemplateClothingItem,
        PrefetchHooks Function({bool templateId, bool clothingItemId})>;
typedef $$OutfitPhotosTableCreateCompanionBuilder = OutfitPhotosCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<String?> tags,
  required Uint8List imageData,
  Value<DateTime> createdAt,
});
typedef $$OutfitPhotosTableUpdateCompanionBuilder = OutfitPhotosCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> tags,
  Value<Uint8List> imageData,
  Value<DateTime> createdAt,
});

final class $$OutfitPhotosTableReferences
    extends BaseReferences<_$AppDatabase, $OutfitPhotosTable, OutfitPhoto> {
  $$OutfitPhotosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$OutfitClothingItemsTable,
      List<OutfitClothingItem>> _outfitClothingItemsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.outfitClothingItems,
          aliasName: $_aliasNameGenerator(
              db.outfitPhotos.id, db.outfitClothingItems.outfitPhotoId));

  $$OutfitClothingItemsTableProcessedTableManager get outfitClothingItemsRefs {
    final manager = $$OutfitClothingItemsTableTableManager(
            $_db, $_db.outfitClothingItems)
        .filter((f) => f.outfitPhotoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_outfitClothingItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$OutfitPhotosTableFilterComposer
    extends Composer<_$AppDatabase, $OutfitPhotosTable> {
  $$OutfitPhotosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get imageData => $composableBuilder(
      column: $table.imageData, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> outfitClothingItemsRefs(
      Expression<bool> Function($$OutfitClothingItemsTableFilterComposer f) f) {
    final $$OutfitClothingItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.outfitClothingItems,
        getReferencedColumn: (t) => t.outfitPhotoId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OutfitClothingItemsTableFilterComposer(
              $db: $db,
              $table: $db.outfitClothingItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$OutfitPhotosTableOrderingComposer
    extends Composer<_$AppDatabase, $OutfitPhotosTable> {
  $$OutfitPhotosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get imageData => $composableBuilder(
      column: $table.imageData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$OutfitPhotosTableAnnotationComposer
    extends Composer<_$AppDatabase, $OutfitPhotosTable> {
  $$OutfitPhotosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<Uint8List> get imageData =>
      $composableBuilder(column: $table.imageData, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> outfitClothingItemsRefs<T extends Object>(
      Expression<T> Function($$OutfitClothingItemsTableAnnotationComposer a)
          f) {
    final $$OutfitClothingItemsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.outfitClothingItems,
            getReferencedColumn: (t) => t.outfitPhotoId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$OutfitClothingItemsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.outfitClothingItems,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$OutfitPhotosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OutfitPhotosTable,
    OutfitPhoto,
    $$OutfitPhotosTableFilterComposer,
    $$OutfitPhotosTableOrderingComposer,
    $$OutfitPhotosTableAnnotationComposer,
    $$OutfitPhotosTableCreateCompanionBuilder,
    $$OutfitPhotosTableUpdateCompanionBuilder,
    (OutfitPhoto, $$OutfitPhotosTableReferences),
    OutfitPhoto,
    PrefetchHooks Function({bool outfitClothingItemsRefs})> {
  $$OutfitPhotosTableTableManager(_$AppDatabase db, $OutfitPhotosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OutfitPhotosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OutfitPhotosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OutfitPhotosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> tags = const Value.absent(),
            Value<Uint8List> imageData = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              OutfitPhotosCompanion(
            id: id,
            name: name,
            description: description,
            tags: tags,
            imageData: imageData,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> tags = const Value.absent(),
            required Uint8List imageData,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              OutfitPhotosCompanion.insert(
            id: id,
            name: name,
            description: description,
            tags: tags,
            imageData: imageData,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$OutfitPhotosTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({outfitClothingItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (outfitClothingItemsRefs) db.outfitClothingItems
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (outfitClothingItemsRefs)
                    await $_getPrefetchedData<OutfitPhoto, $OutfitPhotosTable,
                            OutfitClothingItem>(
                        currentTable: table,
                        referencedTable: $$OutfitPhotosTableReferences
                            ._outfitClothingItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$OutfitPhotosTableReferences(db, table, p0)
                                .outfitClothingItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.outfitPhotoId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$OutfitPhotosTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OutfitPhotosTable,
    OutfitPhoto,
    $$OutfitPhotosTableFilterComposer,
    $$OutfitPhotosTableOrderingComposer,
    $$OutfitPhotosTableAnnotationComposer,
    $$OutfitPhotosTableCreateCompanionBuilder,
    $$OutfitPhotosTableUpdateCompanionBuilder,
    (OutfitPhoto, $$OutfitPhotosTableReferences),
    OutfitPhoto,
    PrefetchHooks Function({bool outfitClothingItemsRefs})>;
typedef $$OutfitClothingItemsTableCreateCompanionBuilder
    = OutfitClothingItemsCompanion Function({
  Value<int> id,
  required int outfitPhotoId,
  required int clothingItemId,
});
typedef $$OutfitClothingItemsTableUpdateCompanionBuilder
    = OutfitClothingItemsCompanion Function({
  Value<int> id,
  Value<int> outfitPhotoId,
  Value<int> clothingItemId,
});

final class $$OutfitClothingItemsTableReferences extends BaseReferences<
    _$AppDatabase, $OutfitClothingItemsTable, OutfitClothingItem> {
  $$OutfitClothingItemsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $OutfitPhotosTable _outfitPhotoIdTable(_$AppDatabase db) =>
      db.outfitPhotos.createAlias($_aliasNameGenerator(
          db.outfitClothingItems.outfitPhotoId, db.outfitPhotos.id));

  $$OutfitPhotosTableProcessedTableManager get outfitPhotoId {
    final $_column = $_itemColumn<int>('outfit_photo_id')!;

    final manager = $$OutfitPhotosTableTableManager($_db, $_db.outfitPhotos)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_outfitPhotoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ClothingItemsTable _clothingItemIdTable(_$AppDatabase db) =>
      db.clothingItems.createAlias($_aliasNameGenerator(
          db.outfitClothingItems.clothingItemId, db.clothingItems.id));

  $$ClothingItemsTableProcessedTableManager get clothingItemId {
    final $_column = $_itemColumn<int>('clothing_item_id')!;

    final manager = $$ClothingItemsTableTableManager($_db, $_db.clothingItems)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clothingItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$OutfitClothingItemsTableFilterComposer
    extends Composer<_$AppDatabase, $OutfitClothingItemsTable> {
  $$OutfitClothingItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  $$OutfitPhotosTableFilterComposer get outfitPhotoId {
    final $$OutfitPhotosTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.outfitPhotoId,
        referencedTable: $db.outfitPhotos,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OutfitPhotosTableFilterComposer(
              $db: $db,
              $table: $db.outfitPhotos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ClothingItemsTableFilterComposer get clothingItemId {
    final $$ClothingItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clothingItemId,
        referencedTable: $db.clothingItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClothingItemsTableFilterComposer(
              $db: $db,
              $table: $db.clothingItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OutfitClothingItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $OutfitClothingItemsTable> {
  $$OutfitClothingItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  $$OutfitPhotosTableOrderingComposer get outfitPhotoId {
    final $$OutfitPhotosTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.outfitPhotoId,
        referencedTable: $db.outfitPhotos,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OutfitPhotosTableOrderingComposer(
              $db: $db,
              $table: $db.outfitPhotos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ClothingItemsTableOrderingComposer get clothingItemId {
    final $$ClothingItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clothingItemId,
        referencedTable: $db.clothingItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClothingItemsTableOrderingComposer(
              $db: $db,
              $table: $db.clothingItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OutfitClothingItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OutfitClothingItemsTable> {
  $$OutfitClothingItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$OutfitPhotosTableAnnotationComposer get outfitPhotoId {
    final $$OutfitPhotosTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.outfitPhotoId,
        referencedTable: $db.outfitPhotos,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OutfitPhotosTableAnnotationComposer(
              $db: $db,
              $table: $db.outfitPhotos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ClothingItemsTableAnnotationComposer get clothingItemId {
    final $$ClothingItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clothingItemId,
        referencedTable: $db.clothingItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClothingItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.clothingItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OutfitClothingItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OutfitClothingItemsTable,
    OutfitClothingItem,
    $$OutfitClothingItemsTableFilterComposer,
    $$OutfitClothingItemsTableOrderingComposer,
    $$OutfitClothingItemsTableAnnotationComposer,
    $$OutfitClothingItemsTableCreateCompanionBuilder,
    $$OutfitClothingItemsTableUpdateCompanionBuilder,
    (OutfitClothingItem, $$OutfitClothingItemsTableReferences),
    OutfitClothingItem,
    PrefetchHooks Function({bool outfitPhotoId, bool clothingItemId})> {
  $$OutfitClothingItemsTableTableManager(
      _$AppDatabase db, $OutfitClothingItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OutfitClothingItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OutfitClothingItemsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OutfitClothingItemsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> outfitPhotoId = const Value.absent(),
            Value<int> clothingItemId = const Value.absent(),
          }) =>
              OutfitClothingItemsCompanion(
            id: id,
            outfitPhotoId: outfitPhotoId,
            clothingItemId: clothingItemId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int outfitPhotoId,
            required int clothingItemId,
          }) =>
              OutfitClothingItemsCompanion.insert(
            id: id,
            outfitPhotoId: outfitPhotoId,
            clothingItemId: clothingItemId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$OutfitClothingItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {outfitPhotoId = false, clothingItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (outfitPhotoId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.outfitPhotoId,
                    referencedTable: $$OutfitClothingItemsTableReferences
                        ._outfitPhotoIdTable(db),
                    referencedColumn: $$OutfitClothingItemsTableReferences
                        ._outfitPhotoIdTable(db)
                        .id,
                  ) as T;
                }
                if (clothingItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.clothingItemId,
                    referencedTable: $$OutfitClothingItemsTableReferences
                        ._clothingItemIdTable(db),
                    referencedColumn: $$OutfitClothingItemsTableReferences
                        ._clothingItemIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$OutfitClothingItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OutfitClothingItemsTable,
    OutfitClothingItem,
    $$OutfitClothingItemsTableFilterComposer,
    $$OutfitClothingItemsTableOrderingComposer,
    $$OutfitClothingItemsTableAnnotationComposer,
    $$OutfitClothingItemsTableCreateCompanionBuilder,
    $$OutfitClothingItemsTableUpdateCompanionBuilder,
    (OutfitClothingItem, $$OutfitClothingItemsTableReferences),
    OutfitClothingItem,
    PrefetchHooks Function({bool outfitPhotoId, bool clothingItemId})>;
typedef $$WeatherPlansTableCreateCompanionBuilder = WeatherPlansCompanion
    Function({
  Value<int> id,
  required String name,
  required String location,
  required String weatherType,
  required int temperature,
  Value<String?> description,
  Value<DateTime> createdAt,
});
typedef $$WeatherPlansTableUpdateCompanionBuilder = WeatherPlansCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> location,
  Value<String> weatherType,
  Value<int> temperature,
  Value<String?> description,
  Value<DateTime> createdAt,
});

class $$WeatherPlansTableFilterComposer
    extends Composer<_$AppDatabase, $WeatherPlansTable> {
  $$WeatherPlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get weatherType => $composableBuilder(
      column: $table.weatherType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$WeatherPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $WeatherPlansTable> {
  $$WeatherPlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get weatherType => $composableBuilder(
      column: $table.weatherType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$WeatherPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeatherPlansTable> {
  $$WeatherPlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get weatherType => $composableBuilder(
      column: $table.weatherType, builder: (column) => column);

  GeneratedColumn<int> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$WeatherPlansTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WeatherPlansTable,
    WeatherPlan,
    $$WeatherPlansTableFilterComposer,
    $$WeatherPlansTableOrderingComposer,
    $$WeatherPlansTableAnnotationComposer,
    $$WeatherPlansTableCreateCompanionBuilder,
    $$WeatherPlansTableUpdateCompanionBuilder,
    (
      WeatherPlan,
      BaseReferences<_$AppDatabase, $WeatherPlansTable, WeatherPlan>
    ),
    WeatherPlan,
    PrefetchHooks Function()> {
  $$WeatherPlansTableTableManager(_$AppDatabase db, $WeatherPlansTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeatherPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeatherPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeatherPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> location = const Value.absent(),
            Value<String> weatherType = const Value.absent(),
            Value<int> temperature = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              WeatherPlansCompanion(
            id: id,
            name: name,
            location: location,
            weatherType: weatherType,
            temperature: temperature,
            description: description,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String location,
            required String weatherType,
            required int temperature,
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              WeatherPlansCompanion.insert(
            id: id,
            name: name,
            location: location,
            weatherType: weatherType,
            temperature: temperature,
            description: description,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WeatherPlansTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WeatherPlansTable,
    WeatherPlan,
    $$WeatherPlansTableFilterComposer,
    $$WeatherPlansTableOrderingComposer,
    $$WeatherPlansTableAnnotationComposer,
    $$WeatherPlansTableCreateCompanionBuilder,
    $$WeatherPlansTableUpdateCompanionBuilder,
    (
      WeatherPlan,
      BaseReferences<_$AppDatabase, $WeatherPlansTable, WeatherPlan>
    ),
    WeatherPlan,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TripsTableTableManager get trips =>
      $$TripsTableTableManager(_db, _db.trips);
  $$ClothingItemsTableTableManager get clothingItems =>
      $$ClothingItemsTableTableManager(_db, _db.clothingItems);
  $$TripDaysTableTableManager get tripDays =>
      $$TripDaysTableTableManager(_db, _db.tripDays);
  $$DayClothingItemsTableTableManager get dayClothingItems =>
      $$DayClothingItemsTableTableManager(_db, _db.dayClothingItems);
  $$TripTemplatesTableTableManager get tripTemplates =>
      $$TripTemplatesTableTableManager(_db, _db.tripTemplates);
  $$TemplateClothingItemsTableTableManager get templateClothingItems =>
      $$TemplateClothingItemsTableTableManager(_db, _db.templateClothingItems);
  $$OutfitPhotosTableTableManager get outfitPhotos =>
      $$OutfitPhotosTableTableManager(_db, _db.outfitPhotos);
  $$OutfitClothingItemsTableTableManager get outfitClothingItems =>
      $$OutfitClothingItemsTableTableManager(_db, _db.outfitClothingItems);
  $$WeatherPlansTableTableManager get weatherPlans =>
      $$WeatherPlansTableTableManager(_db, _db.weatherPlans);
}
