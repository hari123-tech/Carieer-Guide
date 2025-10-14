import 'package:flutter/material.dart';
import 'MedicalCollegesPage.dart'; // Ensure this file exists and contains CollegesInTamilNaduPage

class CourseAndMedical extends StatefulWidget {
  final String category;

  const CourseAndMedical({super.key, required this.category});

  @override
  State<CourseAndMedical> createState() => _CourseAndMedicalState();
}

class _CourseAndMedicalState extends State<CourseAndMedical> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> medicalCourses = [
    {
      'name': 'MBBS (Bachelor of Medicine and Bachelor of Surgery)',
      'description': 'Undergraduate program for becoming a medical doctor.',
      'duration': '5.5 Years',
      'benefits': 'Allows you to become a licensed medical practitioner.',
      'governmentJobs': [
        'Government Hospital Medical Officer / Junior Doctor',
        'District Health Officer (after experience/PG)',
        'Staff Nurse (for MBBS graduates in administrative roles)',
        'Medical Officer in Public Health Programs'
      ],
      'privateJobs': [
        'Private Hospital Physician / Consultant',
        'Clinical Research Associate',
        'Private clinic owner / practitioner',
        'Medical Content Writer / Medical Advisor'
      ]
    },
    {
      'name': 'BDS (Bachelor of Dental Surgery)',
      'description': 'Focuses on dental care and surgery.',
      'duration': '5 Years',
      'benefits': 'Qualifies you to practice dentistry and oral care.',
      'governmentJobs': [
        'Government Dental Surgeon',
        'Dental Officer in Public Health Departments',
        'Dental faculty in government dental colleges (after PG)'
      ],
      'privateJobs': [
        'Private Dental Clinic Owner / Dentist',
        'Orthodontist (after specialization)',
        'Dental hygienist trainer / consultant'
      ]
    },
    {
      'name': 'B.Pharm (Bachelor of Pharmacy)',
      'description': 'Deals with preparing and dispensing medicines.',
      'duration': '4 Years',
      'benefits': 'Opens careers in pharma industries and clinical settings.',
      'governmentJobs': [
        'Drug Inspector (state/federal) (with additional qualifications)',
        'Pharmacist in Government Hospitals',
        'Government regulatory roles in drug control departments'
      ],
      'privateJobs': [
        'Community / Retail Pharmacist',
        'Pharmaceutical R&D / Production / Quality Control',
        'Medical representative / Sales specialist',
        'Regulatory affairs executive'
      ]
    },
    {
      'name': 'B.Sc Nursing',
      'description': 'Trains students in patient care and nursing procedures.',
      'duration': '4 Years',
      'benefits': 'Employment in hospitals, clinics, and home care.',
      'governmentJobs': [
        'Staff Nurse in Government Hospitals',
        'Nurse Supervisor / Matron in public institutions',
        'Community Health Nurse with government programs'
      ],
      'privateJobs': [
        'Staff Nurse in private hospitals',
        'ICU / NICU / OR Nurse in specialty hospitals',
        'Nursing educator / trainer in private institutions'
      ]
    },
    {
      'name': 'BPT (Bachelor of Physiotherapy)',
      'description': 'Focuses on physical therapy and rehabilitation.',
      'duration': '4.5 Years',
      'benefits': 'Opens opportunities in rehabilitation and sports therapy.',
      'governmentJobs': [
        'Physiotherapist in government hospitals and rehabilitation centres',
        'Community physiotherapy roles in public health programs'
      ],
      'privateJobs': [
        'Private physiotherapy clinic owner',
        'Physiotherapist in sports teams and private hospitals',
        'Ergonomics consultant'
      ]
    },
    {
      'name': 'BAMS (Ayurvedic Medicine)',
      'description': 'Study of traditional Indian Ayurvedic medical systems.',
      'duration': '5.5 Years',
      'benefits': 'Practice as an Ayurvedic physician.',
      'governmentJobs': [
        'Ayurvedic Medical Officer in government hospitals',
        'Public health roles in AYUSH departments'
      ],
      'privateJobs': [
        'Private Ayurvedic clinic owner',
        'Wellness / Panchakarma centre therapist or manager',
        'Product development for Ayurvedic companies'
      ]
    },
    {
      'name': 'BHMS (Homeopathic Medicine)',
      'description': 'Study of homeopathic medicine and treatments.',
      'duration': '5.5 Years',
      'benefits': 'Allows you to practice homeopathic treatments.',
      'governmentJobs': [
        'Homeopathic Medical Officer in government AYUSH clinics',
      ],
      'privateJobs': [
        'Private homeopathic practice',
        'Clinical research for alternative medicine companies'
      ]
    },
    {
      'name': 'BUMS (Unani Medicine)',
      'description': 'Deals with Unani (Greek-Arabic) medicine systems.',
      'duration': '5.5 Years',
      'benefits': 'Eligibility to be a Unani doctor.',
      'governmentJobs': [
        'Unani medical officer in government AYUSH centres'
      ],
      'privateJobs': [
        'Private Unani clinics',
        'Herbal product consultancy'
      ]
    },
    {
      'name': 'Bachelor of Veterinary Science',
      'description': 'Focuses on animal health, diagnosis, and treatment.',
      'duration': '5 Years',
      'benefits': 'Careers in animal hospitals, zoos, and agriculture.',
      'governmentJobs': [
        'Government Veterinary Officer / Livestock Inspector',
        'Veterinary Surgeon in government animal hospitals'
      ],
      'privateJobs': [
        'Private veterinary clinics',
        'Livestock consultancy',
        'Pharma and vaccine industries (animal health)'
      ]
    },
    {
      'name': 'BMLT (Bachelor of Medical Laboratory Technology)',
      'description': 'Training in diagnosing diseases using lab tests.',
      'duration': '3 Years',
      'benefits': 'Work as lab technologist or technician.',
      'governmentJobs': [
        'Laboratory Technician in government hospitals and diagnostic centres'
      ],
      'privateJobs': [
        'Diagnostic lab technologist in private labs',
        'QA/QC roles in medical testing companies'
      ]
    },
    {
      'name': 'B.Sc Radiology',
      'description': 'Focuses on medical imaging and X-ray technologies.',
      'duration': '3 Years',
      'benefits': 'Opportunities in diagnostic labs and hospitals.',
      'governmentJobs': [
        'Radiographer in government diagnostic centres',
        'X-ray technician roles in public hospitals'
      ],
      'privateJobs': [
        'Radiology technician in private hospitals and imaging centres',
        'CT/MRI technician in specialty clinics'
      ]
    },
    {
      'name': 'Bachelor of Occupational Therapy',
      'description': 'Helps patients improve daily living and working skills.',
      'duration': '4.5 Years',
      'benefits': 'Helps in mental and physical rehabilitation sectors.',
      'governmentJobs': [
        'Occupational therapist in government hospitals and rehabilitation programs'
      ],
      'privateJobs': [
        'Occupational therapist in private rehab centres',
        'Ergonomics and workplace rehab consultant'
      ]
    },
    {
      'name': 'Public Health',
      'description': 'Focuses on improving community health and wellness.',
      'duration': '3 Years',
      'benefits': 'Roles in NGOs, health ministries, and global health agencies.',
      'governmentJobs': [
        'Public Health Officer / Program Manager (government health schemes)',
        'Epidemiologist roles in public health departments'
      ],
      'privateJobs': [
        'NGO program officer',
        'Public health consultant for private firms and donors'
      ]
    },
    {
      'name': 'Biomedical Science',
      'description': 'Combines biology and medicine to study human diseases.',
      'duration': '3 Years',
      'benefits': 'Research and diagnostic roles in labs and pharma.',
      'governmentJobs': [
        'Research assistant in government labs',
        'Diagnostic roles in public health institutions'
      ],
      'privateJobs': [
        'R&D roles in pharmaceutical and biotech companies',
        'Clinical lab technologist in private labs'
      ]
    },
    {
      'name': 'Emergency and Trauma Care',
      'description': 'Deals with emergency medical treatment and trauma cases.',
      'duration': '3 Years',
      'benefits': 'Work in emergency rooms, ambulances, and trauma units.',
      'governmentJobs': [
        'Emergency Medical Technician in government ambulance services',
        'Emergency department roles in public hospitals'
      ],
      'privateJobs': [
        'Emergency care roles in private hospitals',
        'Ambulance services and private trauma centres'
      ]
    },
    {
      'name': 'Anesthesia Technology',
      'description': 'Trains students to assist anesthesiologists during surgery.',
      'duration': '3 Years',
      'benefits': 'Support roles in operating theatres and ICUs.',
      'governmentJobs': [
        'Anesthesia technician roles in government hospitals'
      ],
      'privateJobs': [
        'Anesthesia technician in private hospitals and specialty centres'
      ]
    },
    {
      'name': 'Cardiac Care Technology',
      'description': 'Focuses on heart-related treatments and diagnostics.',
      'duration': '3 Years',
      'benefits': 'Work alongside cardiologists in heart care units.',
      'governmentJobs': [
        'Cardiac technician in government cardiac units'
      ],
      'privateJobs': [
        'Cardiac care technician in private hospitals and heart centres'
      ]
    },
    {
      'name': 'Forensic Science',
      'description': 'Applies science to solve crimes and legal investigations.',
      'duration': '3 Years',
      'benefits': 'Crime labs, police departments, and legal institutions.',
      'governmentJobs': [
        'Forensic scientist / lab assistant in government crime labs',
        'Technical roles with police departments'
      ],
      'privateJobs': [
        'Forensic analyst in private labs (court cases / consulting)',
        'Forensic consultant for legal firms'
      ]
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> filteredCourses = medicalCourses
        .where((course) =>
            (course['name'] as String).toLowerCase().contains(_searchQuery.toLowerCase()) ||
            (course['description'] as String).toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} Courses'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search medical courses...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredCourses.length,
                  itemBuilder: (context, index) {
                    final course = filteredCourses[index];
                    final List<dynamic> governmentJobs = (course['governmentJobs'] as List<dynamic>?) ?? [];
                    final List<dynamic> privateJobs = (course['privateJobs'] as List<dynamic>?) ?? [];

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.local_hospital, color: Colors.green, size: 28),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          course['name'] ?? '',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Text("Duration: ${course['duration'] ?? 'N/A'}"),
                                        SizedBox(height: 4),
                                        Text("Benefits: ${course['benefits'] ?? 'N/A'}"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Text("Government Jobs:", style: TextStyle(fontWeight: FontWeight.w600)),
                              SizedBox(height: 6),
                              if (governmentJobs.isEmpty)
                                Text("No government job data available.")
                              else
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: governmentJobs.map<Widget>((job) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(vertical: 2),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("• "),
                                          Expanded(child: Text(job.toString())),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              SizedBox(height: 10),
                              Text("Private Jobs:", style: TextStyle(fontWeight: FontWeight.w600)),
                              SizedBox(height: 6),
                              if (privateJobs.isEmpty)
                                Text("No private job data available.")
                              else
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: privateJobs.map<Widget>((job) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(vertical: 2),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("• "),
                                          Expanded(child: Text(job.toString())),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            right: 16,
            bottom: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CollegesInTamilNaduPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Colleges', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
