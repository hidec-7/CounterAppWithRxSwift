//
//  ViewController.swift
//  CounterAppWithRxSwift
//
//  Created by hideto c. on 2021/06/02.
//


import RxSwift
import RxCocoa
import UIKit

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private var viewModel: CounterViewModel!
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countUpButton: UIButton!
    @IBOutlet weak var countDownButton: UIButton!
    @IBOutlet weak var countResetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel = CounterViewModel()
        
        let input = CounterViewModelInput(countUpButton: countUpButton.rx.tap.asObservable(),
                                          countDownButton: countDownButton.rx.tap.asObservable(),
                                          countResetButton: countResetButton.rx.tap.asObservable())
        viewModel.setup(input: input)
        
        viewModel.outputs?.counterText
            .drive(countLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
