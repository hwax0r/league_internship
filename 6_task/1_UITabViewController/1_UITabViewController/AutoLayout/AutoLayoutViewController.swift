//
//  AutoLayoutViewController.swift
//  1_UITabViewController
//
//  Created by David Sergeev on 15.03.2022.
//

import UIKit

final class AutoLayoutViewController: UIViewController {
  private let cellReuseId = "ALCourseCell"
  private let data: [CourseDescriptionModel]
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.dataSource = self
    tableView.separatorStyle = .none
    tableView.estimatedRowHeight = 180
    tableView.rowHeight = UITableView.automaticDimension
    tableView.register(ALCourseCell.self, forCellReuseIdentifier: cellReuseId)
    return tableView
  }()

  init(data: [CourseDescriptionModel]) {
    self.data = data
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Auto layout"
    navigationItem.largeTitleDisplayMode = .never
    
    configureView()
  }
}

// MARK: - Private methods
extension AutoLayoutViewController {
  private func configureView() {
    let navigationBarView = NavigationBarView(frame: CGRect(x: 16,
                                                            y: 0,
                                                            width: UIScreen.main.bounds.width,
                                                            height: 44.0))
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationBarView)
    
    view.addSubview(tableView)

    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
}

// MARK: - UITableViewDataSource
extension AutoLayoutViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: cellReuseId,
      for: indexPath
    ) as? ALCourseCell else { return UITableViewCell() }
    let model = data[indexPath.row]
    cell.configureCell(courseDescription: model)
    
    cell.detailedViewButtonTaped = {
      let alertController = UIAlertController(title: "Detailed view",
                                              message: "Not implemented",
                                              preferredStyle: .alert)
      let alertAction = UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil)
      alertController.addAction(alertAction)
      self.present(alertController, animated: true)
    }

    cell.addToCartButtonTaped = {
      let alertController = UIAlertController(title: "Add to cart",
                                              message: "Not implemented",
                                              preferredStyle: .alert)
      let alertAction = UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil)
      alertController.addAction(alertAction)
      self.present(alertController, animated: true)
    }
    return cell
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    data.count
  }
}
