//
//  CounterViewModel.swift
//  CounterAppWithRxSwift
//
//  Created by hideto c. on 2021/06/02.
//

import RxSwift
import RxCocoa

struct CounterViewModelInput {
    
    let countUpButton: Observable<Void>
    let countDownButton: Observable<Void>
    let countResetButton: Observable<Void>
}

protocol CounterViewModelOutput {
    
    var counterText: Driver<String?> { get }
}

protocol CounterViewModelType {
    
    var outputs: CounterViewModelOutput? { get }
    
    func setup(input: CounterViewModelInput)
}

class CounterViewModel: CounterViewModelType {
    
    var outputs: CounterViewModelOutput?
    
    private let countRelay = BehaviorRelay<Int>(value: 0)
    private let initialCount = 0
    private let disposeBag = DisposeBag()
    
    init() {
        outputs = self
        resetCount()
    }
    
    func setup(input: CounterViewModelInput) {
        input.countUpButton
            .subscribe { [weak self] in
                self?.incrementCount()
            }
            .disposed(by: disposeBag)

        input.countDownButton
            .subscribe { [weak self] in
                self?.decrementCount()
            }
            .disposed(by: disposeBag)
        
        input.countResetButton
            .subscribe { [weak self] in
                self?.resetCount()
            }
            .disposed(by: disposeBag)
    }

    private func incrementCount() {
        let count = countRelay.value + 1
        countRelay.accept(count)
    }
    
    private func decrementCount() {
        let count = countRelay.value - 1
        countRelay.accept(count)
    }
    
    private func resetCount() {
        countRelay.accept(initialCount)
    }
}

extension CounterViewModel: CounterViewModelOutput {
    
    var counterText: Driver<String?> {
        return countRelay
            .map {
                "Rx: \($0)"
            }
            .asDriver(onErrorJustReturn: nil)
    }
}
