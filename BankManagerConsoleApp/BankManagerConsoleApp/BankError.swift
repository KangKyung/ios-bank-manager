//
//  BankError.swift
//  BankManagerConsoleApp
//
//  Created by 이영우 on 2021/04/27.
//

import Foundation

enum BankError: CustomStringConvertible {
    case invalidStartInput

    var description: String {
        switch self {
        case .invalidStartInput:
            return "잘못된 입력입니다. 1(시작) 혹은 2(종료)를 입력해주세요"
        }
    }
}
