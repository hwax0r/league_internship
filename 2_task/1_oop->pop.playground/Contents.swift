import UIKit

// Задание №2 (необязательно)
// Добавьте Гильдию.
enum GuildType {
    case alliance
    case orc
    
    static func <(lhs: GuildType, rhs: GuildType) -> Bool {
        switch (lhs, rhs) {
        case(.alliance, .orc):
            return true
        default:
            return false
        }
    }
}

// Предлагаю использовать ульту(способность) героев в виде Enum
enum AttackType: String {
    case melee = "melee attack"
    case longRange  = "long range attack"
}

enum UltimateType: String {
    case keeperOfTheGrove = "Tranquility"
    // https://wowpedia.fandom.com/wiki/Keeper_of_the_Grove_(Warcraft_III)
    
    case lich = "Death And Decay"
    // https://wowpedia.fandom.com/wiki/Lich_(Warcraft_III)
    
    case random = "unknown technique"
}

protocol HeroStatisticsProtocol {
    var armor: Float { get set }
    var attackPower: Float { get set }
    var strength: Float { get set }
    var agility: Float { get set }
    var intelligence: Float { get set }
    var hitPoints: Float { get set }
    var mana: Float { get set }
    
    var guildType: GuildType { get set }
    var currentPosition: CGPoint { get set }
    var attackType: AttackType { get set }
    var ultimateAbility: UltimateType { get set }
}



protocol HeroProtocol: AnyObject {
    // migration HeroStatisticsProtocol -> HeroStatistics seems like non-POP programming
    // not really clear how to make equatable protocol variables
    var statistics: HeroStatistics? { get }
    
    init(statistics: HeroStatistics)
    
    func attack()
    func updateStatistics(_ statistics: HeroStatistics)
    func ultimate()
    func info()
}

// Задание №4 (необязательно)
// Добавьте возможность героям летать. func fly(to point: CGPoint)

protocol StopProtocol {
    func stop()
}

protocol MovableProtocol: StopProtocol {
    var moveSpeed: Float? { get }
    
    func move(to point: CGPoint)
}

protocol FlyableProtocol: StopProtocol {
    var flySpeed: Float? { get }
    
    func fly(to point: CGPoint)
}

extension HeroProtocol {
    func attack() {
        guard let attackType = statistics?.attackType else {
            print("Attack type is not set")
            return
        }
        print("Attack of type: \(attackType.rawValue)")
    }
    
    func ultimate() {
        guard let ultimate = statistics?.ultimateAbility else {
            print("Hero ultimate ability is not set")
            return
        }
        print("Hero is casting ultimate: \(ultimate.rawValue)")
    }
    
    func info() {
        print("\(String(describing: self))")
    }
}


struct HeroStatistics: HeroStatisticsProtocol, Equatable {
    var armor: Float
    var attackPower: Float
    var strength: Float
    var agility: Float
    var intelligence: Float
    var hitPoints: Float
    var mana: Float
    
    var guildType: GuildType
    var currentPosition: CGPoint
    var attackType: AttackType
    var ultimateAbility: UltimateType
    
    static func ==(lhs: HeroStatistics, rhs: HeroStatistics) -> Bool {
        return lhs.armor == rhs.armor &&
        lhs.attackPower == rhs.attackPower &&
        lhs.strength == rhs.strength &&
        lhs.agility == rhs.agility &&
        lhs.intelligence == rhs.intelligence &&
        lhs.hitPoints == rhs.hitPoints &&
        lhs.mana == rhs.mana &&
        lhs.guildType == rhs.guildType &&
        lhs.currentPosition == rhs.currentPosition &&
        lhs.attackType == rhs.attackType &&
        lhs.ultimateAbility == rhs.ultimateAbility
    }
}

func randomStats(guild: GuildType, curPos: CGPoint) -> HeroStatistics {
    let armor = Float.random(in: 1.0...6.99)
    let attackPower = Float.random(in: 20.0...40.01)
    let strength = Float.random(in: 10.0...30.99)
    let agility = Float.random(in: 8.01...24.99)
    let intelligence = Float.random(in: 5.0...20.0)
    let hitPoints = Float.random(in: 300.0...650.0)
    let mana = Float.random(in: 100.0...280.0)
    
    let guildType = guild
    let currentPosition = curPos
    let attackType = Bool.random() ? AttackType.melee : AttackType.longRange
    let ultimateAbility = UltimateType.random
    
    return HeroStatistics(armor: armor,
                          attackPower: attackPower,
                          strength: strength,
                          agility: agility,
                          intelligence: intelligence,
                          hitPoints: hitPoints,
                          mana: mana,
                          guildType: guildType,
                          currentPosition: currentPosition,
                          attackType: attackType,
                          ultimateAbility: ultimateAbility)
}


class RandomHero: HeroProtocol, MovableProtocol {
    var statistics: HeroStatistics?
    var moveSpeed: Float?
    
    required init(statistics: HeroStatistics) {
        self.statistics = statistics
        moveSpeed = Float.random(in: 5.01...10.99)
    }
    
    func updateStatistics(_ statistics: HeroStatistics) {
        self.statistics = statistics
    }
    
    func stop() {
        guard let curPos = statistics?.currentPosition else {
            print("Current position is not set!")
            return
        }
        print("Hero stopped at x:\(curPos.x) y:\(curPos.y)")
    }
    
    func move(to point: CGPoint) {
        guard let curPos = statistics?.currentPosition, let moveSpeed = moveSpeed else {
            print("Hero position/move speed is not set")
            return
        }
        statistics?.currentPosition = point
        
        let distance = Float(sqrt(pow((point.x - curPos.x), 2) + pow((point.y - curPos.y), 2)))
        print("Travel(move) time: \(distance/moveSpeed)")
        
        stop()
    }
}

extension RandomHero: Equatable {
    static func ==(lhs: RandomHero, rhs: RandomHero) -> Bool {
        guard let lhsStats = lhs.statistics,
              let rhsStats = rhs.statistics,
              let lhsMoveSpeed = lhs.moveSpeed,
              let rhsMoveSpeed = rhs.moveSpeed else {
                  return false
              }
        return lhsStats == rhsStats && lhsMoveSpeed == rhsMoveSpeed
    }
}

class Lich: HeroProtocol, FlyableProtocol {
    var statistics: HeroStatistics?
    var flySpeed: Float?
    
    required init(statistics: HeroStatistics) {
        self.statistics = statistics
        flySpeed = 14
    }
    
    func updateStatistics(_ statistics: HeroStatistics) {
        self.statistics = statistics
    }
    
    func stop() {
        guard let curPos = statistics?.currentPosition else {
            print("Current position is not set!")
            return
        }
        print("Hero stopped at x:\(curPos.x) y:\(curPos.y)")
    }
        
    func fly(to point: CGPoint) {
        guard let curPos = statistics?.currentPosition, let flySpeed = flySpeed else {
            print("Hero position/move speed is not set")
            return
        }
        statistics?.currentPosition = point
        
        let distance = Float(sqrt(pow((point.x - curPos.x), 2) + pow((point.y - curPos.y), 2)))
        print("Travel(fly) time: \(distance/flySpeed)")
        
        stop()
    }
}

extension Lich: Equatable {
    static func ==(lhs: Lich, rhs: Lich) -> Bool {
        guard let lhsStats = lhs.statistics,
              let rhsStats = rhs.statistics,
              let lhsFlySpeed = lhs.flySpeed,
              let rhsFlySpeed = rhs.flySpeed else {
                  return false
              }
        return lhsStats == rhsStats && lhsFlySpeed == rhsFlySpeed
    }
}

class KeeperOfTheGrove: HeroProtocol, FlyableProtocol {
    var statistics: HeroStatistics?
    var flySpeed: Float?
    
    required init(statistics: HeroStatistics) {
        self.statistics = statistics
        flySpeed = 14
    }
    
    func updateStatistics(_ statistics: HeroStatistics) {
        self.statistics = statistics
    }
    
    func stop() {
        guard let curPos = statistics?.currentPosition else {
            print("Current position is not set!")
            return
        }
        print("Hero stopped at x:\(curPos.x) y:\(curPos.y)")
    }
        
    func fly(to point: CGPoint) {
        guard let curPos = statistics?.currentPosition, let flySpeed = flySpeed else {
            print("Hero position/move speed is not set")
            return
        }
        statistics?.currentPosition = point
        
        let distance = Float(sqrt(pow((point.x - curPos.x), 2) + pow((point.y - curPos.y), 2)))
        print("Travel(fly) time: \(distance/flySpeed)")
        
        stop()
    }
}

extension KeeperOfTheGrove: Equatable {
    static func ==(lhs: KeeperOfTheGrove, rhs: KeeperOfTheGrove) -> Bool {
        guard let lhsStats = lhs.statistics,
              let rhsStats = rhs.statistics,
              let lhsFlySpeed = lhs.flySpeed,
              let rhsFlySpeed = rhs.flySpeed else {
                  return false
              }
        return lhsStats == rhsStats && lhsFlySpeed == rhsFlySpeed
    }
}

let allianceStartPoint = CGPoint(x: 0, y: 0)
let orcStartPoint = CGPoint(x: 1000, y: 1000)

let lichAllianceStatistics = HeroStatistics(armor: 2,
                                            attackPower: 25,
                                            strength: 15,
                                            agility: 14,
                                            intelligence: 20,
                                            hitPoints: 475,
                                            mana: 300,
                                            guildType: .alliance,
                                            currentPosition: allianceStartPoint,
                                            attackType: .longRange,
                                            ultimateAbility: .lich)

let keeperOfTheGroveOrcStatistics = HeroStatistics(armor: 3,
                                                   attackPower: 23,
                                                   strength: 16,
                                                   agility: 15,
                                                   intelligence: 18,
                                                   hitPoints: 500,
                                                   mana: 270,
                                                   guildType: .orc,
                                                   currentPosition: orcStartPoint,
                                                   attackType: .longRange,
                                                   ultimateAbility: .keeperOfTheGrove)

// За Альянс!
let lichAlliance = Lich(statistics: lichAllianceStatistics)
let hero1Alliance = RandomHero(statistics: randomStats(guild: .alliance, curPos: allianceStartPoint))
let hero2Alliance = RandomHero(statistics: randomStats(guild: .alliance, curPos: allianceStartPoint))
let hero3Alliance = RandomHero(statistics: randomStats(guild: .alliance, curPos: allianceStartPoint))
let hero4Alliance = RandomHero(statistics: randomStats(guild: .alliance, curPos: allianceStartPoint))

// За Орду!
let keeperOfTheGroveOrc = KeeperOfTheGrove(statistics: keeperOfTheGroveOrcStatistics)
let hero1Orc = RandomHero(statistics: randomStats(guild: .orc, curPos: orcStartPoint))
let hero2Orc = RandomHero(statistics: randomStats(guild: .orc, curPos: orcStartPoint))
let hero3Orc = RandomHero(statistics: randomStats(guild: .orc, curPos: orcStartPoint))
let hero4Orc = RandomHero(statistics: randomStats(guild: .orc, curPos: orcStartPoint))

// Далее Задание №5 (необязательно)
// 5.1 Создайте свои структуры со своими героями и положите их в массив.
let allHeroes: [HeroProtocol] = [
    lichAlliance, hero1Alliance, hero2Alliance, hero3Alliance, hero4Alliance,
    keeperOfTheGroveOrc, hero1Orc, hero2Orc, hero3Orc, hero4Orc,
]

// 5.2 Отсортируйте массивы с героями отделяя Орду от Альянса.
let sortedByGuild = allHeroes.sorted(by: { $0.statistics!.guildType < $1.statistics!.guildType })
for element in sortedByGuild {
    print(element.statistics!.guildType, terminator: " ")
}
print()

// 5.3 Отсортируйте по мощности атаки attackPower
let sortedByAttackPower = allHeroes.sorted(by: { $0.statistics!.attackPower > $1.statistics!.attackPower })
for element in sortedByAttackPower {
    print(String(format: "\(element.statistics!.guildType): %.2f", element.statistics!.attackPower), terminator: " ")
}

// 5.4 Найдите самого сильного в массиве (attackPower)
let theMostPowerfulAttackPower = sortedByAttackPower[0]

var maxMana: Float = 0
var theMostPowerfulMagician: HeroProtocol? = nil
for element in allHeroes {
    if element.statistics!.mana > maxMana {
        maxMana = element.statistics!.mana
        theMostPowerfulMagician = element
    }
}
print()

// или того у кого больше всего mana
let sortedByMana: HeroProtocol = allHeroes.sorted(by: { $0.statistics!.mana > $1.statistics!.mana })[0]
print("Is he the most powerful magician: \(theMostPowerfulMagician!.statistics!.mana == sortedByMana.statistics!.mana)")

// Задание №6 (необязательно)
// Придумайте как можно использовать Dictionary для хранения героев

var armySize: [GuildType : Int] = [:]
for element in allHeroes {
    if let army = element.statistics?.guildType {
        armySize[army, default: 0] += 1
    }
}
print(armySize)
