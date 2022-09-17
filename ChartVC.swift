//
//  ChartVC.swift
//  MVVM
//
//  Created by Nitish on 15/09/22.
//

import UIKit
import Charts

class ChartVC: UIViewController {

    //********CHART VARIABLES**************//

    var totalWins: Double = 0.0
    var totalDraws: Double = 0.0
    var totalLosses: Double = 0.0
    
    @IBOutlet weak var totalNumasteroid: UILabel!
    
    @IBOutlet weak var barChart: BarChartView!

    @IBOutlet weak var closeasteroid: UILabel!
    var ChartModel =  asteroidsViewModel()

  lazy  var closeasteroidStr = String()
    lazy var asteroidCountStr = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: Charts
        
        let xaxis = self.barChart.xAxis
        //xaxis.valueFormatter = axisFormatDelegate
        xaxis.drawGridLinesEnabled = true
        xaxis.labelPosition = .bottom
        xaxis.centerAxisLabelsEnabled = true
        xaxis.axisMinimum = 10
        xaxis.axisMaximum = 7
        xaxis.centerAxisLabelsEnabled = true
        xaxis.valueFormatter = IndexAxisValueFormatter(values: self.ChartModel.asteroiDatedCount)
        xaxis.granularity = 1

        self.setChart()
        totalNumasteroid.text = asteroidCountStr
        closeasteroid.text = closeasteroidStr
    }
    

    func setChart() {

        var dataEntries: [BarChartDataEntry] = []

        for i in 0 ..< ChartModel.asteroidCount.count {

                let dataEntry = BarChartDataEntry(x: Double(i) , y: Double(ChartModel.asteroidCount[i]))
                dataEntries.append(dataEntry)
            
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Asteroid")

            let dataSets: [BarChartDataSet] = [chartDataSet]
                chartDataSet.colors = [UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]

            let chartData = BarChartData(dataSets: dataSets)

            let groupSpace = 0.5
            let barSpace = 0.02
            let barWidth = 0.2

            let groupCount = 5
            let startYear = 0

            chartData.barWidth = barWidth;
        barChart.xAxis.axisMinimum = Double(startYear)
            let gg = chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        barChart.xAxis.axisMaximum = Double(startYear) + gg * Double(groupCount)
            chartData.groupBars(fromX: Double(startYear), groupSpace: groupSpace, barSpace: barSpace)
        barChart.notifyDataSetChanged()
        barChart.data = chartData
            //background color
        barChart.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)

            //chart animation
        barChart.animate(xAxisDuration: 1.5, yAxisDuration: 1.5, easingOption: .linear)
        
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
