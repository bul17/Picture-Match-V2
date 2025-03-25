//
//  MainViewController.swift
//  Picture-Match
//
//  Created by Billy McRitchie on 05/03/2025.
//

import UIKit

class MainViewController: UIViewController {

    // UI Elements
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Picture Match"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let newGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("New Game", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let leaderboardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Leaderboard", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("MainViewController loaded")
        layoutUI()
        
        newGameButton.addTarget(self, action: #selector(newGameTapped), for: .touchUpInside)
        leaderboardButton.addTarget(self, action: #selector(leaderboardTapped), for: .touchUpInside)
    }
    
    func layoutUI() {
        view.addSubview(titleLabel)
        view.addSubview(nameTextField)
        view.addSubview(newGameButton)
        view.addSubview(leaderboardButton)
        
        NSLayoutConstraint.activate([
            // Title label at top
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Name text field
            nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            nameTextField.heightAnchor.constraint(equalToConstant: 44),
            
            // New Game button
            newGameButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 40),
            newGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            newGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            newGameButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Leaderboard button
            leaderboardButton.topAnchor.constraint(equalTo: newGameButton.bottomAnchor, constant: 20),
            leaderboardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            leaderboardButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            leaderboardButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func newGameTapped() {
        let gameVC = GameViewController()
        // Pass the player's name if provided
        gameVC.playerName = nameTextField.text
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @objc func leaderboardTapped() {
        let leaderboardVC = LeaderboardViewController()
        navigationController?.pushViewController(leaderboardVC, animated: true)
    }
}
