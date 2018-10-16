//
//  Article+CoreDataProperties.swift
//  
//
//  Created by Kyle ROUTLEDGE on 2018/10/12.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var content: String?
    @NSManaged public var creation_date: NSDate?
    @NSManaged public var image: NSData?
    @NSManaged public var language: String?
    @NSManaged public var modification_date: NSDate?
    @NSManaged public var title: String?
    
    public override var description: String {
        return (/(tite) /(content) /(language) /(image) /(creation_date) /(modification_date)
    }

}
