//
//  MainUserRegisterViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 04/05/22.
//

import UIKit

class MainUserRegisterViewController: UIViewController, MainUserRegisterViewControllerProtocol {
    
    @IBOutlet weak var tableUsuarios: UITableView!
    
    var presenter: MainUserRegisterPresentProtocol?
    
    var listUsuarios: [UsuarioCore]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //Funcion que pide los datos almacenados en core
    func getUsuarios() {
        presenter?.getUsuarios()
    }
    
    func datosRecibidosUsuario(data: [UsuarioCore]) {
        listUsuarios = data

            //Recargamos la tabla
            tableUsuarios.reloadData()
    }
    

    @IBAction func addUser(_ sender: Any) {
    }
}

extension MainUserRegisterViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listUsuarios?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainUserRegisterTableViewCell
        
        let data = listUsuarios?[indexPath.row]
        
        cell.nameUser.text = data?.nombre
        cell.apeUser.text = data?.apellido
        
        return cell
        
    }
    
}

