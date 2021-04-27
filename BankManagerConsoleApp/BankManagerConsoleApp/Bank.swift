//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 이영우 on 2021/04/27.
//

import Foundation

class Bank {
    let bankersNumber: Int = 3
    let customersNumber: Int = Int.random(in: 10...30)
    
    lazy var bankers: [Banker] = {
        var bankers: [Banker] = []
        for index in 0..<bankersNumber {
            bankers.append(Banker(counterNumber: index))
        }
        
        return bankers
    }()
    
    lazy var customers: [Customer] = {
        var customers: [Customer] = []
        for index in 1...customersNumber {
            customers.append(Customer(number: index))
        }
        
        return customers
    }()
    
    func open() {
        let startTime = CFAbsoluteTimeGetCurrent()
        for index in 0..<bankersNumber {
            if customers.isEmpty {
                let processTime = CFAbsoluteTimeGetCurrent() - startTime
                print(processTime)
                finish()
                return
            }
            assign(customer: customers.removeFirst(), banker: bankers[index])
        }
    }
    
    func assign(customer: Customer, banker: Banker) {
        banker.processTaskOf(customer)
        banker.operationQueue.waitUntilAllOperationsAreFinished()
        if customers.isEmpty {
            return
        } else {
            self.assign(customer: self.customers.removeFirst(), banker: banker)
        }
    }
    
    func finish() {
        let totalTime = customers.reduce(0) {
            $0 + $1.time
        }
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customersNumber)명이며, 총 업무시간은 \(totalTime)초입니다.")
    }
}
