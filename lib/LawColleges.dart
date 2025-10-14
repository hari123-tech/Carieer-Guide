import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LawCollegePage extends StatefulWidget {
  final String? courseName;
  final String? initialDistrict;

  const LawCollegePage({Key? key, this.courseName, this.initialDistrict}) : super(key: key);

  @override
  _LawCollegePageState createState() => _LawCollegePageState();
}

class _LawCollegePageState extends State<LawCollegePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String? _expandedDistrict;

  /// Map: district -> list of colleges; each college is a map with 'name' and 'departments' (list)
  final Map<String, List<Map<String, dynamic>>> _collegesByDistrict = {
    'Chennai': [
      {
        'name': 'Dr. Ambedkar Government Law College, Chennai',
        'departments': ['LLB', 'LLM', 'Criminal Law', 'Constitutional Law']
      },
      {
        'name': 'School of Excellence in Law (University of Madras)',
        'departments': ['BA LLB', 'BCom LLB', 'LLM', 'Research']
      },
      {
        'name': 'SRM Institute of Science and Technology - School of Law',
        'departments': ['BA LLB', 'BBA LLB', 'LLM', 'Corporate Law']
      },
      {
        'name': 'Vels School of Law (VISTAS)',
        'departments': ['BBA LLB', 'LLM', 'Intellectual Property Law']
      },
      {
        'name': 'Madras Law College (private/affiliated)',
        'departments': ['LLB (3-year)', 'LLM', 'Family Law']
      },
      {
        'name': 'Sathyabama Institute of Science & Technology - Law Dept.',
        'departments': ['BA LLB', 'LLM', 'Environmental Law']
      },
      {
        'name': 'Hindustan Institute of Technology & Science - Law',
        'departments': ['BA LLB', 'Corporate Law', 'International Law']
      },
      {
        'name': 'Raja Lakshmi Law College (Chennai region)',
        'departments': ['LLB', 'Criminal Law', 'Legal Aid Clinic']
      },
      {
        'name': 'Anna University - Legal Studies/Research (if applicable)',
        'departments': ['Legal Research', 'Intellectual Property', 'Technology Law']
      },
      {
        'name': 'City Law Academy (private; Chennai)',
        'departments': ['LLB', 'Legal Practice & Internship']
      },
    ],
    'Coimbatore': [
      {
        'name': 'Government Law College, Coimbatore (affiliated)',
        'departments': ['LLB', 'LLM', 'Civil & Criminal Law']
      },
      {
        'name': 'PSG College - Dept. of Legal Studies',
        'departments': ['BA LLB', 'BCom LLB', 'Corporate Law']
      },
      {
        'name': 'Amrita School of Law, Coimbatore / Amrita Vishwa Vidyapeetham',
        'departments': ['BA LLB', 'LLM', 'International Law']
      },
      {
        'name': 'Sri Krishna Arts and Science College - Law programs',
        'departments': ['LLB', 'Legal Studies', 'Business Law']
      },
      {
        'name': 'Kumaraguru College - Law & Governance Programs',
        'departments': ['LLB', 'Criminal Law', 'Environmental Law']
      },
      {
        'name': 'SNS College - Law or affiliated programs',
        'departments': ['LLB', 'Commercial Law', 'Taxation Law']
      },
      {
        'name': 'Avinashilingam Institute - Law related diplomas',
        'departments': ['Legal Aid', 'Family Law', 'LLB (affiliated)']
      },
      {
        'name': 'RVS College - Law offerings (affiliated)',
        'departments': ['LLB', 'LLM (select topics)']
      },
      {
        'name': 'Coimbatore City Law College (private)',
        'departments': ['LLB', 'Legal Practice Clinic']
      },
      {
        'name': 'Regional Law Institute (Coimbatore)',
        'departments': ['Corporate Law', 'Arbitration & Mediation']
      },
    ],
    'Madurai': [
      {
        'name': 'Dr. NML College - Law Faculty (Madurai region)',
        'departments': ['LLB', 'Constitutional Law', 'Criminal Law']
      },
      {
        'name': 'The American College - Law related programs',
        'departments': ['BA LLB (affiliated programs)', 'Legal Research']
      },
      {
        'name': 'Lady Doak College - Legal Studies & allied diplomas',
        'departments': ['Legal Literacy', 'Family Law', 'Human Rights']
      },
      {
        'name': 'Madurai Kamaraj University - Dept. of Law (affiliated)',
        'departments': ['LLB', 'LLM', 'Human Rights Law']
      },
      {
        'name': 'Thiagarajar College - Law affiliated courses (regional)',
        'departments': ['LLB', 'Corporate Law', 'Internship Programs']
      },
      {
        'name': 'Fatima College - Law and legal aid programs',
        'departments': ['Legal Aid Clinic', 'LLB (affiliated)']
      },
      {
        'name': 'Madurai Law Academy (private)',
        'departments': ['LLB', 'Criminal Law', 'Civil Law']
      },
      {
        'name': 'Nadar Mahajana Sangam - Law programs (affiliated)',
        'departments': ['LLB', 'Commercial Law']
      },
      {
        'name': 'A.V.V.M. Sri Pushpam - Law related courses (Thanjavur/Madurai region)',
        'departments': ['LLB (affiliated)', 'Rural Legal Studies']
      },
      {
        'name': 'Madurai Regional Law Centre (clinics & diplomas)',
        'departments': ['Legal Aid', 'ADR / Mediation']
      },
    ],
    'Tiruchirappalli (Trichy)': [
      {
        'name': 'St. Joseph\'s College - Legal Studies (Trichy)',
        'departments': ['LLB (affiliated)', 'Human Rights', 'Corporate Law']
      },
      {
        'name': 'Bishop Heber College - Law related programs',
        'departments': ['Legal Studies', 'Criminal Law', 'Family Law']
      },
      {
        'name': 'National Institute of Technology, Trichy - Legal Research cell',
        'departments': ['Technology & Law', 'IPR', 'Cyber Law (short courses)']
      },
      {
        'name': 'Government Law College, Trichy region (affiliated)',
        'departments': ['LLB', 'LLM', 'Judicial Services coaching']
      },
      {
        'name': 'Saranathan College - Law affiliated programs',
        'departments': ['BA LLB (affiliated)', 'Corporate Law']
      },
      {
        'name': 'MAM College - Legal Studies & internships',
        'departments': ['LLB (affiliated)', 'Taxation Law']
      },
      {
        'name': 'Indra Ganesan College - Law related diplomas',
        'departments': ['Legal Aid', 'ADR']
      },
      {
        'name': 'Trichy City Law Academy (private)',
        'departments': ['LLB', 'Legal Clinic', 'Criminal Practice']
      },
      {
        'name': 'Regional Legal Studies Centre (Trichy)',
        'departments': ['Environmental Law', 'Human Rights']
      },
      {
        'name': 'Kongu Arts & Science (nearby campus law offerings)',
        'departments': ['LLB', 'Corporate & Business Law']
      },
    ],
    'Salem': [
      {
        'name': 'Government Law College, Salem (affiliated)',
        'departments': ['LLB', 'LLM', 'Constitutional Law']
      },
      {
        'name': 'Periyar University - Law affiliated colleges',
        'departments': ['LLB', 'Human Rights', 'Environmental Law']
      },
      {
        'name': 'Sona College - Law & Management link programs',
        'departments': ['IPR', 'Technology Law', 'LLB (affiliated)']
      },
      {
        'name': 'Sri Sarada College - Legal studies (Salem)',
        'departments': ['LLB (affiliated)', 'Family Law']
      },
      {
        'name': 'Vivekananda College - Law related diplomas',
        'departments': ['Legal Literacy', 'ADR']
      },
      {
        'name': 'Vellalar Institutions - Law programs (Erode/Salem region)',
        'departments': ['LLB', 'Criminal Law', 'Corporate Law']
      },
      {
        'name': 'MVC College - Law & Legal Aid',
        'departments': ['Legal Aid Clinic', 'LLB (affiliated)']
      },
      {
        'name': 'Dhanalakshmi Srinivasan - Law allied programs',
        'departments': ['LLB', 'Taxation & Business Law']
      },
      {
        'name': 'Salem City Law Academy',
        'departments': ['LLB', 'Practice & Internship']
      },
      {
        'name': 'Regional ADR Centre (Salem)',
        'departments': ['Mediation', 'Arbitration courses']
      },
    ],
    'Tirunelveli': [
      {
        'name': 'Sarah Tucker College - Law allied (Tirunelveli)',
        'departments': ['Legal Literacy', 'LLB (affiliated)']
      },
      {
        'name': 'St. Xavier\'s College, Palayamkottai - Legal studies',
        'departments': ['LLB (affiliated)', 'Human Rights Law']
      },
      {
        'name': 'Mannar Thirumalai Naicker College - Law programs',
        'departments': ['LLB', 'Civil & Criminal Law']
      },
      {
        'name': 'Manonmaniam Sundaranar University - Law affiliated colleges',
        'departments': ['LLB', 'LLM', 'Rural Law']
      },
      {
        'name': 'Tirunelveli City Law College',
        'departments': ['LLB', 'Family Law', 'Legal Aid Clinic']
      },
      {
        'name': 'ADH College - Law diplomas & clinics',
        'departments': ['Legal Aid', 'ADR', 'LLB (affiliated)']
      },
      {
        'name': 'Regional Law Training Centre (Tirunelveli)',
        'departments': ['Judicial Services training', 'Criminal Law']
      },
      {
        'name': 'St. John\'s College - Legal studies (affiliated)',
        'departments': ['LLB', 'Internship Programs']
      },
      {
        'name': 'Local Professional Law Institutes (Tirunelveli)',
        'departments': ['Arbitration', 'Corporate Law']
      },
      {
        'name': 'Tirunelveli Law Academy (private)',
        'departments': ['LLB', 'Legal Practice & Clinic']
      },
    ],
    'Erode': [
      {
        'name': 'Government Law College / affiliated (Erode region)',
        'departments': ['LLB', 'LLM', 'Civil Law']
      },
      {
        'name': 'Vellalar College for Women - Erode (law allied)',
        'departments': ['Legal Studies', 'Family Law']
      },
      {
        'name': 'Bharathiar University - Law affiliated colleges (Erode)',
        'departments': ['LLB', 'Corporate Law', 'Research']
      },
      {
        'name': 'MVC College of Arts & Science - legal programs',
        'departments': ['LLB (affiliated)', 'Practical Law']
      },
      {
        'name': 'Nandha Arts & Science - Law diplomas',
        'departments': ['Legal Aid', 'Criminal Law']
      },
      {
        'name': 'Erode City Law Institute (private)',
        'departments': ['LLB', 'Legal Clinic']
      },
      {
        'name': 'Gobi Arts & Science - law allied courses',
        'departments': ['LLB (affiliated)', 'Family Law']
      },
      {
        'name': 'Regional ADR & Training Centre (Erode)',
        'departments': ['Mediation', 'Arbitration']
      },
      {
        'name': 'Government College law programs (regional)',
        'departments': ['LLB', 'Judicial Services coaching']
      },
      {
        'name': 'Erode Legal Research Cell',
        'departments': ['Research Methodology', 'Clinical Legal Education']
      },
    ],
    'Vellore': [
      {
        'name': 'VIT University - School of Law & Governance (Vellore)',
        'departments': ['BBA LLB', 'LLM', 'Corporate & IP Law']
      },
      {
        'name': 'Christian Medical College - allied legal programs (Vellore)',
        'departments': ['Healthcare Law', 'Bioethics & Law']
      },
      {
        'name': 'Thiruvalluvar University - Law affiliated colleges',
        'departments': ['LLB', 'Human Rights', 'Environmental Law']
      },
      {
        'name': 'Vellore City Law College',
        'departments': ['LLB', 'Criminal Law', 'Legal Aid Clinic']
      },
      {
        'name': 'Sairam Institutions - law allied programs',
        'departments': ['LLB (affiliated)', 'Corporate Law']
      },
      {
        'name': 'Kings College (Vellore region) - legal studies',
        'departments': ['LLB', 'ADR', 'Taxation Law']
      },
      {
        'name': 'Govt. Arts College - Vellore (law programs)',
        'departments': ['LLB (affiliated)', 'Public Law']
      },
      {
        'name': 'Regional Legal Practice Centre (Vellore)',
        'departments': ['Internships', 'Mediation']
      },
      {
        'name': 'Private Law Institute - Vellore',
        'departments': ['Criminal Law', 'Civil Litigation']
      },
      {
        'name': 'Clinical Legal Education Centre (Vellore region)',
        'departments': ['Legal Aid', 'Research & Advocacy']
      },
    ],
    'Thanjavur': [
      {
        'name': 'Government Arts College (Thanjavur) - Law programs',
        'departments': ['LLB (affiliated)', 'Rural Law']
      },
      {
        'name': 'A.V.V.M. Sri Pushpam College - Law allied courses',
        'departments': ['LLB (affiliated)', 'Legal Aid']
      },
      {
        'name': 'Bharathidasan University - affiliated law colleges (region)',
        'departments': ['LLB', 'LLM', 'Public Policy & Law']
      },
      {
        'name': 'National College - Thanjavur (law programs)',
        'departments': ['LLB', 'Family Law']
      },
      {
        'name': 'Govt. College of Engineering (Thanjavur) - law allied (tech & law)',
        'departments': ['Technology Law', 'IPR']
      },
      {
        'name': 'RKM Vivekananda College - legal studies',
        'departments': ['LLB (affiliated)', 'Human Rights']
      },
      {
        'name': 'Padmavani Arts & Science - law diplomas',
        'departments': ['Legal Aid', 'Criminal Law']
      },
      {
        'name': 'Kumbakonam Arts & Science - law affiliated colleges',
        'departments': ['LLB', 'Corporate Law']
      },
      {
        'name': 'Regional Judicial Training Centre (Thanjavur)',
        'departments': ['Judicial Services training', 'ADR']
      },
      {
        'name': 'Thanjavur Legal Practice Institute',
        'departments': ['Clinical Education', 'Internships']
      },
    ],
    'Kanyakumari': [
      {
        'name': 'Scott Christian College, Nagercoil - law allied',
        'departments': ['LLB (affiliated)', 'Human Rights']
      },
      {
        'name': 'St. Xavier\'s College - law affiliated programs',
        'departments': ['LLB (affiliated)', 'Family Law']
      },
      {
        'name': 'Sarah Tucker College (nearby) - legal studies',
        'departments': ['Legal Literacy', 'LLB (affiliated)']
      },
      {
        'name': 'Nagercoil Institute of Management - law courses',
        'departments': ['BA LLB (affiliated)', 'Corporate Law']
      },
      {
        'name': 'Annai Velankanni College - law allied',
        'departments': ['LLB (affiliated)', 'Legal Aid']
      },
      {
        'name': 'CJ College of Arts & Science - legal diplomas',
        'departments': ['LLB', 'Criminal Law', 'ADR']
      },
      {
        'name': 'Government Arts College (Kanyakumari region)',
        'departments': ['LLB', 'Public Law']
      },
      {
        'name': 'Marthandam College - law affiliated programs',
        'departments': ['LLB (affiliated)', 'Family & Property Law']
      },
      {
        'name': 'Nagercoil Law Academy (private)',
        'departments': ['Legal Practice', 'Criminal Law']
      },
      {
        'name': 'District Legal Service Authority linked colleges (Nagercoil)',
        'departments': ['Legal Aid Clinic', 'Rural Law']
      },
    ],
  };

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
          'departments': (c['departments'] as List<dynamic>?)?.join(', ') ?? '',
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
    final title = widget.courseName ?? 'Law Colleges - Tamil Nadu';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.red.shade700,
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Scroll to browse colleges by district.')),
              );
            },
            child: Text('Colleges', style: TextStyle(color: Colors.white)),
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
                hintText: 'Search college, district or department...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              ),
            ),
          ),
          Expanded(
            child: _searchQuery.isNotEmpty
                ? ListView.builder(
                    itemCount: _filteredFlatList.length,
                    itemBuilder: (context, index) {
                      final item = _filteredFlatList[index];
                      final departmentsText = item['departments'] ?? '';
                      return ListTile(
                        title: Text(item['college'] ?? ''),
                        subtitle: Text('${item['district']} • $departmentsText'),
                        trailing: IconButton(
                          icon: Icon(Icons.copy),
                          tooltip: 'Copy departments',
                          onPressed: () => _copyToClipboard(departmentsText),
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item['college'] ?? '',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    SizedBox(height: 8),
                                    Text('District: ${item['district']}'),
                                    SizedBox(height: 8),
                                    Text('Departments:'),
                                    SizedBox(height: 6),
                                    Text(departmentsText),
                                    SizedBox(height: 12),
                                    ElevatedButton.icon(
                                      icon: Icon(Icons.copy),
                                      label: Text('Copy Departments'),
                                      onPressed: () {
                                        _copyToClipboard(departmentsText);
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ),
                              );
                            },
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
                        title: Text(district, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        children: colleges.map((college) {
                          final name = college['name'] ?? '';
                          final departments = (college['departments'] as List<dynamic>?) ?? [];
                          final deptText = departments.join(', ');
                          return ListTile(
                            title: Text(name),
                            subtitle: Text(deptText),
                            trailing: IconButton(
                              icon: Icon(Icons.copy),
                              tooltip: 'Copy departments',
                              onPressed: () => _copyToClipboard(deptText),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                        SizedBox(height: 8),
                                        Text('District: $district'),
                                        SizedBox(height: 8),
                                        Text('Departments:'),
                                        SizedBox(height: 6),
                                        ...departments.map((d) => Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 2.0),
                                              child: Text('• $d'),
                                            )),
                                        SizedBox(height: 12),
                                        ElevatedButton.icon(
                                          icon: Icon(Icons.copy),
                                          label: Text('Copy Departments'),
                                          onPressed: () {
                                            _copyToClipboard(deptText);
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                },
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
