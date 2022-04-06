//
//  Thread+Extension.swift
//  1_StocksApp_MVVM
//
//  Created by David Sergeev on 30.03.2022.
//

import Foundation

extension Thread {
    class func printCurrent() {
        print("\r⚡️: \(Thread.current)\r" + "🏭: \(OperationQueue.current?.underlyingQueue?.label ?? "None")\r")
    }
}
