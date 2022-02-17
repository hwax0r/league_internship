protocol EducationalInstitutionProtocol: AnyObject {
    var name: String { get }
    var headManager: HeadManagerProtocol { get }
    var employees: [EmployeeProtocol] { get set }
    var groupes: [GroupProtocol] { get set }
    
    func newHead(is newHead: HeadManagerProtocol)
}

protocol GroupProtocol: AnyObject {
    var groupNumber: Int { get set }
    var groupLetter: Character { get }
    var groupHead: EmployeeProtocol? { get }
    var groupStudents: [StudentProtocol] { get }
    
    func setGroupHead(newHead: EmployeeProtocol)
    func addStudent(newbee: StudentProtocol)
    func kickStudent(culpable: StudentProtocol)
}

protocol HeadManagerProtocol: EmployeeProtocol {
    var institution: EducationalInstitutionProtocol? { get set }
    
    func hireSubordinate(newbee: EmployeeProtocol)
    func fireSubordinate(culpable: EmployeeProtocol)
    
    func addGroup(_ newGroup: GroupProtocol)
    func removeGroup(_ toBeRemoved: GroupProtocol)
    func changePosition(of employee: EmployeeProtocol, newPosition: String)
}

protocol EmployeeProtocol: PersonProtocol {
    var position: String { get set }
    var academicRank: String? { get set }
}

protocol StudentProtocol: PersonProtocol {
    var meanGrade: Float { get set }
}

protocol PersonProtocol: AnyObject {
    var name: String { get set }
    var surname: String { get set }
    
    func sayHi()
}

class EducationalInstitution: EducationalInstitutionProtocol {
    var name: String
    var headManager: HeadManagerProtocol
    var employees: [EmployeeProtocol]
    var groupes: [GroupProtocol]
    
    init(name: String, headManager: HeadManagerProtocol) {
        self.name = name
        self.headManager = headManager
        employees = []
        groupes = []
        
        print("EducationalInstitution instance \(name) was created")
    }
    
    deinit {
        print("EducationalInstitution instance \(name) was deinitialized")
    }
    
    func newHead(is newHead: HeadManagerProtocol) {
        headManager = newHead
    }
    
}

class HeadManager: HeadManagerProtocol {
    var name: String
    var surname: String
    var position: String
    var academicRank: String?
    weak var institution: EducationalInstitutionProtocol?
    
    init(name: String, surname: String, position: String, academicRank: String) {
        self.name = name
        self.surname = surname
        self.position = position
        self.academicRank = academicRank
        
        print("HeadManager instance \(name) \(surname) was created")
    }
    
    deinit {
        print("HeadManager instance \(name) \(surname) was deinitialized")
    }
    
    func sayHi() {
        print("\(name) \(surname) who is \(position) at \(institution?.name ?? "nowhere") says hi!")
    }
    
    func hireSubordinate(newbee: EmployeeProtocol) {
        institution?.employees.append(newbee)
    }
    func fireSubordinate(culpable: EmployeeProtocol) {
        guard let culpableIndex = institution?.employees.firstIndex(where: {
            $0.name == culpable.name &&
            $0.surname == culpable.surname &&
            $0.position == culpable.position
        }) else {
            return
        }
        institution!.employees.remove(at: culpableIndex)
    }
    
    func addGroup(_ newGroup: GroupProtocol) {
        institution?.groupes.append(newGroup)
    }
    func removeGroup(_ toBeRemoved: GroupProtocol) {
        guard let toBeRemovedIndex = institution?.groupes.firstIndex(where: {
            $0.groupLetter == toBeRemoved.groupLetter &&
            $0.groupNumber == toBeRemoved.groupNumber
        }) else {
            return
        }
        institution!.groupes.remove(at: toBeRemovedIndex)
    }
    
    func changePosition(of employee: EmployeeProtocol, newPosition: String) {
        employee.position = newPosition
    }
}

class Group: GroupProtocol {
    var groupNumber: Int
    var groupLetter: Character
    var groupHead: EmployeeProtocol?
    var groupStudents: [StudentProtocol]
    
    init(groupNumber: Int, groupLetter: Character){
        self.groupNumber = groupNumber
        self.groupLetter = groupLetter
        groupStudents = []
        
        print("Group instance \(groupNumber)\(groupLetter) was created")
    }
    
    deinit {
        print("Group instance \(groupNumber)\(groupLetter) was deinitialized")
    }
    
    func setGroupHead(newHead: EmployeeProtocol) {
        groupHead = newHead
    }
    
    func addStudent(newbee: StudentProtocol) {
        groupStudents.append(newbee)
    }
    func kickStudent(culpable: StudentProtocol) {
        guard let culpableIndex = groupStudents.firstIndex(where: {
            $0.name == culpable.name &&
            $0.surname == culpable.surname &&
            $0.meanGrade == culpable.meanGrade
        }) else {
            return
        }
        groupStudents.remove(at: culpableIndex)
    }
}

class Employee: EmployeeProtocol {
    var name: String
    var surname: String
    var position: String
    var academicRank: String?
    
    init(name: String, surname: String, position: String) {
        self.name = name
        self.surname = surname
        self.position = position
        
        print("Employee instance \(name) \(surname) was created")
    }
    
    deinit {
        print("Employee instance \(name) \(surname) was deinitialized")
    }
    
    func sayHi() {
        print("\(name) \(surname) who is \(position) says hi!")
    }
}

class Student: StudentProtocol {
    var name: String
    var surname: String
    var meanGrade: Float
    
    init(name: String, surname: String, meanGrade: Float) {
        self.name = name
        self.surname = surname
        self.meanGrade = meanGrade
        
        print("Student instance \(name) \(surname) was created")
    }
    
    deinit {
        print("Student instance \(name) \(surname) was deinitialized")
    }
    
    func sayHi() {
        print("Student \(name) \(surname) says hi!")
    }
}

do {
    let darthVader = HeadManager(name: "Darth",
                                 surname: "Vader",
                                 position: "CEO",
                                 academicRank: "Reichsführer")
    darthVader.sayHi()


    let doomedSchool = EducationalInstitution(name: "Doomed Jedi School",
                                              headManager: darthVader)
    darthVader.institution = doomedSchool


    let marieCurie = Employee(name: "Marie",
                              surname: "Curie",
                              position: "Lead Physicist")
    darthVader.hireSubordinate(newbee: marieCurie)
    marieCurie.sayHi()

    var physicistsGroup = Group(groupNumber: 1, groupLetter: "A")
    darthVader.addGroup(physicistsGroup)

    physicistsGroup.setGroupHead(newHead: marieCurie)


    let isaacNewton = Student(name: "Isaac",
                              surname: "Newton",
                              meanGrade: 3.25)
    let nielsBohr = Student(name: "Neils",
                            surname: "Bohr",
                            meanGrade: 4.32)
    let galileoGalilei = Student(name: "Galileo",
                                 surname: "Galilei",
                                 meanGrade: 4.01)
    let albertEinstein = Student(name: "Albert",
                                 surname: "Einstein",
                                 meanGrade: 3.86)
    let jamesMaxwell = Student(name: "James",
                               surname: "Maxwell",
                               meanGrade: 5.0)

    physicistsGroup.addStudent(newbee: isaacNewton)
    isaacNewton.sayHi()

    physicistsGroup.addStudent(newbee: nielsBohr)
    physicistsGroup.addStudent(newbee: galileoGalilei)
    physicistsGroup.addStudent(newbee: albertEinstein)
    physicistsGroup.addStudent(newbee: jamesMaxwell)
}

// Result output section
print("Seems like success")
