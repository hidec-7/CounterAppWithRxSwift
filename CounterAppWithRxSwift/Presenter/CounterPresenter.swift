//
//  CounterPresenter.swift
//  CounterAppWithRxSwift
//
//  Created by hideto c. on 2021/06/02.
//

import Foundation

protocol CounterDelegate {
    func updateCount(count: Int)
}

class CounterPresenter {
    
    private var count = 0 {
        didSet {
            delegate?.updateCount(count: count)
        }
    }
    
    private var delegate: CounterDelegate?
    
    func attachView(_ delegate: CounterDelegate) {
        self.delegate = delegate
    }
    
    func detachView() {
        self.delegate = nil
    }
    
    func incrementCount() {
        count += 1
    }
    
    func decrementCount() {
        count -= 1
    }
    
    func resetCount() {
        count = 0
    }
}
