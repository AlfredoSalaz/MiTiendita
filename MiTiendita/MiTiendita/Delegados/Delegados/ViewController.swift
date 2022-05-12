//
//  ViewController.swift
//  Delegados
//
//  Created by Alfredo Salazar on 12/05/22.
//

import UIKit

class ViewController: UIViewController, SegundaViewControllerDelgate {

    @IBOutlet weak var lblText: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func actionRecived(_ sender: Any){
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "segundo") as! SegundaViewController
        vc.delegate = self
        present(vc, animated: true)
        
    }

    func loadData(text: String?) {
        lblText?.text = text
    }
}

