//
//  ViewController.swift
//  MVVMCryptoExample
//
//  Created by burak ozen on 14.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var cryptoListViewModel : CryptoListViewModel!
    
    
//    var colorArray = [UIColor]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        self.colorArray = [
//            UIColor(displayP3Red: 100/255, green: 100/255, blue: 120/255, alpha: 1.0),
//            UIColor(displayP3Red: 10/255, green: 10/255, blue: 120/255, alpha: 1.0),
//            UIColor(displayP3Red: 200/255, green: 2000/255, blue: 120/255, alpha: 1.0)
//        ]
        
        getData()
        
        
    }
    
    func getData() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        WebService().downloadCurrencies( url : url) { crypos in
            if let crypos = crypos {
                
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: crypos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                }
                
            }
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoTableViewCell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(index: indexPath.row)
        
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
//        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        
        
        return cell
    }
    
    
    
}

