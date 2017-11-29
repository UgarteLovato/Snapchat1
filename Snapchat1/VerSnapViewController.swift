//
//  VerSnapViewController.swift
//  Snapchat1
//
//  Created by Mac Tecsup on 28/11/17.
//  Copyright © 2017 Tecsup. All rights reserved.
//
import Firebase
import UIKit
import SDWebImage

class VerSnapViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var snap = Snap()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text? = snap.descrip
        imageView.sd_setImage(with: URL(string: snap.imagenURL))

    }
    override func viewWillDisappear(_ animated: Bool) {
        Database.database().reference().child("usuarios").child(Auth.auth().currentUser!.uid).child("snaps").child(snap.id).removeValue()
        
    
        
    }
    
    
}
