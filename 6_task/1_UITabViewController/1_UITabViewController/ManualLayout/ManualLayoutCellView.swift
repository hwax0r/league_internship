//
//  ManualLayoutCellView.swift
//  1_UITabViewController
//
//  Created by David Sergeev on 20.03.2022.
//

import UIKit

final class ManualLayoutCellView: UIView {
  let screenWidth: CGFloat
  private(set) var cellHeight: CGFloat = 0
  private let data: CourseDescriptionModel

  private let promoLabelWrapperView: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 12
    view.layer.borderWidth = 1.0
    view.layer.borderColor = UIColor(red: 181/255, green: 181/255, blue: 185/255, alpha: 1.0).cgColor
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private let promoLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 13, weight: .regular)
    label.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0)
    label.numberOfLines = 1
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let nameLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 17, weight: .regular)
    label.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let detailedViewButton: UIButton = {
    let button = UIButton()
    button.setTitle("Подробнее", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
    button.setTitleColor(UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  private let priceLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 17, weight: .bold)
    label.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let addToCartButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor(red: 18/255, green: 139/255, blue: 227/255, alpha: 1.0)
    button.setImage(UIImage(systemName: "plus"), for: .normal)
    button.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    button.contentMode = .center
    button.imageView?.contentMode = .scaleAspectFit
    button.layer.cornerRadius = 4
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  private let cellWrapperView: UIView = {
    let view = UIView()
    view.layer.borderWidth = 1.0
    view.layer.borderColor = UIColor(red: 223/255, green: 222/255, blue: 226/255, alpha: 1.0).cgColor
    view.layer.cornerRadius = 12
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  init(data: CourseDescriptionModel, width: CGFloat) {
    self.screenWidth = width
    self.data = data
    promoLabel.text = self.data.promo
    nameLabel.text = self.data.name
    priceLabel.text = self.data.priceFormattedString()
    super.init(frame: .zero)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension ManualLayoutCellView {
  func configureView() {
    self.backgroundColor = .clear
    self.isOpaque = true
    self.translatesAutoresizingMaskIntoConstraints = false

    self.addSubview(cellWrapperView)

    cellWrapperView.addSubview(detailedViewButton)
    cellWrapperView.addSubview(priceLabel)
    cellWrapperView.addSubview(addToCartButton)

    var topOffset: CGFloat = 20
    if let promoText = data.promo {
      cellWrapperView.addSubview(promoLabelWrapperView)
      cellWrapperView.addSubview(nameLabel)

      promoLabelWrapperView.addSubview(promoLabel)

      let promoLabelWrapperViewWidth = UIScreen.main.bounds.width - 20 - 20 - 16 - 16
      let promoLabelWrapperViewHeight = promoText.height(withWidth: screenWidth, font: .systemFont(ofSize: 13)) + 4 + 4

      promoLabelWrapperView.frame = CGRect(x: 20,
                                           y: topOffset,
                                           width: promoLabelWrapperViewWidth,
                                           height: promoLabelWrapperViewHeight)

      let promoLabelWidth = promoLabelWrapperView.frame.width - 12 - 12
      let promoLabelHeight = promoText.height(withWidth: screenWidth, font: .systemFont(ofSize: 13))
      promoLabel.frame = CGRect(x: 12,
                                y: 4,
                                width: promoLabelWidth,
                                height: promoLabelHeight)
      topOffset += promoLabelWrapperView.frame.maxY + 12
    }

    let nameLabelWidth = UIScreen.main.bounds.width - 20 - 20
    let nameLabelHeight = data.name.height(withWidth: screenWidth, font: .systemFont(ofSize: 17, weight: .regular))
    nameLabel.frame = CGRect(x: 20,
                             y: topOffset,
                             width: nameLabelWidth,
                             height: nameLabelHeight)

    let detailedViewButtonWidth: CGFloat = 80
    let detailedViewButtonHeight = "Подробнее".height(withWidth: screenWidth, font: .systemFont(ofSize: 14, weight: .semibold))
    detailedViewButton.frame = CGRect(x: 20,
                                      y: nameLabel.frame.maxY + 4.0,
                                      width: detailedViewButtonWidth,
                                      height: detailedViewButtonHeight)

    let priceLabelWidth = UIScreen.main.bounds.width - 20 - 20 - 20 - 72
    let priceLabelHeight = priceLabel.text!.height(withWidth: screenWidth, font: .systemFont(ofSize: 17, weight: .bold))
    priceLabel.frame = CGRect(x: 20,
                              y: detailedViewButton.frame.maxY + 23.0,
                              width: priceLabelWidth,
                              height: priceLabelHeight)

    addToCartButton.frame = CGRect(x: UIScreen.main.bounds.width - 20 - 72,
                                   y: detailedViewButton.frame.maxY + 16.0,
                                   width: 72,
                                   height: 36)

    cellHeight = addToCartButton.frame.maxY + 20

    cellWrapperView.frame = CGRect(x: 16,
                                   y: 16,
                                   width: screenWidth - 16 - 16,
                                   height: cellHeight)
  }
}
