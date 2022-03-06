//
//  ViewController.swift
//  LiveCodingSession
//
//  Created by David Sergeev on 22.02.2022.
//
import Foundation
import UIKit

class SRPViewController: UIViewController {

  // MARK: - Dummies
  enum ProportionType {
    case paleo
    case keto
  }

  enum CaloriesCalculationType: Int {
    case mifflin = 1200
    case harrisBenedict = 1400
  }

  struct Nutrients {
    var carbs: Int
    var fats: Int
    var proteins: Int
  }

  // MARK: - Nutrient Calculator Class
  struct NutrientCalculator {
    // Зачем нужна структура, если у неё нет полей?
    private var proportionType: ProportionType
    private var caloriesCalculatorType: CaloriesCalculationType

    init(proportionType: ProportionType, caloriesCalculatorType: CaloriesCalculationType){
      self.proportionType = proportionType
      self.caloriesCalculatorType = caloriesCalculatorType
    }

    func calculateDailtyNutrients() -> Nutrients {
      // ничто в коде не говорит об использовании targetCalories. Непонятно что делать
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

    func someCalculationsOverCalories(_ calories: Int) -> (Int, Int, Int) {
      if calories == 1200 {
        return (carbs: 4, fats: 10, proteins: 20)
      } else if
    }
  }

  // как правильно?
  // А это на ДЗ!
}



