//
//  EmailValidationViewController.swift
//  1_PresentingViewsViaNavigationStackAndModally
//
//  Created by David Sergeev on 02.03.2022.
//

import UIKit


final class EmailValidationViewController: UIViewController {
  private lazy var emailValidationCardView = EmailValidationCardView()
  private let mainView = UIView()

  private let gradient: CAGradientLayer = CAGradientLayer()
  private var gradientColorSet: [[CGColor]] = []
  private var colorIndex: Int = 0
  private let yellowColor: CGColor = UIColor(red: 255.0/255.0,
                                     green: 236.0/255.0,
                                     blue: 24.0/255.0,
                                     alpha: 1.0).cgColor
  private let purpleColor: CGColor = UIColor(red: 120.0/255.0,
                                     green: 24.0/255.0,
                                     blue: 255.0/255.0,
                                     alpha: 1.0).cgColor
  private let lightBlueColor: CGColor = UIColor(red: 154.0/255.0,
                                        green: 159.0/255.0,
                                        blue: 255.0/255.0,
                                        alpha: 1.0).cgColor

  override func loadView() {
    view = mainView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.largeTitleDisplayMode = .never
    
    navigationBarTitleTransition()
    configureView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    setupBackgroundGradient()
    animateBackgroundGradient()
  }
}

// MARK: - Private methods
extension EmailValidationViewController {

  private func configureView() {
    view.addSubview(emailValidationCardView)

    NSLayoutConstraint.activate([
      emailValidationCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
      emailValidationCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      emailValidationCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
    ])
  }

}

// MARK: - Navigation item transition
extension EmailValidationViewController {

  private func navigationBarTitleTransition() {
    let titleAnimation = CATransition()
    titleAnimation.duration = 0.5
    titleAnimation.type = CATransitionType.push
    titleAnimation.subtype = CATransitionSubtype.fromRight
    titleAnimation.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeInEaseOut)

    if let subviews = parent?.navigationController?.navigationBar.subviews {
      for navigationItem in subviews {
        for itemSubView in navigationItem.subviews {
          if let largeLabel = itemSubView as? UILabel {
            largeLabel.layer.add(titleAnimation, forKey: "changeTitle")
          }
        }
      }
    }
    navigationItem.title = "EmailCard"
  }

}

// MARK: - Background gradient color animation
extension EmailValidationViewController: CAAnimationDelegate {

  func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    if flag {
      animateBackgroundGradient()
    }
  }

  private func setupBackgroundGradient(){
    gradientColorSet = [
      [yellowColor, purpleColor],
      [purpleColor, lightBlueColor],
      [lightBlueColor, yellowColor],
    ]
    gradient.frame = self.view.bounds
    gradient.colors = gradientColorSet[colorIndex]

    self.view.layer.insertSublayer(gradient, at: 0)
  }

  private func animateBackgroundGradient() {
    gradient.colors = gradientColorSet[colorIndex]

    let gradientAnimation = CABasicAnimation(keyPath: "colors")
    gradientAnimation.delegate = self
    gradientAnimation.duration = 3.0

    updateColorIndex()
    gradientAnimation.toValue = gradientColorSet[colorIndex]

    gradientAnimation.fillMode = .forwards
    gradientAnimation.isRemovedOnCompletion = false

    gradient.add(gradientAnimation, forKey: "colors")
  }

  private func updateColorIndex(){
    if colorIndex < gradientColorSet.count - 1 {
      colorIndex += 1
    } else {
      colorIndex = 0
    }
  }

}
