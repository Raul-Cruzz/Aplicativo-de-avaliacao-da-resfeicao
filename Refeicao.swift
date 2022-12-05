//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Admin on 31/10/22.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    
    // Mark: - Atributos
    
    let nome: String
    var felicidade: Int
    var itens: Array<Item> = []
    
    // Mark: - Init
    
    init(nome: String, felicidade: Int, itens: [Item] = [] ) {//acrescentando valor default ao objeto
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    // Mark: - NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(felicidade, forKey: "felicidade")
        aCoder.encode(itens, forKey: "itens")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        felicidade = aDecoder.decodeInteger(forKey: "felicidade")
        itens = aDecoder.decodeObject(forKey: "itens") as! Array<Item>
    }
    
    // Mark: - Metodos
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }
    
    func detalhes() -> String { //metodo que diz quais sao os itens da refeicao
        
        var mensagem = "Felicidade \(felicidade)"
        
        for item in itens {
            mensagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
        
        return mensagem
        
    }

}

