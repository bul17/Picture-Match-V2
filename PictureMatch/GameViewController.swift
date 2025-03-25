//
//  GameViewController.swift
//  Picture-Match
//
//  Created by Billy McRitchie on 05/03/2025.
//

import UIKit

class GameViewController: UIViewController {
    
    var playerName: String?
    
    // UI Elements for game screen
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score: 0"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "Time: 60"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let gameBoardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray5
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let playButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap to Play", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Timer and game state
    var timer: Timer?
    var remainingTime: Int = 60
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutUI()
        playButton.addTarget(self, action: #selector(playTapped), for: .touchUpInside)
        
        startGame()
    }
    
    func layoutUI() {
        view.addSubview(scoreLabel)
        view.addSubview(timerLabel)
        view.addSubview(gameBoardView)
        view.addSubview(playButton)
        
        NSLayoutConstraint.activate([
            // Score label at top left
            scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            // Timer label at top right
            timerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            timerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Game board view in the middle
            gameBoardView.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 40),
            gameBoardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            gameBoardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            gameBoardView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            
            // Play button below game board
            playButton.topAnchor.constraint(equalTo: gameBoardView.bottomAnchor, constant: 20),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.heightAnchor.constraint(equalToConstant: 50),
            playButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func startGame() {
        score = 0
        remainingTime = 60
        updateLabels()
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateGameTimer),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func updateGameTimer() {
        remainingTime -= 1
        updateLabels()
        if remainingTime <= 0 {
            timer?.invalidate()
            timer = nil
            finishGame()
        }
    }
    
    func updateLabels() {
        scoreLabel.text = "Score: \(score)"
        timerLabel.text = "Time: \(remainingTime)"
    }
    
    @objc func playTapped() {
        // Increment score on each tap
        score += 1
        updateLabels()
    }
    
    func finishGame() {
        // Save score to leaderboard
        ScoreManager.shared.addScore(player: playerName ?? "Player", score: score)
        
        let alert = UIAlertController(title: "Game Over",
                                      message: "Your score: \(score)",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
}
