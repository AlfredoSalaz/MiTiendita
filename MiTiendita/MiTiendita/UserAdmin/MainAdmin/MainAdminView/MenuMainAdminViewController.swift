//
//  MenuMainAdminViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 27/04/22.
//

import UIKit
protocol MenuHamburguesaViewControllerDelegate {
    func hideMenuHamburguesa()
}
class MenuMainAdminViewController: UIViewController {

    @IBOutlet weak var photoUser: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var stackUsuarios: UIStackView?
    
    var presenter: MainAdminPresenterProtocol?
    var user: User?
    var delegate: MenuHamburguesaViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validateView()
        nameUser.text = user?.name
    }
    func validateView(){
        if user?.role == "admin" {
            stackUsuarios?.isHidden = false
        }else{
            stackUsuarios?.isHidden = true
        }
    }
    
    @IBAction func editUser(_ sender: Any) {
        delegate?.hideMenuHamburguesa()
        presenter?.openEditUser(user: user!, isEdditing: true)
    }
    
    @IBAction func categoryProduct(_ sender: Any) {
        delegate?.hideMenuHamburguesa()
    }
    @IBAction func productsAdmin(_ sender: Any) {
        presenter?.openListProduct()
    }
    @IBAction func registerUserAdmin(_ sender: Any) {
        
        presenter?.openEditUser(user: user!, isEdditing: false)
    }

    @IBAction func cerrarSession(_ sender: Any){
        dismiss(animated: true)
    }
    

}
