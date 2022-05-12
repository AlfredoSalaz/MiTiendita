//
//  SegundaViewController.swift
//  Delegados
//
//  Created by Alfredo Salazar on 12/05/22.
//

import UIKit

class SegundaViewController: UIViewController {

    @IBOutlet weak var txtMensaje: UITextField?
    var delegate: SegundaViewControllerDelgate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func actionEnviar(_ sender: Any){
        delegate?.loadData(text: txtMensaje?.text)
        dismiss(animated: true, completion: nil)
    }
}
protocol SegundaViewControllerDelgate {
    func loadData( text: String?)
}
