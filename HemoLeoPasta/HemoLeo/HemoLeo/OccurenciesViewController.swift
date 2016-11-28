//
//  OccurenciesViewController.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/19/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import CareKit

class OccurenciesViewController: UIViewController {
    var tableView: UITableView!
    var activity: Int!
    var button: UIButton!
    var occurencies: Array<Int> = [0, 0, 0, 0, 0, 0, 0]
    var path: String = ""
    var id: String!
    var leo: Leo!
    let color: Array<UIColor> = [UIColor(netHex: 0x54C7FC), UIColor(netHex: 0xD0011B), UIColor(netHex: 0x44DB5E), UIColor(netHex: 0xFF9600), UIColor(netHex: 0x9B59B6), UIColor(netHex: 0xA4AAB3), UIColor(netHex: 0xFFCD00)]
    
    private let codingManager = NSCodingManager.sharedNSCodingManager
    private let careCardModel = CareCardModel.sharedCareCardModel
    fileprivate let notificationsModel = NotificationsModel.sharedNotificationsModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        id = careCardModel.getActivityID(withKey: activity)
        leo = careCardModel.getLeo()
        path = "\(leo.getId())/Occurencies\(id)"
       
        tableView = UITableView(frame: CGRect(x: 0, y: height / 7.36, width: width / 1.034, height: height / 0.92), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = height / 10.51
        tableView.register(UINib(nibName: "CustomActivityCell", bundle: nil), forCellReuseIdentifier: "idCellNormal")
        tableView.clipsToBounds = true

        self.view.addSubview(tableView)
        self.getDefaultOccurencies()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func save() {
        if occurencies.allElementsAreEqual(to: 0) {
            careCardModel.removeActivity(withKey: activity)
            button.isSelected = false
            
        } else {
            careCardModel.removeActivity(withKey: activity)
            careCardModel.addActivity(withKey: activity, occurencies: occurencies)
            button.isSelected = true

        }
        
        if !codingManager.saveAnyWithPath(path: path, object: occurencies){
            print("Não foi possível salvar as ocorrências")
        }
    }
    
    func getDefaultOccurencies() {
        let occ = codingManager.getAnyWithPath(path: path)
        
        if occ != nil {
            occurencies = occ as! Array<Int>
        }
    }
}

//MARK: - Table View Delegate
extension OccurenciesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        occurencies[indexPath.row] = (occurencies[indexPath.row] == 1) ? 0 : 1
        
        print(occurencies)
        
        let cell = tableView.cellForRow(at: indexPath) as! CustomActivityCell
        
        cell.check.isHidden = cell.check.isHidden ? false : true
        
        if id == "Shot" {
            let notId = "\(leo.getId())\(indexPath.row + 1))"
            
            print(notId)
            
            if occurencies[indexPath.row] == 1 {
                notificationsModel.createNotification(title: leo.nome,
                                                      body: "Não esqueça da sua profilaxia",
                                                      weekDay: indexPath.row + 1,
                                                      id: notId)
            } else {
                notificationsModel.removeNotification(withId: notId)
                
            }
        }
        
        save()
        
    }
}

//MARK: - Table View Data Source
extension OccurenciesViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CustomActivityCell
        let cellName = self.getIndexOccurences(day: indexPath.row)
        cell = tableView.dequeueReusableCell(withIdentifier: "idCellNormal", for: indexPath as IndexPath) as! CustomActivityCell
        cell.labelNome.text = cellName
        cell.selectionStyle = .none

        cell.check.isHidden = (occurencies[indexPath.row] == 0) ? true : false
        cell.colorMark.backgroundColor = color[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
        
    }
    
    //Get the correct index of the days array
    func getIndexOccurences(day: Int) -> String {
        switch day {
        case 0:
            return "Domingo"
            
        case 1:
            return "Segunda-feira"
            
        case 2:
            return "Terça-feira"
            
        case 3:
            return "Quarta-feira"
            
        case 4:
            return "Quinta-feira"
            
        case 5:
            return "Sexta-feira"
            
        default:
            return "Sábado"
            
        }
    }
}
