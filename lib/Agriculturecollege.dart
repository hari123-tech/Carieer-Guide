// lib/agriculture_colleges_page.dart
import 'package:flutter/material.dart';

class AgricultureCollegesTNPage extends StatefulWidget {
  final String? initialDistrict;
  final String? courseName; // optional filter when coming from a course page

  const AgricultureCollegesTNPage({Key? key, this.initialDistrict, this.courseName})
      : super(key: key);

  @override
  _AgricultureCollegesTNPageState createState() => _AgricultureCollegesTNPageState();
}

class _AgricultureCollegesTNPageState extends State<AgricultureCollegesTNPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String? _expandedDistrict;

  /// Map of district -> list of colleges.
  /// Each college is a Map with 'name' and 'courses' (List<String>).
  final Map<String, List<Map<String, dynamic>>> _collegesByDistrict = {
    'Chennai': [
      {
        'name': 'Tamil Nadu Agricultural University (Chennai campus / extension)',
        'courses': [
          'B.Sc. Agriculture',
          'M.Sc. Agriculture',
          'Diploma in Organic Farming',
          'Ph.D. in Agriculture'
        ]
      },
      {
        'name': 'Madras Veterinary College (agri allied programs)',
        'courses': ['B.Sc. Agriculture (select programs)', 'M.Sc. Soil Science']
      },
      {
        'name': 'Vels University - Dept. of Biosciences',
        'courses': ['Certificate in Organic Farming', 'M.Sc. Plant Pathology']
      },
      {
        'name': 'SRM University - Agricultural & Life Sciences (extension)',
        'courses': ['B.Sc. Agronomy', 'M.Sc. Agriculture', 'Certificate courses']
      },
      {
        'name': 'Hindustan Institute - School of Agricultural Sciences',
        'courses': ['B.Sc. Agriculture', 'Diploma in Agricultural Engineering']
      },
      {
        'name': 'Stella Maris College (vocational agri programs)',
        'courses': ['Certificate in Organic Farming', 'Short-term horticulture course']
      },
      {
        'name': 'Ethiraj College (vocational / allied)',
        'courses': ['Certificate in Soil Testing', 'Nursery Management (certificate)']
      },
      {
        'name': 'Sathyabama Institute (AgriTech programs)',
        'courses': ['B.Tech Agricultural Engineering (applied)', 'M.Sc. Plant Pathology']
      },
      {
        'name': 'VIT Chennai (management & agri programs)',
        'courses': ['Agri-business certificate', 'M.Sc. Agronomy (selected offerings)']
      },
      {
        'name': 'Anna University - Agricultural Research Collaborations',
        'courses': ['Research-based M.Sc./Ph.D. projects in agri engineering']
      },
    ],
    'Coimbatore': [
      {
        'name': 'Tamil Nadu Agricultural University (Coimbatore campus - TNAU)',
        'courses': [
          'B.Sc. Agriculture',
          'B.Sc. Horticulture',
          'B.Sc. Forestry',
          'M.Sc. Agriculture',
          'M.Sc. Soil Science',
          'Ph.D. Agriculture'
        ]
      },
      {
        'name': 'PSG College of Arts & Science (Agri allied departments)',
        'courses': ['B.Sc. Agriculture (affiliated)', 'M.Sc. Plant Pathology', 'Certificate courses']
      },
      {
        'name': 'Avinashilingam Institute (Coimbatore)',
        'courses': ['B.Sc. Horticulture', 'Diploma in Floriculture', 'Organic Farming Certificate']
      },
      {
        'name': 'Kumaraguru College (AGR-related programs)',
        'courses': ['B.Sc. Agronomy (vocational)', 'Diploma in Agricultural Engineering']
      },
      {
        'name': 'Amrita School of Agricultural Sciences (Amrita campuses)',
        'courses': ['B.Sc. Agriculture', 'M.Sc. Agronomy', 'M.Sc. Soil Science']
      },
      {
        'name': 'GRD College of Science',
        'courses': ['B.Sc. Agriculture (affiliated)', 'Certificate in Nursery Management']
      },
      {
        'name': 'SNS College of Arts & Science',
        'courses': ['B.Sc. Horticulture', 'B.Sc. Agriculture (affiliated)', 'Short courses']
      },
      {
        'name': 'RVS College of Arts & Science',
        'courses': ['Diploma in Agri Engineering', 'B.Sc. Agriculture (affiliated)']
      },
      {
        'name': 'The Coimbatore Agricultural College (private/regional)',
        'courses': ['B.Sc. Agriculture', 'Certificate in Organic Farming', 'M.Sc. Plant Pathology']
      },
      {
        'name': 'Sri Krishna Arts and Science College',
        'courses': ['B.Sc. Horticulture', 'B.Sc. Agriculture (affiliated)', 'Soil Science Certificate']
      },
    ],
    'Madurai': [
      {
        'name': 'Madurai Agricultural College (affiliated / regional)',
        'courses': [
          'B.Sc. Agriculture',
          'M.Sc. Agriculture',
          'Diploma in Agricultural Engineering'
        ]
      },
      {
        'name': 'The American College (Madurai) - vocational agri',
        'courses': ['Certificate in Organic Farming', 'B.Sc. Agronomy (vocational)']
      },
      {
        'name': 'Lady Doak College (extension programs)',
        'courses': ['Short courses in horticulture', 'Certificate in Plant Pathology']
      },
      {
        'name': 'Madurai Kamaraj University - School of Agricultural Studies',
        'courses': ['M.Sc. Soil Science', 'Ph.D. Agriculture', 'B.Sc. Agriculture (affiliate)']
      },
      {
        'name': 'Thiagarajar College of Engineering - agri-engineering workshops',
        'courses': ['Diploma in Agricultural Engineering', 'Agri-automation certificate']
      },
      {
        'name': 'Fatima College (vocational)',
        'courses': ['Certificate in Nursery Management', 'Short horticulture courses']
      },
      {
        'name': 'Nadar Mahajana Sangam (NMSSV) College',
        'courses': ['B.Sc. Agriculture (affiliated)', 'Soil Testing Certificate']
      },
      {
        'name': 'A.V.V.M. Sri Pushpam College (Madurai region)',
        'courses': ['B.Sc. Agriculture (affiliate)', 'M.Sc. Plant Pathology']
      },
      {
        'name': 'Madurai Business School (agri-management programs)',
        'courses': ['Agri-business Management (PG)', 'Short certificate courses']
      },
      {
        'name': 'William Carey College (Madurai) - allied',
        'courses': ['Certificate in Organic Farming', 'B.Sc. Agronomy (vocational)']
      },
    ],
    'Tiruchirappalli (Trichy)': [
      {
        'name': 'Tamil Nadu Agricultural University (Trichy regional centre)',
        'courses': ['B.Sc. Agriculture', 'M.Sc. Horticulture', 'Diploma in Organic Farming']
      },
      {
        'name': 'St. Joseph\'s College (Trichy) - agri programs',
        'courses': ['B.Sc. Agriculture (affiliated)', 'Soil Science certificate']
      },
      {
        'name': 'Bishop Heber College',
        'courses': ['Certificate courses in horticulture', 'B.Sc. Agriculture (affiliate)']
      },
      {
        'name': 'Saranathan College of Engineering (agri engineering labs)',
        'courses': ['Diploma Agricultural Engineering', 'B.Tech allied projects']
      },
      {
        'name': 'MAM College (Trichy region)',
        'courses': ['B.Sc. Agriculture (affiliated)', 'M.Sc. Plant Pathology']
      },
      {
        'name': 'Indra Ganesan College of Arts & Science',
        'courses': ['B.Sc. Horticulture', 'Certificate in Nursery Management']
      },
      {
        'name': 'Jamialal Bajaj affiliated regional colleges',
        'courses': ['B.Sc. Agriculture (affiliate)', 'Organic Farming Certificate']
      },
      {
        'name': 'Kongu Arts & Science (campus options nearby)',
        'courses': ['B.Sc. Agriculture (affiliated)', 'Soil Science courses']
      },
      {
        'name': 'Govt. Arts College (Trichy) - regional',
        'courses': ['Certificate in Horticulture', 'B.Sc. Agriculture (affiliate)']
      },
      {
        'name': 'Bannari Amman affiliated colleges (regional)',
        'courses': ['Diploma in Agricultural Engineering', 'B.Sc. Agriculture (affiliate)']
      },
    ],
    'Salem': [
      {
        'name': 'Periyar University - Agricultural Science affiliates',
        'courses': [
          'B.Sc. Agriculture',
          'B.Sc. Horticulture',
          'M.Sc. Soil Science',
          'Certificate in Organic Farming'
        ]
      },
      {
        'name': 'Government Arts College, Salem (affiliated agri courses)',
        'courses': ['B.Sc. Agriculture (affiliate)', 'Certificate in Nursery Management']
      },
      {
        'name': 'Sona College of Technology (agri-engineering labs)',
        'courses': ['Diploma in Agricultural Engineering', 'B.Tech agri automation projects']
      },
      {
        'name': 'Sri Sarada College for Women',
        'courses': ['B.Sc. Horticulture', 'Certificate courses (floriculture)']
      },
      {
        'name': 'Vivekananda College, Salem',
        'courses': ['B.Sc. Agriculture (affiliate)', 'Soil Science certificate']
      },
      {
        'name': 'Vellalar College for Women (Salem)',
        'courses': ['B.Sc. Agriculture (affiliate)', 'Organic farming certificate']
      },
      {
        'name': 'MVC College of Arts & Science',
        'courses': ['B.Sc. Horticulture', 'M.Sc. Plant Pathology']
      },
      {
        'name': 'Dhanalakshmi Srinivasan College',
        'courses': ['B.Sc. Agriculture (affiliate)', 'Diploma in Agri engineering']
      },
      {
        'name': 'Vanavarayar Institute (nearby)',
        'courses': ['B.Sc. Agronomy', 'Certificate in Nursery Management']
      },
      {
        'name': 'KSR College of Arts (regional)',
        'courses': ['Short courses in horticulture', 'B.Sc. Agriculture (affiliate)']
      },
    ],
    'Vellore': [
      {
        'name': 'VIT Vellore - School of Agricultural Sciences (selected programs)',
        'courses': ['B.Sc. Agriculture', 'M.Sc. Agricultural Biotechnology', 'Certificate programs']
      },
      {
        'name': 'Vellore Institute of Technology - School of Management (agri management)',
        'courses': ['Agri-business Management (PG)', 'Short certificates']
      },
      {
        'name': 'Thiruvalluvar University affiliated colleges (Vellore region)',
        'courses': ['B.Sc. Agriculture (affiliate)', 'M.Sc. Soil Science']
      },
      {
        'name': 'Christian Medical College allied programs (agri allied research)',
        'courses': ['M.Sc. Plant Pathology (research oriented)', 'Certificate projects']
      },
      {
        'name': 'Sairam Institutions (management & agri allied)',
        'courses': ['B.Sc. Agriculture (affiliate)', 'Diploma in Horticulture']
      },
      {
        'name': 'Kings College of Arts & Science (nearby)',
        'courses': ['B.Sc. Horticulture', 'Soil Science certificate']
      },
      {
        'name': 'Diraviam College of Arts & Science (regional)',
        'courses': ['B.Sc. Agriculture (affiliate)', 'Certificate in Organic Farming']
      },
      {
        'name': 'Govt. Arts College, Vellore',
        'courses': ['Short horticulture courses', 'B.Sc. Agriculture (affiliate)']
      },
      {
        'name': 'Thirumalai Engg & Management Colleges (agri tech)',
        'courses': ['Diploma in Agricultural Engineering', 'Agri-automation workshops']
      },
      {
        'name': 'Kings Polytechnic & affiliated institutes (regional)',
        'courses': ['Diploma in Horticulture', 'Certificate in Nursery Management']
      },
    ],
  };

  late final List<Map<String, dynamic>> _flatCollegeList;

  @override
  void initState() {
    super.initState();
    _expandedDistrict = widget.initialDistrict;
    _flatCollegeList = [];

    // Flatten for search: each item has district, college, and each course
    _collegesByDistrict.forEach((district, collegeList) {
      for (var college in collegeList) {
        _flatCollegeList.add({
          'district': district,
          'college': college['name'],
          'courses': List<String>.from(college['courses'] ?? [])
        });
      }
    });

    // If caller passed a courseName, seed the search query to filter
    if ((widget.courseName ?? '').isNotEmpty) {
      _searchQuery = widget.courseName!.toLowerCase();
      _searchController.text = widget.courseName!;
    }

    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.trim().toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredFlatList {
    if (_searchQuery.isEmpty) {
      return _flatCollegeList;
    }
    return _flatCollegeList.where((item) {
      final college = (item['college'] as String).toLowerCase();
      final district = (item['district'] as String).toLowerCase();
      final courses = (item['courses'] as List<String>).join(' ').toLowerCase();
      return college.contains(_searchQuery) ||
          district.contains(_searchQuery) ||
          courses.contains(_searchQuery);
    }).toList();
  }

  void _showCollegeDetails(BuildContext ctx, Map<String, dynamic> collegeItem) {
    final name = collegeItem['college'] as String;
    final district = collegeItem['district'] as String;
    final courses = List<String>.from(collegeItem['courses'] ?? []);

    showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          title: Text(name),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('District: $district'),
                const SizedBox(height: 8),
                const Text('Agriculture / Allied courses available:',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                ...courses.map((c) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• '),
                          Expanded(child: Text(c)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))
          ],
        );
      },
    );
  }

  Widget _buildCollegeTile(Map<String, dynamic> collegeItem) {
    final name = collegeItem['college'] as String;
    final courses = List<String>.from(collegeItem['courses'] ?? []);

    return ListTile(
      title: Text(name),
      subtitle: Text(courses.join(' • '), maxLines: 2, overflow: TextOverflow.ellipsis),
      isThreeLine: courses.length > 2,
      onTap: () => _showCollegeDetails(context, collegeItem),
      trailing: IconButton(
        icon: const Icon(Icons.info_outline),
        tooltip: 'View courses',
        onPressed: () => _showCollegeDetails(context, collegeItem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // If search active, show flat filtered list; otherwise group by district.
    final isSearching = _searchQuery.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agriculture Colleges - Tamil Nadu'),
        backgroundColor: Colors.green[700],
        actions: [
          // A small hint button (optional)
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tap a college to see agriculture courses available.')),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search college, district or course (e.g., "B.Sc. Agriculture")...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: isSearching
                ? _buildSearchResults()
                : ListView(
                    children: _collegesByDistrict.entries.map((entry) {
                      final district = entry.key;
                      final colleges = entry.value;

                      return ExpansionTile(
                        key: PageStorageKey(district),
                        initiallyExpanded: _expandedDistrict == district,
                        title: Text(
                          district,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        children: colleges
                            .map((c) => _buildCollegeTile({
                                  'district': district,
                                  'college': c['name'],
                                  'courses': List<String>.from(c['courses'] ?? [])
                                }))
                            .toList(),
                      );
                    }).toList(),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    final results = _filteredFlatList;
    if (results.isEmpty) {
      return const Center(child: Text('No colleges found for that query.'));
    }

    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final item = results[index];
        return _buildCollegeTile(item);
      },
    );
  }
}
