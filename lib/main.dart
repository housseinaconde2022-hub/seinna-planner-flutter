import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const SeinnaPlannerApp());
}

class SeinnaPlannerApp extends StatelessWidget {
  const SeinnaPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seinna Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFF6B9D),
        scaffoldBackgroundColor: const Color(0xFFFFF0F5),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6B9D),
          primary: const Color(0xFFFF6B9D),
          secondary: const Color(0xFFFF9EC8),
        ),
        textTheme: GoogleFonts.quicksandTextTheme(),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              // Header
              _buildHeader(),
              const SizedBox(height: 16),

              // Grid de cards
              _buildProfilCard(),
              const SizedBox(height: 12),
              _buildCalendrierCard(),
              const SizedBox(height: 12),
              _buildPlanningCard(),
              const SizedBox(height: 12),
              _buildTodoCard(),
              const SizedBox(height: 12),
              _buildHabitsCard(),
              const SizedBox(height: 12),
              _buildNotesCard(),
              const SizedBox(height: 12),
              _buildSanteCard(),
              const SizedBox(height: 12),
              _buildSelfCareCard(),
              const SizedBox(height: 12),
              _buildObjectifsCard(),
              const SizedBox(height: 12),
              _buildBudgetCard(),
              const SizedBox(height: 12),
              _buildMoodCard(),
              const SizedBox(height: 12),
              _buildMessageFinal(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('♕', style: TextStyle(fontSize: 28, color: Color(0xFFFF6B9D))),
            const SizedBox(width: 8),
            Text(
              'Seinna Planner',
              style: GoogleFonts.playfairDisplay(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFF6B9D),
              ),
            ),
            const SizedBox(width: 8),
            const Text('♥', style: TextStyle(fontSize: 22, color: Color(0xFFFF6B9D))),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Rêve • Organise • Brille ♥',
          style: TextStyle(
            fontSize: 13,
            color: Colors.pink.shade300,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _card({required String title, required Widget child, IconData? icon}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFFFD6E7), width: 2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF6B9D).withOpacity(0.12),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF6B9D), Color(0xFFFFB6D9)],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('🎀', style: TextStyle(fontSize: 18)),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFF6B9D),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilCard() {
    return _card(
      title: 'Seinna',
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: const Color(0xFFFFE6F0),
            child: Text(
              'S',
              style: GoogleFonts.playfairDisplay(
                fontSize: 32,
                color: const Color(0xFFFF6B9D),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Rêve • Organise • Brille ♥',
            style: TextStyle(color: Colors.pink.shade300, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendrierCard() {
    final now = DateTime(2026, 11, 13);
    return _card(
      title: 'Mon Calendrier ♥',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_left, color: Color(0xFFFF6B9D))),
              Text(
                'Novembre 2026',
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right, color: Color(0xFFFF6B9D))),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim']
                .map((d) => Text(d, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.pink.shade400)))
                .toList(),
          ),
          const SizedBox(height: 8),
          // Simplified calendar grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.2,
            ),
            itemCount: 30,
            itemBuilder: (context, index) {
              final day = index + 1;
              final isToday = day == 13;
              return Center(
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: isToday
                      ? const BoxDecoration(
                          color: Color(0xFFFF6B9D),
                          shape: BoxShape.circle,
                        )
                      : null,
                  child: Center(
                    child: Text(
                      '$day',
                      style: TextStyle(
                        fontSize: 13,
                        color: isToday ? Colors.white : Colors.black87,
                        fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE6F0),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Text(
              '📅 Sam. 8 Nov. — Baby-sitting ♥',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanningCard() {
    final slots = [
      {'hour': '8h', 'event': 'Cours / Travail ♥'},
      {'hour': '12h', 'event': 'Pause ♥'},
      {'hour': '17h', 'event': 'Sport / Danse ♥'},
      {'hour': '20h', 'event': 'Soirée chill ♥'},
    ];
    return _card(
      title: 'Mon Planning ♥',
      child: Column(
        children: [
          Row(
            children: [
              _tabButton('Jour', true),
              _tabButton('Semaine', false),
              _tabButton('Mois', false),
            ],
          ),
          const SizedBox(height: 12),
          ...slots.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: Text(s['hour']!, style: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE6F0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(s['event']!, style: const TextStyle(fontSize: 13)),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _tabButton(String label, bool active) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: active ? const Color(0xFFFF6B9D) : const Color(0xFFFFE6F0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: active ? Colors.white : const Color(0xFF5A2A3A),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTodoCard() {
    final todos = [
      'Réviser mes cours',
      'Faire du sport',
      'Prendre soin de ma peau',
      'Créer du contenu IG',
      'Lire un livre ♥',
      'Préparer mes affaires',
      'Boire de l\'eau',
      'Être heureuse ♥',
    ];
    return _card(
      title: 'Mes To-Do ♥',
      child: Column(
        children: todos.map((t) => CheckboxListTile(
          value: false,
          onChanged: (_) {},
          title: Text(t, style: const TextStyle(fontSize: 14)),
          activeColor: const Color(0xFFFF6B9D),
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          dense: true,
        )).toList(),
      ),
    );
  }

  Widget _buildHabitsCard() {
    final habits = [
      {'icon': '💧', 'name': 'Boire de l\'eau', 'hearts': 3},
      {'icon': '🏋️', 'name': 'Faire du sport', 'hearts': 2},
      {'icon': '🧘', 'name': 'Méditation / Yoga', 'hearts': 1},
      {'icon': '🧴', 'name': 'Ma skincare', 'hearts': 3},
      {'icon': '📚', 'name': 'Lire', 'hearts': 2},
      {'icon': '😊', 'name': 'Être positive ♥', 'hearts': 3},
    ];
    return _card(
      title: 'Habitudes ♥',
      child: Column(
        children: [
          Text('L  M  M  J  V  S  D', style: TextStyle(fontSize: 12, color: Colors.pink.shade300, fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          ...habits.map((h) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Text(h['icon'] as String, style: const TextStyle(fontSize: 18)),
                    const SizedBox(width: 10),
                    Expanded(child: Text(h['name'] as String, style: const TextStyle(fontSize: 14))),
                    Text('♥' * (h['hearts'] as int), style: const TextStyle(color: Color(0xFFFF6B9D))),
                  ],
                ),
              )),
          const SizedBox(height: 10),
          Text(
            'Tu es incroyable ♥',
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.pink.shade400),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesCard() {
    final notes = [
      {'title': 'Idées Instagram ♥', 'date': 'Aujourd\'hui, 10:24'},
      {'title': 'Recette savon naturel ♥', 'date': 'Hier, 19:16'},
      {'title': 'Projets futurs ♥', 'date': 'Hier, 14:32'},
      {'title': 'Petits mots doux ♥', 'date': '10/11/2026'},
    ];
    return _card(
      title: 'Mes Notes ♥',
      child: Column(
        children: [
          Row(
            children: [
              _tabButton('Toutes', true),
              _tabButton('Études', false),
              _tabButton('Beauté', false),
              _tabButton('Autre', false),
            ],
          ),
          const SizedBox(height: 12),
          ...notes.map((n) => Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE6F0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('♥ ${n['title']}', style: const TextStyle(fontWeight: FontWeight.w500)),
                    const SizedBox(height: 2),
                    Text(n['date']!, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildSanteCard() {
    return _card(
      title: 'Ma Santé ♥',
      child: Column(
        children: [
          Row(
            children: [
              _tabButton('Cycle', true),
              _tabButton('Poids', false),
              _tabButton('Sommeil', false),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE6F0),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Text('Mon cycle ♥', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Text(
                  'Prochaines règles ≈ 25 Nov. ♥',
                  style: TextStyle(color: Colors.pink.shade400),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: const Text('Voir mon cycle ›', style: TextStyle(color: Color(0xFFFF6B9D))),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE6F0),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Column(
                    children: [
                      Text('⚖️'),
                      SizedBox(height: 4),
                      Text('Mon poids', style: TextStyle(fontSize: 12)),
                      Text('56 kg', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE6F0),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Column(
                    children: [
                      Text('🌙'),
                      SizedBox(height: 4),
                      Text('Mon sommeil', style: TextStyle(fontSize: 12)),
                      Text('7h30', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSelfCareCard() {
    final items = [
      'Soins visage',
      'Masque visage',
      'Hydratation',
      'Routine cheveux',
      'Bain relaxant',
      'Faire une activité que j\'aime ♥',
    ];
    return _card(
      title: 'Self Care ♥',
      child: Column(
        children: [
          ...items.map((t) => CheckboxListTile(
                value: false,
                onChanged: (_) {},
                title: Text(t, style: const TextStyle(fontSize: 14)),
                activeColor: const Color(0xFFFF6B9D),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                dense: true,
              )),
          const SizedBox(height: 8),
          Text(
            'Prends soin de toi, tu le mérites ♥',
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.pink.shade400),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildObjectifsCard() {
    final goals = [
      'Réussir mes études',
      'Être indépendante',
      'Voyager ✈',
      'Me sentir bien dans mon corps',
      'Construire ma vie de rêve ♥',
    ];
    return _card(
      title: 'Mes Objectifs ♥',
      child: Column(
        children: [
          ...goals.map((t) => CheckboxListTile(
                value: false,
                onChanged: (_) {},
                title: Text(t, style: const TextStyle(fontSize: 14)),
                activeColor: const Color(0xFFFF6B9D),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                dense: true,
              )),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.0,
              minHeight: 10,
              backgroundColor: const Color(0xFFFFE6F0),
              color: const Color(0xFFFF6B9D),
            ),
          ),
          const SizedBox(height: 4),
          const Align(
            alignment: Alignment.centerRight,
            child: Text('0%', style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetCard() {
    return _card(
      title: 'Mon Budget ♥',
      child: Column(
        children: [
          Text(
            'Dépenses du mois : 0 €',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Ajouter une dépense'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF6B9D),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Aucune dépense pour le moment ♥',
            style: TextStyle(color: Colors.pink.shade300, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _buildMoodCard() {
    final moods = [
      {'emoji': '😊', 'label': 'Heureuse'},
      {'emoji': '😌', 'label': 'Calme'},
      {'emoji': '😩', 'label': 'Fatiguée'},
      {'emoji': '😢', 'label': 'Triste'},
      {'emoji': '😰', 'label': 'Stressée'},
      {'emoji': '🥰', 'label': 'Amoureuse'},
    ];
    return _card(
      title: 'Mon Mood ♥',
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.3,
        children: moods.map((m) => Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFFFD6E7), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(m['emoji']!, style: const TextStyle(fontSize: 22)),
              const SizedBox(height: 2),
              Text(m['label']!, style: const TextStyle(fontSize: 11)),
            ],
          ),
        )).toList(),
      ),
    );
  }

  Widget _buildMessageFinal() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFF0F5), Color(0xFFFFE6F0)],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFFFD6E7), width: 2),
      ),
      child: Column(
        children: [
          Text(
            'Crois en toi,',
            style: GoogleFonts.playfairDisplay(fontSize: 20, color: const Color(0xFF5A2A3A)),
          ),
          Text(
            'Seinna ♥',
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFF6B9D),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF6B9D).withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFF6B9D),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_rounded), label: 'Calendrier'),
          BottomNavigationBarItem(icon: Icon(Icons.star_rounded), label: 'Explorer'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: 'Progrès'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_rounded), label: 'Paramètres'),
        ],
      ),
    );
  }
}
