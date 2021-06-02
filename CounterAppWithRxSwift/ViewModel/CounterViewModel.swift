//
//  CounterViewModel.swift
//  CounterAppWithRxSwift
//
//  Created by hideto c. on 2021/06/02.
//

import Foundation

class CounterViewModel {
    
    private(set) var count = 0
    
    func incrementCount(callback: (Int) -> ()) {
        count += 1
        callback(count)
    }
    
    func decrement(callback: (Int) -> ()) {
        count -= 1
        callback(count)
    }
    
    func resetCount(callback: (Int) -> ()) {
        count = 0
        callback(count)
    }
}
