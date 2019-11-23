//
//  ViewModel.swift
//  ShareApp
//
//  Created by Mikhail Serov on 23.11.2019.
//  Copyright © 2019 serov. All rights reserved.
//

import Foundation
import CoreData

class ViewModel {
    
    var items: [ShareObj] = []
    
    init() {
        updateItems()
    }
    
    func updateItems() {
        items = CoreDataManager.shared.shareObjects
    }
    
}
