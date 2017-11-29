//
//  VisitaViewController.swift
//  fc_practica5
//
//  Created by Carlos Villa on 23/11/2017.
//  Copyright © 2017 Carlos Fernando. All rights reserved.
//

import UIKit

class VisitaViewController: UIViewController {

    @IBOutlet weak var imagen: UIImageView!
    var info: Visit?
    var idSalesmen = ""
    var idCustomer = ""
    var fans = [Visit]()
    var customerName = ""
    var salesmanName = ""
    var fanText = ""
    @IBOutlet weak var ayuda: UIButton!
    @IBOutlet weak var target: UILabel!
    @IBOutlet weak var fansButton: UIButton!
    @IBOutlet weak var salesManButton: UIButton!
    @IBOutlet weak var customerButton: UIButton!
    var estado = true
    @IBAction func ayuda(_ sender: UIButton) {
        if estado {
            estado = false
            salesManButton.setTitle("haz click aqui", for: .normal)
            customerButton.setTitle("haz click aqui", for: .normal)
            fansButton.setTitle("haz click aqui para ver los fans de esta Visita", for: .normal)
            ayuda.setTitle("ocultar", for: .normal)
        }else{
            estado = true
            salesManButton.setTitle(salesmanName, for: .normal)
            customerButton.setTitle(customerName, for: .normal)
            fansButton.setTitle(fanText, for: .normal)
            ayuda.setTitle("ayuda", for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let salesman = info!["Salesman"] as? [String:Any], let id = salesman["id"]{
            idSalesmen = String(describing: id)
            if let name = salesman["fullname"] as? String{
                salesmanName = name
                salesManButton.setTitle(salesmanName, for: .normal)
            }
            print(id)
        }
        if let customer = info!["Customer"] as? [String:Any], let id = customer["id"]{
            idCustomer = String(describing: id)
           if let name = customer["name"] as? String{
                customerName = name
                customerButton.setTitle(customerName, for: .normal)
            }
            print(id)
        }
        if let fan = info!["Fans"] as? [Visit]{
            fans = fan
            let numero = String(fans.count)
            fanText = "\(numero) fans"
            fansButton.setTitle(fanText, for: .normal)
        }
        if let targets = info!["Targets"] as? [Visit] ,targets.count != 0, let targetOne = targets[targets.count-1] as? Visit , let targetType = targetOne["TargetType"] as? Visit, let name = targetType["name"] as? String{
            target.text = "Motivo: \(name)"
        }
       // imagen = UIImage(named: "no face")
        putPhoto()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func putPhoto(){
        if let salesman = info!["Salesman"] as? [String:Any], let photo = salesman["Photo"] as? [String:Any], let strurl = photo["url"] as? String {
            
            if let img = imgCache[strurl] {
                imagen.image = img
            }else{
                updatePhoto(strurl)
            }
            //imagen.setNeedsDisplay()
           // imagen.reloadInputViews()
        }
    }
  

    
    func updatePhoto(_ strurl: String){
        //Cola global
        DispatchQueue.global().async {
            if let url = URL(string: strurl), let data = try? Data(contentsOf: url), let img = UIImage(data: data){
                self.imagen.image = img

                //propiedades o interfaz de usuario, para acceder a las propiedades -> self
                DispatchQueue.main.async {
                    imgCache[strurl] = img
                    
                }
        
            }
        }
        
        
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
