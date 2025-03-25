//
//  ScoreManager.swift
//  Picture-Match
//
//  Created by Billy McRitchie on 05/03/2025.
//

import Foundation

struct ScoreEntry: Codable {
    let player: String
    let score: Int
}

class ScoreManager {
    static let shared = ScoreManager()
    
    private let scoresKey = "leaderboardScores"
    
    private init() {}
    
    // Adds a new score and keeps only the top 10 scores
    func addScore(player: String, score: Int) {
        var currentScores = getScores()
        currentScores.append(ScoreEntry(player: player, score: score))
        currentScores.sort { $0.score > $1.score }
        if currentScores.count > 10 {
            currentScores = Array(currentScores.prefix(10))
        }
        saveScores(currentScores)
    }
    
    func getScores() -> [ScoreEntry] {
        if let data = UserDefaults.standard.data(forKey: scoresKey),
           let savedScores = try? JSONDecoder().decode([ScoreEntry].self, from: data) {
            return savedScores
        }
        return []
    }
    
    func getTopScores() -> [ScoreEntry] {
        return getScores().sorted { $0.score > $1.score }
    }
    
    private func saveScores(_ scores: [ScoreEntry]) {
        if let data = try? JSONEncoder().encode(scores) {
            UserDefaults.standard.set(data, forKey: scoresKey)
        }
    }
}
