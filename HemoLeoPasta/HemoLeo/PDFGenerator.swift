//
//  PDFGenerator.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 05/12/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation
import SimplePDF

class PDFGenerator {
    static var sharedPDFGenerator = PDFGenerator()
    
    private let calendarDAO = DAOCalendario.sharedDAOCalendario
    
    private init() { }
    
    func generatePDF() -> Data {
        let A4paperSize = CGSize(width: 595, height: 842)
        let pdf = SimplePDF(pageSize: A4paperSize)
        let dataArray = generateArray()
        
        pdf.setFont(UIFont.systemFont(ofSize: 9.0))
        pdf.addText("                                         Profilaxia                  Hemartrose             Dor Muscular            Hematomas               Emergencial")
        
        pdf.addTable(dataArray.count,
                     columnCount: (dataArray.first?.count)!,
                     rowHeight: 26,
                     columnWidth: 90,
                     tableLineWidth: 1,
                     font: UIFont.systemFont(ofSize: 8.0),
                     dataArray: dataArray)
        
        let pdfData = pdf.generatePDFdata()
        
        return pdfData
    }
    
    private func generateArray() -> Array<Array<String>> {
        var PDFArray: Array<Array<String>> = []
        var array: Array<String> = ["", "", "", "", "", ""]
        let arrayCalendario = calendarDAO.getEventsDictionary()
        let tuple = getDaysNum()
        let numDias = tuple[0]
        let mes = tuple[1]
        let ano = tuple[2]
        
        for i in 1...numDias {
            var stringDay = ""
            
            stringDay = (i < 10) ? "0\(i)/" : "\(i)/"
            stringDay += (mes < 10) ? "0\(mes)/\(ano)" : "\(mes)/\(ano)"
            
            let arrayDia = arrayCalendario[stringDay]
            
            if arrayDia == nil {
                array[0] = stringDay
                PDFArray.append(array)
                
            } else {
                array = makeArray(arrayDia!)
                array[0] = stringDay
                
                PDFArray.append(array)
                
            }
            
            array = ["", "", "", "", "", ""]
            
        }
        
        return PDFArray
    }
    
    private func makeArray(_ array: [String : [String]]) -> Array<String> {
        var resArray: Array<String> = ["", "", "", "", "", ""]
        
        for i in array {
            switch i.key {
            case "Profilaxia":
                resArray[1] = "X"
                
            case "Hemartrose":
                resArray[2] = getStringFromArray(i.value)
                
            case "DorMuscular":
                resArray[3] = getStringFromArray(i.value)
                
            case "Hematoma":
                resArray[4] = getStringFromArray(i.value)
                
            case "Emergencial":
                resArray[5] = i.value.first!
                
            default:
                break
            }
        }
        
        return resArray
    }
    
    private func getStringFromArray(_ array: [String]) -> String {
        var resString = ""
        
        for i in array {
            resString += "\(i.getFirstWord())"
            
            if i != array.last {
                resString += "\n"
            }
        }
        
        return resString
    }
    
    private func getDaysNum() -> [Int] {
        let date = Date()
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        if month == 2 {
            return [28, month, year]
            
        } else if (month <= 9 && month % 2 != 0) || (month >= 9 && month % 2 == 0) {
            return [31, month, year]
            
        } else {
            return [30, month, year]
            
        }
    }
}
