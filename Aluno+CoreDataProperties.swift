//
//  Aluno+CoreDataProperties.swift
//  Agenda
//
//  Created by Eduardo Santos on 02/07/21.
//  Copyright © 2021 Alura. All rights reserved.
//
//

import Foundation
import CoreData


extension Aluno {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Aluno> {
        return NSFetchRequest<Aluno>(entityName: "Aluno")
    }

    @NSManaged public var nome: String?
    @NSManaged public var endereco: String?
    @NSManaged public var telefone: String?
    @NSManaged public var site: String?
    @NSManaged public var nota: Double
    @NSManaged public var foto: NSObject?

}
