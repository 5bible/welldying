import 'package:flutter/material.dart';
// import 'funeral_matching_2.dart'; // 제거

// 디자인 토큰
const Color primaryColor = Color(0xFF8B5A3C);
const Color backgroundColor = Color(0xFFF5F5F5);
const Color cardColor = Color(0xFFEDE6DC);
const Color chipSelected = Color(0xFF8B5A3C);
const Color chipUnselected = Colors.white;
const Color textPrimary = Colors.black87;
const Color accentOrange = Color(0xFFD2691E);
const Color greenColor = Color(0xFF4CAF50);

const TextStyle titleStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: Colors.black87,
);

TextStyle chipLabelStyle(bool selected) => TextStyle(
  color: selected ? Colors.white : Colors.black87,
  fontWeight: FontWeight.w500,
);

class FuneralMatchingScreen extends StatefulWidget {
  const FuneralMatchingScreen({super.key});

  @override
  State<FuneralMatchingScreen> createState() => _FuneralMatchingScreenState();
}

class _FuneralMatchingScreenState extends State<FuneralMatchingScreen> {
  // 상태 변수들
  String selectedLocation = '서울 강남구';
  String selectedBudget = '50-100만원';
  String selectedSchedule = '3일 이내';
  String selectedSize = '소형';

  // 옵션 리스트들
  final List<String> budgetOptions = ['50만원 이하', '50-100만원', '100-200만원', '200만원 이상'];
  final List<String> scheduleOptions = ['긴급', '3일 이내', '일주일 이내'];
  final List<String> sizeOptions = ['소형', '중형', '대형'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          '장례 준비',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            const SizedBox(height: 30),
            _buildAiRecommendationSection(),
            const SizedBox(height: 30),
            _buildCurrentLocationSection(),
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

  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '가까운 곳에서 편안하게\n믿을 수 있는 시설을 찾아드려요',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
              height: 1.3,
            ),
          ),
          SizedBox(height: 12),
          Text(
            '매생이를 위한 마지막 배웅 준비',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAiRecommendationSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F4FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF90CAF9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.smart_toy, color: Color(0xFF1976D2)),
              SizedBox(width: 8),
              Text(
                'AI 맞춤 추천',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            '매생이(미니어처 푸들, 8살)의 프로필을 분석한 결과입니다.',
            style: TextStyle(
              color: Color(0xFF1976D2),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildChipTag('위치 : $selectedLocation'),
              _buildChipTag('예산 : $selectedBudget'),
              _buildChipTag('일정 : $selectedSchedule'),
              _buildChipTag('크기 : $selectedSize'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChipTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1E88E5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildCurrentLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.place, color: Colors.red, size: 20),
            SizedBox(width: 8),
            Text('현재 위치', style: titleStyle),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF7E9),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFC5E1A5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC8E6C9),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'AI추천',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      '단골병원에서 3km / 평균이동시간 15분',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: _onLocationChange,
                child: const Row(
                  children: [
                    Icon(Icons.my_location, color: Colors.red, size: 20),
                    SizedBox(width: 6),
                    Text(
                      '위치 변경',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBudgetSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.attach_money, color: accentOrange, size: 20),
            SizedBox(width: 8),
            Text('예산 범위', style: titleStyle),
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
              selectedColor: chipSelected,
              backgroundColor: chipUnselected,
              shape: StadiumBorder(
                side: BorderSide(
                  color: selected ? chipSelected : Colors.grey.shade300,
                ),
              ),
              labelStyle: chipLabelStyle(selected),
              onSelected: (v) => setState(() => selectedBudget = budget),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildScheduleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.calendar_month, color: accentOrange, size: 20),
            SizedBox(width: 8),
            Text('희망 일정', style: titleStyle),
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
              selectedColor: chipSelected,
              backgroundColor: chipUnselected,
              shape: StadiumBorder(
                side: BorderSide(
                  color: selected ? chipSelected : Colors.grey.shade300,
                ),
              ),
              labelStyle: chipLabelStyle(selected),
              onSelected: (v) => setState(() => selectedSchedule = schedule),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPetSizeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.pets, color: accentOrange, size: 20),
            SizedBox(width: 8),
            Text('반려동물 크기', style: titleStyle),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: sizeOptions.map((size) {
            final selected = selectedSize == size;
            return ChoiceChip(
              label: Text(size),
              selected: selected,
              selectedColor: chipSelected,
              backgroundColor: chipUnselected,
              shape: StadiumBorder(
                side: BorderSide(
                  color: selected ? chipSelected : Colors.grey.shade300,
                ),
              ),
              labelStyle: chipLabelStyle(selected),
              onSelected: (v) => setState(() => selectedSize = size),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildFindButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        onPressed: _onFindFacilities,
        child: const Text(
          '맞춤 시설 찾기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _onLocationChange() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _LocationSelectionScreen(),
      ),
    ).then((result) {
      if (result != null && result is String) {
        setState(() {
          selectedLocation = result;
        });
      }
    });
  }

  void _onFindFacilities() {
    // 로딩 다이얼로그 표시
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Text('맞춤 시설을 찾고 있습니다...'),
          ],
        ),
      ),
    );

    // 2초 후 검색 결과 화면으로 이동
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // 로딩 다이얼로그 닫기
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => _SearchResultScreen(),
        ),
      );
    });
  }
}

// 위치 선택 화면 (funeral_matching_2.dart와 동일한 로직)
class _LocationSelectionScreen extends StatefulWidget {
  @override
  State<_LocationSelectionScreen> createState() => __LocationSelectionScreenState();
}

class __LocationSelectionScreenState extends State<_LocationSelectionScreen> {
  String selectedLocation = '';

  final List<Map<String, dynamic>> recentLocations = [
    {
      'name': '서울시 강남구',
      'description': '서울시 강남구 대치동로',
      'icon': Icons.location_city,
      'color': Colors.brown,
    },
    {
      'name': '서울시 송파구',
      'description': '서울시 송파구 잠실로',
      'icon': Icons.apartment,
      'color': Colors.red,
    },
  ];

  final List<Map<String, dynamic>> popularRegions = [
    {'name': '서울시', 'icon': Icons.location_city},
    {'name': '부산시', 'icon': Icons.nights_stay},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '위치 설정',
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, selectedLocation),
            child: const Text('완료', style: TextStyle(color: accentOrange)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 검색 필드
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: '지역명, 도로명 또는 건물명 검색',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // 현재 위치
            const Text('현재 위치', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: Container(
                  width: 48, height: 48,
                  decoration: BoxDecoration(color: Colors.brown.shade100, borderRadius: BorderRadius.circular(24)),
                  child: const Icon(Icons.my_location, color: Colors.brown),
                ),
                title: const Text('현재 위치 사용', style: TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('GPS를 통해 자동으로 감지', style: TextStyle(color: Colors.grey)),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: accentOrange, borderRadius: BorderRadius.circular(16)),
                  child: const Text('정확', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
                onTap: () {
                  setState(() => selectedLocation = '서울시 강남구 (현재 위치)');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('현재 위치가 설정되었습니다'), backgroundColor: accentOrange),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            
            // 최근 검색 위치
            const Text('최근 검색한 위치', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            ...recentLocations.map((loc) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(loc['icon'], color: loc['color']),
                title: Text(loc['name']),
                subtitle: Text(loc['description']),
                onTap: () {
                  setState(() => selectedLocation = loc['name']);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${loc['name']}이 선택되었습니다'), backgroundColor: accentOrange),
                  );
                },
              ),
            )),
            const SizedBox(height: 30),
            
            // 인기 지역
            const Text('인기 지역', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            Row(
              children: popularRegions.map((region) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() => selectedLocation = region['name']);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${region['name']}이 선택되었습니다'), backgroundColor: accentOrange),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 100,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(region['icon'], size: 40, color: primaryColor),
                        const SizedBox(height: 8),
                        Text(region['name'], style: const TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              )).toList(),
            ),
            const SizedBox(height: 40),
            
            // 확인 버튼
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, selectedLocation),
                style: ElevatedButton.styleFrom(backgroundColor: accentOrange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                child: const Text('현재 위치로 설정하기', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 검색 결과 화면 (funeral_matching_3.dart와 동일한 로직)
class _SearchResultScreen extends StatefulWidget {
  @override
  State<_SearchResultScreen> createState() => __SearchResultScreenState();
}

class __SearchResultScreenState extends State<_SearchResultScreen> {
  String selectedFilter = '전체';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('시설 찾기', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
      ),
      body: Column(
        children: [
          _buildSummarySection(),
          _buildFilterChips(),
          _buildSortingRow(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                _buildFacilityCard(
                  name: '평안 동물병원 장례식장',
                  rating: 4.8,
                  reviewCount: 124,
                  distance: '1.2km',
                  travelTime: '5분 거리',
                  price: '85만원',
                  priceSubtext: '(조건 맞춤)',
                  availability: '오늘 예약 가능 • 오후 2시부터',
                  tags: ['24시간', '픽업서비스', '개별추모실'],
                  features: ['화장시설', '주차가능'],
                  buttonText: '당일예약',
                  buttonColor: greenColor,
                  usageCount: 130,
                ),
                const SizedBox(height: 16),
                _buildFacilityCard(
                  name: '사랑 펫 메모리얼',
                  rating: 4.6,
                  reviewCount: 89,
                  distance: '1.8km',
                  travelTime: '7분 거리',
                  price: '72만원',
                  priceSubtext: '(15%할인 적용)',
                  availability: '내일 예약 가능 • 오전 9시부터',
                  tags: ['24시간', '픽업서비스'],
                  features: [],
                  buttonText: '할인중',
                  buttonColor: accentOrange,
                  usageCount: 98,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummarySection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // 상단 헤더
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('총 12개 시설 찾음', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.bookmark_border, size: 16, color: Colors.grey.shade700),
                        const SizedBox(width: 4),
                        Text('북마크', style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.map, size: 16, color: Colors.grey.shade700),
                        const SizedBox(width: 4),
                        Text('지도', style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // AI 추천 알림
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.smart_toy, color: Colors.blue.shade600, size: 20),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'AI 추천 이유:\n소형견 전문 케어 시설 / 8살 고령견 맞춤 환경 / 예산 범위 내 최고 가성비',
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 12),
          
          // 검색 조건 카드
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: primaryColor, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('검색조건', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 16, color: Colors.black87),
                              SizedBox(width: 4),
                              Text('서울시 강남구', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.calendar_month, size: 16, color: Colors.black87),
                              SizedBox(width: 4),
                              Text('3일 이내', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Icon(Icons.attach_money, size: 16, color: Colors.black87),
                              SizedBox(width: 4),
                              Text('50-100만원', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.pets, size: 16, color: Colors.black87),
                              SizedBox(width: 4),
                              Text('소형', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = [
      {'label': '전체', 'count': 12, 'color': primaryColor},
      {'label': '당일예약', 'count': 5, 'color': accentOrange},
      {'label': '24시간', 'count': 8, 'color': accentOrange},
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: filters.map((filter) {
          final isSelected = selectedFilter == filter['label'];
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? filter['color'] as Color : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                '${filter['label']} ${filter['count']}',
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSortingRow() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.smart_toy, color: Colors.blue, size: 16),
              SizedBox(width: 6),
              Text(
                '매생이를 위한 AI 맞춤 추천 순서',
                style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            children: const [
              Text('정렬 변경', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              SizedBox(width: 4),
              Icon(Icons.keyboard_arrow_down, size: 16),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFacilityCard({
    required String name,
    required double rating,
    required int reviewCount,
    required String distance,
    required String travelTime,
    required String price,
    required String priceSubtext,
    required String availability,
    required List<String> tags,
    required List<String> features,
    required String buttonText,
    required Color buttonColor,
    required int usageCount,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더 영역
          Row(
            children: [
              Icon(Icons.local_hospital, color: Colors.blue, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.blue),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          // 별점과 이용 횟수
          Row(
            children: [
              ...List.generate(5, (i) => Icon(
                i < rating.floor() ? Icons.star : Icons.star_border,
                color: Colors.orange,
                size: 16,
              )),
              const SizedBox(width: 6),
              Text('$rating($reviewCount)', style: const TextStyle(fontSize: 12, color: Colors.black87)),
              const Text(' • ', style: TextStyle(color: Colors.grey)),
              Text('${usageCount}회 이용', style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          
          const SizedBox(height: 4),
          
          // 거리 정보
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.red, size: 16),
              const SizedBox(width: 4),
              Text(distance, style: const TextStyle(fontSize: 12)),
              const SizedBox(width: 12),
              const Icon(Icons.directions_car, color: Colors.grey, size: 16),
              const SizedBox(width: 4),
              Text(travelTime, style: const TextStyle(fontSize: 12)),
            ],
          ),
          
          const SizedBox(height: 8),
          
          // 가격 정보
          Row(
            children: [
              const Icon(Icons.attach_money, color: Colors.green, size: 16),
              const SizedBox(width: 4),
              Text('예상 비용 : ', style: const TextStyle(fontSize: 13)),
              Text(price, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
              Text(priceSubtext, style: const TextStyle(fontSize: 13, color: Colors.grey)),
            ],
          ),
          
          const SizedBox(height: 4),
          
          // 예약 가능 시간
          Row(
            children: [
              const Icon(Icons.schedule, color: Colors.blue, size: 16),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  availability,
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // 태그들
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              ...tags.map((tag) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(tag, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600)),
              )),
              ...features.map((feature) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(feature, style: const TextStyle(color: Colors.black87, fontSize: 10)),
              )),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // 하단 버튼들
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  icon: const Icon(Icons.favorite_border, color: Colors.blue, size: 16),
                  label: const Text('관심', style: TextStyle(color: Colors.blue, fontSize: 12)),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  icon: const Icon(Icons.phone, color: Colors.red, size: 16),
                  label: const Text('상담', style: TextStyle(color: Colors.red, fontSize: 12)),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  icon: const Icon(Icons.info, color: Colors.white, size: 16),
                  label: const Text('상세확인', style: TextStyle(color: Colors.white, fontSize: 12)),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}