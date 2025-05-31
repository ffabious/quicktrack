import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: SizedBox(
        width: 0.8 * MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('About QuickTrack', style: theme.textTheme.headlineMedium),
            const SizedBox(height: 20),
            Text(
              'QuickTrack is a simple and efficient task management app designed to help you stay organized and productive.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('GitHub Repo:'),
                      Tooltip(
                        waitDuration: const Duration(milliseconds: 300),
                        message: 'Visit GitHub Repository',
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'QuickTrack',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Developed by:'),
                      Tooltip(
                        waitDuration: const Duration(milliseconds: 300),
                        message: 'Visit Developer Profile',
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'ffabious',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
