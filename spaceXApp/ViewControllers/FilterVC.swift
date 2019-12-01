//
//  FilterVC.swift
//  spaceXApp
//
//  Created by Ahmet Muhammet Vural on 1.12.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//

import UIKit

protocol filterRocket {
    func filterData(index:Int)
}

class FilterVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var baseView: UIView!
    let filterList = ["Oldest", "Latest"]
    var delegate: filterRocket?

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(selectedID, inComponent: 0, animated: true)
        view.isOpaque = false
        view.backgroundColor = .clear
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.blurEffect(view: self.baseView)
        }
        roundCorners(corners: [.layerMaxXMinYCorner, .layerMinXMinYCorner], radius: 40, view: filterView)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        baseView.addGestureRecognizer(tap)
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        dismissView()
    }
    
    func dismissView(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
           
            self.removeBlurEffenct(view: self.baseView)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filterList.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return filterList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
       
        selectedID = row
        delegate?.filterData(index: row)
        dismissView()
    }

}
