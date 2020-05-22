//
//  ViewController.swift
//  Bitcoin-MVVM
//
//  Created by Burak Donat on 21.04.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var currencyListViewModel: CurrencyListViewModel!
    let url = "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
        
    }
    
    func getData() {
        Webservice().downloadCurrencies(url: url) { (currencies) in
            if let currencies = currencies {
                self.currencyListViewModel = CurrencyListViewModel(currencyList: currencies)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currencyListViewModel == nil ? 0 : self.currencyListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CyriptoCell", for: indexPath) as! CurrencyTableViewCell
        let currencyViewModel = self.currencyListViewModel.currencyAtIndex(indexPath.row)
        cell.priceText.text = currencyViewModel.price
        cell.currencyText.text = currencyViewModel.name
        return cell
    }
}
