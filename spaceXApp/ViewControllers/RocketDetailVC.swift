//
//  RocketDetailVC.swift
//  spaceXApp
//
//  Created by Ahmet Muhammet Vural on 28.11.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//

import UIKit
import SDWebImage
import RxSwift
import RxCocoa

class RocketDetailVC: UIViewController , UITableViewDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rocketImage: UIImageView!
     var disposeBag = DisposeBag()
    var imageRocket = String()
    var nameRocket = String()
    var titleArray = ["Detail:","Year:","Mission Name:"]
    var descArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = nameRocket
        rocketImage.sd_setImage(with: URL(string: imageRocket))
        tableViewSource()
        // Do any additional setup after loading the view.
    }
    
    func tableViewSource(){

        
            let items = Observable.just(
                (0..<titleArray.count).map { "\($0)" }
            )

            items
                .bind(to: tableView.rx.items(cellIdentifier: "DetailCell", cellType: DetailCell.self)) { (row, element, cell) in

                    let attributedWithTextColor: NSAttributedString = "\(self.titleArray[row]) \(self.descArray[row])".attributedStringWithColor(["\(self.titleArray[row])"], color:  #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1))
                    cell.titleLabel.attributedText = attributedWithTextColor
              
                    
                }
                .disposed(by: disposeBag)





        }


}
