//
//  ListaTarjetasViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 12/05/22.
//

import UIKit
import CoreData

class ListaTarjetasViewController: UIViewController, ListaTarjetasViewControllerProtocol {
    var presenter: ListaTarjetasPresenterProtocol?
    
    var listCards: [NSManagedObject]?
    @IBOutlet weak var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.delegate = self
        presenter?.loadCards()
    }
    func onReciveListCards(data: [NSManagedObject]){
        print(data.count)
        listCards = data
        collectionView?.reloadData()
    }
    
}

extension ListaTarjetasViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listCards?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ListaTarjetaCollectionViewCell
        let data = listCards?[indexPath.row]
        
        cell.lblBanco?.text = "\(data?.value(forKey: "banco") as? String ?? "")"
        cell.lblCV?.text = "CVV: \(data?.value(forKey: "cv") as? String ?? "")"
        cell.lblNumeroTarjeta?.text = data?.value(forKey: "numero") as? String
        cell.lblUser?.text = data?.value(forKey: "nombre") as? String
        cell.lblVencimiento?.text = "Cad: \(data?.value(forKey: "vencimiento") as? String ?? "")"
        
        return cell
    }
    
    
}
