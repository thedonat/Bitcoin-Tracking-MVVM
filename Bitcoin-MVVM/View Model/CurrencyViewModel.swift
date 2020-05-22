//
//  CurrencyViewModel.swift
//  Bitcoin-MVVM
//
//  Created by Burak Donat on 21.04.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

struct CurrencyListViewModel {
    let currencyList: [Currency]
}

extension CurrencyListViewModel {
    func numberOfRowsInSection() -> Int {
         return self.currencyList.count
     }
     
     func currencyAtIndex(_ index: Int) -> CurrencyViewModel {
         let crypto = self.currencyList[index]
         return CurrencyViewModel(currency: crypto)
     }
}

struct CurrencyViewModel {
    let currency: Currency
}

extension CurrencyViewModel {
    var name: String {
         return self.currency.currency
     }
     
     var price: String {
         return self.currency.price
     }
}
