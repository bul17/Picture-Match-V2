//
//  LeaderboardViewController.swift
//  Picture-Match
//
//  Created by Billy McRitchie on 05/03/2025.
//

import UIKit

class LeaderboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    var scores: [ScoreEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Leaderboard"
        setupTableView()
        loadScores()
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func loadScores() {
        scores = ScoreManager.shared.getTopScores()
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return scores.count
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
         let scoreEntry = scores[indexPath.row]
         cell.textLabel?.text = "\(indexPath.row + 1). \(scoreEntry.player)"
         cell.detailTextLabel?.text = "Score: \(scoreEntry.score)"
         return cell
    }
}
