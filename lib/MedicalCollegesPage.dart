import 'package:flutter/material.dart';

class CollegesInTamilNaduPage extends StatelessWidget {
  final Map<String, Map<String, List<Map<String, String>>>> collegesByCourse = {
    'MBBS': {
      'Chennai': [
        {'name': 'Madras Medical College', 'domain': 'MBBS'},
        {'name': 'Stanley Medical College', 'domain': 'MBBS'},
        {'name': 'Kilpauk Medical College', 'domain': 'MBBS'},
        {'name': 'Sri Ramachandra Medical College', 'domain': 'MBBS'},
        {'name': 'Saveetha Medical College', 'domain': 'MBBS'},
        {'name': 'SRM Medical College', 'domain': 'MBBS'},
        {'name': 'ACS Medical College', 'domain': 'MBBS'},
        {'name': 'Meenakshi Medical College', 'domain': 'MBBS'},
        {'name': 'Tagore Medical College', 'domain': 'MBBS'},
        {'name': 'Sree Balaji Medical College', 'domain': 'MBBS'},
      ],
      'Coimbatore': [
        {'name': 'Coimbatore Medical College', 'domain': 'MBBS'},
        {'name': 'PSG Institute of Medical Sciences', 'domain': 'MBBS'},
        {'name': 'KMCH Institute of Health Sciences', 'domain': 'MBBS'},
        {'name': 'Sri Ramakrishna Medical College', 'domain': 'MBBS'},
        {'name': 'Dr. N.G.P Institute of Health Sciences', 'domain': 'MBBS'},
        {'name': 'KG Hospital & PG Institute', 'domain': 'MBBS'},
        {'name': 'Sankara Medical College', 'domain': 'MBBS'},
        {'name': 'Texcity Medical College', 'domain': 'MBBS'},
        {'name': 'SNS Medical College', 'domain': 'MBBS'},
        {'name': 'Crescent Medical College', 'domain': 'MBBS'},
      ],
      'Madurai': [
        {'name': 'Madurai Medical College', 'domain': 'MBBS'},
        {'name': 'Velammal Medical College', 'domain': 'MBBS'},
        {'name': 'American College of Medical Sciences', 'domain': 'MBBS'},
        {'name': 'Apollo Speciality Medical Institute', 'domain': 'MBBS'},
        {'name': 'Annai Medical College', 'domain': 'MBBS'},
        {'name': 'Raja Medical College', 'domain': 'MBBS'},
        {'name': 'Kamaraj Medical College', 'domain': 'MBBS'},
        {'name': 'Latha Mathavan Medical College', 'domain': 'MBBS'},
        {'name': 'Subham Medical College', 'domain': 'MBBS'},
        {'name': 'Mother Teresa Medical College', 'domain': 'MBBS'},
      ],
      'Kanyakumari': [
        {'name': 'Kanyakumari Government Medical College', 'domain': 'MBBS'},
        {'name': 'Sree Mookambika Institute of Medical Sciences', 'domain': 'MBBS'},
        {'name': 'Annai Velankanni Medical College', 'domain': 'MBBS'},
        {'name': 'St. Xavier Medical College', 'domain': 'MBBS'},
        {'name': 'Holy Cross Medical Institute', 'domain': 'MBBS'},
        {'name': 'Dr. Anbu Medical College', 'domain': 'MBBS'},
        {'name': 'Christuraj Medical College', 'domain': 'MBBS'},
        {'name': 'St. Joseph Medical College', 'domain': 'MBBS'},
        {'name': 'Nagercoil Medical Institute', 'domain': 'MBBS'},
        {'name': 'Grace Medical College', 'domain': 'MBBS'},
      ],
    },
    'BDS': {
      'Chennai': [
        {'name': 'Saveetha Dental College', 'domain': 'BDS'},
        {'name': 'Sri Ramachandra Dental College', 'domain': 'BDS'},
        {'name': 'Ragas Dental College', 'domain': 'BDS'},
        {'name': 'Meenakshi Ammal Dental College', 'domain': 'BDS'},
        {'name': 'Tagore Dental College', 'domain': 'BDS'},
        {'name': 'Sree Balaji Dental College', 'domain': 'BDS'},
        {'name': 'Thai Moogambigai Dental College', 'domain': 'BDS'},
        {'name': 'Venkateswara Dental College', 'domain': 'BDS'},
        {'name': 'Chettinad Dental College', 'domain': 'BDS'},
        {'name': 'Tamil Nadu Government Dental College', 'domain': 'BDS'},
      ],
      'Erode': [
        {'name': 'Erode Dental College', 'domain': 'BDS'},
        {'name': 'RVS Dental College', 'domain': 'BDS'},
        {'name': 'JKKN Dental College', 'domain': 'BDS'},
        {'name': 'Karpagam Dental College', 'domain': 'BDS'},
        {'name': 'KSR Institute of Dental Science', 'domain': 'BDS'},
        {'name': 'Bharath Dental College', 'domain': 'BDS'},
        {'name': 'Ganga Dental College', 'domain': 'BDS'},
        {'name': 'Excel Dental College', 'domain': 'BDS'},
        {'name': 'KMCH Dental College', 'domain': 'BDS'},
        {'name': 'Erode Christian Dental College', 'domain': 'BDS'},
      ],
    },
    'B.Pharm': {
      'Chennai': [
        {'name': 'Sri Ramachandra College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'Saveetha College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'Vels College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'C.L. Baid Metha College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'Meenakshi College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'Jaya College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'Adhiparasakthi College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'Annai Veilankanni College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'K.K. College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'Sankaralingam Bhuvaneswari College of Pharmacy', 'domain': 'B.Pharm'},
      ],
      'Trichy': [
        {'name': 'SRM Trichy College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'Annai College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'Bishop Heber College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'Dhanalakshmi Srinivasan College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'Our Lady of Health College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'Cheran College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'Indira College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'St. Joseph College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'Saranathan College of Pharmacy', 'domain': 'B.Pharm'},
        {'name': 'Shri Venkateshwara College of Pharmacy', 'domain': 'B.Pharm'},
      ],
    },
    'B.Sc Nursing': {
      'Chennai': [
        {'name': 'Apollo College of Nursing', 'domain': 'B.Sc Nursing'},
        {'name': 'SRM College of Nursing', 'domain': 'B.Sc Nursing'},
        {'name': 'Saveetha College of Nursing', 'domain': 'B.Sc Nursing'},
        {'name': 'Sri Ramachandra College of Nursing', 'domain': 'B.Sc Nursing'},
        {'name': 'Meenakshi College of Nursing', 'domain': 'B.Sc Nursing'},
        {'name': 'Madha College of Nursing', 'domain': 'B.Sc Nursing'},
        {'name': 'Sree Balaji College of Nursing', 'domain': 'B.Sc Nursing'},
        {'name': 'Tagore College of Nursing', 'domain': 'B.Sc Nursing'},
        {'name': 'Omayal Achi College of Nursing', 'domain': 'B.Sc Nursing'},
        {'name': 'K.J. College of Nursing', 'domain': 'B.Sc Nursing'},
      ],
      'Madurai': [
        {'name': 'American College of Nursing', 'domain': 'B.Sc Nursing'},
        {'name': 'Velammal College of Nursing', 'domain': 'B.Sc Nursing'},
        {'name': 'Apollo College of Nursing Madurai', 'domain': 'B.Sc Nursing'},
        {'name': 'Government College of Nursing Madurai', 'domain': 'B.Sc Nursing'},
        {'name': 'Raja College of Nursing', 'domain': 'B.Sc Nursing'},
        {'name': 'Latha Mathavan Nursing College', 'domain': 'B.Sc Nursing'},
        {'name': 'Matha College of Nursing', 'domain': 'B.Sc Nursing'},
        {'name': 'Subham Nursing College', 'domain': 'B.Sc Nursing'},
        {'name': 'Jainee College of Nursing', 'domain': 'B.Sc Nursing'},
        {'name': 'Mother Teresa College of Nursing', 'domain': 'B.Sc Nursing'},
      ],
    },
    'BPT': {
      'Chennai': [
        {'name': 'SRM Institute of Science and Technology', 'domain': 'BPT'},
        {'name': 'Sri Ramachandra Institute of Higher Education', 'domain': 'BPT'},
        {'name': 'Saveetha Institute of Medical and Technical Sciences', 'domain': 'BPT'},
        {'name': 'Tagore College of Physiotherapy', 'domain': 'BPT'},
        {'name': 'Madha College of Physiotherapy', 'domain': 'BPT'},
        {'name': 'Sree Balaji College of Physiotherapy', 'domain': 'BPT'},
        {'name': 'Meenakshi College of Physiotherapy', 'domain': 'BPT'},
        {'name': 'Vels Institute of Science, Technology and Advanced Studies', 'domain': 'BPT'},
        {'name': 'KMCH College of Physiotherapy', 'domain': 'BPT'},
        {'name': 'Apollo College of Physiotherapy', 'domain': 'BPT'},
      ],
      'Coimbatore': [
        {'name': 'KMCH College of Physiotherapy', 'domain': 'BPT'},
        {'name': 'PSG College of Physiotherapy', 'domain': 'BPT'},
        {'name': 'Dr. N.G.P College of Physiotherapy', 'domain': 'BPT'},
        {'name': 'Karpagam College of Physiotherapy', 'domain': 'BPT'},
        {'name': 'Ganga College of Physiotherapy', 'domain': 'BPT'},
        {'name': 'Cheran College of Physiotherapy', 'domain': 'BPT'},
        {'name': 'RVS College of Physiotherapy', 'domain': 'BPT'},
        {'name': 'Ramalingam College of Physiotherapy', 'domain': 'BPT'},
        {'name': 'Excel College of Physiotherapy', 'domain': 'BPT'},
        {'name': 'SNS College of Physiotherapy', 'domain': 'BPT'},
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colleges in Tamil Nadu'),
        backgroundColor: Colors.green.shade700,
      ),
      body: ListView(
        children: collegesByCourse.entries.map((courseEntry) {
          return ExpansionTile(
            title: Text(
              courseEntry.key,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            children: courseEntry.value.entries.map((districtEntry) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      districtEntry.key,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 6),
                    ...districtEntry.value.map((collegeInfo) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text("• ${collegeInfo['name']}\n  Domain: ${collegeInfo['domain']}",
                              style: const TextStyle(fontSize: 14)),
                        )),
                  ],
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
