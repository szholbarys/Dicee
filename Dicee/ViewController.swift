//
//  ViewController.swift
//  Dicee
//
//  Created by Zholbarys on 20.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var leftDiceImageView: UIImageView!
    private var rightDiceImageView: UIImageView!
    private var rollButton: UIButton!
    
    private var leftDiceNumber = 1
    private var rightDiceNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // Create left dice image view
        leftDiceImageView = UIImageView()
        leftDiceImageView.translatesAutoresizingMaskIntoConstraints = false
        leftDiceImageView.contentMode = .scaleAspectFit
        view.addSubview(leftDiceImageView)
        
        // Create right dice image view
        rightDiceImageView = UIImageView()
        rightDiceImageView.translatesAutoresizingMaskIntoConstraints = false
        rightDiceImageView.contentMode = .scaleAspectFit
        view.addSubview(rightDiceImageView)
        
        // Create roll button
        rollButton = UIButton(type: .system)
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        rollButton.setTitle("Roll Dice", for: .normal)
        rollButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        rollButton.setTitleColor(.white, for: .normal)
        rollButton.backgroundColor = .red
        rollButton.layer.cornerRadius = 10
        rollButton.addTarget(self, action: #selector(rollDice), for: .touchUpInside)
        view.addSubview(rollButton)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            leftDiceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            leftDiceImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            leftDiceImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            leftDiceImageView.heightAnchor.constraint(equalTo: leftDiceImageView.widthAnchor),
            
            rightDiceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rightDiceImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rightDiceImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            rightDiceImageView.heightAnchor.constraint(equalTo: rightDiceImageView.widthAnchor),
            
            rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            rollButton.widthAnchor.constraint(equalToConstant: 200),
            rollButton.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        updateDiceImages()
    }
    
    @objc private func rollDice() {
        leftDiceNumber = Int.random(in: 1...6)
        rightDiceNumber = Int.random(in: 1...6)
        updateDiceImages()
    }
    
    private func updateDiceImages() {
        leftDiceImageView.image = UIImage(named: "dice\(leftDiceNumber)")
        rightDiceImageView.image = UIImage(named: "dice\(rightDiceNumber)")
    }
}
