//
//  ItemDao.swift
//  eggplant-brownie
//
//  Created by Admin on 07/12/22.
//

import Foundation

class ItemDao {
    
    //convertendo o item para dados e salvando no arquivo
    func save(_ itens: [Item]) {
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            guard let caminho = recuperaDiretorio() else {  return }
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }

    }
    
    func recupera() -> [Item] {
        //pegando os arquivos salvos no device e mostrando para o usuario
        do {
            guard let diretorio = recuperaDiretorio() else { return [] }
            let dados = try Data(contentsOf: diretorio)
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! [Item]
            return itensSalvos
        }catch{
            print(error.localizedDescription)
        }
        return []
    }
    
    func recuperaDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent("itens")
        
        return caminho
    }
}
