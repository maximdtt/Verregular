//
//  TrainViewController.swift
//  VerbMemoryGame
//
//  Created by Maksims Šalajevs on 24/05/2024.
//

import UIKit
import SnapKit

final class TrainViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        label.text = "Score: \(counter)"
        
        return label
    }()
    
    private lazy var infinitiveLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Foo".uppercased()
        
        return label
    }()
    
    private lazy var pastSimpleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Past Simple"
        
        return label
    }()
    
    private lazy var participleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Past Participle"
        
        return label
    }()
    
    private lazy var pastSimpleTextField: UITextField = {
        let field = UITextField()
        
        field.borderStyle = .roundedRect
        field.delegate = self
        
        return field
    }()
    
    private lazy var participleTextField: UITextField = {
        let field = UITextField()
        
        field.borderStyle = .roundedRect
        field.delegate = self
        
        return field
    }()
    
    private lazy var checkButton: UIButton = {
        let button = UIButton()
        
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray5
        button.setTitle("Check".localized, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        
        button.addTarget(self, action: #selector(checkAction), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Properties
    
    private var counter = 0
    private let edgeInsets = 30
    private var dataSource = IrregularVerbs.shared.selectedVerbs
    private var currentVerb: Verb? {
        guard dataSource.count > count else { return nil }
        return dataSource[count]
    }
    
    private var count = 0 {
        didSet {
            infinitiveLabel.text = currentVerb?.infinitive
            pastSimpleTextField.text = ""
            participleTextField.text = ""
            checkButton.backgroundColor = .systemGray5
            checkButton.setTitle("Check".localized, for: .normal)
        }
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Train verbs".localized
        setUpUI()
        registerForKeyboardNotification()
        unregisterForKeyboardNotification()
        hideKeyboardWhenTappedAround()
        
        infinitiveLabel.text = dataSource.first?.infinitive
        
    }
    
    // MARK: - Private methods
    
    @objc
    private func checkAction() {
        if checkAnswers() {
            counter += 1
            counterLabel.text = "Score: \(counter)"
            count += 1
            
        } else {
            checkButton.backgroundColor = .red
            checkButton.setTitle("Try again".localized, for: .normal)
        }
    }
    //currentVerb?.infinitive == dataSource.last?.infinitive
    
    private func checkAnswers() -> Bool {
        
        pastSimpleTextField.text?.lowercased() == currentVerb?.pastSimple.lowercased() && participleTextField.text?.lowercased() == currentVerb?.participle.lowercased()
    }
    
    private func finalAlert() {
        
        let alert = UIAlertController(title: "Game over", message: "Your score is \(counter)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Thanks", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    private func setUpUI() {
        view.backgroundColor = .white
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews([infinitiveLabel, pastSimpleLabel, pastSimpleTextField, participleLabel, participleTextField, checkButton, counterLabel])
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.size.edges.equalToSuperview()
        }
        
        infinitiveLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        counterLabel.snp.makeConstraints { make in
            make.bottom.equalTo(infinitiveLabel.snp.top).offset(-45)
            make.trailing.equalToSuperview().inset(45)
        }
        
        pastSimpleLabel.snp.makeConstraints { make in
            make.top.equalTo(infinitiveLabel.snp.bottom).offset(60)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        pastSimpleTextField.snp.makeConstraints { make in
            make.top.equalTo(pastSimpleLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        participleLabel.snp.makeConstraints { make in
            make.top.equalTo(pastSimpleTextField.snp.bottom).offset(20)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        participleTextField .snp.makeConstraints { make in
            make.top.equalTo(participleLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(participleTextField.snp.bottom).offset(100)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
    }
}

 // MARK: - UITextFieldDelegate

extension TrainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if pastSimpleTextField.isFirstResponder {
            participleTextField.becomeFirstResponder()
        } else {
            scrollView.endEditing(true)
        }
        return true
    }
    
}


// MARK: - Keyboard events

private extension TrainViewController {
    func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    }
    
    func unregisterForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, 
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func keyboardWillShow(_ notification: Notification) {
        guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?
                CGRect else { return }
        
        scrollView.contentInset.bottom = frame.height + 50
    }
    
    @objc
    func keyboardWillHide() {
        scrollView.contentInset.bottom = .zero - 50
    }
    
    func hideKeyboardWhenTappedAround() {
        let recognizer = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(recognizer)
    }
    
    @objc
    func hideKeyboard() {
        scrollView.endEditing(true)
    }
    
}
