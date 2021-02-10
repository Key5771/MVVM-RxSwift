//
//  ViewController.swift
//  MVVM+RxSwift
//
//  Created by 김기현 on 2021/02/10.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testButton: UIButton!
    
    var viewModel = ViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bind(viewModel: self.viewModel)
    }
    
    private func bind(viewModel: ViewModel) {
        self.viewModel.number
            .drive(self.testLabel.rx.text)
            .disposed(by: self.disposeBag)
        
        self.testButton.rx.tap
            .bind(to: viewModel.tap)
            .disposed(by: disposeBag)
    }
}
