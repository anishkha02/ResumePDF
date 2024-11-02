import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _generateResumePDF(BuildContext context) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(24),
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text('Anishkha Chaudhary', style: pw.TextStyle(fontSize: 28, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 8),
                pw.Text('Software Engineer | anishkha@gmail.com | +9174 456 7890 | Amroha, India',
                    style: pw.TextStyle(fontSize: 12, color: PdfColors.grey700)),
                pw.Divider(thickness: 1, color: PdfColors.grey300),
                pw.SizedBox(height: 16),
              ],
            ),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  flex: 1,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Professional Summary', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 8),
                      pw.Text(
                        'B.Tech Computer Science graduate skilled in problem-solving, Flutter, and tools like Android Studio and Figma. Eager to create user-focused, scalable applications in a dynamic tech role. Committed to continuous learning and contributing to impactful software solutions.',
                        style: pw.TextStyle(fontSize: 12),
                      ),
                      pw.SizedBox(height: 16),

                      pw.Text('Experience', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 8),
                      _buildExperienceSection(
                        title: 'Flutter Developer',
                        company: 'Kartexa',
                        date: 'Jan 2023 - March 2023',
                        details: [
                          'Created a communication app with Dart programming language to enable effective connectivity.',
                          'Implemented a user interface for the application, seamlessly integrating 3 diverse themes to optimize the user experience.',
                          'Collaborated with team members using the Git version control system to manage 4 modifications, assign tasks, and ensure a smooth project workflow.',
                        ],
                      ),
                      pw.SizedBox(height: 12),

                      pw.Text('Education', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 8),
                      _buildEducationSection(
                        degree: 'Bachelor of Technology in Computer Science',
                        institution: 'AKG Engineering College',
                        date: '2020 - 2024',
                        additionalInfo: '8.5 CGPA',
                      ),
                      pw.SizedBox(height: 8),
                      _buildEducationSection(
                        degree: 'Intermediate',
                        institution: 'S.T. Mary\'s Convent School',
                        date: '2020',
                        additionalInfo: '94%',
                      ),
                      pw.SizedBox(height: 8),
                      _buildEducationSection(
                        degree: 'High School',
                        institution: 'S.T. Mary\'s Convent School',
                        date: '2018',
                        additionalInfo: '82%',
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(width: 24),

                pw.Expanded(
                  flex: 1,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.SizedBox(height: 16),
                      pw.Text('Skills', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 8),
                      pw.Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: [
                          _buildSkillChip('Flutter'),
                          _buildSkillChip('Dart'),
                          _buildSkillChip('Firebase'),
                          _buildSkillChip('REST APIs'),
                          _buildSkillChip('Git & GitHub'),
                          _buildSkillChip('UI/UX Design'),
                        ],
                      ),
                      pw.SizedBox(height: 16),
                      pw.Text('Projects', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 8),
                      _buildProjectSection(
                        title: 'Weather App',
                        description:
                            'A Flutter-based application that fetches weather data from an API and displays real-time weather conditions for various cities. Implemented state management and optimized API requests.',
                      ),
                      _buildProjectSection(
                        title: 'ToDo List App',
                        description:
                            'Developed a to-do list application with task management, sorting, and priority settings. Utilized BLoC architecture for efficient state management and seamless user experience.',
                      ),
                      pw.SizedBox(height: 16),

                      pw.Text('Roles and Responsibilities', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 8),
                      _buildExtraCurricularSection(
                        title: 'Student Community Head, Flutter Developer',
                        organization: 'Cloud Computing Cell',
                        details:
                            'Led the development, build, and execution of campus programs and closed community events to generate student awareness. Organized and coordinated various activities to engage students and promote participation.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  pw.Widget _buildExperienceSection({
    required String title,
    required String company,
    required String date,
    required List<String> details,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('$title - $company', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
        pw.Text(date, style: pw.TextStyle(fontSize: 12, color: PdfColors.grey600)),
        pw.SizedBox(height: 4),
        ...details.map((detail) => pw.Bullet(text: detail, style: pw.TextStyle(fontSize: 12))),
        pw.SizedBox(height: 12),
      ],
    );
  }
  pw.Widget _buildEducationSection({
    required String degree,
    required String institution,
    required String date,
    required String additionalInfo,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(degree, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
        pw.Text(institution, style: pw.TextStyle(fontSize: 12, color: PdfColors.grey600)),
        pw.Text(date, style: pw.TextStyle(fontSize: 12, color: PdfColors.grey600)),
        pw.SizedBox(height: 4),
        pw.Text(additionalInfo, style: pw.TextStyle(fontSize: 12)),
      ],
    );
  }
  pw.Widget _buildProjectSection({
    required String title,
    required String description,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(title, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 4),
        pw.Text(description, style: pw.TextStyle(fontSize: 12)),
        pw.SizedBox(height: 12),
      ],
    );
  }
  pw.Widget _buildSkillChip(String skill) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey300,
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Text(skill, style: pw.TextStyle(fontSize: 12)),
    );
  }
  pw.Widget _buildExtraCurricularSection({
    required String title,
    required String organization,
    required String details,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('$title - $organization', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 4),
        pw.Text(details, style: pw.TextStyle(fontSize: 12)),
        pw.SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('My Resume')),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _generateResumePDF(context),
          child: const Text('Download Resume'),
        ),
      ),
    );
  }
}
