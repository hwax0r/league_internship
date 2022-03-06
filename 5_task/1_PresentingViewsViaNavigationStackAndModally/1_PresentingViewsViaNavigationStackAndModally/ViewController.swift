//
//  ViewController.swift
//  1_PresentingViewsViaNavigationStackAndModally
//
//  Created by David Sergeev on 02.03.2022.
//

import UIKit

final class ViewController: UIViewController {
//  private var emailValidationButton: UIButton = {
//    let button = UIButton()
//    button.setTitle("Email validation", for: .normal)
//    button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
//    button.setTitleColor(.black, for: .normal)
//    button.layer.cornerRadius = 4
//    button.backgroundColor = .gray
//    button.addTarget(self, action: #selector(testButtonAction), for: .touchUpInside)
//    button.translatesAutoresizingMaskIntoConstraints = false
//    return button
//  }()
  private var emailValidationButton = ButtonWithoutAction(titleForNormal: "Email validation")
  private var nameValidationButton = ButtonWithoutAction(titleForNormal: "Name validation")
  private lazy var emailValidationViewController = EmailValidationViewController()
  private lazy var nameValidationViewController = NameValidationViewController()
  let backgroundBottomYellowColor: CGColor = UIColor(red: 255.0/255.0,
                                                     green: 154.0/255.0,
                                                     blue: 47.0/255.0,
                                                     alpha: 1.0).cgColor
  let backgroundTopBlueColor: CGColor = UIColor(red: 47.0/255.0,
                                                green: 148.0/255.0,
                                                blue: 255.0/255.0,
                                                alpha: 1.0).cgColor

  override func loadView() {
    super.loadView()
  }

  override func viewWillAppear(_ animated: Bool) {
    setGradientBackground(colorTop: backgroundTopBlueColor, colorBottom: backgroundBottomYellowColor)
    navigationController?.navigationBar.prefersLargeTitles = true
    super.viewWillAppear(animated)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureNavigationBar()
    test()
  }

}

// MARK: - Private methods
extension ViewController {
  private func configureNavigationBar(){
    self.title = "Transition to: "
  }

  private func test() {
    emailValidationButton.addTarget(self, action: #selector(pushEmailValidationViewControllerSelector), for: .touchUpInside)
    nameValidationButton.addTarget(self, action: #selector(modallyOpenNameValidationViewControllerSelector), for: .touchUpInside)

    view.addSubview(emailValidationButton)
    view.addSubview(nameValidationButton)

    NSLayoutConstraint.activate([
      emailValidationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45),
      emailValidationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      emailValidationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

      nameValidationButton.topAnchor.constraint(equalTo: emailValidationButton.bottomAnchor, constant: 20),
      nameValidationButton.leadingAnchor.constraint(equalTo: emailValidationButton.leadingAnchor),
      nameValidationButton.trailingAnchor.constraint(equalTo: emailValidationButton.trailingAnchor),
    ])

  }

  @objc func pushEmailValidationViewControllerSelector() {
    navigationController?.pushViewController(emailValidationViewController, animated: true)
  }

  @objc func modallyOpenNameValidationViewControllerSelector() {
    self.present(nameValidationViewController, animated: true, completion: nil)
  }

  private func setGradientBackground(colorTop: CGColor, colorBottom: CGColor) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [colorTop, colorBottom]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.frame = self.view.bounds

    view.layer.insertSublayer(gradientLayer, at: 0)
  }
}
