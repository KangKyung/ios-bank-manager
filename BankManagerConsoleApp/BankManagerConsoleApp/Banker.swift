//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by 이영우 on 2021/04/27.
//

import Foundation

class Banker {
    let counterNumber: Int
    let operationQueue = OperationQueue()
    
    init(counterNumber: Int) {
        self.counterNumber = counterNumber
    }
    
    func processTaskOf(_ customer: Customer) {
        operationQueue.addOperation {
            print("\(customer.number)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: customer.time)
            print("\(customer.number)번 고객 업무 완료")
        }
    }
}
