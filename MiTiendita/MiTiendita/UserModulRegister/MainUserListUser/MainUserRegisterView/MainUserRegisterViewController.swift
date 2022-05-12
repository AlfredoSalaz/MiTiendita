//
//  MainUserRegisterViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 04/05/22.
//

import UIKit
import CoreData

class MainUserRegisterViewController: UIViewController, MainUserRegisterViewControllerProtocol {
    
    func returnData() {
        DispatchQueue.main.async {
            self.tableUsuarios.reloadData()
        }
    }
    
    
    @IBOutlet weak var tableUsuarios: UITableView!
    
    var presenter: MainUserRegisterPresentProtocol?
    
    var listUsuarios: [UsuarioCore]?
    
    var usuarios: [NSManagedObject]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableUsuarios.delegate = self
        tableUsuarios.dataSource = self
        
        tableUsuarios.reloadData()
        
        getUsuarios()
        datosObtenidosUser(data: usuarios!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getUsuarios()
        self.tableUsuarios.reloadData()

    }
    
    //Funcion que pide los datos almacenados en core
    func getUsuarios() {
        presenter?.getUsuarios()
    }
    
    func datosObtenidosUser(data: [NSManagedObject]) {
        usuarios = data
        print("Datos llegados en el presenter: \(data)")
        tableUsuarios.reloadData()
    }
    
    @IBAction func addUser(_ sender: Any) {
        print("Me presiono")
        presenter?.agregarNuevoUsuario()
    }
    
    
    @IBAction func backMenu(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension MainUserRegisterViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return usuarios?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainUserRegisterTableViewCell
        
        let data = usuarios?[indexPath.row] as! UsuariosCD
        
        cell.nameUser.text = data.nombre
        cell.apeUser.text = data.apellido
        
        return cell
        
    }
    
/*
    //Eliminar el registro
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
    }
     
    */
}

