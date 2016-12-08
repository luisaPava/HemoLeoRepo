//
//  InsightsViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 01/12/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import FSCalendar

class InsightsViewController: UIViewController {
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contraintsHeight: NSLayoutConstraint!
    
    fileprivate let calendarDAO = DAOCalendario.sharedDAOCalendario
    fileprivate var arraySectionsName: [String] = []
    fileprivate var arraySections: [[String]] = []
    private let pdfGenerator = PDFGenerator.sharedPDFGenerator

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50

        self.calendar.delegate = self
        self.calendar.dataSource = self
        self.calendar.appearance.caseOptions = [.headerUsesUpperCase, .weekdayUsesUpperCase]
        self.calendar.scopeGesture.isEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        calendar.reloadData()
        
        if let date = calendarDAO.lastDate {
            tableViewSetup(date)
            
        } else {
            tableViewSetup(Date())
            
        }
        
        calendarDAO.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func exportToPDF(_ sender: UIBarButtonItem) {
        let pdf = pdfGenerator.generatePDF()
        
        let activity = UIActivityViewController(activityItems: [pdf], applicationActivities: nil)
        activity.popoverPresentationController?.sourceView = self.view
        present(activity, animated: true, completion: nil)
    }
    
    //Populate arrays used on the table view
    func tableViewSetup(_ date: Date) {
        arraySections = []
        arraySectionsName = []
        
        guard let testArray = calendarDAO.getValues(at: date) else {
            arraySections = []
            arraySectionsName = []
            
            return
        }
        
        for array in testArray {
            arraySections.append(array.value)
            arraySectionsName.append(array.key.rawValue)
        }
    }
}

extension InsightsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arraySectionsName[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arraySectionsName.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraySections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resumoCell", for: indexPath as IndexPath) as! ResumoTableViewCell
        
        cell.resumoLabel.text = arraySections[indexPath.section][indexPath.row]
        cell.resumoLabel.lineBreakMode = .byWordWrapping
        cell.resumoLabel.numberOfLines = 0
        
        return cell
    }
}

extension InsightsViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date) {
        calendarDAO.lastDate = date
        tableViewSetup(date)
        tableView.reloadData()
    }
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        contraintsHeight.constant = bounds.height
        view.layoutIfNeeded()
    }
}

extension InsightsViewController: FSCalendarDataSource {
    func minimumDate(for calendar: FSCalendar) -> Date {
        return formatter.date(from: "01/01/2016")!
    }
    
    func maximumDate(for calendar: FSCalendar) -> Date {
        return formatter.date(from: "31/12/2017")!
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        return calendarDAO.events(at: date) ? 1 : 0
    }
}
