//
//  Dish+CoreDataProperties.swift
//  LittleLemonMenu
//
//  Created by Manuchimso Oliver on 06/02/2023.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var category: String?
    @NSManaged public var dishDescription: String?
    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var title: String?

}

extension Dish : Identifiable {

}
