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
    var moveSpeed: Float { get set }
    var attackType: AttackType { get set }
    var ultimateAbility: UltimateType { get set }
}

// Задание №4 (необязательно)
// Добавьте возможность героям летать. func fly(to point: CGPoint)
protocol HeroFlyable {
    var flySpeedModifier: Float { get }
    var flySpeed: Float? { get }
    
    func fly(to point: CGPoint)
}

protocol HeroProtocol: AnyObject {
    var armor: Float? { get }
    var attackPower: Float? { get }
    var strength: Float? { get }
    var agility: Float? { get }
    var intelligence: Float? { get }
    var hitPoints: Float? { get }
    var mana: Float? { get }
    
    var guildType: GuildType? { get }
    var currentPosition: CGPoint? { get }
    var moveSpeed: Float? { get }
    var attackType: AttackType? { get }
    var ultimateAbility: UltimateType? { get set }
    
    init(statistics: HeroStatisticsProtocol)
    
    func attack()
    func move(to point: CGPoint)
    func stop()
    func updateStatistics(_ statistics: HeroStatisticsProtocol)
    func ultimate()
    func info()
    func getStatistics() -> HeroStatisticsProtocol?
}

extension HeroProtocol {
    func attack() {
        guard let attackType = self.attackType else {
            print("Attack type is not set")
            return
        }
        print("Attack of type: \(attackType.rawValue)")
    }

    func stop() {
        print("stop")
    }
    
    func ultimate() {
        guard let ultimate = ultimateAbility else {
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
    var moveSpeed: Float
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
        lhs.moveSpeed == rhs.moveSpeed &&
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
    let moveSpeed = Float.random(in: 7.0...15.99)
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
                          moveSpeed: moveSpeed,
                          attackType: attackType,
                          ultimateAbility: ultimateAbility)
}


class Hero: HeroProtocol {
    var armor: Float?
    var attackPower: Float?
    var strength: Float?
    var agility: Float?
    var intelligence: Float?
    var hitPoints: Float?
    var mana: Float?
    
    var guildType: GuildType?
    var currentPosition: CGPoint?
    var moveSpeed: Float?
    var attackType: AttackType?
    var ultimateAbility: UltimateType?
    
    required init(statistics: HeroStatisticsProtocol) {
        armor = statistics.armor
        attackPower = statistics.attackPower
        strength = statistics.strength
        agility = statistics.agility
        intelligence = statistics.intelligence
        hitPoints = statistics.hitPoints
        mana = statistics.mana
        
        guildType = statistics.guildType
        currentPosition = statistics.currentPosition
        moveSpeed = statistics.moveSpeed
        attackType = statistics.attackType
        ultimateAbility = statistics.ultimateAbility
    }
    
    func updateStatistics(_ statistics: HeroStatisticsProtocol) {
        armor = statistics.armor
        attackPower = statistics.attackPower
        strength = statistics.strength
        agility = statistics.agility
        intelligence = statistics.intelligence
        hitPoints = statistics.hitPoints
        mana = statistics.mana
        
        guildType = statistics.guildType
        currentPosition = statistics.currentPosition
        moveSpeed = statistics.moveSpeed
        attackType = statistics.attackType
        ultimateAbility = statistics.ultimateAbility
    }
    
    func move(to point: CGPoint) {
        guard let curPos = currentPosition, moveSpeed != nil else {
            print("Hero position/move speed is not set")
            return
        }
        currentPosition = point
        
        let distance = Float(sqrt(pow((point.x - curPos.x), 2) + pow((point.y - curPos.y), 2)))
        print("Travel(move) time: \(distance/moveSpeed!)")
    }
    
    func getStatistics() -> HeroStatisticsProtocol? {
        guard armor != nil, attackPower != nil, strength != nil, agility != nil,
                intelligence != nil, hitPoints != nil, mana != nil,
                guildType != nil, currentPosition != nil, moveSpeed != nil,
              attackType != nil, ultimateAbility != nil else {
                  return nil
              }
        return HeroStatistics(armor: armor!,
                              attackPower: attackPower!,
                              strength: strength!,
                              agility: agility!,
                              intelligence: intelligence!,
                              hitPoints: hitPoints!,
                              mana: mana!,
                              guildType: guildType!,
                              currentPosition: currentPosition!,
                              moveSpeed: moveSpeed!,
                              attackType: attackType!,
                              ultimateAbility: ultimateAbility!)
    }
}

extension Hero: Equatable {
    static func ==(lhs: Hero, rhs: Hero) -> Bool {
        let lhsStats = lhs.getStatistics() as? HeroStatistics
        let rhsStats = rhs.getStatistics() as? HeroStatistics
        guard lhsStats != nil, rhsStats != nil else {
            return false
        }
        return lhsStats! == rhsStats!
    }
}

class Lich: Hero, HeroFlyable {
    var flySpeedModifier: Float = 1.4
    var flySpeed: Float?
    
    required init(statistics: HeroStatisticsProtocol) {
        super.init(statistics: statistics)
        
        guard moveSpeed != nil else {
            print("Move speed is not set")
            return
        }
        flySpeed = flySpeedModifier * Float(moveSpeed!)
    }
    
    func fly(to point: CGPoint) {
        guard let curPos = currentPosition, flySpeed != nil else {
            print("Hero position/move speed is not set")
            return
        }
        currentPosition = point
        
        let distance = Float(sqrt(pow((point.x - curPos.x), 2) + pow((point.y - curPos.y), 2)))
        print("Travel(fly) time: \(distance/flySpeed!)")
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
                                            moveSpeed: 10,
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
                                                moveSpeed: 13,
                                                attackType: .longRange,
                                                ultimateAbility: .keeperOfTheGrove)

// За Альянс!
let lichAlliance = Lich(statistics: lichAllianceStatistics)
let hero1Alliance = Hero(statistics: randomStats(guild: .alliance, curPos: allianceStartPoint))
let hero2Alliance = Hero(statistics: randomStats(guild: .alliance, curPos: allianceStartPoint))
let hero3Alliance = Hero(statistics: randomStats(guild: .alliance, curPos: allianceStartPoint))
let hero4Alliance = Hero(statistics: randomStats(guild: .alliance, curPos: allianceStartPoint))

// За Орду!
let keeperOfTheGroveOrc = Hero(statistics: keeperOfTheGroveOrcStatistics)
let hero1Orc = Hero(statistics: randomStats(guild: .orc, curPos: orcStartPoint))
let hero2Orc = Hero(statistics: randomStats(guild: .orc, curPos: orcStartPoint))
let hero3Orc = Hero(statistics: randomStats(guild: .orc, curPos: orcStartPoint))
let hero4Orc = Hero(statistics: randomStats(guild: .orc, curPos: orcStartPoint))

// Далее Задание №5 (необязательно)
// 5.1 Создайте свои структуры со своими героями и положите их в массив.
let allHeroes: [HeroProtocol] = [
    lichAlliance, hero1Alliance, hero2Alliance, hero3Alliance, hero4Alliance,
    keeperOfTheGroveOrc, hero1Orc, hero2Orc, hero3Orc, hero4Orc
]

// 5.2 Отсортируйте массивы с героями отделяя Орду от Альянса.
let sortedByGuild = allHeroes.sorted(by: {$0.guildType! < $1.guildType!})
for element in sortedByGuild {
    print(element.guildType!, terminator: " ")
}
print()

// 5.3 Отсортируйте по мощности атаки attackPower
let sortedByAttackPower = allHeroes.sorted(by: {$0.attackPower! > $1.attackPower!})
for element in sortedByAttackPower {
    print(String(format: "\(element.guildType!): %.2f", element.attackPower!), terminator: " ")
}

// 5.4 Найдите самого сильного в массиве (attackPower)
let theMostPowerfulAttackPower = sortedByAttackPower[0]

var maxMana: Float = 0
var theMostPowerfulMagician: HeroProtocol? = nil
for element in allHeroes {
    if element.mana! > maxMana {
        maxMana = element.mana!
        theMostPowerfulMagician = element
    }
}
print()

// или того у кого больше всего mana
let sortedByMana = allHeroes.sorted(by: {$0.mana! > $1.mana!})
print("Is he the most powerful magician: \(theMostPowerfulMagician! as! Hero == sortedByMana[0] as! Hero)")

// Задание №6 (необязательно)
// Придумайте как можно использовать Dictionary для хранения героев

var armySize: [GuildType : Int] = [:]
for element in allHeroes {
    if let army = element.guildType {
        armySize[army, default: 0] += 1
    }
}
print(armySize)
