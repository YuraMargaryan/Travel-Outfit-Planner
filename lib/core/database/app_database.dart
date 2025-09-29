import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

// Таблица для поездок
class Trips extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get destination => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// Таблица для одежды
class ClothingItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get category => text()(); // 'top', 'bottom', 'shoes', 'accessories'
  TextColumn get color => text().nullable()();
  TextColumn get size => text().nullable()();
  TextColumn get brand => text().nullable()();
  TextColumn get imagePath => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// Таблица для дней поездки
class TripDays extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tripId => integer().references(Trips, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get weather => text().nullable()(); // 'sunny', 'rainy', 'cold', etc.
  RealColumn get temperature => real().nullable()();
  TextColumn get activities => text().nullable()();
  TextColumn get notes => text().nullable()();
}

// Таблица для связи одежды с днями
class DayClothingItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dayId => integer().references(TripDays, #id)();
  IntColumn get clothingItemId => integer().references(ClothingItems, #id)();
  BoolColumn get isWorn => boolean().withDefault(const Constant(false))();
}

// Таблица для шаблонов поездок
class TripTemplates extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get destination => text().nullable()();
  TextColumn get season => text().nullable()(); // 'spring', 'summer', 'autumn', 'winter'
  TextColumn get duration => text().nullable()(); // 'weekend', 'week', 'month'
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// Таблица для связи шаблонов с одеждой
class TemplateClothingItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get templateId => integer().references(TripTemplates, #id)();
  IntColumn get clothingItemId => integer().references(ClothingItems, #id)();
  IntColumn get quantity => integer().withDefault(const Constant(1))();
}

// Таблица для фото поездок
class TripPhotos extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tripId => integer().references(Trips, #id)();
  IntColumn get dayId => integer().references(TripDays, #id).nullable()();
  TextColumn get imagePath => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// Таблица для фото комплектов
class OutfitPhotos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get tags => text().nullable()(); // Теги через запятую
  BlobColumn get imageData => blob()(); // Uint8List изображения
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// Таблица для планов погоды
class WeatherPlans extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get location => text()();
  TextColumn get weatherType => text()(); // 'sunny', 'cloudy', 'rainy', 'snowy', 'windy'
  IntColumn get temperature => integer()(); // Температура в градусах Цельсия
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [
  Trips,
  ClothingItems,
  TripDays,
  DayClothingItems,
  TripTemplates,
  TemplateClothingItems,
  OutfitPhotos,
  WeatherPlans,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
      await _insertDefaultData();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.createTable(outfitPhotos);
      }
      if (from < 3) {
        await m.createTable(weatherPlans);
      }
      if (from < 4) {
        // Update existing templates to English
        await _updateTemplatesToEnglish();
      }
    },
  );

  Future<void> _insertDefaultData() async {
    // Вставляем базовые шаблоны поездок
    await into(tripTemplates).insert(
      TripTemplatesCompanion.insert(
        name: 'Business trip',
        description: const Value('A template for business trips'),
        season: const Value('all'),
        duration: const Value('week'),
      ),
    );
    
    await into(tripTemplates).insert(
      TripTemplatesCompanion.insert(
        name: 'Beach holidays',
        description: const Value('A template for a beach holiday'),
        season: const Value('summer'),
        duration: const Value('week'),
      ),
    );
    
    await into(tripTemplates).insert(
      TripTemplatesCompanion.insert(
        name: 'Ski resort',
        description: const Value('Template for ski holidays'),
        season: const Value('winter'),
        duration: const Value('week'),
      ),
    );
    
    await into(tripTemplates).insert(
      TripTemplatesCompanion.insert(
        name: 'Urban tourism',
        description: const Value('Template for urban tourism'),
        season: const Value('all'),
        duration: const Value('weekend'),
      ),
    );
  }

  Future<void> _updateTemplatesToEnglish() async {
    // Delete existing templates and insert English ones
    await delete(tripTemplates).go();
    await _insertDefaultData();
  }

  // Методы для работы с поездками
  Future<List<Trip>> getAllTrips() => select(trips).get();
  
  Future<Trip?> getTripById(int id) => 
    (select(trips)..where((t) => t.id.equals(id))).getSingleOrNull();
  
  Future<int> insertTrip(TripsCompanion trip) => into(trips).insert(trip);
  
  Future<bool> updateTrip(Trip trip) => update(trips).replace(trip);
  
  Future<int> deleteTrip(int id) => (delete(trips)..where((t) => t.id.equals(id))).go();

  // Методы для работы с одеждой
  Future<List<ClothingItem>> getAllClothingItems() => select(clothingItems).get();
  
  Future<List<ClothingItem>> getClothingItemsByCategory(String category) =>
    (select(clothingItems)..where((c) => c.category.equals(category))).get();
  
  Future<int> insertClothingItem(ClothingItemsCompanion item) => 
    into(clothingItems).insert(item);
  
  Future<bool> updateClothingItem(ClothingItem item) => 
    update(clothingItems).replace(item);
  
  Future<int> deleteClothingItem(int id) => 
    (delete(clothingItems)..where((c) => c.id.equals(id))).go();

  // Методы для работы с днями поездки
  Future<List<TripDay>> getDaysForTrip(int tripId) =>
    (select(tripDays)..where((d) => d.tripId.equals(tripId))).get();
  
  Future<int> insertTripDay(TripDaysCompanion day) => into(tripDays).insert(day);
  
  Future<bool> updateTripDay(TripDay day) => update(tripDays).replace(day);
  
  Future<int> deleteTripDay(int id) => 
    (delete(tripDays)..where((d) => d.id.equals(id))).go();

  // Методы для работы с шаблонами
  Future<List<TripTemplate>> getAllTemplates() => select(tripTemplates).get();
  
  Future<TripTemplate?> getTemplateById(int id) =>
    (select(tripTemplates)..where((t) => t.id.equals(id))).getSingleOrNull();
  
  Future<int> insertTemplate(TripTemplatesCompanion template) =>
    into(tripTemplates).insert(template);
  
  Future<bool> updateTemplate(TripTemplate template) => 
    update(tripTemplates).replace(template);
  
  Future<int> deleteTemplate(int id) => 
    (delete(tripTemplates)..where((t) => t.id.equals(id))).go();
  
  Future<List<TripTemplate>> getTemplatesBySeason(String season) =>
    (select(tripTemplates)..where((t) => t.season.equals(season))).get();
  
  Future<List<TripTemplate>> getTemplatesByDuration(String duration) =>
    (select(tripTemplates)..where((t) => t.duration.equals(duration))).get();

  // Методы для работы с одеждой по дням
  Future<List<DayClothingItem>> getClothingForDay(int dayId) =>
    (select(dayClothingItems)..where((d) => d.dayId.equals(dayId))).get();
  
  Future<List<ClothingItem>> getClothingItemsForDay(int dayId) async {
    final dayClothing = await getClothingForDay(dayId);
    final clothingIds = dayClothing.map((dc) => dc.clothingItemId).toList();
    
    if (clothingIds.isEmpty) return [];
    
    return (select(clothingItems)..where((c) => c.id.isIn(clothingIds))).get();
  }
  
  Future<int> addClothingToDay(int dayId, int clothingItemId) =>
    into(dayClothingItems).insert(
      DayClothingItemsCompanion.insert(
        dayId: dayId,
        clothingItemId: clothingItemId,
      ),
    );
  
  Future<bool> removeClothingFromDay(int dayId, int clothingItemId) async {
    final result = await (delete(dayClothingItems)
      ..where((d) => d.dayId.equals(dayId) & d.clothingItemId.equals(clothingItemId))
    ).go();
    return result > 0;
  }
  
  Future<bool> toggleClothingWornStatus(int dayId, int clothingItemId) async {
    final existing = await (select(dayClothingItems)
      ..where((d) => d.dayId.equals(dayId) & d.clothingItemId.equals(clothingItemId))
    ).getSingleOrNull();
    
    if (existing == null) return false;
    
    return update(dayClothingItems).replace(
      existing.copyWith(isWorn: !existing.isWorn),
    );
  }

  // Методы для работы с фото комплектов
  Future<List<OutfitPhoto>> getAllOutfitPhotos() {
    return select(outfitPhotos).get();
  }
  
  Future<OutfitPhoto?> getOutfitPhoto(int id) {
    return (select(outfitPhotos)..where((p) => p.id.equals(id))).getSingleOrNull();
  }
  
  Future<int> insertOutfitPhoto(OutfitPhotosCompanion photo) async {
    final result = await into(outfitPhotos).insert(photo);
    return result;
  }
  
  Future<bool> updateOutfitPhoto(int id, String name, String? description, String? tags, Uint8List imageData) async {
    final result = await (update(outfitPhotos)..where((p) => p.id.equals(id))).write(
      OutfitPhotosCompanion(
        name: Value(name),
        description: Value(description),
        tags: Value(tags),
        imageData: Value(imageData),
      ),
    );
    return result > 0;
  }
  
  Future<bool> deleteOutfitPhoto(int id) async {
    final result = await (delete(outfitPhotos)..where((p) => p.id.equals(id))).go();
    return result > 0;
  }

  // Методы для работы с планами погоды
  Future<List<WeatherPlan>> getAllWeatherPlans() {
    return select(weatherPlans).get();
  }
  
  Future<WeatherPlan?> getWeatherPlan(int id) {
    return (select(weatherPlans)..where((p) => p.id.equals(id))).getSingleOrNull();
  }
  
  Future<int> insertWeatherPlan(WeatherPlansCompanion plan) async {
    final result = await into(weatherPlans).insert(plan);
    return result;
  }
  
  Future<bool> updateWeatherPlan(int id, String name, String location, String weatherType, int temperature, String? description) async {
    final result = await (update(weatherPlans)..where((p) => p.id.equals(id))).write(
      WeatherPlansCompanion(
        name: Value(name),
        location: Value(location),
        weatherType: Value(weatherType),
        temperature: Value(temperature),
        description: description != null ? Value(description) : const Value.absent(),
      ),
    );
    return result > 0;
  }
  
  Future<int> deleteWeatherPlan(int id) {
    return (delete(weatherPlans)..where((p) => p.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'travel_outfit_planner.db'));
    return NativeDatabase(file);
  });
}
