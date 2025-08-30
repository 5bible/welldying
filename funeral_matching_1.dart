import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welldying',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.orange,
        fontFamily: 'NotoSans',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const StoreRegistrationScreen(),
    );
  }
}

class StoreRegistrationScreen extends StatefulWidget {
  const StoreRegistrationScreen({super.key});

  @override
  State<StoreRegistrationScreen> createState() => _StoreRegistrationScreenState();
}

class _StoreRegistrationScreenState extends State<StoreRegistrationScreen> {
  String selectedLocation = '서울 강남구';
  String selectedBudget = '50만원 이하';
  String selectedSchedule = '3일 이내';
  // NOTE: 라벨은 소/중/대 이지만 변수명은 기존 유지(추후 selectedSizes 등으로 리네임 권장)
  final Set<String> selectedServices = {'소형'};

  final List<String> budgetOptions = ['50만원 이하', '50-100만원', '100-200만원', '200만원 이상'];
  final List<String> scheduleOptions = ['긴급', '3일 이내', '일주일 이내'];
  final List<String> serviceOptions = ['소형', '중형', '대형'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text('장례 준비'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            const SizedBox(height: 30),
            _buildLocationSection(),
            const SizedBox(height: 30),
            _buildBudgetSection(),
            const SizedBox(height: 30),
            _buildScheduleSection(),
            const SizedBox(height: 30),
            _buildPetSizeSection(),
            const SizedBox(height: 40),
            _buildFindButton(),
          ],
        ),
      ),
    );
  }

  // 헤더
  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF0E6D6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.store, color: Colors.orange, size: 24),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              '가까운 곳에서 편안하게\n믿을 수 있는 시설을 찾아드려요',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 위치
  Widget _buildLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFD2691E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                '현재 위치: $selectedLocation',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: _showLocationPicker,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      '위치 변경',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 예산
  Widget _buildBudgetSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.attach_money, color: Color(0xFFD2691E), size: 20),
            SizedBox(width: 8),
            Text(
              '예산 범위',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: budgetOptions.map((budget) {
            final selected = selectedBudget == budget;
            return ChoiceChip(
              label: Text(budget),
              selected: selected,
              selectedColor: const Color(0xFFD2691E),
              backgroundColor: Colors.white,
              shape: StadiumBorder(
                side: BorderSide(color: selected ? const Color(0xFFD2691E) : Colors.grey.shade300),
              ),
              labelStyle: TextStyle(
                color: selected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              onSelected: (v) => setState(() => selectedBudget = budget),
            );
          }).toList(),
        ),
      ],
    );
  }

  // 일정
  Widget _buildScheduleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.calendar_today, color: Color(0xFFD2691E), size: 20),
            SizedBox(width: 8),
            Text(
              '희망 일정',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: scheduleOptions.map((schedule) {
            final selected = selectedSchedule == schedule;
            return ChoiceChip(
              label: Text(schedule),
              selected: selected,
              selectedColor: const Color(0xFFD2691E),
              backgroundColor: Colors.white,
              shape: StadiumBorder(
                side: BorderSide(color: selected ? const Color(0xFFD2691E) : Colors.grey.shade300),
              ),
              labelStyle: TextStyle(
                color: selected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              onSelected: (v) => setState(() => selectedSchedule = schedule),
            );
          }).toList(),
        ),
      ],
    );
  }

  // 반려동물 크기
  Widget _buildPetSizeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.pets, color: Color(0xFFD2691E), size: 20),
            SizedBox(width: 8),
            Text(
              '반려동물 크기',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: serviceOptions.map((service) {
            final selected = selectedServices.contains(service);
            return FilterChip(
              label: Text(service),
              selected: selected,
              selectedColor: const Color(0xFFD2691E),
              backgroundColor: Colors.white,
              shape: StadiumBorder(
                side: BorderSide(color: selected ? const Color(0xFFD2691E) : Colors.grey.shade300),
              ),
              labelStyle: TextStyle(
                color: selected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              onSelected: (v) => setState(() {
                if (selected) {
                  selectedServices.remove(service);
                } else {
                  selectedServices.add(service);
                }
              }),
            );
          }).toList(),
        ),
      ],
    );
  }

  // 위치 선택 바텀시트
  void _showLocationPicker() {
    final locations = [
      '서울 강남구', '서울 서초구', '서울 송파구', '서울 강동구',
      '서울 마포구', '서울 용산구', '서울 성동구', '서울 광진구',
      '부산 해운대구', '부산 수영구', '대구 수성구', '인천 연수구',
      '광주 서구', '대전 유성구', '울산 남구', '세종시',
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        maxChildSize: 0.8,
        minChildSize: 0.4,
        builder: (context, scrollController) => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: 40, height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              const Text('지역 선택', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: locations.length,
                  itemBuilder: (_, i) {
                    final location = locations[i];
                    final isSelected = selectedLocation == location;
                    return ListTile(
                      title: Text(location),
                      trailing: isSelected ? const Icon(Icons.check, color: Color(0xFFD2691E)) : null,
                      onTap: () {
                        setState(() => selectedLocation = location);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 찾기 버튼
  Widget _buildFindButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _onFindStores,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD2691E),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: const Text('맞춤 시설 찾기',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }

  // 검색 실행(데모)
  void _onFindStores() {
    if (selectedServices.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('반려동물 크기를 선택해주세요'), backgroundColor: Colors.red),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const AlertDialog(
        content: Row(
          children: [CircularProgressIndicator(), SizedBox(width: 20), Text('맞춤 시설을 찾고 있습니다...')],
        ),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Row(
            children: [Icon(Icons.search, color: Color(0xFFD2691E)), SizedBox(width: 8), Text('검색 조건')],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow('📍 위치', selectedLocation),
              _buildInfoRow('💰 예산', selectedBudget),
              _buildInfoRow('📅 일정', selectedSchedule),
              _buildInfoRow('🐕 크기', selectedServices.join(', ')),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(8)),
                child: const Text('조건에 맞는 시설 3곳을 찾았습니다!\n결과 화면으로 이동하시겠습니까?',
                    style: TextStyle(fontSize: 14, color: Colors.black87)),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('취소')),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _navigateToResults();
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD2691E)),
              child: const Text('결과 보기', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.grey)),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black87))),
        ],
      ),
    );
  }

  void _navigateToResults() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('검색 결과 화면으로 이동합니다'),
        backgroundColor: const Color(0xFFD2691E),
        action: SnackBarAction(label: '확인', textColor: Colors.white, onPressed: () {}),
      ),
    );
  }
}
