//
//  ViewController.swift
//  spaceXApp
//
//  Created by Ahmet Muhammet Vural on 26.11.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//

import UIKit
import SVProgressHUD
import RxSwift
import RxCocoa
import SDWebImage
import FontAwesome_swift

class RocketListVC: UIViewController, UITableViewDelegate, filterRocket {

    
    
    @IBOutlet weak var filterOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterOutlet.titleLabel?.font = UIFont.fontAwesome(ofSize: 30, style: .solid)
        filterOutlet.setTitle(String.fontAwesomeIcon(name: .sort), for: .normal)
        getRockets()
       
    }
    
    func getRockets(){
        ApiClient.shared.listRockets().observe(onStart: {
            SVProgressHUD.show()
        }, onEnd: {
            SVProgressHUD.dismiss()
        }, onSuccess: { (result) in
            
            result.forEach({ (list) in
                print(list)
                RocketArray.append((rocket_id: list.rocket.rocket_id!, rocket_name: list.rocket.rocket_name!, rocket_type: list.rocket.rocket_type!, mission_name: list.mission_name, launch_year: list.launch_year, mission_patch_small: list.links.mission_patch_small!, mission_patch: list.links.mission_patch!, details: list.details ?? "Not Found" ))
                
            })
            self.tableViewSource()

            
        }) { (erorr) in
            print(erorr)
        }
    }
    func tableViewSource(){
            let items = Observable.just(
                (0..<RocketArray.count).map { "\($0)" }
            )

            items
                .bind(to: tableView.rx.items(cellIdentifier: "RoketsCell", cellType: RoketsCell.self)) { (row, element, cell) in
                       
                 
                    cell.titleLabel?.text = RocketArray[row].rocket_name
                    cell.detailLabel.text = RocketArray[row].launch_year
                    cell.rocketImage.sd_setImage(with: URL(string: RocketArray[row].mission_patch_small))
                }
                .disposed(by: disposeBag)


            tableView.rx
                .modelSelected(String.self)
                .subscribe(onNext:  { value in
                    let detailVC = self.storyboard!.instantiateViewController(withIdentifier: "RocketDetailVC") as! RocketDetailVC
                    detailVC.modalPresentationStyle = .pageSheet
                    detailVC.imageRocket = RocketArray[Int(value)!].mission_patch
                    detailVC.nameRocket = RocketArray[Int(value)!].rocket_name
                    detailVC.descArray.append(RocketArray[Int(value)!].details)
                    detailVC.descArray.append(RocketArray[Int(value)!].launch_year)
                    detailVC.descArray.append(RocketArray[Int(value)!].mission_name)
                    self.navigationController!.pushViewController(detailVC, animated: true)
                })
                .disposed(by: disposeBag)


        }

    @IBAction func filterButton(_ sender: Any) {
        let filterVC = self.storyboard!.instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
        filterVC.modalPresentationStyle = .overCurrentContext
        filterVC.delegate = self
        self.present(filterVC, animated: true, completion: nil)
    }
    
    
    func filterData(index: Int) {
        
        switch index {
        case 0:
             let sortedRockets = RocketArray.sorted { $0.launch_year < $1.launch_year }
             RocketArray = sortedRockets
             tableView.reloadData()
        case 1:
            let sortedRockets = RocketArray.sorted { $0.launch_year > $1.launch_year }
            RocketArray = sortedRockets
            tableView.reloadData()
        default:
            let sortedRockets = RocketArray.sorted { $0.launch_year < $1.launch_year }
            RocketArray = sortedRockets
            tableView.reloadData()
        }
        
        
        
    }
}




