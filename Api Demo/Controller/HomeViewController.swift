//
//  ViewController.swift
//  Api Demo
//
//  Created by Rishi on 01/02/23.
//

import UIKit

class HomeViewController: UIViewController {

   
    @IBOutlet weak var tblView: UITableView!
    
    let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.vc = self
        homeViewModel.getOfferData()
        tblView.register(ProductCell.nibName, forCellReuseIdentifier: ProductCell.reUseIdentifier)
        tblView.dataSource = self
    }


}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeViewModel.arrProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reUseIdentifier, for: indexPath) as? ProductCell {
            let product = homeViewModel.arrProducts[indexPath.row]
            cell.product = product
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

