//
//  HistoryComprasViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 13/05/22.
//

import UIKit
import  CoreData

class HistoryComprasViewController: UIViewController, HistoryComprasViewControllerProtocol {
    var presenter: HistoryComprasPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getListHistory()
    }
    
    func successGetHistoryCompra(data: [NSManagedObject]) {
        
    }
    @IBAction func backAction(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
}
