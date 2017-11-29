//
//  DatesViewController.swift
//  fc_practica5
//
//  Created by Carlos Villa on 24/11/2017.
//  Copyright © 2017 Carlos Fernando. All rights reserved.
//

import UIKit

class DatesViewController: UIViewController {
  //https://dcrmt.herokuapp.com/api/visits/flattened?token=232a6ff08c235306c577&dateafter=2017-09-11
    @IBOutlet weak var datePicker1: UIDatePicker!
    @IBOutlet weak var datePicker2: UIDatePicker!
    var tipoDeTabla: String?
    var extensionUrl: String?
    var titulo: String?
    var fav = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var s: UISwitch!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Visitas Fechas"{
            if let visitasDestination = segue.destination as? VisitsTableViewController{
                visitasDestination.extensionUrl = extensionUrl
                visitasDestination.navegationBar.title = titulo
                visitasDestination.tipoDeTabla = tipoDeTabla
                if (s.isOn){
                    
                    let calendar = Calendar.current
                    let year1 = calendar.component(.year, from: datePicker1.date)
                    let month1 = calendar.component(.month, from: datePicker1.date)
                    let day1 = calendar.component(.day, from: datePicker1.date)
                    let year2 = calendar.component(.year, from: datePicker2.date)
                    let month2 = calendar.component(.month, from: datePicker2.date)
                    let day2 = calendar.component(.day, from: datePicker2.date)
                    //&dateafter=2017-09-11&datebefore=2017-10-30
                    if fav {
                        visitasDestination.argumentosAdicionales = "&dateafter=\(year1)-\(month1)-\(day1)&datebefore=\(year2)-\(month2)-\(day2)&favourites=1"
                    }else{
                        visitasDestination.argumentosAdicionales = "&dateafter=\(year1)-\(month1)-\(day1)&datebefore=\(year2)-\(month2)-\(day2)"
                    }

                }else{
                    if fav {
                        visitasDestination.argumentosAdicionales = "&favourites=1"
                    }
                }
                
                
                
                
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "Visitas Fechas" && s.isOn {
            if (datePicker1.date > datePicker2.date){
                let alertController = UIAlertController(title: "Fechas erroneas", message: "La primera no puede ser mayor que la segunda", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true)
                return false
            }
        }
        return true
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
