//
//  ManualLayoutViewController.swift
//  1_UITabViewController
//
//  Created by David Sergeev on 20.03.2022.
//

import UIKit

final class ManualLayoutViewController: UIViewController {
  private let data: [CourseDescriptionModel]
  private let scrollView: UIScrollView

  private let firstCell: ManualLayoutCellView
  private let secondCell: ManualLayoutCellView
  private let thirdCell: ManualLayoutCellView
  private let fourthCell: ManualLayoutCellView

  init(data: [CourseDescriptionModel]) {
    self.data = data
    scrollView = UIScrollView()

    firstCell = ManualLayoutCellView(data: data[0], width: UIScreen.main.bounds.width)
    secondCell = ManualLayoutCellView(data: data[1], width: UIScreen.main.bounds.width)
    thirdCell = ManualLayoutCellView(data: data[2], width: UIScreen.main.bounds.width)
    fourthCell = ManualLayoutCellView(data: data[3], width: UIScreen.main.bounds.width)

    super.init(nibName: nil, bundle: nil)
    configureView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = scrollView
    scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width,
                                    height: 1000.0)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Manual layout"
    navigationItem.largeTitleDisplayMode = .never
    
  }

  override func viewWillLayoutSubviews() {
    firstCell.frame = CGRect(x: 0,
                             y: 0,
                             width: UIScreen.main.bounds.width,
                             height: 190.0)

    firstCell.configureView()
  }

}

// MARK: - Private methods
extension ManualLayoutViewController {
  private func configureView() {
    view.addSubview(firstCell)
  }
}
