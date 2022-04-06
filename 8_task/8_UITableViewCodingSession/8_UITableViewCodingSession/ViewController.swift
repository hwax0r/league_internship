//
//  ViewController.swift
//  8_UITableViewCodingSession
//
//  Created by David Sergeev on 15.03.2022.
//

import UIKit

class ViewController: UIViewController {
  private var teams = [
    TeamModel(name: "GONZAGA BULLDOGS",
              teamMembers: [
                TeamMemberModel(name: "Timme",
                                surname: "D."),
                TeamMemberModel(name: "Holmgren",
                                surname: "C."),
                TeamMemberModel(name: "Strawther",
                                surname: "J."),
                TeamMemberModel(name: "Nembhard",
                                surname: "A."),
              ]),
    TeamModel(name: "ARIZONA WILDCATS",
              teamMembers: [
                TeamMemberModel(name: "Mathurin",
                                surname: "B."),
                TeamMemberModel(name: "Tubelis",
                                surname: "A."),
                TeamMemberModel(name: "Koloko",
                                surname: "C."),
                TeamMemberModel(name: "Kriisa",
                                surname: "K."),
              ]),
    TeamModel(name: "KANSAS JAYHAWKS",
              teamMembers: [
                TeamMemberModel(name: "Agbaji",
                                surname: "O."),
                TeamMemberModel(name: "Braun",
                                surname: "C."),
                TeamMemberModel(name: "Wilson",
                                surname: "J."),
                TeamMemberModel(name: "McCormack",
                                surname: "D."),
              ]),
    TeamModel(name: "BAYLOR BEARS",
              teamMembers: [
                TeamMemberModel(name: "Cryer",
                                surname: "L."),
                TeamMemberModel(name: "Akinjo",
                                surname: "J."),
                TeamMemberModel(name: "Flagler",
                                surname: "A."),
                TeamMemberModel(name: "Brown",
                                surname: "K."),
              ]),
  ]
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TeamMember")
    tableView.dataSource = self
    tableView.delegate = self
    return tableView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    configureView()
    setNavigationBarItems()
  }

}

// MARK: - Private methods
extension ViewController {
  private func configureView() {
    title = "Leaderboard"
    view.backgroundColor = .white
    
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
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    teams[section].teamMembers.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TeamMember", for: indexPath)
    let teamMember = teams[indexPath.section].teamMembers[indexPath.row]
    cell.textLabel?.text = "\(teamMember.surname) \(teamMember.name)"
    return cell
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    teams.count
  }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    teams[section].name
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      teams[indexPath.section].teamMembers.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
    print(String(describing: teams))
  }

  func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    true
  }

  func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    let memeberChangingTeam = teams[sourceIndexPath.section].teamMembers[sourceIndexPath.row]
    teams[destinationIndexPath.section].teamMembers.insert(memeberChangingTeam, at: destinationIndexPath.row)
    teams[sourceIndexPath.section].teamMembers.remove(at: sourceIndexPath.row)
    print(String(describing: teams))
  }
}

// MARK: - Navigation Bar Items & Button Actions
extension ViewController {
  private func setNavigationBarItems() {
    let addTeamMemberButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTeamMemberAction))
    addTeamMemberButton.setTitleTextAttributes([.foregroundColor: UIColor.red], for: .normal)
    navigationItem.leftBarButtonItem = addTeamMemberButton

    let editTableView = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editTableViewAction))
    editTableView.setTitleTextAttributes([.foregroundColor: UIColor.red], for: .normal)
    navigationItem.rightBarButtonItem = editTableView
  }

  @objc func addTeamMemberAction() {
    let alertController = UIAlertController(title: "Add new team member",
                                            message: "Creates new team if not exists",
                                            preferredStyle: .alert)
    alertController.addTextField(configurationHandler: { (textField: UITextField!) -> Void in
      textField.placeholder = "Название команды"
    })
    alertController.addTextField(configurationHandler: { (textField: UITextField!) -> Void in
      textField.placeholder = "Имя игрока"
    })
    alertController.addTextField(configurationHandler: { (textField: UITextField!) -> Void in
      textField.placeholder = "Фамилия игрока"
    })

    let saveAction = UIAlertAction(title: "Save", style: .default, handler: { [weak self] alert -> Void in
      let teamNameTextField = alertController.textFields![0] as UITextField
      let nameTextField = alertController.textFields![1] as UITextField
      let surnameTextField = alertController.textFields![2] as UITextField

      guard let teamName = teamNameTextField.text,
            let name = nameTextField.text,
            let surname = surnameTextField.text,
            let teams = self?.teams else { return }
      for teamIndex in Range(0...(teams.count-1)) {
        if teams[teamIndex].name == teamName {
          teams[teamIndex].teamMembers.append(
            TeamMemberModel(name: name,
                            surname: surname
                           ))
        }
      }
      self!.teams.append(TeamModel(name: teamName, teamMembers: [TeamMemberModel(name: name, surname: surname)]))
      self!.tableView.reloadData()
    })
    let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)

    alertController.addAction(cancelAction)
    alertController.addAction(saveAction)
    self.present(alertController, animated: true, completion: {
      self.tableView.reloadData()
    })
  }

  @objc func editTableViewAction() {
    if tableView.isEditing {
      tableView.isEditing = false
    } else {
      tableView.isEditing = true
    }
  }
}

