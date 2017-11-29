//
//  SnapsViewController.swift
//  Snapchat1
//
//  Created by Mac Tecsup on 27/11/17.
//  Copyright © 2017 Tecsup. All rights reserved.
//

import UIKit
import Firebase

class SnapsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var snaps : [Snap] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        Database.database().reference().child("usuarios").child(Auth.auth().currentUser!.uid).child("snaps").observe(DataEventType.childAdded, with: {(snaphot)in
            
        let snap = Snap()
        
            snap.imagenURL = (snaphot.value as! NSDictionary)["imagenURL"] as! String
            snap.from = (snaphot.value as! NSDictionary)["from"] as! String
            snap.descrip = (snaphot.value as! NSDictionary)["descripcion"] as! String
            snap.id = snaphot.key
           
            
        self.snaps.append(snap)
        self.tableView.reloadData()
        
        })
        Database.database().reference().child("usuarios").child(Auth.auth().currentUser!.uid).child("snaps").observe(DataEventType.childRemoved, with: {(snapshot) in
            var iterador = 0
            for snap in self.snaps{
                if snap.id == snapshot.key{
                    self.snaps.remove(at: iterador)
                    
                }
                iterador += 1
                
            }
            self.tableView.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snaps.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
            let cell = UITableViewCell()
            let snap = snaps[indexPath.row]
            cell.textLabel?.text = snap.from
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let snap = snaps[indexPath.row]
        performSegue(withIdentifier: "versnapsegue", sender: snap)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "versnapsegue" {
            let siguenteVC = segue.destination as! VerSnapViewController
            siguenteVC.snap = sender as! Snap
            
        }
    }
    

    @IBAction func cerrarSesionTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
