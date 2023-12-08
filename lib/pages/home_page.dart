import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF906AFE),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/quizhome.png',
              width: MediaQuery.of(context).size.width,
              height: 200,
            ),
            SizedBox(height: 20),
            Expanded(
              child: _buildInfoCardWithPageView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCardWithPageView() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: InfoCardPageView(),
      ),
    );
  }
}

class InfoCardPageView extends StatefulWidget {
  @override
  _InfoCardPageViewState createState() => _InfoCardPageViewState();
}

class _InfoCardPageViewState extends State<InfoCardPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              _buildPageContent('Welcome to Quiz App', 'Discover and enjoy a variety of quizzes.'),
              _buildPageContent('Challenge Yourself', 'Test your knowledge in different subjects.'),
              _buildPageContent('Track Your Progress', 'See your improvement over time.'),
            ],
          ),
        ),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildPageContent(String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.orange : Colors.grey,
          ),
        );
      }),
    );
  }
}
