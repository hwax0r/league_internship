import UIKit

// Задание №1
// Написать код, где можно будет сравнивать перечисления.
// Где перечисления могут быть =>, >, <=, < исходя их rating и их названия самого перечисления

enum LessonType {
    case math(rating: Int)
    case nativeLanguage(rating: Int)
    case computerSince(rating: Int)
    case literature(rating: Int)
}

extension LessonType: Comparable {
    static func < (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(rating: let lhsRating), .math(rating: let rhsRating)):
            return lhsRating < rhsRating
        case (.nativeLanguage(rating: let lhsRating), .nativeLanguage(rating: let rhsRating)):
            return lhsRating < rhsRating
        case (.computerSince(rating: let lhsRating), .computerSince(rating: let rhsRating)):
            return lhsRating < rhsRating
        case (.literature(rating: let lhsRating), .literature(rating: let rhsRating)):
            return lhsRating < rhsRating
        default:
            return false
        }
    }
}

// Задание №2
// Реализуйте протокол Equatable у LessonType

extension LessonType: Equatable {
    static func == (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(rating: let lhsRating), .math(rating: let rhsRating)):
            return lhsRating == rhsRating
        case (.nativeLanguage(rating: let lhsRating), .nativeLanguage(rating: let rhsRating)):
            return lhsRating == rhsRating
        case (.computerSince(rating: let lhsRating), .computerSince(rating: let rhsRating)):
            return lhsRating == rhsRating
        case (.literature(rating: let lhsRating), .literature(rating: let rhsRating)):
            return lhsRating == rhsRating
        default:
            return false
        }
    }
}

func tests() {
    // >=
    assert(LessonType.math(rating: 12) >= LessonType.math(rating: 12), "1") // 12 >= 12 -> true
    assert(LessonType.math(rating: 13) >= LessonType.math(rating: 12), "2") // 13 >= 12 -> true
    assert(!(LessonType.math(rating: 12) >= LessonType.math(rating: 13)), "3") // 12 >= 13 -> false
    
    // >
    assert(LessonType.math(rating: 12) > LessonType.math(rating: 11), "4") // 12 > 11 -> true
    assert(!(LessonType.math(rating: 12) > LessonType.math(rating: 12)), "5") // 12 > 12 -> false
    assert(!(LessonType.math(rating: 12) > LessonType.math(rating: 13)), "6") // 12 > 13 -> false
    
    // <=
    assert(LessonType.math(rating: 12) <= LessonType.math(rating: 12), "7") // 12 <= 12 -> true
    assert(LessonType.math(rating: 12) <= LessonType.math(rating: 13), "8") // 12 <= 13 - true
    assert(!(LessonType.math(rating: 13) <= LessonType.math(rating: 12)), "9") // 13 <= 12 -> false
    
    // <
    assert(LessonType.math(rating: 12) < LessonType.math(rating: 13), "10") // 12 < 13 -> true
    assert(!(LessonType.math(rating: 12) < LessonType.math(rating: 12)), "11") // 12 < 12 -> false
    assert(!(LessonType.math(rating: 12) < LessonType.math(rating: 11)), "12") // 12 < 11 -> false
    
    // ==
    assert(LessonType.math(rating: 12) == LessonType.math(rating: 12), "13") // 12 == 12 -> true
    assert(!(LessonType.math(rating: 12) == LessonType.math(rating: 13)), "14") // 12 == 13 -> false
}

tests()
