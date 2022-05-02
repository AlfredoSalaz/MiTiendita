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
    var presenter: MainAdminPresenterProtocol?
    
    var delegate: MenuHamburguesaViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func editUser(_ sender: Any) {
        delegate?.hideMenuHamburguesa()
        presenter?.openEditUser()
    }
    
    @IBAction func categoryProduct(_ sender: Any) {
        delegate?.hideMenuHamburguesa()
    }
    @IBAction func productsAdmin(_ sender: Any) {
    }
    @IBAction func userAdmin(_ sender: Any) {
    }
    @IBAction func registerUserAdmin(_ sender: Any) {
    }


}
