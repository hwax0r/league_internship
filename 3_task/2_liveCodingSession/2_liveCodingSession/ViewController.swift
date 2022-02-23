//
//  ViewController.swift
//  2_liveCodingSession
//
//  Created by David Sergeev on 23.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var emailCardView: EmailCardView = {
        let view = EmailCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var nameCardView: NameCardView = {
        let view = NameCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
        
    }
}

extension ViewController {
    private func configureView() {
        self.view.backgroundColor = .systemBackground
        
        view.addSubview(emailCardView)
        view.addSubview(nameCardView)
        
        NSLayoutConstraint.activate([
            emailCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            emailCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailCardView.bottomAnchor.constraint(equalTo: emailCardView.topAnchor, constant: 200),
            
            nameCardView.topAnchor.constraint(equalTo: emailCardView.bottomAnchor, constant: 20),
            nameCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameCardView.bottomAnchor.constraint(equalTo: nameCardView.topAnchor, constant: 200)
        ])
    }
}

class cardView: UIView{
    var textField: UITextField
    var validationButton: UIButton
    var validationStatusLabel: UILabel
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textFieldPlaceholder: String) {
        textField = UITextField()
        validationButton = UIButton()
        validationStatusLabel = UILabel()
        super.init(frame: .zero)
        
        setupView()
        setupTextField(placeholder: textFieldPlaceholder)
        setupValidationButton()
        setupValidationStatusLabel()
        setupInnerConstraints()
    }
    
    func setupView(){
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 12
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(textField)
        self.addSubview(validationButton)
        self.addSubview(validationStatusLabel)
    }
    
    func setupTextField(placeholder: String) {
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupValidationButton() {
        validationButton.setTitle("Валидировать", for: .normal)
        validationButton.setTitle("ДАВАЙ, ЖМИ ЕЩË", for: .highlighted)
        validationButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        validationButton.backgroundColor = .blue
        validationButton.setTitleColor(.white, for: .normal)
        validationButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupValidationStatusLabel() {
        validationStatusLabel.text = "Ожидание валидации..."
        validationStatusLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupInnerConstraints(){
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            validationButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            validationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            validationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            validationStatusLabel.topAnchor.constraint(equalTo: validationButton.bottomAnchor, constant: 20),
            validationStatusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            validationStatusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            validationStatusLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
        ])
    }
}

class EmailCardView: cardView {
    convenience init() {
        self.init(textFieldPlaceholder: "Введите email...")
    }
    override func setupValidationButton() {
        super.setupValidationButton()
        validationButton.addTarget(self, action: #selector(emailValidation), for: .touchUpInside)
    }
    
    @objc private func emailValidation() {
        let regExString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: textField.text)
        
        validationStatusLabel.text = isValid ? "Валидация прошла успешно" : "Валидация не прошла"
        validationStatusLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}

class NameCardView: cardView {
    convenience init(){
        self.init(textFieldPlaceholder: "Введите имя и фамилию...")
    }
    override func setupValidationButton() {
        super.setupValidationButton()
        validationButton.addTarget(self, action: #selector(nameValidation), for: .touchUpInside)
    }
    
    @objc private func nameValidation() {
        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: textField.text)
        
        validationStatusLabel.text = isValid ? "Валидация прошла успешно" : "Валидация не прошла"
        validationStatusLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}
