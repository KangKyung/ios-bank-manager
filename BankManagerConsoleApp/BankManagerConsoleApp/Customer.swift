//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

struct Customer: Hashable {
  private let ticketNumber: Int
  private let grade: GradeType
  
  init(order orderNumber: Int, grade: GradeType) {
    self.ticketNumber = orderNumber
    self.grade = grade
  }
  
  func showTicketNumber() -> Int {
    return ticketNumber
  }
  
  func checkGrade() -> GradeType {
    return grade
  }
}

enum GradeType {
  case VVIP, VIP, normal
}
