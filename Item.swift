//
//  Item.swift
//  eggplant-brownie
//
//  Created by Admin on 31/10/22.
//

import UIKit

class Item: NSObject, NSCoding {
    
    //Mark: - Atributod
    
    let nome: String
    let calorias: Double
    
    //Mark: - Init
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
    
    //Mark: - NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        calorias = aDecoder.decodeDouble(forKey: "calorias")
    }
}

