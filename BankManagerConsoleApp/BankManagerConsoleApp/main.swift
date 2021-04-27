//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Command: String {
    case open = "1"
    case close = "2"
}

private func printConsoleStartMessage() {
    let startMessage = """
    1 : 은행개점
    2 : 종료
    """
    
    print(startMessage)
    print("입력 : ", terminator: "")
}

func startBank() {
    var isEnd = false
    while !isEnd {
        printConsoleStartMessage()
        
        guard let input = readLine(), let command = Command(rawValue: input) else {
            print(BankError.invalidStartInput)
            continue
        }
        
        switch command {
        case .open:
            Bank().open()
        case .close:
            isEnd = true
        }
    }
}

startBank()
