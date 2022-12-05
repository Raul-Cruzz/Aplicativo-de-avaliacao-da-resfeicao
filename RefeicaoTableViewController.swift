//
//  RefeicaoTableViewController.swift
//  eggplant-brownie
//
//  Created by Admin on 10/11/22.
//


import UIKit

class RefeicaoTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
    var refeicoes = [Refeicao(nome: "Macarrao", felicidade: 4),
                     Refeicao(nome: "Pizza", felicidade: 4),
                     Refeicao(nome: "Comida Japonesa", felicidade: 5)]
    
    //retornando o numero de linhas que vai ter na tabela
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//retorno int, numero de linhas
        return refeicoes.count // retornando o contador de elementos refeicoes da lista, no caso 3
    }
    //informando o conteudo de cada celula ou linha da tabela
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {// return celula
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row] //constante que representa o elemento
        celula.textLabel?.text = refeicao.nome // propriedade textlabel onde busca o conteudo da celula
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress) //criado o objeto e passado para a celula
        
        return celula
    }
    
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)//adiciono o novo elemento na lista
        tableView.reloadData()//pesso para atualizar as informacoes
        
        //implementacao para salvar um arquivo
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let caminho = diretorio.appendingPathComponent("refeicao")
        
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicao, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began{
            let celula = gesture.view as! UITableViewCell //convertendo a constante para uma celula
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]//linha que o usuário seleciona
            
            RemoveRefeicaoViewController(controller: self).exibe(refeicao, handler: { alerta in
                self.refeicoes.remove(at: indexPath.row)// clousure, funcao dentro de outra funcao
                self.tableView.reloadData()//@escaping sera acionado quando essa acao de remover item for selecionada pelo o usuario.
                //handler devolvido após o usuário realizar uma acao.
                
            }) 
        }
        
    }
    
    //metodo que se prepare antes de ir para a proxima tela ou viewcontroller
    //usando os ifs para verificar os identificadores
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
        }
        
        
        }
    }
    
}
