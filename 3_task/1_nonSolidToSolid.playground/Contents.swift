//
//  ViewController.swift
//  LiveCodingSession
//
//  Created by David Sergeev on 22.02.2022.
//
import Foundation
import UIKit

class SRPViewController: UIViewController {

  struct NutrientCalculator {
    func calculateDailtyNutrients(proportionType: ProportionType,
                                  caloriesCalculatorType: CaloriesCalculationType) -> Nutrients {
      var targetCalories: Int
      switch caloriesCalculatorType {
      case .mifflin:
        // some calculation
        targetCalories = 1200
      case .harrisBenedict:
        // some calculation
        targetCalories = 1400
      }

      var nutrients: Nutrients
      switch proportionType {
      case .paleo:
        // use calories to calculate
        // nutrients
        nutrients = Nutrients(carbs: 4, fats: 10, proteins: 8)
      case .keto:
        // use calories to calculate
        // nutrients
        nutrients = Nutrients(carbs: 6, fats: 1, proteins: 20)
      }

      return nutrients
    }
  }

  // как правильно?
  // А это на ДЗ!
}


// MARK: - Dummies

enum ProportionType {
  case paleo
  case keto
}

enum CaloriesCalculationType {
  case mifflin
  case harrisBenedict
}

struct Nutrients {
  var carbs: Int
  var fats: Int
  var proteins: Int
}
