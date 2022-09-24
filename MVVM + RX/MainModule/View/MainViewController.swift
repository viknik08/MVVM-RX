//
//  ViewController.swift
//  MVVM + RX
//
//  Created by Виктор Басиев on 16.09.2022.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {

    private var viewModel: MainViewModelProtocol!
    private var testView: TestView!
    private var bag =  DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel()
        view.backgroundColor = .white
        creatView()
        setupTargetButton()
        updateView()
    }
    
    private func updateView() {
        viewModel.updateViewDataRx.asObserver().subscribe { [weak self] viewData in
            self?.testView.viewData = viewData
        }.disposed(by: bag)
    }
    
    private func creatView() {
        testView = TestView()
        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        testView.center = view.center
        view.addSubview(testView)
    }

    private func setupTargetButton() {
        testView.startButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
    }
}

extension MainViewController {
    @objc func startAction() {
        viewModel.startFetch()
    }
}


