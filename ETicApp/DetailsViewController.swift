//
//  DetailsViewController.swift
//  ETicApp
//
//  Created by Bilal Candemir on 29.11.2019.
//  Copyright © 2019 Bilal Candemir. All rights reserved.
//

import UIKit
import Firebase
import NVActivityIndicatorView
class DetailsViewController: UIViewController, NVActivityIndicatorViewable {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var addBasket: UIButton!
    var choosenIndex = Int()
    @IBAction func add(_ sender: Any) {
        getBasketData { (succes) in
            if succes{
                self.stopAnimating()
                self.alert()
            }
        }
    }
    @IBOutlet weak var productPriceLabel: UILabel!
    
    var selectedProductNames = ""
    var selectedProductPictures = UIImage()
    var selectedProductPrice = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        productNameLabel.text = selectedProductNames
        productImage.image = selectedProductPictures
        productPriceLabel.text = String(selectedProductPrice) + "TL"
        self.title = selectedProductNames
        
    }
    
    func alert(){
        let alert = UIAlertController(title: "İşlem Başarılı", message: "Ürün Sepetinize Eklendi", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func getBasketData(complation: @escaping (_ succes:Bool) -> ()){
        let size = CGSize(width: 30.0, height: 30.0)
        self.startAnimating(size, message: "Yükleniyor", color: .blue, textColor: .white, fadeInAnimation: nil)
        let ref = Database.database().reference().child("Basket")
        let basketInfo = ["ProductName": selectedProductNames, "ProductPrice": selectedProductPrice] as [String : Any]
        ref.child("\(choosenIndex)").setValue(basketInfo)
        complation(true)
    }


}