//
//  BankCounter.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/29.
//

import Foundation

class BankWork: Operation {
  private let queue: Queue<Customer>
  private let banker: Banker?
  
  init(queue: Queue<Customer>, workableBanker banker: Banker?) {
    self.queue = queue
    self.banker = banker
  }
  
  override func main() {
    guard let firstElement = queue.front else { return }
    banker?.process(firstElement)
  }
}

final class BankManager {
  let operationQueue = OperationQueue()
  
  private var bankers: [Int:Banker] = [:]
  private var currentTicketNumber = 1
  private var totalCompletedCustomer = 0
  
  func process(vvipQueue: Queue<Customer>,
               vipQueue: Queue<Customer>,
               normalQueue: Queue<Customer>,
               ​completionHandler: @escaping (()->Void) = { }) {
    if !vvipQueue.isEmpty {
      process(grade: .vvip, vvipQueue)
    } else if !vipQueue.isEmpty {
      process(grade: .vip, vipQueue)
    } else if !normalQueue.isEmpty {
      process(grade: .normal, normalQueue)
    }
  }
  
  private func process(grade: CustomerGrade, _ queue: Queue<Customer>) {
    let workableBanker = self.bankers.first?.value
    guard let counterNumber = workableBanker?.showCounterNumber() else {
      return
    }

    self.bankers.removeValue(forKey: counterNumber)
    
    NotificationCenter.default.post(
      name: NSNotification.Name(rawValue: "completedCustomer"),
      object: nil,
      userInfo: ["userGrade":grade, "ticketNumber":currentTicketNumber])
    
    currentTicketNumber += 1
    
    let bankWork = BankWork(queue: queue, workableBanker: workableBanker)
    bankWork.completionBlock = {
      self.bankers[counterNumber] = workableBanker
      self.totalCompletedCustomer += 1
    }
    
    if queue.front?.showGrade() == CustomerGrade.vvip {
      bankWork.queuePriority = Operation.QueuePriority.veryHigh
    } else if queue.front?.showGrade() == CustomerGrade.vip {
      bankWork.queuePriority = Operation.QueuePriority.high
    } else {
      bankWork.queuePriority = Operation.QueuePriority.normal
    }
    
    operationQueue.addOperation(bankWork)
  }
  
  func setBankCounters(number: Int) {
    bankers[number] = Banker(number)
  }

  func showTotalCompletedCustomer() -> Int {
    return totalCompletedCustomer
  }
}
