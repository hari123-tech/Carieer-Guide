import 'package:flutter/material.dart';

class AnimationMultimediaCollegesPage extends StatefulWidget {
  @override
  _AnimationMultimediaCollegesPageState createState() =>
      _AnimationMultimediaCollegesPageState();
}

class _AnimationMultimediaCollegesPageState
    extends State<AnimationMultimediaCollegesPage> {
  String searchQuery = '';

  final Map<String, List<Map<String, dynamic>>> districts = {
    'Chennai': [
      {
        'name': 'Loyola-ICAM College of Engineering & Technology',
        'courses': ['B.Sc. Animation & Multimedia', 'Certificate in VFX']
      },
      {
        'name': 'NIFT Chennai (Design & Multimedia Dept.)',
        'courses': ['Certificate in Multimedia Design', 'Animation Studio']
      },
      {
        'name': 'BIT Chennai (Visual Arts)',
        'courses': ['Diploma in Animation', 'Graphic Design']
      },
      {
        'name': 'SRM University (School of Media Arts)',
        'courses': ['B.Sc Animation', 'Motion Graphics']
      },
      {
        'name': 'Madras Christian College (Value Added Courses)',
        'courses': ['Certificate in Animation', 'Video Editing']
      },
    ],
    'Coimbatore': [
      {
        'name': 'PSG Institute of Media Technology',
        'courses': ['Diploma in Animation & VFX', 'Certificate in Graphics']
      },
      {
        'name': 'Karpagam University (Creative Arts Dept.)',
        'courses': ['B.Sc Multimedia', 'VFX Certificate']
      },
      {
        'name': 'CIT School of Arts & Media',
        'courses': ['Certificate in Animation', 'Motion Graphics']
      },
      {
        'name': 'Dr NGP Arts & Science (Skill Courses)',
        'courses': ['Diploma in Graphic & Web Design']
      },
      {
        'name': 'SNS College of Arts',
        'courses': ['Certificate in Animation', 'Video Editing']
      },
    ],
    'Madurai': [
      {
        'name': 'American College Madurai (Media Labs)',
        'courses': ['Certificate in Animation', 'Graphic Design']
      },
      {
        'name': 'Thiagarajar School of Technology',
        'courses': ['Diploma in Multimedia', 'Motion Graphics']
      },
      {
        'name': 'Madurai Kamaraj University (Skill Cell)',
        'courses': ['PG Diploma Animation', 'VFX Basics']
      },
      {
        'name': 'Lady Doak College (Workshop Series)',
        'courses': ['Animation Workshop', 'Video Editing']
      },
      {
        'name': 'Madurai School of Visual Arts',
        'courses': ['Diploma in Animation', 'Graphic Design']
      },
    ],
    'Tiruchirappalli': [
      {
        'name': 'Bharathidasan University (Multimedia Dept.)',
        'courses': ['Diploma in Animation & Multimedia']
      },
      {
        'name': 'St Joseph’s College Trichy (Media Studio)',
        'courses': ['Certificate in Animation', 'Video Editing']
      },
      {
        'name': 'Trichy Engineering College (Creative Cell)',
        'courses': ['Animation & VFX Workshops']
      },
      {
        'name': 'Imayam Arts & Science College',
        'courses': ['Diploma in Animation', 'Graphic Design']
      },
      {
        'name': 'Periyar Maniammai Institute (Skill Program)',
        'courses': ['Certificate in Multimedia', 'Motion Graphics']
      },
    ],
    'Salem': [
      {
        'name': 'Government Arts College Salem (Skill Section)',
        'courses': ['Diploma in Animation', 'Certificate in Graphics']
      },
      {
        'name': 'Bharathiar University (Visual Arts Dept.)',
        'courses': ['B.Sc Animation & Multimedia']
      },
      {
        'name': 'Salem School of Arts & Media',
        'courses': ['Certificate in Animation', 'Video Editing']
      },
      {
        'name': 'Sona Arts & Science College (Workshops)',
        'courses': ['Motion Graphics', 'Graphic Design']
      },
      {
        'name': 'Salem Arts & Management Institute',
        'courses': ['Diploma in VFX & Animation']
      },
    ],
  };

  List<Map<String, dynamic>> get allColleges {
    final list = <Map<String, dynamic>>[];
    districts.forEach((district, colleges) {
      for (var c in colleges) {
        final entry = Map<String, dynamic>.from(c);
        entry['district'] = district;
        list.add(entry);
      }
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final filtered = allColleges.where((c) {
      final q = searchQuery.toLowerCase().trim();
      if (q.isEmpty) return true;
      final name = c['name']?.toLowerCase() ?? '';
      final district = (c['district'] as String).toLowerCase();
      final courses = (c['courses'] as List).join(' ').toLowerCase();
      return name.contains(q) || district.contains(q) || courses.contains(q);
    }).toList();

    final showSearch = searchQuery.isNotEmpty;
    final districtList = districts.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Animation & Multimedia Colleges – TN'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search college, district or course...',
                prefixIcon: Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (v) => setState(() => searchQuery = v),
            ),
          ),
          Expanded(
            child: showSearch
                ? ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: filtered.length,
                    itemBuilder: (_, i) => _collegeCard(filtered[i]),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: districtList.length,
                    itemBuilder: (_, i) {
                      final d = districtList[i];
                      final cols = districts[d]!;
                      return ExpansionTile(
                        title: Text(
                          d,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        children: cols.map((c) => _collegeTile(c, d)).toList(),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }

  Widget _collegeTile(Map<String, dynamic> data, String district) {
    final courses = List<String>.from(data['courses']);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        title: Text(data['name']),
        subtitle: Text('$district\n${courses.join(' • ')}'),
        isThreeLine: true,
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  CollegeDetails(data: {...data, 'district': district}),
            )),
      ),
    );
  }

  Widget _collegeCard(Map<String, dynamic> data) {
    final courses = List<String>.from(data['courses']);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title:
            Text(data['name'], style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data['district']),
            Wrap(
              spacing: 6,
              children: courses.map((c) => Chip(label: Text(c))).toList(),
            )
          ],
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CollegeDetails(data: data),
            )),
      ),
    );
  }
}

class CollegeDetails extends StatelessWidget {
  final Map<String, dynamic> data;
  const CollegeDetails({required this.data});

  @override
  Widget build(BuildContext context) {
    final courses = List<String>.from(data['courses'] ?? []);
    return Scaffold(
      appBar: AppBar(
        title: Text(data['name']),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(data['name'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('District: ${data['district']}'),
          SizedBox(height: 12),
          Text('Courses offered:',
              style: TextStyle(fontWeight: FontWeight.bold)),
          ...courses.map((c) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text('• $c'))),
        ]),
      ),
    );
  }
}
