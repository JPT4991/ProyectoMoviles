//
//  DetailViewController.swift
//  Waiter
//
//  Created by Danny Boloban on 31/05/20.
//  Copyright © 2020 JackWolf. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var Nombre: UILabel!
    
    @IBOutlet weak var Imagen: UIImageView!
    
    
    @IBOutlet weak var Descripcion: UITextView!
    
    @IBOutlet weak var Precio: UILabel!
    
    
    var imagen = UIImage()
    var name = ""
    var descripcion = ""
    var precio = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Nombre.text = name
        Imagen.image = imagen
        Descripcion.text = descripcion
        Precio.text = precio
        
    }
    

    @IBAction func Agregar(_ sender: Any) {
    }
}
