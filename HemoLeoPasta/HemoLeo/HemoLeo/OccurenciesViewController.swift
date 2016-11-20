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
    var path = ""
    let color: Array<UIColor> = [.blue, .green, .red, .yellow, .black, .lightGray, .orange]
    
    private let codingManager: NSCodingManager = NSCodingManager.sharedNSCodingManager
    private let careCardModel = CareCardModel.sharedCareCardModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        path = "\(careCardModel.getLeo().getId())/Occurencies"
       
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

    
    @IBAction func save(sender: AnyObject) {
        if occurencies.allElementsAreEqual(to: 0) {
            careCardModel.removeActivity(activity)
            button.isSelected = false
            
        } else {
            careCardModel.removeActivity(activity)
            careCardModel.addActivity(activity, occurencies)
            button.isSelected = true

        }
        
        if !codingManager.saveAnyWithPath(path: path, object: occurencies){
            print("Não foi possível salvar as ocorrências")
        }
        
        dismiss(animated: true, completion: nil)
        
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
        
    }
}

//MARK: - Table View Data Source
extension OccurenciesViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CustomActivityCell
        let cellName = self.getIndexOccurences(day: indexPath.row)
        cell = tableView.dequeueReusableCell(withIdentifier: "idCellNormal", for: indexPath as IndexPath) as! CustomActivityCell
        cell.labelNome.text = cellName

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
