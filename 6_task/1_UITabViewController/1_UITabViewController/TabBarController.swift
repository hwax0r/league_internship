//
//  TabBarController.swift
//  1_UITabViewController
//
//  Created by David Sergeev on 09.03.2022.
//

import UIKit

class TabBarController: UITabBarController {
  private var autoLayoutController: AutoLayoutNavigationController
  private var xibController = XIBController()
  private var manualLayoutNavigationController: ManualLayoutNavigationController
  private var navigationController1 = NavigationController()
  private var largeNavigationController = LargeNavigationController()
  
  private var models: [CourseDescriptionModel] = [
    CourseDescriptionModel(promo: "Первые три занятия бесплатно",
                           name: "Backend разработка",
                           price: 7840,
                           currency: .rub,
                           durationInMonths: 39,
                           overview: "Здесь много подробностей"),
    CourseDescriptionModel(promo: "1.02.2022 - 1.04.2022 Скидка 10% ",
                           name: "Курсы по Android разработке",
                           price: 9800,
                           currency: .rub,
                           durationInMonths: 12,
                           overview: "Здесь много подробностей"),
    CourseDescriptionModel(promo: nil,
                           name: "Курсы по iOS разработке + Computer Science + Computer Vision + System Design",
                           price: 100,
                           currency: .usd,
                           durationInMonths: 324,
                           overview: "Здесь много подробностей"),
    CourseDescriptionModel(promo: "Текст промо. Ну очень длинный текст промо. Настолько большое промо, что пиар директор плачет, когда смотрит сюда.",
                           name: "Тут должно быть очень очень очень больщое название. Что-то мне не хватает длины, надо написать ещё текста.",
                           price: 324243,
                           currency: .usd,
                           durationInMonths: 123,
                           overview: "Здесь много подробностей"),
  ]

  init() {
    autoLayoutController = AutoLayoutNavigationController(rootViewController: AutoLayoutViewController(data: models))
    manualLayoutNavigationController = ManualLayoutNavigationController(rootViewController: ManualLayoutViewController(data: models))

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    configureTabBarController()
  }
}

// MARK: - Private methods
extension TabBarController {
  private func configureTabBarController() {
    view.backgroundColor = .systemBackground
    tabBar.tintColor = .label
    tabBar.barTintColor = .black
    tabBar.backgroundColor = .systemPink

    viewControllers = [
      autoLayoutController,
      xibController,
      manualLayoutNavigationController,
      navigationController1,
      largeNavigationController,
    ]
  }

}

// MARK: - Change style after orentation change
extension TabBarController {
  override func willTransition(to newCollection: UITraitCollection,
                               with coordinator: UIViewControllerTransitionCoordinator){
    lazy var protraitTabBarItemImages: [UIImage] = [
      UIImage(systemName: "heart")!,
      UIImage(systemName: "trash.circle")!,
      UIImage(systemName: "eye.trianglebadge.exclamationmark")!,
      UIImage(systemName: "hand.thumbsup")!,
      UIImage(systemName: "logo.xbox")!,
    ]
    lazy var landscapeTabBarItemImages: [UIImage] = [
      UIImage(systemName: "flame")!,
      UIImage(systemName: "nosign")!,
      UIImage(systemName: "brain.head.profile")!,
      UIImage(systemName: "gear")!,
      UIImage(systemName: "crown")!,
    ]

    guard let viewControllers = viewControllers else {
      return
    }

    if UIDevice.current.orientation.isLandscape {
      for (viewController, image) in zip(viewControllers, landscapeTabBarItemImages) {
        viewController.tabBarItem.image = image
        tabBar.backgroundColor = .systemMint
      }
    } else {
      for (viewController, image) in zip(viewControllers, protraitTabBarItemImages) {
        viewController.tabBarItem.image = image
        tabBar.backgroundColor = .systemPink
      }
    }
  }

}
