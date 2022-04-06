//
//  NavigationBarView.swift
//  1_UITabViewController
//
//  Created by David Sergeev on 14.03.2022.
//

import UIKit

final class NavigationBarView: UIView {
  private var image: UIImage
  private let imageView: UIImageView
  private let barTitle: UILabel

  override init(frame: CGRect) {
    image = UIImage(named: "computerIcon")!
    imageView = UIImageView(image: image)
    barTitle = UILabel()

    super.init(frame: frame)

    backgroundColor = .clear
    configureView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private methods
extension NavigationBarView {
  private func configureView() {
    image = image.withRenderingMode(.alwaysOriginal)
    barTitle.text = "Курсы IT"
    barTitle.font = UIFont.systemFont(ofSize: 17, weight: .medium)

    imageView.frame = CGRect(x: 0,
                             y: 0,
                             width: 40,
                             height: 40)
    barTitle.frame = CGRect(x: imageView.frame.width + 12.0,
                            y: 9,
                            width: UIScreen.main.bounds.width - imageView.frame.width - 12.0,
                            height: 22)
    addSubview(imageView)
    addSubview(barTitle)
  }
}
