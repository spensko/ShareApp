//
//  ShareObj+CoreDataProperties.swift
//  ShareApp
//
//  Created by Mikhail Serov on 23.11.2019.
//  Copyright © 2019 serov. All rights reserved.
//
//

import Foundation
import CoreData


extension ShareObj {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShareObj> {
        return NSFetchRequest<ShareObj>(entityName: "ShareObj")
    }

    @NSManaged public var thumbnail: Data?
    @NSManaged public var name: String?
    @NSManaged public var info: String?
    @NSManaged public var url: String?

}
