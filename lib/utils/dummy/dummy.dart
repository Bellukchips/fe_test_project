import 'package:flutter/material.dart';

class Community {
  final int id;
  final String name;
  final String type;
  final String memberCount;
  final String avatar;
  final Color color;

  Community({
    required this.id,
    required this.name,
    required this.type,
    required this.memberCount,
    required this.avatar,
    required this.color,
  });
}

class Player {
  final int? id;
  final int? rank;
  final String? type;

  final String name;
  final String avatar;
  final int points;
  final String pointsUnit;
  final String sport;
  final String category;
  final String region;
  final String period;

  Player({
    this.id,
    this.rank,
    this.type,
    required this.name,
    required this.avatar,
    required this.points,
    required this.pointsUnit,
    required this.sport,
    required this.category,
    required this.region,
    required this.period,
  });
}

class Tournament {
  final int id;
  final String name;
  final String type;
  final String location;
  final String description;
  final List<Player> participants;

  Tournament({
    required this.id,
    required this.name,
    required this.type,
    required this.location,
    required this.description,
    required this.participants,
  });
}

class DummyData {
  static List<Community> getCommunities() {
    return [
      Community(
        id: 1,
        name: "Far East United",
        type: "premium",
        memberCount: "Komunitas penyegat #456, lingkup yuk!",
        avatar: "https://i.pravatar.cc/150?img=1",
        color: const Color(0xFFFF6B35),
      ),
      Community(
        id: 2,
        name: "Bleu House",
        type: "standard",
        memberCount: "102 Pts",
        avatar: "https://i.pravatar.cc/150?img=2",
        color: const Color(0xFF4285F4),
      ),
      Community(
        id: 3,
        name: "TGD Enthusiast",
        type: "standard",
        memberCount: "101 Pts",
        avatar: "https://i.pravatar.cc/150?img=3",
        color: const Color(0xFF34A853),
      ),
      Community(
        id: 4,
        name: "Grizzly Community",
        type: "standard",
        memberCount: "96 Pts",
        avatar: "https://i.pravatar.cc/150?img=4",
        color: const Color(0xFFFBBC04),
      ),
      Community(
        id: 5,
        name: "Komunitas Kawan AYO",
        type: "standard",
        memberCount: "92 Pts",
        avatar: "https://i.pravatar.cc/150?img=5",
        color: const Color(0xFFEA4335),
      ),
    ];
  }

  static List<Player> getTournamentPlayers() {
    return [
      Player(
        id: 1,
        name: "Gilang Kencana",
        rank: 1,
        points: 210,
        pointsUnit: "Pts",
        avatar: "https://i.pravatar.cc/150?img=6",
        sport: "Badminton",
        category: "Tunggal",
        region: "Jakarta",
        period: "season",
        type: "single",
      ),
      Player(
        id: 2,
        name: "Kevin Halim",
        rank: 2,
        points: 198,
        pointsUnit: "Pts",
        avatar: "https://i.pravatar.cc/150?img=7",
        sport: "Mini Soccer",
        category: "Tunggal",
        region: "Surabaya",
        period: "all",
        type: "single",
      ),
      Player(
        id: 3,
        name: "Narpati Lukita",
        rank: 3,
        points: 190,
        pointsUnit: "Pts",
        avatar: "https://i.pravatar.cc/150?img=8",
        sport: "Basketball",
        category: "Tunggal",
        region: "Bandung",
        period: "all",
        type: "single",
      ),
    ];
  }

  static List<Player> getDoublesTournamentPlayers() {
    return [
      Player(
        id: 1,
        name: "Gilang / Ravi",
        rank: 1,
        points: 220,
        pointsUnit: "Pts",
        avatar: "https://i.pravatar.cc/150?img=9",
        sport: "Badminton",
        category: "Ganda",
        region: "Jakarta",
        period: "season",
        type: "team",
      ),
      Player(
        id: 2,
        name: "Kevin / Kemal",
        rank: 2,
        points: 205,
        pointsUnit: "Pts",
        avatar: "https://i.pravatar.cc/150?img=10",
        sport: "Mini Soccer",
        category: "Ganda",
        region: "Surabaya",
        period: "all",
        type: "team",
      ),
      Player(
        id: 3,
        name: "Narpati / Lifo",
        rank: 3,
        points: 192,
        pointsUnit: "Pts",
        avatar: "https://i.pravatar.cc/150?img=11",
        sport: "Basketball",
        category: "Ganda",
        region: "Bandung",
        period: "all",
        type: "team",
      ),
    ];
  }

  static List<Player> getRankingPlayers() {
    return [
      Player(
        name: "Gilang Kencana",
        avatar: "https://placehold.co/100x100",
        points: 210,
        pointsUnit: "Pts",
        sport: "Badminton",
        category: "Tunggal",
        region: "Jakarta",
        period: "season",
      ),
      Player(
        name: "Kevin Halim",
        avatar: "https://placehold.co/100x100",
        points: 201,
        pointsUnit: "Pts",
        sport: "Mini Soccer",
        category: "Ganda",
        region: "Surabaya",
        period: "all",
      ),
      Player(
        name: "Narpati Lukita",
        avatar: "https://placehold.co/100x100",
        points: 198,
        pointsUnit: "Pts",
        sport: "Basketball",
        category: "Tim",
        region: "Bandung",
        period: "all",
      ),
      Player(
        name: "Narpati",
        avatar: "https://placehold.co/100x100",
        points: 170,
        pointsUnit: "Pts",
        sport: "Mini Soccer",
        category: "Tim",
        region: "Tangerang",
        period: "season",
      ),
    ];
  }

  static Tournament getSingleTournament() {
    return Tournament(
      id: 1,
      name: "Summer 2025",
      type: "Tunggal / Single",
      location: "Tenis Meja, Tunggal, Surabaya",
      description: "Kami nih di turnamen #456, tunggu yak!",
      participants: getTournamentPlayers(),
    );
  }

  static Tournament getDoublesTournament() {
    return Tournament(
      id: 2,
      name: "Summer 2025",
      type: "Ganda / Single",
      location: "Tenis Meja, Tunggal, Surabaya",
      description: "Kami nih di turnamen #456, tunggu yak!",
      participants: getDoublesTournamentPlayers(),
    );
  }
}
