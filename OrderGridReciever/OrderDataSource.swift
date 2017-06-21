//
//  OrderDataSource.swift
//  OrderGridReciever
//
//  Created by Christian Pfeiffer on 18.05.17.
//  Copyright © 2017 Christian Pfeiffer. All rights reserved.
//

import UIKit

class OrderDataSource: NSObject,UITableViewDataSource {
    fileprivate let data : FirebaseRDModel
    
    override init() {
        data = FirebaseRDModel()
    }
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = OrderCell()
        let index = indexPath.row
        let entry = data.getElement(from: index)
        
        cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell")! as! OrderCell
        
        cell.Tablelabel.text = String(entry.table)
        cell.Itemlabel.text = entry.name
        cell.Pricelabel.text = entry.price
        
        
        return cell
    }

    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.numberofEntries()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let orderItem = data.getElement(from: indexPath.row)
            orderItem.ref?.removeValue()
        }
    }


}
