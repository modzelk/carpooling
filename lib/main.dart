import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


const Color kBackgroundColor = Color(0xFF1A1A1A);
const Color kSurfaceColor = Color(0xFF2C2C2C);
const Color kPrimaryColor = Color(0xFF00B0FF); 
const Color kOnBackgroundColor = Color(0xFFFFFFFF);
const Color kOnSurfaceVariantColor = Color(0xFFB0B0B0); 

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carpooling App',
      debugShowCheckedModeBanner: false,
      
      // ----- Implementacja naszego Ciemnego Motywu (Dark Mode) -----
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        cardColor: kSurfaceColor, 
        
    
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: kOnBackgroundColor),
            
        colorScheme: const ColorScheme.dark(
          primary: kPrimaryColor,
          surface: kSurfaceColor,
          background: kBackgroundColor,
          onBackground: kOnBackgroundColor,
          onSurface: kOnBackgroundColor,
        ),
        
    
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent, 
          elevation: 0,
          iconTheme: IconThemeData(color: kOnBackgroundColor, size: 28),
        ),
      ),
      home: const MainHomeScreen(),
    );
  }
}



class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true, 
      

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: () {

          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.account_circle_rounded),
              iconSize: 32,
              onPressed: () {

              },
            ),
          ),
        ],
      ),
      

      body: Stack(
        children: [

          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey[900], 
            child: const Center(
              child: Text(
                'PLACEHOLDER MAPY',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kOnSurfaceVariantColor,
                ),
              ),
            ),
          ),


          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomSearchPanel(context),
          ),
        ],
      ),
    );
  }


  Widget _buildBottomSearchPanel(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 20,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        children: [
          _buildFakeSearchBar(context),
          const SizedBox(height: 20),
          _buildShortcutButtons(),
        ],
      ),
    );
  }


  Widget _buildFakeSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nawiguj do wyszukiwania...')),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: kBackgroundColor, 
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: kOnSurfaceVariantColor),
            const SizedBox(width: 12),
            Text(
              'Dokąd jedziemy?',
              style: TextStyle(
                color: kOnSurfaceVariantColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildShortcutButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildShortcutChip(icon: Icons.home_filled, label: 'Dom'),
        _buildShortcutChip(icon: Icons.work_rounded, label: 'Praca'),
      ],
    );
  }

  Widget _buildShortcutChip({required IconData icon, required String label}) {
    return GestureDetector(
      onTap: () {
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: kBackgroundColor,
            child: Icon(icon, color: kOnSurfaceVariantColor, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: kOnBackgroundColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}