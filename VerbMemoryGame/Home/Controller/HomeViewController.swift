//
//  HomeViewController.swift
//  VerbMemoryGame
//
//  Created by Maksims Šalajevs on 24/05/2024.
//

import UIKit

// final
final class HomeViewController: UIViewController {
	
	// for UI constants
	private struct UIConstants {
		static let cornerRadius: CGFloat = 20
		static let buttonHeight: CGFloat = 80
		static let labelText: String = "Verregular"
		static let firstButtonText: String = "Select Verbs"
		static let secondButtonText: String = "Train Verbs"
	}
    
    // MARK: - GUI Variables
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
		label.text = UIConstants.labelText.uppercased()
        label.font = .boldSystemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var firstButton: UIButton = {
        let button = UIButton()
		button.setTitle(UIConstants.firstButtonText.localized, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .systemGray5
		button.layer.cornerRadius = UIConstants.cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToSelectViewController), for: .touchUpInside)
        return button
    }()

    private lazy var secondButton: UIButton = {
        let button = UIButton()
		button.setTitle(UIConstants.secondButtonText.localized, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .systemGray5
		button.layer.cornerRadius = UIConstants.cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToTrainViewController), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
       configureUI()
    }

    // MARK: - Private methods

    @objc
    private func goToSelectViewController() {
        navigationController?.pushViewController(SelectVerbsViewController(), animated: true)
    }

    @objc
    private func goToTrainViewController() {
        navigationController?.pushViewController(TrainViewController(), animated: true)
    }

    private func configureUI() {
        view.addSubview(titleLabel)
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.backgroundColor = .white
        setUpConstrains()
    }
    
    private func setUpConstrains() {
        firstButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		firstButton.heightAnchor.constraint(equalToConstant: UIConstants.buttonHeight).isActive = true
        firstButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: firstButton.topAnchor, constant: -80).isActive = true
        secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 40).isActive = true
        secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		secondButton.heightAnchor.constraint(equalToConstant: UIConstants.buttonHeight).isActive = true
        secondButton.widthAnchor.constraint(equalTo: firstButton.widthAnchor).isActive = true
    }
}
