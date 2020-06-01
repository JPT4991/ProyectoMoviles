//
//  LoginController.swift
//  Waiter
//
//  Created by Danny Boloban on 5/9/20.
//  Copyright © 2020 JackWolf. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var tfUsuario: UITextField!
    @IBOutlet weak var tfPass: UITextField!
    var token = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tfUsuario.text = nil
        tfPass.text = nil
        tfUsuario.placeholder = "Usuario"
        tfPass.placeholder = "Contraseña"
    }

    @IBAction func login(_ sender: Any) {
        let alert = UIAlertController(title: "Iniciar Sesion", message: "¿Estas seguro?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style:.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
            action in
            guard let user = self.tfUsuario.text else {print("Ingresa un usuario y contraseña validos"); return}
            guard let password = self.tfPass.text else {print("Ingresa un usuario y contraseña validos"); return}
            
            let datos = DatosLogin(user:user, pass: password)
            let postRequest = LoginRequest(endpoint: "auth/local")
            postRequest.log(datos, completion: {result in
                switch result{
                case .success(let datos):
                    print("El Login fue correcto \(datos.user.email)")
                    self.token = datos.jwt
                    DispatchQueue.main.async{
                        self.performSegue(withIdentifier:"login",sender: self)
                    }
                case .failure(let err):
                    print("Ocurrio un error: \(err)")
                }
            })
        }))
        self.present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dashboardController = segue.destination as! DashboardController
        dashboardController.token = self.token
    }
    
}

