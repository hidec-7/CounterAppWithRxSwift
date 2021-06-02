//
//  ViewController.swift
//  CounterAppWithRxSwift
//
//  Created by hideto c. on 2021/06/02.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel: CounterViewModel!

    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CounterViewModel()
    }

    @IBAction func countUpButton(_ sender: UIButton) {
        viewModel.incrementCount { [weak self] count in
            self?.updateCountLabel(count)
        }
    }
    
    @IBAction func countDownButton(_ sender: UIButton) {
        viewModel.decrement { [weak self] count in
            self?.updateCountLabel(count)
        }
    }
    
    @IBAction func countResetButton(_ sender: UIButton) {
        viewModel.resetCount { [weak self] count in
            self?.updateCountLabel(count)
        }
    }
    
    private func updateCountLabel(_ count: Int) {
        countLabel.text = String(count)
    }
}

