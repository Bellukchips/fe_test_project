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

// models/player.dart
class Player {
  final int id;
  final String name;
  final String? username;
  final int rank;
  final dynamic points;
  final String pointsUnit;
  final String avatar;
  final String? type;
  final String? status;

  Player({
    required this.id,
    required this.name,
    this.username,
    required this.rank,
    required this.points,
    required this.pointsUnit,
    required this.avatar,
    this.type,
    this.status,
  });
}

// models/tournament.dart
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

// data/dummy_data.dart
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
        points: "EXTRA",
        pointsUnit: "",
        avatar: "https://i.pravatar.cc/150?img=6",
      ),
      Player(
        id: 2,
        name: "Kevin Halim",
        rank: 2,
        points: "EXTRA",
        pointsUnit: "",
        avatar: "7",
      ),
      Player(
        id: 3,
        name: "Narpati Lukita",
        rank: 3,
        points: "EXTRA",
        pointsUnit: "",
        avatar: "https://i.pravatar.cc/150?img=8",
      ),
    ];
  }

  static List<Player> getDoublesTournamentPlayers() {
    return [
      Player(
        id: 1,
        name: "Gilang / Ravi",
        rank: 1,
        points: "EXTRA",
        pointsUnit: "",
        avatar: "https://i.pravatar.cc/150?img=9",
        type: "team",
      ),
      Player(
        id: 2,
        name: "Kevin / Kemal",
        rank: 2,
        points: "EXTRA",
        pointsUnit: "",
        avatar: "https://i.pravatar.cc/150?img=10",
        type: "team",
      ),
      Player(
        id: 3,
        name: "Narpati / Lifo",
        rank: 3,
        points: "EXTRA",
        pointsUnit: "",
        avatar: "https://i.pravatar.cc/150?img=11",
        type: "team",
      ),
    ];
  }

  static List<Player> getRankingPlayers() {
    return [
      Player(
        id: 1,
        name: "Budiman Tanuwiswa",
        username: "@budimantanuwiswa",
        rank: 4,
        points: 130,
        pointsUnit: "Pts",
        avatar: "https://i.pravatar.cc/150?img=12",
      ),
      Player(
        id: 2,
        name: "Leo Adriansyah",
        username: "@leo.adrain",
        rank: 5,
        points: 100,
        pointsUnit: "Pts",
        avatar: "https://i.pravatar.cc/150?img=13",
      ),
      Player(
        id: 3,
        name: "Kemal Halim",
        username: "@kemalhalim",
        rank: 6,
        points: 96,
        pointsUnit: "Pts",
        avatar: "https://i.pravatar.cc/150?img=14",
      ),
      Player(
        id: 4,
        name: "Ravi Kusuma",
        username: "@ravikusuma",
        rank: 7,
        points: 90,
        pointsUnit: "Pts",
        avatar: "https://i.pravatar.cc/150?img=15",
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
