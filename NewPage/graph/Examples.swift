
import UIKit
class Examples : ScrollableGraphViewDataSource {
    private var numberOfDataItems = 12
    private var month:[String]=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
     //var blueLinePlotData: [Double] = [2,3,9,1,8,1,2,1,2,1,8,2]
     //var orangeLinePlotData: [Double] = [1,1,7,1,1,1,1,2,2,6,6,3]
    //var GreenLinePlotData: [Double] = [1,1,7,1,1,1,1,2,2,6,6,3]
    var blueLinePlotData: [Double] = []
    var orangeLinePlotData: [Double] = []
    var GreenLinePlotData: [Double] = []
    
    private lazy var xAxisLabels: [String] = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    var dotPlotData: [Double] =  []
    var barPlotData: [Double] =  []
    
    
    func dataplot (bluedata:[Double],greendata:[Double],orangedata:[Double],dotplotdata:[Double],barplotdata:[Double])
    {
        blueLinePlotData=bluedata
        orangeLinePlotData=orangedata
        GreenLinePlotData=greendata
        dotPlotData=dotplotdata
        barPlotData=barplotdata
    }
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        switch(plot.identifier) {
        case "multiBlue":
            return blueLinePlotData[pointIndex]
        case "multiBlueDot":
            return blueLinePlotData[pointIndex]
        case "multiOrange":
            return orangeLinePlotData[pointIndex]
        case "multiGreen":
            return GreenLinePlotData[pointIndex]
       case "multiOrangeSquare":
            return orangeLinePlotData[pointIndex]
        case "dot":
           return dotPlotData[pointIndex]
        case "bar":
            return barPlotData[pointIndex]
        default:
            return 0
        }
    }
    
    func label(atIndex pointIndex: Int) -> String {
        return xAxisLabels[pointIndex]
    }
    
    func numberOfPoints() -> Int {
        return numberOfDataItems
    }
    
     func createonlybarGraph(_ frame: CGRect) -> ScrollableGraphView {
         let graphView = ScrollableGraphView(frame: frame, dataSource: self)
        // Setup the second line plot.
          let plot = DotPlot(identifier: "dot")
           plot.dataPointSize = 5
           plot.dataPointFillColor = UIColor.white

             let barPlot = BarPlot(identifier: "bar")
             
             barPlot.barWidth = 20
             barPlot.barLineWidth = 1
         
             barPlot.barLineColor = UIColor(red: 12/255.0, green: 150/255.0, blue: 230/255.0, alpha: 1.0).withAlphaComponent(0.5)
             barPlot.barColor = UIColor(red: 12/255.0, green: 150/255.0, blue: 230/255.0, alpha: 1.0).withAlphaComponent(0.5)
             
             barPlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
             barPlot.animationDuration = 1.5
             
         let referenceLines = ReferenceLines()
         
         referenceLines.referenceLineLabelFont = UIFont.systemFont(ofSize: 12)
         referenceLines.referenceLineColor = UIColor.red.withAlphaComponent(0.2)
         referenceLines.referenceLineLabelColor = UIColor.white
         referenceLines.dataPointLabelColor = UIColor.white.withAlphaComponent(1)
         graphView.addReferenceLines(referenceLines: referenceLines)
         graphView.addPlot(plot: plot)
         graphView.addPlot(plot: barPlot)
         return graphView
     }
    
     func createBlueOrangeGraph(_ frame: CGRect) -> ScrollableGraphView {
        let graphView = ScrollableGraphView(frame: frame, dataSource: self)
        let blueLinePlot = LinePlot(identifier: "multiBlue")
        blueLinePlot.lineWidth = 3
        blueLinePlot.lineColor = UIColor(red: 76/255.0, green: 191/255.0, blue: 251/255.0, alpha: 1.0)
            
         blueLinePlot.lineStyle = ScrollableGraphViewLineStyle.smooth
        
        blueLinePlot.shouldFill = false
        blueLinePlot.fillType = ScrollableGraphViewFillType.solid
        blueLinePlot.fillColor = UIColor(red: 76/255.0, green: 191/255.0, blue: 251/255.0, alpha: 1.0).withAlphaComponent(0.5)
        blueLinePlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
        
       // Setup the second line plot.
        let orangeLinePlot = LinePlot(identifier: "multiOrange")
        
        orangeLinePlot.lineWidth = 3
        orangeLinePlot.lineColor = UIColor(red: 255/255.0, green: 125/255.0, blue: 120/255.0, alpha: 1.0)
        orangeLinePlot.lineStyle = ScrollableGraphViewLineStyle.smooth
        
        orangeLinePlot.shouldFill = false
        orangeLinePlot.fillType = ScrollableGraphViewFillType.solid
        orangeLinePlot.fillColor = UIColor(red: 255/255.0, green: 125/255.0, blue: 120/255.0, alpha: 1.0).withAlphaComponent(0.5)
        
        orangeLinePlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
        
        let GreenLinePlot = LinePlot(identifier: "multiGreen")
        
        GreenLinePlot.lineWidth = 3
        GreenLinePlot.lineColor = UIColor(red: 46/255.0, green: 233/255.0, blue: 98/255.0, alpha: 1.0)
        GreenLinePlot.lineStyle = ScrollableGraphViewLineStyle.smooth
        
        GreenLinePlot.shouldFill = false
        GreenLinePlot.fillType = ScrollableGraphViewFillType.solid
        GreenLinePlot.fillColor = UIColor(red: 46/255.0, green: 233/255.0, blue: 98/255.0, alpha: 1.0).withAlphaComponent(0.5)
        
        GreenLinePlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
        
        
        
          let plot = DotPlot(identifier: "dot")
          plot.dataPointSize = 5
          plot.dataPointFillColor = UIColor.white

            let barPlot = BarPlot(identifier: "bar")
            
            barPlot.barWidth = 20
            barPlot.barLineWidth = 1
        
            barPlot.barLineColor = UIColor(red: 12/255.0, green: 150/255.0, blue: 230/255.0, alpha: 1.0).withAlphaComponent(0.5)
            barPlot.barColor = UIColor(red: 12/255.0, green: 150/255.0, blue: 230/255.0, alpha: 1.0).withAlphaComponent(0.5)
            
            barPlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
            barPlot.animationDuration = 1.5
            
        let referenceLines = ReferenceLines()
        
        referenceLines.referenceLineLabelFont = UIFont.systemFont(ofSize: 12)
        referenceLines.referenceLineColor = UIColor.red.withAlphaComponent(0.2)
        referenceLines.referenceLineLabelColor = UIColor.white
        referenceLines.dataPointLabelColor = UIColor.white.withAlphaComponent(1)
        graphView.addReferenceLines(referenceLines: referenceLines)
        graphView.addPlot(plot: blueLinePlot)
        graphView.addPlot(plot: orangeLinePlot)
        graphView.addPlot(plot: GreenLinePlot)
        graphView.addPlot(plot: plot)
        graphView.addPlot(plot: barPlot)
        return graphView
    }
}
