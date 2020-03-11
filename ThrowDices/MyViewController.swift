//
//  MyViewController.swift
//  ThrowDices
//
//  Created by Ernest Godlewski on 10/03/2020.
//  Copyright © 2020 Ernest Godlewski. All rights reserved.
//

import UIKit

class MyViewController: UIViewController
{
    let redLabel: UILabel =
    {
        let label = UILabel()
        label.text = "5"
        label.backgroundColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    let blueLabel: UILabel =
    {
        let label = UILabel()
        label.text = "4"
        label.backgroundColor = .blue
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    let winnerLabel: UILabel =
    {
        let label = UILabel()
        label.text = "who won?"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Roll Dices", style: .plain, target: self, action: #selector(handleRollDices))
        
        
        let arrangedSubviews = [redLabel, blueLabel]
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(winnerLabel)
        NSLayoutConstraint.activate([winnerLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),
                                     winnerLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
                                     winnerLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    @objc func handleRollDices()
    {
        let redValue = arc4random_uniform(6) + 1
        redLabel.text = "\(redValue)"
        
        let blueValue = arc4random_uniform(6) + 1
        blueLabel.text = "\(blueValue)"
        
        evalueateWinner()
    }
    
    fileprivate func evalueateWinner()
    {
        winnerLabel.text = "Figuring out who won..."
    }
}


