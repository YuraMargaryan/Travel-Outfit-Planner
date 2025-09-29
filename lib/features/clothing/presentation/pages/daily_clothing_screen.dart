import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../core/providers/database_provider.dart';
import '../../../../core/database/app_database.dart';

@RoutePage()
class DailyClothingScreen extends StatefulWidget {
  final int tripId;
  
  const DailyClothingScreen({
    super.key,
    required this.tripId,
  });

  @override
  State<DailyClothingScreen> createState() => _DailyClothingScreenState();
}

class _DailyClothingScreenState extends State<DailyClothingScreen> {
  Trip? _trip;
  List<TripDay> _days = [];
  Map<int, List<ClothingItem>> _clothingByDay = {};
  Map<int, List<DayClothingItem>> _dayClothingItems = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
    
    // Загружаем поездку
    final trip = await databaseProvider.database.getTripById(widget.tripId);
    if (trip == null) return;
    
    // Загружаем дни поездки
    final days = await databaseProvider.database.getDaysForTrip(widget.tripId);
    
    // Загружаем одежду для каждого дня
    Map<int, List<ClothingItem>> clothingByDay = {};
    Map<int, List<DayClothingItem>> dayClothingItems = {};
    
    for (final day in days) {
      final clothingItems = await databaseProvider.database.getClothingItemsForDay(day.id);
      final dayClothing = await databaseProvider.database.getClothingForDay(day.id);
      
      clothingByDay[day.id] = clothingItems;
      dayClothingItems[day.id] = dayClothing;
    }
    
    setState(() {
      _trip = trip;
      _days = days;
      _clothingByDay = clothingByDay;
      _dayClothingItems = dayClothingItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text(_trip?.name ?? 'Одежда по дням'),
        backgroundColor: CupertinoColors.systemBackground,
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _addDay,
          child: const Icon(CupertinoIcons.add),
        ),
      ),
      child: SafeArea(
        child: Consumer<DatabaseProvider>(
          builder: (context, databaseProvider, child) {
            if (!databaseProvider.isInitialized) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }

            if (_trip == null) {
              return const Center(
                child: Text('Поездка не найдена'),
              );
            }

            if (_days.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.calendar,
                      size: 64,
                      color: CupertinoColors.systemGrey,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Нет дней в поездке',
                      style: TextStyle(
                        fontSize: 18,
                        color: CupertinoColors.label,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Добавьте дни для планирования одежды',
                      style: TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.secondaryLabel,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    CupertinoButton.filled(
                      onPressed: _addDay,
                      child: const Text('Добавить день'),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _days.length,
              itemBuilder: (context, index) {
                final day = _days[index];
                final clothingItems = _clothingByDay[day.id] ?? [];
                final dayClothingItems = _dayClothingItems[day.id] ?? [];
                
                return _buildDayCard(day, clothingItems, dayClothingItems);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildDayCard(TripDay day, List<ClothingItem> clothingItems, List<DayClothingItem> dayClothingItems) {
    final dateStr = _formatDate(day.date);
    final wornCount = dayClothingItems.where((dc) => dc.isWorn).length;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Заголовок дня
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey5,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'День ${_days.indexOf(day) + 1}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.label,
                        ),
                      ),
                      Text(
                        dateStr,
                        style: const TextStyle(
                          fontSize: 14,
                          color: CupertinoColors.secondaryLabel,
                        ),
                      ),
                      if (day.weather != null) ...[
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              _getWeatherIcon(day.weather!),
                              size: 16,
                              color: CupertinoColors.secondaryLabel,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              day.weather!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: CupertinoColors.secondaryLabel,
                              ),
                            ),
                            if (day.temperature != null) ...[
                              const SizedBox(width: 8),
                              Text(
                                '${day.temperature!.round()}°C',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: CupertinoColors.secondaryLabel,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '$wornCount/${clothingItems.length}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.label,
                      ),
                    ),
                    const Text(
                      'надето',
                      style: TextStyle(
                        fontSize: 12,
                        color: CupertinoColors.secondaryLabel,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => _manageDayClothing(day),
                  child: const Icon(
                    CupertinoIcons.settings,
                    color: CupertinoColors.activeBlue,
                  ),
                ),
              ],
            ),
          ),
          
          // Список одежды
          if (clothingItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Одежда на день:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: CupertinoColors.label,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: clothingItems.map((item) {
                      final dayClothing = dayClothingItems.firstWhere(
                        (dc) => dc.clothingItemId == item.id,
                        orElse: () => DayClothingItem(
                          id: 0,
                          dayId: day.id,
                          clothingItemId: item.id,
                          isWorn: false,
                        ),
                      );
                      
                      return _buildClothingChip(item, dayClothing);
                    }).toList(),
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Icon(
                    CupertinoIcons.bag,
                    size: 32,
                    color: CupertinoColors.systemGrey,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Одежда не добавлена',
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.secondaryLabel,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CupertinoButton(
                    onPressed: () => _manageDayClothing(day),
                    child: const Text('Добавить одежду'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildClothingChip(ClothingItem item, DayClothingItem dayClothing) {
    return GestureDetector(
      onTap: () => _toggleClothingWorn(dayClothing),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: dayClothing.isWorn 
              ? CupertinoColors.activeGreen.withOpacity(0.2)
              : CupertinoColors.systemGrey5,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: dayClothing.isWorn 
                ? CupertinoColors.activeGreen
                : CupertinoColors.systemGrey4,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              dayClothing.isWorn 
                  ? CupertinoIcons.checkmark_circle_fill
                  : CupertinoIcons.circle,
              size: 16,
              color: dayClothing.isWorn 
                  ? CupertinoColors.activeGreen
                  : CupertinoColors.systemGrey,
            ),
            const SizedBox(width: 6),
            Text(
              item.name,
              style: TextStyle(
                fontSize: 12,
                color: dayClothing.isWorn 
                    ? CupertinoColors.activeGreen
                    : CupertinoColors.label,
                fontWeight: dayClothing.isWorn 
                    ? FontWeight.w500
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'янв', 'фев', 'мар', 'апр', 'май', 'июн',
      'июл', 'авг', 'сен', 'окт', 'ноя', 'дек'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  IconData _getWeatherIcon(String weather) {
    switch (weather.toLowerCase()) {
      case 'sunny':
      case 'солнечно':
        return CupertinoIcons.sun_max;
      case 'rainy':
      case 'дождь':
        return CupertinoIcons.cloud_rain;
      case 'cloudy':
      case 'облачно':
        return CupertinoIcons.cloud;
      case 'cold':
      case 'холодно':
        return CupertinoIcons.snow;
      default:
        return CupertinoIcons.cloud;
    }
  }

  void _addDay() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Добавить день'),
        content: const Text('Функция будет добавлена в следующей версии'),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _manageDayClothing(TripDay day) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => DayClothingManagementModal(
        day: day,
        onClothingUpdated: _loadData,
      ),
    );
  }

  void _toggleClothingWorn(DayClothingItem dayClothing) async {
    final databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
    
    await databaseProvider.database.toggleClothingWornStatus(
      dayClothing.dayId,
      dayClothing.clothingItemId,
    );
    
    _loadData();
  }
}

class DayClothingManagementModal extends StatefulWidget {
  final TripDay day;
  final VoidCallback onClothingUpdated;

  const DayClothingManagementModal({
    super.key,
    required this.day,
    required this.onClothingUpdated,
  });

  @override
  State<DayClothingManagementModal> createState() => _DayClothingManagementModalState();
}

class _DayClothingManagementModalState extends State<DayClothingManagementModal> {
  List<ClothingItem> _dayClothing = [];
  List<ClothingItem> _availableClothing = [];

  @override
  void initState() {
    super.initState();
    _loadClothing();
  }

  Future<void> _loadClothing() async {
    final databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
    
    final allClothing = await databaseProvider.database.getAllClothingItems();
    final dayClothing = await databaseProvider.database.getClothingItemsForDay(widget.day.id);
    
    final dayClothingIds = dayClothing.map((c) => c.id).toSet();
    final availableClothing = allClothing.where((c) => !dayClothingIds.contains(c.id)).toList();
    
    setState(() {
      _dayClothing = dayClothing;
      _availableClothing = availableClothing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Одежда - ${_formatDate(widget.day.date)}'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Готово'),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Текущая одежда на день
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Одежда на день:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.label,
                      ),
                    ),
                  ),
                  if (_dayClothing.isEmpty)
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Одежда не добавлена',
                          style: TextStyle(
                            fontSize: 16,
                            color: CupertinoColors.secondaryLabel,
                          ),
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: _dayClothing.length,
                        itemBuilder: (context, index) {
                          final item = _dayClothing[index];
                          return _buildClothingItemCard(item, isOnDay: true);
                        },
                      ),
                    ),
                ],
              ),
            ),
            
            Container(
              height: 1,
              color: CupertinoColors.separator,
            ),
            
            // Доступная одежда
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Доступная одежда:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: CupertinoColors.label,
                          ),
                        ),
                        Text(
                          '${_availableClothing.length}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: CupertinoColors.secondaryLabel,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_availableClothing.isEmpty)
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Вся одежда уже добавлена',
                          style: TextStyle(
                            fontSize: 16,
                            color: CupertinoColors.secondaryLabel,
                          ),
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: _availableClothing.length,
                        itemBuilder: (context, index) {
                          final item = _availableClothing[index];
                          return _buildClothingItemCard(item, isOnDay: false);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClothingItemCard(ClothingItem item, {required bool isOnDay}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey5,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                CupertinoIcons.bag,
                color: CupertinoColors.systemGrey,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: CupertinoColors.label,
                    ),
                  ),
                  Text(
                    _getCategoryName(item.category),
                    style: const TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.secondaryLabel,
                    ),
                  ),
                ],
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => _toggleClothingOnDay(item, isOnDay),
              child: Icon(
                isOnDay ? CupertinoIcons.minus_circle : CupertinoIcons.add_circled,
                color: isOnDay ? CupertinoColors.systemRed : CupertinoColors.activeBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getCategoryName(String category) {
    switch (category) {
      case 'top':
        return 'Верхняя одежда';
      case 'bottom':
        return 'Нижняя одежда';
      case 'shoes':
        return 'Обувь';
      case 'accessories':
        return 'Аксессуары';
      default:
        return category;
    }
  }

  String _formatDate(DateTime date) {
    final months = [
      'янв', 'фев', 'мар', 'апр', 'май', 'июн',
      'июл', 'авг', 'сен', 'окт', 'ноя', 'дек'
    ];
    return '${date.day} ${months[date.month - 1]}';
  }

  void _toggleClothingOnDay(ClothingItem item, bool isOnDay) async {
    final databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
    
    if (isOnDay) {
      // Убираем одежду с дня
      await databaseProvider.database.removeClothingFromDay(widget.day.id, item.id);
    } else {
      // Добавляем одежду на день
      await databaseProvider.database.addClothingToDay(widget.day.id, item.id);
    }
    
    _loadClothing();
    widget.onClothingUpdated();
  }
}
