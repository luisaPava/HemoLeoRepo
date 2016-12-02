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
    @IBOutlet weak var titleLabel: UILabel!
    
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
    fileprivate let calendarDAO = DAOCalendario.sharedDAOCalendario

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        
        self.calendar.delegate = self
        self.calendar.dataSource = self
        self.calendar.appearance.caseOptions = [.headerUsesUpperCase,.weekdayUsesUpperCase]
        self.calendar.scopeGesture.isEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        calendar.reloadData()
        calendarDAO.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension InsightsViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date) {
        print("Delegate calendar")
        guard let title = calendarDAO.getValue(at: date) else { return }
        
        print(title)
        
        titleLabel.text = title
    }
}

extension InsightsViewController: FSCalendarDataSource {
    func minimumDate(for calendar: FSCalendar) -> Date {
        return self.formatter.date(from: "01/01/2016")!
    }
    
    func maximumDate(for calendar: FSCalendar) -> Date {
        return self.formatter.date(from: "31/12/2017")!
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        return calendarDAO.events(at: date) ? 1 : 0
    }
}
