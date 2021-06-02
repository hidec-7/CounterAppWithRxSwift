//
//  ViewController.swift
//  CounterAppWithRxSwift
//
//  Created by hideto c. on 2021/06/02.
//

import UIKit

class ViewController: UIViewController {
    
    private let presenter = CounterPresenter()

    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.attachView(self)
    }

    @IBAction func countUpButton(_ sender: UIButton) {
        presenter.incrementCount()
    }
    
    @IBAction func countDownButton(_ sender: UIButton) {
        presenter.decrementCount()
    }
    
    @IBAction func countResetButton(_ sender: UIButton) {
        presenter.resetCount()
    }
}

extension ViewController: CounterDelegate {
    
    func updateCount(count: Int) {
        countLabel.text = String(count)
    }
}
