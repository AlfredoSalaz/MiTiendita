//
//  MainUserRegisterViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 04/05/22.
//

import UIKit
import CoreData

class MainUserRegisterViewController: UIViewController, MainUserRegisterViewControllerProtocol {
    
    @IBOutlet weak var tableUsuarios: UITableView!
    
    var presenter: MainUserRegisterPresentProtocol?
    var listUsuarios: [UsuarioCore]?
    var usuarios: [User]?
    var user = User.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableUsuarios.delegate = self
        tableUsuarios.dataSource = self
        tableUsuarios.reloadData()
        getUsuarios()
    }
    /*
    override func viewWillAppear(_ animated: Bool) {
        getUsuarios()
        self.tableUsuarios.reloadData()

    }
    */
    func returnData() {
        DispatchQueue.main.async {
            self.tableUsuarios.reloadData()
        }
    }
    
    //Funcion que pide los datos almacenados la api
    func getUsuarios() {
        print("Pidiendo datos")
        presenter?.getUsuarios()
    }
    /*
    func datosObtenidosUser(data: [NSManagedObject]) {
        usuarios = data
        print("Datos llegados en el presenter: \(data)")
        tableUsuarios.reloadData()
    }
     */
    
    func datosObtenidosUser(data: [User]) {
        usuarios = data
        print("Datos llegados desde la API: \(data)")
        DispatchQueue.main.async {
            self.tableUsuarios.reloadData()
        }
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
        
        //let data = usuarios?[indexPath.row] as! UsuariosCD
        
        let data = usuarios?[indexPath.row]
        if let url = URL(string: data?.avatar ?? "")  {
            cell.imgUser.load(url: url)
        }
        
        //cell.imgUser.image =
        cell.nameUser.text = data?.name
        cell.apeUser.text = data?.email
        
        
        return cell
        
    }
}

