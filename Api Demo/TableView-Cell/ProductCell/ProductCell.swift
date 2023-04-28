//
//  ProductCell.swift
//  Api Demo
//
//  Created by Rishi on 28/04/23.
//

import UIKit
import SDWebImage

class ProductCell: UITableViewCell {
    
    //MARK:- Configration
    static let reUseIdentifier = "ProductCell"
    static let nibName = UINib(nibName: ProductCell.reUseIdentifier, bundle: nil)

    //MARK:- IBOutlet
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductPrice: UILabel!
    
    //MARK:- OutsideVariable
    var product: ProductModel? { didSet { setUpProduct() } }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpProduct() {
        lblProductName.text = product?.Name ?? ""
        lblProductPrice.text = "100"
        bgView.layer.cornerRadius = 5.0 
        guard let url = URL(string: product?.ProductPictures?[0].PictureUrl ?? "") else {return}
        imgView.sd_setImage(with: url)
    }
    
}
