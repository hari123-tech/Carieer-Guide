import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BusinessCollegePage extends StatefulWidget {
  final String? courseName;
  final String? initialDistrict;

  const BusinessCollegePage({Key? key, this.courseName, this.initialDistrict})
      : super(key: key);

  @override
  _BusinessCollegePageState createState() => _BusinessCollegePageState();
}

class _BusinessCollegePageState extends State<BusinessCollegePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String? _expandedDistrict;

  // Map of districts -> list of colleges. Each college is a map with 'name' and 'departments'.
  final Map<String, List<Map<String, String>>> _collegesByDistrict = {
    'Chennai': [
      {
        'name': 'Loyola College, Chennai',
        'departments': 'Commerce, Corporate Secretaryship, Management (BBA), Economics'
      },
      {
        'name': 'Madras Christian College, Chennai',
        'departments': 'Commerce, Business Administration, Economics, Social Science'
      },
      {
        'name': 'Stella Maris College, Chennai',
        'departments': 'Commerce, Management Studies, Economics, Sociology'
      },
      {
        'name': 'Ethiraj College for Women, Chennai',
        'departments': 'Commerce, Business Administration, Economics, Computer Applications'
      },
      {
        'name': 'Anna Adarsh College for Women, Chennai',
        'departments': 'Commerce, Management, Computer Science'
      },
      {
        'name': 'Hindustan Institute of Technology and Science, Chennai',
        'departments': 'School of Business, Management Studies, Commerce, BBA, MBA'
      },
      {
        'name': 'Vels University, Chennai',
        'departments': 'School of Management, Commerce, Business Analytics, MBA'
      },
      {
        'name': 'Sathyabama Institute of Science & Technology, Chennai',
        'departments': 'School of Management Studies, Commerce, Finance, Marketing'
      },
      {
        'name': 'SRM Institute of Science and Technology, Chennai',
        'departments': 'School of Management, Commerce, Finance, HR, MBA'
      },
      {
        'name': 'Great Lakes Institute of Management, Chennai',
        'departments': 'Postgraduate Management (PGP), Executive Programs, Research'
      },
    ],
    'Coimbatore': [
      {
        'name': 'PSG College of Arts & Science, Coimbatore',
        'departments': 'Commerce, Management Studies, BBA, B.Com, Business Analytics'
      },
      {
        'name': 'Government Arts College, Coimbatore',
        'departments': 'Commerce, Economics, Business Studies'
      },
      {
        'name': 'Kumaraguru College of Liberal Arts & Science, Coimbatore',
        'departments': 'Commerce, Management, Finance, Marketing'
      },
      {
        'name': 'Sri Krishna Arts and Science College, Coimbatore',
        'departments': 'Commerce, BBA, Business Administration'
      },
      {
        'name': 'Nehru Arts & Science College, Coimbatore',
        'departments': 'Commerce, Management, Corporate Courses'
      },
      {
        'name': 'KG College of Arts & Science, Coimbatore',
        'departments': 'Commerce, Management, BBA'
      },
      {
        'name': 'Avinashilingam Institute for Home Science, Coimbatore',
        'departments': 'Commerce, Management, Home Science with Management modules'
      },
      {
        'name': 'GRD College of Science, Coimbatore',
        'departments': 'Commerce, Management, Finance'
      },
      {
        'name': 'SNS College of Arts & Science, Coimbatore',
        'departments': 'Commerce, Business Administration, Management'
      },
      {
        'name': 'Amrita School of Business, Coimbatore',
        'departments': 'Postgraduate Management (MBA), Executive Programs'
      },
    ],
    'Madurai': [
      {
        'name': 'The American College, Madurai',
        'departments': 'Commerce, Management, Economics, Entrepreneurship'
      },
      {
        'name': 'Lady Doak College, Madurai',
        'departments': 'Commerce, Business Administration, Finance'
      },
      {
        'name': 'Madurai Kamaraj University - Colleges',
        'departments': 'Department of Commerce, Management Studies, MBA programs (affiliated)'
      },
      {
        'name': 'Thiagarajar College of Engineering (TCE), Madurai',
        'departments': 'School of Management, Business Analytics (PG programs)'
      },
      {
        'name': 'Fatima College, Madurai',
        'departments': 'Commerce, Business Administration, Accountancy'
      },
      {
        'name': 'William Carey College, Madurai',
        'departments': 'Commerce, Management, Business Courses'
      },
      {
        'name': 'Nadar Mahajana Sangam S Vellaichamy Nadar College, Madurai',
        'departments': 'Commerce, BBA, Management'
      },
      {
        'name': 'A.V.V.M. Sri Pushpam College, Madurai',
        'departments': 'Commerce, Management, Corporate Courses'
      },
      {
        'name': 'Thiagarajar Polytechnic (regional)',
        'departments': 'Management & Business-related diploma programs'
      },
      {
        'name': 'Madurai Business School (management institutes)',
        'departments': 'MBA, Executive MBA, Management Development Programs'
      },
    ],
    'Tiruchirappalli (Trichy)': [
      {
        'name': 'St. Joseph\'s College, Trichy',
        'departments': 'Commerce, Management, BBA, Economics'
      },
      {
        'name': 'Bishop Heber College, Trichy',
        'departments': 'Commerce, Business Administration, Management Studies'
      },
      {
        'name': 'National Institute of Technology, Trichy (NIT Trichy)',
        'departments': 'Department of Management Studies (MBA, Executive Programs)'
      },
      {
        'name': 'Govt. Arts College, Trichy',
        'departments': 'Commerce, Management, Accounting'
      },
      {
        'name': 'Saranathan College of Engineering',
        'departments': 'Management, Business Systems (PG programs)'
      },
      {
        'name': 'MAM College, Trichy',
        'departments': 'Commerce, Business Administration, Management'
      },
      {
        'name': 'Kongu Arts & Science (campus options)',
        'departments': 'Commerce, BBA, Management'
      },
      {
        'name': 'Indra Ganesan College of Arts & Science',
        'departments': 'Commerce, Business Administration, Corporate Courses'
      },
      {
        'name': 'Jamialal Bajaj affiliated colleges (regional)',
        'departments': 'Commerce and Management-related programs'
      },
      {
        'name': 'Bannari Amman Institute affiliated colleges',
        'departments': 'Management and business diploma programs'
      },
    ],
    'Salem': [
      {
        'name': 'Government Arts College, Salem',
        'departments': 'Commerce, Management, Accounting'
      },
      {
        'name': 'Periyar University - affiliated colleges (Salem)',
        'departments': 'Commerce, Management, BBA (affiliated colleges)'
      },
      {
        'name': 'Sri Sarada College for Women, Salem',
        'departments': 'Commerce, Business Administration'
      },
      {
        'name': 'Vivekananda College, Salem',
        'departments': 'Commerce, Management Studies, Finance'
      },
      {
        'name': 'Vellalar College for Women, Salem',
        'departments': 'Commerce, BBA, Corporate Courses'
      },
      {
        'name': 'Sona College of Technology (nearby)',
        'departments': 'School of Management, MBA, Management Research'
      },
      {
        'name': 'MVC College of Arts & Science, Salem',
        'departments': 'Commerce, Management, Business Analytics'
      },
      {
        'name': 'Dhanalakshmi Srinivasan College, Salem',
        'departments': 'Commerce, Management, Accountancy'
      },
      {
        'name': 'Vanavarayar Institute of Agriculture, Salem',
        'departments': 'Agri-business management, Commerce subjects'
      },
      {
        'name': 'KSR College of Arts (regional)',
        'departments': 'Commerce, Management related courses'
      },
    ],
    'Tirunelveli': [
      {
        'name': 'Sarah Tucker College, Tirunelveli',
        'departments': 'Commerce, Management, BBA'
      },
      {
        'name': 'St. Xavier\'s College, Palayamkottai',
        'departments': 'Commerce, Management Studies, Finance'
      },
      {
        'name': 'Government Arts College, Tirunelveli',
        'departments': 'Commerce, BBA, Accountancy'
      },
      {
        'name': 'Mannar Thirumalai Naicker College',
        'departments': 'Commerce, Business Administration'
      },
      {
        'name': 'Manonmaniam Sundaranar University affiliated colleges',
        'departments': 'Commerce, Management, MBA (affiliated)'
      },
      {
        'name': 'ADH College of Arts & Science, Tirunelveli',
        'departments': 'Commerce, Management, Corporate Courses'
      },
      {
        'name': 'St. John\'s College (affiliated region)',
        'departments': 'Commerce, Business-related programs'
      },
      {
        'name': 'Muthukrishnan College (regional)',
        'departments': 'Commerce, Management'
      },
      {
        'name': 'RvS College of Arts & Science',
        'departments': 'Commerce, Management, BBA'
      },
      {
        'name': 'Tirunelveli Medical Allied Colleges (management branches)',
        'departments': 'Health management, Hospital Administration courses'
      },
    ],
    'Erode': [
      {
        'name': 'Vellalar College for Women, Erode',
        'departments': 'Commerce, Management, BBA'
      },
      {
        'name': 'Bharathiar University affiliated colleges (Erode)',
        'departments': 'Commerce, Management, Business Research'
      },
      {
        'name': 'MVC College of Arts and Science, Erode',
        'departments': 'Commerce, Business Administration'
      },
      {
        'name': 'Nandha Arts & Science College, Erode',
        'departments': 'Commerce, Management, Accounting'
      },
      {
        'name': 'Gobi Arts & Science College',
        'departments': 'Commerce, Business-related programs'
      },
      {
        'name': 'Government College of Engineering, Erode',
        'departments': 'Management for engineering professionals (PG programs)'
      },
      {
        'name': 'Krishnasamy College of Arts & Science, Erode',
        'departments': 'Commerce, Management'
      },
      {
        'name': 'PSG affiliated colleges (Erode region)',
        'departments': 'Commerce, Business Administration (affiliated)'
      },
      {
        'name': 'Sree Narayana Guru College (Erode area)',
        'departments': 'Commerce, Management'
      },
      {
        'name': 'Bharathi College (regional affiliated colleges)',
        'departments': 'Commerce, BBA, Management'
      },
    ],
    'Vellore': [
      {
        'name': 'VIT University (Vellore)',
        'departments': 'School of Management, MBA, Business Analytics'
      },
      {
        'name': 'VIT School of Management',
        'departments': 'MBA, Executive Programs, Research'
      },
      {
        'name': 'Thiruvalluvar University affiliated colleges',
        'departments': 'Commerce, Management, BBA'
      },
      {
        'name': 'Diraviam College of Arts & Science (Vellore region)',
        'departments': 'Commerce, Management'
      },
      {
        'name': 'Govt. Arts College, Vellore',
        'departments': 'Commerce, Business Administration'
      },
      {
        'name': 'Kings College of Arts & Science (Vellore nearby)',
        'departments': 'Commerce, Management'
      },
      {
        'name': 'Sairam Institutions (management programs nearby)',
        'departments': 'Management, Finance, Business Studies'
      },
      {
        'name': 'Christian Medical College allied management programs',
        'departments': 'Healthcare Management, Hospital Administration'
      },
      {
        'name': 'Thirumalai Engineering & Management Colleges',
        'departments': 'Management, BBA, MBA (PG programs)'
      },
    ],
    'Thanjavur': [
      {
        'name': 'Government Arts College, Thanjavur',
        'departments': 'Commerce, Management, Accounting'
      },
      {
        'name': 'A.V.V.M. Sri Pushpam College, Thanjavur',
        'departments': 'Commerce, Management, BBA'
      },
      {
        'name': 'Bharathidasan University affiliated colleges (region)',
        'departments': 'Commerce, Management Studies, MBA (affiliated)'
      },
      {
        'name': 'National College (Thanjavur)',
        'departments': 'Commerce, Business Administration'
      },
      {
        'name': 'Govt. College of Engineering (Thanjavur)',
        'departments': 'Management for technical students, PG management'
      },
      {
        'name': 'RKM Vivekananda College',
        'departments': 'Commerce, Management, BBA'
      },
      {
        'name': 'Kumbakonam Arts & Science affiliated colleges',
        'departments': 'Commerce, Management'
      },
      {
        'name': 'Mannai Narayanaswamy College (Thanjavur nearby)',
        'departments': 'Commerce, Business Studies'
      },
      {
        'name': 'Padmavani Arts & Science College',
        'departments': 'Commerce, Management'
      },
      {
        'name': 'PRIST University affiliated programs (near region)',
        'departments': 'Management, Commerce, MBA (affiliated)'
      },
    ],
    'Kanyakumari': [
      {
        'name': 'Scott Christian College, Nagercoil',
        'departments': 'Commerce, Management, Economics'
      },
      {
        'name': 'Sarah Tucker College (affiliated campuses nearby)',
        'departments': 'Commerce, Management, BBA'
      },
      {
        'name': 'Holy Cross College (affiliates in region)',
        'departments': 'Commerce, Management'
      },
      {
        'name': 'Annai Velankanni College, Nagercoil',
        'departments': 'Commerce, Management, Business Studies'
      },
      {
        'name': 'St. Xavier’s College (affiliated options)',
        'departments': 'Commerce, Management'
      },
      {
        'name': 'CJ College of Arts & Science (local)',
        'departments': 'Commerce, Business Administration'
      },
      {
        'name': 'Government Arts College (Kanyakumari area)',
        'departments': 'Commerce, Management'
      },
      {
        'name': 'Marthandam College (Nagercoil region)',
        'departments': 'Commerce, Management, BBA'
      },
      {
        'name': 'Pazhassi Raja Arts & Science (regional options)',
        'departments': 'Commerce, Management'
      },
      {
        'name': 'Nagercoil Institute of Management (local)',
        'departments': 'Management, MBA, Executive Programs'
      },
    ],
  };

  // Build a flattened search list: pairs of (district, collegeName, departments)
  late final List<Map<String, String>> _flatCollegeList;

  @override
  void initState() {
    super.initState();
    _expandedDistrict = widget.initialDistrict;
    _flatCollegeList = [];

    _collegesByDistrict.forEach((district, list) {
      for (var c in list) {
        _flatCollegeList.add({
          'district': district,
          'college': c['name'] ?? '',
          'departments': c['departments'] ?? ''
        });
      }
    });

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

  // Filtered results by query
  List<Map<String, String>> get _filteredFlatList {
    if (_searchQuery.isEmpty) return _flatCollegeList;
    return _flatCollegeList.where((item) {
      final college = item['college']!.toLowerCase();
      final district = item['district']!.toLowerCase();
      final departments = item['departments']!.toLowerCase();
      return college.contains(_searchQuery) ||
          district.contains(_searchQuery) ||
          departments.contains(_searchQuery);
    }).toList();
  }

  Future<void> _copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.courseName ?? 'Colleges (Business & Management)';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.redAccent,
        actions: [
          // Colleges button shown as text (as requested)
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Browse colleges below by district.')),
              );
            },
            child: const Text('Colleges', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search college, department or district...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: _searchQuery.isNotEmpty
                ? ListView.builder(
                    itemCount: _filteredFlatList.length,
                    itemBuilder: (context, index) {
                      final item = _filteredFlatList[index];
                      return ListTile(
                        title: Text(item['college']!),
                        subtitle: Text('${item['district']} • ${item['departments']}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.copy),
                          tooltip: 'Copy departments',
                          onPressed: () => _copyToClipboard(item['departments'] ?? ''),
                        ),
                        onTap: () {
                          final departments = item['departments'] ?? '';
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${item['college']} — $departments')),
                          );
                        },
                      );
                    },
                  )
                : ListView(
                    children: _collegesByDistrict.entries.map((entry) {
                      final district = entry.key;
                      final colleges = entry.value;

                      return ExpansionTile(
                        key: PageStorageKey(district),
                        initiallyExpanded: _expandedDistrict == district,
                        title: Text(
                          district,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        children: colleges.map((college) {
                          final name = college['name'] ?? '';
                          final departments = college['departments'] ?? '';
                          return ListTile(
                            title: Text(name),
                            subtitle: Text(departments),
                            trailing: IconButton(
                              icon: const Icon(Icons.copy),
                              tooltip: 'Copy departments',
                              onPressed: () => _copyToClipboard(departments),
                            ),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('$name — $departments')),
                              );
                            },
                          );
                        }).toList(),
                      );
                    }).toList(),
                  ),
          ),
        ],
      ),
    );
  }
}

