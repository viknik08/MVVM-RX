//
//  MainViewModel.swift
//  MVVM + RX
//
//  Created by Виктор Басиев on 16.09.2022.
//

import UIKit
import RxSwift

protocol MainViewModelProtocol {
    
    var updateViewDataRx: PublishSubject<ViewData> { get set }
    
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {
    
    public var updateViewDataRx = PublishSubject<ViewData>()
    
    init() {
        updateViewDataRx.onNext(.initial)
    }
       
    public func startFetch() {
        
        self.updateViewDataRx.onNext(.loading(ViewData.UserData(icon: nil, title: nil, description: nil)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewDataRx.onNext(.success(ViewData.UserData(icon: "person.fill.checkmark", title: "Success", description: "Good job")))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
            self?.updateViewDataRx.onNext(.failure(ViewData.UserData(icon: "person.fill.xmark", title: "Fail", description: "Oh no..")))
        }
    }
}
