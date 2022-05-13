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
    var tarjeta = TarjetaModel.shared
    var user = User.shared
    var listCards: [NSManagedObject]?
    
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var btnAddTarjeta: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.delegate = self
        //presenter?.loadCards()
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter?.loadCards()
    }
    func onReciveListCards(data: [NSManagedObject]){
        print(data.count)
        var lis: [NSManagedObject] = []
        data.forEach{
            print("id: \($0.value(forKey: "userId") as? Int) \(user.id)")
            if $0.value(forKey: "userId") as? Int == user.id{
                lis.append($0)
            }
        }
        listCards = lis
        print("lista\(listCards?.count)")
        collectionView?.reloadData()
    }
    @IBAction func addNewTarjeta(_ sender: Any){
        
        presenter?.loadDetailCard(isEditt: false, data: nil)
    }
    @IBAction func backAction(_ sender: Any){
        dismiss(animated: true, completion: nil)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = listCards?[indexPath.row]
        tarjeta.banco = data?.value(forKey: "banco") as? String
        tarjeta.cv = data?.value(forKey: "cv") as? String
        tarjeta.nombre = data?.value(forKey: "nombre") as? String
        tarjeta.numero = data?.value(forKey: "numero") as? String
        tarjeta.saldo = data?.value(forKey: "saldo") as? Decimal
        tarjeta.userId = data?.value(forKey: "userId") as? Int
        tarjeta.vencimiento = data?.value(forKey: "vencimiento") as? String
        presenter?.loadDetailCard(isEditt: true, data: data!)
    }
}
