//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 이영우 on 2021/04/27.
//

import Foundation

class Customer {
    let number: Int
    let time: Double
    
    init(number: Int, time: Double = 0.7) {
        self.number = number
        self.time = time
    }
}
