//
//  asteroidRangeVC.swift
//  MVVM
//
//  Created by Nitish on 13/09/22.
//

import Foundation
import UIKit
import Charts



class asteroidRangeVC: UIViewController,ChartViewDelegate {

    //MARK: Outlets and Variables
    
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var startDateButton: UIButton!
    @IBOutlet weak var endDateButton: UIButton!
    @IBOutlet weak var toolBarView: UIToolbar!
    
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    var selectedDateTag = Int()
    lazy  var startDateText = String()
    lazy var endDateText = String()
    
    let dateFormatter = DateFormatter()
    var ChartModel =  asteroidsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         datePickerView.isHidden = true
        toolBarView.isHidden = true
        dateFormatter.dateFormat = "yyyy-MM-dd"
        activityLoader.isHidden = true
        
    }

    
    @IBAction func startDateAction(_ sender: Any) {
        datePickerView.isHidden = false
        toolBarView.isHidden = false
        selectedDateTag = 1
        startDateText = dateFormatter.string(from: datePickerView.date)
        startDateButton.setTitle(startDateText, for: .normal)
        startDateText =    startDateText.replacingOccurrences(of: " ", with: "-")
    }
    
    @IBAction func submitDataAction(_ sender: Any) {
        
        activityLoader.isHidden = false
        ChartModel.asteroidsData(startDateText, endDateText, handler: { (cloaseasteroid,asteroidCount) in
            print("result \(cloaseasteroid)")
            DispatchQueue.main.async {
                self.activityLoader.isHidden = true
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChartVC") as! ChartVC
                vc.ChartModel = self.ChartModel
                vc.closeasteroidStr = cloaseasteroid
                vc.asteroidCountStr = asteroidCount
                self.present(vc, animated: true, completion: nil)
           
            }
           })
        
    }
    @IBAction func endDateAction(_ sender: Any) {
        datePickerView.isHidden = false
        toolBarView.isHidden = false
        selectedDateTag = 2
        endDateText = dateFormatter.string(from: datePickerView.date)
        endDateButton.setTitle(endDateText, for: .normal)
        endDateText =   endDateText.replacingOccurrences(of: " ", with: "-")

    }
    
    @IBAction func doneToolBarActin(_ sender: Any) {
        
        datePickerView.isHidden = true
        toolBarView.isHidden = true
my        switch selectedDateTag {
            
        case 1:
            startDateText = dateFormatter.string(from: datePickerView.date)
            startDateText =    startDateText.replacingOccurrences(of: " ", with: "-")
            startDateButton.setTitle(startDateText, for: .normal)
            break
        case 2:
            endDateText = dateFormatter.string(from: datePickerView.date)
            endDateText =    endDateText.replacingOccurrences(of: " ", with: "-")

            endDateButton.setTitle(endDateText, for: .normal)
            break
        default:
            break
        }

    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
