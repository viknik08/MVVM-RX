//
//  Model.swift
//  MVVM + RX
//
//  Created by Виктор Басиев on 16.09.2022.
//

import Foundation
//import RxSwift
//import RxCocoa

enum ViewData {
    case initial
    case loading(UserData)
    case success(UserData)
    case failure(UserData)
    
    struct UserData {
        let icon: String?
        let title: String?
        let description: String?
    }
}

