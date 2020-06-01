//
//  FoodViewController.swift
//  Waiter
//
//  Created by Danny Boloban on 5/10/20.
//  Copyright © 2020 JackWolf. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    var thumbnails: [Thumbnail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://arturogil.com.mx/api/platillos"
        getData(from: url)
        
        thumbnails = createArray()
        
    }
    
    private func getData(from url: String){
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            guard let data = data, error == nil else {
                print("Algo salio mal")
                return
            }
            var result: [Response]?
            do {
                result = try JSONDecoder().decode([Response].self, from: data)
            }
            catch {
                print("Ha ocurrido un error \(error)")
            }
            
            guard let json = result else {
                return
            }
            for element in json{
                print(element)
                print(element.nombre)
                print(element.imagen)
            }
            
        })
        task.resume()
    }
    
    struct Response: Codable {
        let nombre:String
        let descripcion:String
        let costo:Int
        let imagen:Imagen
    }
    
    struct Imagen: Codable {
        let url:String
    }
    

    

    func createArray() -> [Thumbnail] {
        /*var food: [Thumbnail] = []
        for element in json {
            let precio = String("$\(element.costo)")
            let imageURL = "https://arturogil.com.mx/api\(element.imagen)"
            let thumb = Thumbnail(image: imageURL, title: element.nombre, price: precio, descripcion: element.descripcion)
            food.append(thumb)
        }*/
        
        let thumb1 = Thumbnail(image: #imageLiteral(resourceName: "bistec-asado"), title: "Bistec Asado", price: "$68", descripcion: "Corte suave y sin grasa de bistec que viene acompañado de dos guarniciones saludables e incluye 5 tortillas. Ideal para llevar a cabo tu régimen alimenticio")
        let thumb2 = Thumbnail(image: #imageLiteral(resourceName: "burguer"), title: "Hamburguesa", price: "$65", descripcion: "Nuestra hamburguesa lleva lechuga, jitomate, cebolla y viene acompañada de papas a la francesa")
        let thumb3 = Thumbnail(image: #imageLiteral(resourceName: "Tiras-de-carne_c3f032168d"), title: "Fajitas de carne", price: "$68", descripcion: "Fajitas de res que vienen con su típico pimiento morrón, cebolla y con nuestra receta que contiene poca sal. Acompañadas de dos guarniciones e incluye 5 tortillas")
        let thumb4 = Thumbnail(image: #imageLiteral(resourceName: "ensalada"), title: "Ensalada de pollo", price: "$70", descripcion: "Nuestra ensalada llevará lo que es una variedad de cosas como lo que es lechuga, crotones, jicama, nuez, un poco de nuestro aderezo, jitomate y por supuesto pollo")
        let thumb5 = Thumbnail(image: #imageLiteral(resourceName: "pepsi"), title: "Pepsi de lata", price: "$18", descripcion: "Refresco enlatado frío o al tiempo")
        
        
        return [thumb1, thumb2, thumb3, thumb4, thumb5]
    }


}



extension FoodViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thumbnails.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let thumbnail = thumbnails[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell") as! FoodCell
        cell.setThumbnail(thumbnail: thumbnail)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Details") as? DetailViewController
        vc?.imagen = thumbnails[indexPath.row].image
        vc?.name = thumbnails[indexPath.row].title
        vc?.precio = thumbnails[indexPath.row].price
        vc?.descripcion = thumbnails[indexPath.row].description
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}


