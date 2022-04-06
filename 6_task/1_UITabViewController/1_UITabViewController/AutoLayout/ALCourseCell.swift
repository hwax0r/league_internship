//
//  ALCourseCell.swift
//  1_UITabViewController
//
//  Created by David Sergeev on 14.03.2022.
//

import UIKit

final class ALCourseCell: UITableViewCell {
  var detailedViewButtonTaped: (() -> ()) = {}
  var addToCartButtonTaped: (() -> ()) = {}

  private let promoLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 13, weight: .regular)
    label.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0)
    label.numberOfLines = 1
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let promoLabelWrapperView: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 12
    view.layer.borderWidth = 1.0
    view.layer.borderColor = UIColor(red: 181/255, green: 181/255, blue: 185/255, alpha: 1.0).cgColor
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
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

  private let wrapperCellKostylView: UIView = {
    let view = UIView()
    view.layer.borderWidth = 1.0
    view.layer.borderColor = UIColor(red: 223/255, green: 222/255, blue: 226/255, alpha: 1.0).cgColor
    view.layer.cornerRadius = 12
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    selectionStyle = .none
    initCell()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configureCell(courseDescription: CourseDescriptionModel) {
    promoLabel.text = courseDescription.promo
    nameLabel.text = courseDescription.name
    priceLabel.text = courseDescription.priceFormattedString()

    guard promoLabel.text != nil else {
      NSLayoutConstraint.deactivate([
        promoLabel.topAnchor.constraint(equalTo: promoLabelWrapperView.topAnchor, constant: 4),
        promoLabel.leadingAnchor.constraint(equalTo: promoLabelWrapperView.leadingAnchor, constant: 12),
        promoLabel.trailingAnchor.constraint(lessThanOrEqualTo: promoLabelWrapperView.trailingAnchor, constant: -12),
        promoLabel.bottomAnchor.constraint(equalTo: promoLabelWrapperView.bottomAnchor, constant: -4),
        promoLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 13),

        promoLabelWrapperView.topAnchor.constraint(equalTo: wrapperCellKostylView.topAnchor, constant: 20),
        promoLabelWrapperView.leadingAnchor.constraint(equalTo: wrapperCellKostylView.leadingAnchor, constant: 20),
        promoLabelWrapperView.trailingAnchor.constraint(lessThanOrEqualTo: wrapperCellKostylView.trailingAnchor, constant: -20),
        promoLabelWrapperView.heightAnchor.constraint(lessThanOrEqualToConstant: 21),

        nameLabel.topAnchor.constraint(equalTo: promoLabelWrapperView.bottomAnchor, constant: 16),
      ])
      promoLabel.removeFromSuperview()
      promoLabelWrapperView.removeFromSuperview()

      NSLayoutConstraint.activate([
        nameLabel.topAnchor.constraint(equalTo: wrapperCellKostylView.topAnchor, constant: 20),
      ])
      
      return
    }
//    if promoLabel.text == nil {
//
//    }
  }
}

// MARK: - Private methods
extension ALCourseCell {
  private func initCell() {
    detailedViewButton.addTarget(self, action: #selector(detailedViewButtonAction), for: .touchUpInside)
    addToCartButton.addTarget(self, action: #selector(addToCartButtonAction), for: .touchUpInside)

    promoLabelWrapperView.addSubview(promoLabel)
    wrapperCellKostylView.addSubview(promoLabelWrapperView)
    wrapperCellKostylView.addSubview(nameLabel)
    wrapperCellKostylView.addSubview(detailedViewButton)
    wrapperCellKostylView.addSubview(priceLabel)
    wrapperCellKostylView.addSubview(addToCartButton)
    contentView.addSubview(wrapperCellKostylView)

    NSLayoutConstraint.activate([
      promoLabel.topAnchor.constraint(equalTo: promoLabelWrapperView.topAnchor, constant: 4),
      promoLabel.leadingAnchor.constraint(equalTo: promoLabelWrapperView.leadingAnchor, constant: 12),
      promoLabel.trailingAnchor.constraint(lessThanOrEqualTo: promoLabelWrapperView.trailingAnchor, constant: -12),
      promoLabel.bottomAnchor.constraint(equalTo: promoLabelWrapperView.bottomAnchor, constant: -4),
      promoLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 13),

      promoLabelWrapperView.topAnchor.constraint(equalTo: wrapperCellKostylView.topAnchor, constant: 20),
      promoLabelWrapperView.leadingAnchor.constraint(equalTo: wrapperCellKostylView.leadingAnchor, constant: 20),
      // TODO: BUG - Always wide promoLabelWrapper!
      promoLabelWrapperView.trailingAnchor.constraint(lessThanOrEqualTo: wrapperCellKostylView.trailingAnchor, constant: -20),
      promoLabelWrapperView.heightAnchor.constraint(lessThanOrEqualToConstant: 21),

      nameLabel.topAnchor.constraint(equalTo: promoLabelWrapperView.bottomAnchor, constant: 16),
      nameLabel.leadingAnchor.constraint(equalTo: wrapperCellKostylView.leadingAnchor, constant: 20),
      nameLabel.trailingAnchor.constraint(equalTo: wrapperCellKostylView.trailingAnchor, constant: -20),

      detailedViewButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
      detailedViewButton.leadingAnchor.constraint(equalTo: wrapperCellKostylView.leadingAnchor, constant: 20),
      detailedViewButton.heightAnchor.constraint(equalToConstant: 20),

      priceLabel.topAnchor.constraint(equalTo: detailedViewButton.bottomAnchor, constant: 23),
      priceLabel.leadingAnchor.constraint(equalTo: wrapperCellKostylView.leadingAnchor, constant: 20),
      priceLabel.bottomAnchor.constraint(equalTo: wrapperCellKostylView.bottomAnchor, constant: -27),

      addToCartButton.topAnchor.constraint(equalTo: detailedViewButton.bottomAnchor, constant: 16),
      addToCartButton.trailingAnchor.constraint(equalTo: wrapperCellKostylView.trailingAnchor, constant: -20),
      addToCartButton.bottomAnchor.constraint(equalTo: wrapperCellKostylView.bottomAnchor, constant: -20),
      addToCartButton.widthAnchor.constraint(equalToConstant: 72),

      wrapperCellKostylView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      wrapperCellKostylView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      wrapperCellKostylView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      wrapperCellKostylView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
    ])
  }
}

// MARK: - Button actions
extension ALCourseCell {
  @objc func detailedViewButtonAction() {
    detailedViewButtonTaped()
  }

  @objc func addToCartButtonAction() {
    addToCartButtonTaped()
  }

}
