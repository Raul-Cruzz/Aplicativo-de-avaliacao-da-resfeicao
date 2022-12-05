//
//  ViewController.swift
//  tabela-dinamica-refeicoes
//
//  Created by Admin on 31/10/22.
//

import UIKit

class ViewController: UITableViewController {
    
    let refeicoes = ["Churros", "Macarrao","Pizza"] //constante recebendo um conjunto de strings

    override func viewDidLoad() {
        super.viewDidLoad()
        print("A TableViewController foi carregada")
    }

    //Criando as linhas da tabelas
//    numeroDeLinhas() -> Int {
//
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    // Metodo UITableViewCell exige que retornemos uma celula
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes[indexPath.row] // forma de redenrizar os nossos metodos
        celula.textLabel?.text = refeicao // passando a nossa constante que possui os elementos
        
        return celula
    }

}

