//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

protocol Bankable {
  var customersOfVVIP: [Int:Customer] { get set }
  var customersOfVIP: [Int:Customer] { get set }
  var customersOfNormal: [Int:Customer] { get set }
  var bankManager: BankManager { get set }
  
  func open()
  func close(from openTime: CFAbsoluteTime)
}

extension Bankable {
  func open() {
    let openTime = CFAbsoluteTimeGetCurrent()
    
    var isRepeat = true
    repeat {
      if !customersOfVVIP.isEmpty {
        bankManager.process(customersOfVVIP, GradeType.VVIP)
      } else if !customersOfVIP.isEmpty {
        if let num = customersOfVIP.first?.key {
          bankManager.initCurrentTicketNumber(num)
          bankManager.process(customersOfVIP, GradeType.VIP)
        } else {
          continue
        }
      } else if !customersOfNormal.isEmpty {
        if let num = customersOfNormal.first?.key {
          bankManager.initCurrentTicketNumber(num)
          bankManager.process(customersOfNormal, GradeType.normal)
        } else {
          continue
        }
      } else {
        isRepeat = false
      }
    } while isRepeat
    
    bankManager.operationQueue.waitUntilAllOperationsAreFinished()
    close(from: openTime)
  }
  
  func close(from openTime: CFAbsoluteTime) {
    let closeTime = CFAbsoluteTimeGetCurrent()
    let totalWorkTime = round((closeTime - openTime) * 100) / 100
    
    let complateString = """
    업무가 마감되었습니다.
    오늘 업무를 처리한 고객은 총 \(bankManager.showTotalCompletedCustomer())명이며,
    총 업무 시간은 \(totalWorkTime)초입니다.
    """
    print(complateString)
  }
}

final class Bank: Bankable {
  var customers: [Int:Customer] = [:]
  var customersOfVVIP: [Int:Customer] = [:]
  var customersOfVIP: [Int:Customer] = [:]
  var customersOfNormal: [Int:Customer] = [:]
  var bankManager = BankManager()
  
  init(numOfManagers: Int) {
//    let randomNumber = Int.random(in: 10...30)
//    for ticketNumber in 1...randomNumber {
//      customers[ticketNumber] = Customer(order: ticketNumber)
//    }
    
    // 랜덤 더미
    customers[1] = Customer(order: 1, grade: .normal)
    customers[2] = Customer(order: 2, grade: .normal)
    customers[3] = Customer(order: 3, grade: .VVIP)
    customers[4] = Customer(order: 4, grade: .VIP)
    customers[5] = Customer(order: 5, grade: .VVIP)
    // 예상되는 순서: 3, 5, 4, 1, 2
    
    // 분류 로직
    for customer in customers {
      switch customer.value.checkGrade() {
      case .VVIP:
        customersOfVVIP[customer.key] = customer.value
      case .VIP:
        customersOfVIP[customer.key] = customer.value
      case .normal:
        customersOfNormal[customer.key] = customer.value
      }
    }
    
    for counterNumber in 1...numOfManagers {
      bankManager.setBankCounters(number: counterNumber)
    }
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(removeCustomer(notification:)),
      name: NSNotification.Name(rawValue: "completedCustomer"),
      object: nil)
  }
}

// MARK: - NotificationCenter Method
extension Bank {
  @objc func removeCustomer(notification: Notification) {
    if let userInfo = notification.userInfo {
      guard let ticketNumber = userInfo["ticketNumber"] as? Int else {
        return
      }
      guard let grade = userInfo["grade"] as? GradeType else {
        return
      }
      
      switch grade {
      case GradeType.VVIP:
        customersOfVVIP.removeValue(forKey: ticketNumber)
      case GradeType.VIP:
        customersOfVIP.removeValue(forKey: ticketNumber)
      case GradeType.normal:
        customersOfNormal.removeValue(forKey: ticketNumber)
      }
    }
  }
}
