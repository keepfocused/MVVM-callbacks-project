//
//  ViewData.swift
//  MVVM project
//
//  Created by Danil  on 04.11.2021.
//

import Foundation

enum ViewData {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    struct Data {
        let icon: String?
        let title: String?
        let description: String?
        let numberPhone: String?
    }
}

