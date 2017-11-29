//
//  ViewController.swift
//  fc_practica5
//
//  Created by Carlos Villa on 23/11/2017.
//  Copyright © 2017 Carlos Fernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ayuda: UIButton!
    @IBOutlet weak var texto1: UILabel!
    @IBOutlet weak var texto2: UILabel!
    @IBOutlet weak var texto3: UILabel!
    var oculto = true
    @IBAction func ayuda(_ sender: UIButton) {
        if oculto{
             ayuda.setTitle("Ocultar", for: .normal)
            texto1.isHidden = false
            texto2.isHidden = false
            texto3.isHidden = false
            oculto = false
        }else{
            ayuda.setTitle("Ayuda", for: .normal)
            texto1.isHidden = true
            texto2.isHidden = true
            texto3.isHidden = true
            oculto = true
        }
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "all"{
            if let visitasDestination = segue.destination as? DatesViewController{
                    visitasDestination.extensionUrl = "visits/flattened"
                    visitasDestination.titulo = "Todas las visitas"
                    visitasDestination.tipoDeTabla = "normal"
            }
        }else if segue.identifier == "mine"{
            if let visitasDestination = segue.destination as? DatesViewController{
                visitasDestination.extensionUrl = "users/tokenOwner/visits/flattened"
                visitasDestination.titulo = "Mis visitas"
                visitasDestination.tipoDeTabla = "normal"

            }
        }else if segue.identifier == "fav"{
            if let visitasDestination = segue.destination as? DatesViewController{
                visitasDestination.extensionUrl = "visits/flattened"
                visitasDestination.fav = true
                visitasDestination.titulo = "Favoritas"
                visitasDestination.tipoDeTabla = "normal"
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
    @IBAction func exit(_ segue: UIStoryboardSegue){
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
