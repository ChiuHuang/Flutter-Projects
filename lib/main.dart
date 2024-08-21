import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyProjectsFlutter());
}

class MyProjectsFlutter extends StatelessWidget {
  const MyProjectsFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Projects',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyProjectsPage(),
    );
  }
}

class MyProjectsPage extends StatefulWidget {
  const MyProjectsPage({super.key});

  @override
  _MyProjectsPageState createState() => _MyProjectsPageState();
}

class _MyProjectsPageState extends State<MyProjectsPage> {
  late Future<Map<String, dynamic>> _projects;

  @override
  void initState() {
    super.initState();
    _projects = fetchProjects();
  }

  Future<Map<String, dynamic>> fetchProjects() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/CodeFoxy-Github/Flutter-Projects/main/projects.json'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load projects');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project List'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _projects,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No projects found'));
          }

          final projects = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.all(8.0),
            children: projects.entries.map((entry) {
              final projectName = entry.key;
              final project = entry.value;

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text(
                    projectName,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  subtitle:
                      Text('Language: ${project['Language'] ?? 'Unknown'}'),
                  isThreeLine: true,
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Finished: ${project['Finished?'] ?? 'Unknown'}'),
                      const SizedBox(height: 8.0),
                      project['Git Address'] != null
                          ? TextButton(
                              onPressed: () =>
                                  _launchURL(project['Git Address']),
                              child: const Text('View on GitHub',
                                  style: TextStyle(color: Colors.blue)),
                            )
                          : const Text('No Git Address'),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
