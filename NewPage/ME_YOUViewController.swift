
import UIKit
import StoreKit
@objc class ME_YOUViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    var examples: Examples!
    @IBOutlet var view_breath: UIView!
    @IBOutlet var view_scr: UIView!
    @IBOutlet var scrollview: UIScrollView!
    @IBOutlet var lbl_dep_ver: UILabel!
    @IBOutlet var btnmenuobj: UIButton!
    @IBOutlet var viewshow: UIView!
    @IBOutlet var view_footer2: UIView!
    @IBOutlet var tb_footer: UIView!
    var blueLinePlotData: [Double] = []
    var orangeLinePlotData: [Double] = []
    var GreenLinePlotData: [Double] = []
    @IBOutlet var dep_indi: UILabel!
    @IBOutlet var lbl_depression: UILabel!
    @IBOutlet var lbl_ttscore: UILabel!
    let manager = AFHTTPRequestOperationManager()
    @IBOutlet var lbl_username: UILabel!
    var month: [String] = ["2020","2019","2018","2017","2016","2015","2014","2013","2012","2011","2010","2009","2008","2007","2006","2005","2004","2003","2002","2001","2000"]
          //   (2020...2000).map { String($0) }
    @IBOutlet var tbl_month: UITableView!
    @IBOutlet var lbl_circle: UILabel!
    @IBOutlet var btn_month_sel: UIButton!
    @IBOutlet var view_garph: UIView!
    @IBOutlet var view_footer1: UIView!
    @IBOutlet var btn_chat: UIButton!
    @IBOutlet var btn_home: UIButton!
    var sel_month:Int=0
     var sel_year:String="0"
    var graphView: ScrollableGraphView!
    var graphConstraints = [NSLayoutConstraint]()
    var label = UILabel()
    var reloadLabel = UILabel()
    var dotPlotData: [Double] =  [0,0,0,0,0,0,0,0,0,0,0,0]
    var barPlotData: [Double] =  [0,0,0,0,0,0,0,0,0,0,0,0]
    override var prefersStatusBarHidden : Bool {
        return true
    }
        
    @IBAction func btnqa(_ sender: Any)
    {
       let vc = smilepage1ViewController(nibName: "smilepage1ViewController", bundle: nil)
       self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnhome(_ sender: Any) {
       let vc = FeedViewController(nibName: "FeedViewController", bundle: nil)
       self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnchat(_ sender: Any) {
        let vc = chattypeViewController(nibName: "chattypeViewController", bundle: nil)
       self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_back(_ sender: Any) {
        let vc = FeedViewController(nibName: "FeedViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
     
    }
    @IBAction func btn_month_sel(_ sender: Any) {
        if(tbl_month.isHidden==true)
        {
            tbl_month.isHidden=false
        }
        else{
             tbl_month.isHidden=true
        }
    }

    @IBAction func sos(_ sender: Any) {
        let vc = BS1ViewController(nibName: "BS1ViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
     }
      func getPostString(params:[String:Any]) -> String
      {
            var data = [String]()
            for(key, value) in params
            {
                if(key != "")
                {
                data.append(key + "=\(value)")
                }
            }
            return data.map { String($0) }.joined(separator: "&")
        }

        func callPost(params:[String:Any])
        {
            let weburl="https://w2.sisuroot.com/servicebus/test_result.php"
            let urlString = weburl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let url = URL(string: urlString!)!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let postString = getPostString(params: params)
            request.httpBody = postString.data(using: .utf8)
            var result:(message:String, data:Data?) = (message: "Fail", data: nil)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if(error != nil)
                {
                    result.message = "Fail Error not null : \(error.debugDescription)"
                }
                else
                {
                    result.message = "Success"
                    result.data = data
                do {
                       if let jsonData = data {
                            let jsonResponse = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions()) as? NSDictionary
                            DispatchQueue.main.async {
                                self.blueLinePlotData.removeAll()
                                self.orangeLinePlotData.removeAll()
                                self.GreenLinePlotData.removeAll()
                                let results = jsonResponse!["data"] as! [String:[String:String]]
                                for n in 0...11 {
                                   self.blueLinePlotData.append(Double(results["scaleType2"]!["\(n+1)"]!)!)
                                   self.orangeLinePlotData.append(Double(results["scaleType1"]!["\(n+1)"]!)!)
                                   self.GreenLinePlotData.append(Double(results["scaleType4"]!["\(n+1)"]!)!)
                                }
                                self.examples = Examples()
                                if(Int(self.blueLinePlotData[self.sel_month-1])>Int(self.orangeLinePlotData[self.sel_month-1]))
                                {
                                    self.dotPlotData[self.sel_month-1] = self.blueLinePlotData[self.sel_month-1]
                                    self.barPlotData[self.sel_month-1] = self.blueLinePlotData[self.sel_month-1]
                                 }
                                else
                                {
                                    self.dotPlotData[self.sel_month-1] = self.orangeLinePlotData[self.sel_month-1]
                                    self.barPlotData[self.sel_month-1] = self.orangeLinePlotData[self.sel_month-1]
                                }
                                self.examples.dataplot(bluedata: self.blueLinePlotData, greendata: self.GreenLinePlotData, orangedata: self.orangeLinePlotData, dotplotdata: self.dotPlotData, barplotdata: self.barPlotData)
                                self.graphView = self.examples.createBlueOrangeGraph(self.viewshow.frame)
                                self.viewshow.insertSubview(self.graphView, belowSubview: self.reloadLabel)
                                self.lbl_ttscore.text = "Test Total Score - \(self.barPlotData[self.sel_month-1])"
                                if(self.blueLinePlotData[self.sel_month-1] == 27)
                                {
                                    self.lbl_depression.text=" Depression Complete"
                                }
                                else
                                {
                                    self.lbl_depression.text=" Depression"
                                }
                                let mm:Int = (Int(self.lbl_dep_ver.frame.size.height) * Int(self.blueLinePlotData[self.sel_month-1]))/27
                                let mm1:Int =  Int(self.lbl_dep_ver.frame.origin.y) + Int(self.lbl_dep_ver.frame.size.height) - mm
                                self.lbl_circle.frame = CGRect(x: 12, y: mm1, width: 16, height: 16)
                                self.setupConstraints()
                            }
                        }
                    }
                   catch {  print("Parse Error: \(error)")}
                 }
            }
          task.resume()
        }

        override func viewDidLoad() {
            lbl_ttscore.isHidden=true
            view_scr.frame=CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view_breath.frame.origin.y+self.view_breath.frame.size.height)
            scrollview.delegate=self
            scrollview.contentSize=CGSize(width: 0,height: self.view_scr.frame.size.height);
            let date=Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "M"
            sel_month=Int(dateFormatter.string(from: date))!
            dateFormatter.dateFormat = "YYYY"
            sel_year=dateFormatter.string(from: date)
            
            let show1 = GraphView()
            show1.frame = CGRect(x: 0, y: 0, width: tb_footer.frame.size.height, height: tb_footer.frame.size.height)
            show1.backgroundColor = UIColor.clear
            
            let show2 = GraphView1()
            show2.frame = CGRect(x: 0, y: 0, width: tb_footer.frame.size.height, height: tb_footer.frame.size.height)
            show2.backgroundColor = UIColor.clear
                    
            self.view_footer1.addSubview(show1)
            self.view_footer2.addSubview(show2)
            btn_month_sel.titleLabel?.text=sel_year
            let parameters = ["userId":UserDefaults.standard.value(forKey: "id") as! String,"year":sel_year as! String]
            callPost(params: parameters)
             
            self.tbl_month.delegate = self
            self.tbl_month.dataSource = self
            tbl_month.register(UITableViewCell.self, forCellReuseIdentifier: "SimpleTableItem")
            lbl_username.text=UserDefaults.standard.value(forKey: "username") as? String
            tbl_month.isHidden=true
            super.viewDidLoad()
            viewshow.layer.cornerRadius=10
            viewshow.layer.borderColor=UIColor(red: 63/255.0, green: 152/255.0, blue: 241/255.0, alpha: 1.0).cgColor
            viewshow.layer.borderWidth=1.0
            lbl_circle.layer.cornerRadius=8
            lbl_circle.layer.borderColor=UIColor.white.cgColor
            lbl_circle.layer.borderWidth=1.0
                     
            btn_month_sel.layer.cornerRadius=10
            btn_month_sel.layer.borderColor=UIColor(red: 63/255.0, green: 152/255.0, blue: 241/255.0, alpha: 1.0).cgColor
            btn_month_sel.layer.borderWidth=1.0
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return month.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "SimpleTableItem"
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
        cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifier)
        }
        cell.backgroundColor = UIColor(red: 0/255.0, green: 73/255.0, blue: 200/255.0, alpha: 1.0)
        cell.textLabel?.text = month[indexPath.row]
        cell.textLabel?.font = label.font.withSize(12)
        cell.textLabel?.textAlignment = NSTextAlignment.left
        cell.textLabel?.textColor =  UIColor.white
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        btn_month_sel.titleLabel?.text=month[indexPath.row]
        sel_year=month[indexPath.row]
        let parameters = ["userId":UserDefaults.standard.value(forKey: "id") as! String,"year":sel_year ]
        tbl_month.isHidden=true
        callPost(params: parameters)
    }
    
    private func setupConstraints() {
            self.graphView.translatesAutoresizingMaskIntoConstraints = false
            graphConstraints.removeAll()
        let topConstraint = NSLayoutConstraint(item: self.graphView!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewshow, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: self.graphView!, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewshow, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: self.graphView!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewshow, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: self.graphView!, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewshow, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 0)
            graphConstraints.append(topConstraint)
            graphConstraints.append(bottomConstraint)
            graphConstraints.append(leftConstraint)
            graphConstraints.append(rightConstraint)
            self.viewshow.addConstraints(graphConstraints)
        }
        
        @objc func didTap(_ gesture: UITapGestureRecognizer) {
            self.viewshow.removeConstraints(graphConstraints)
            graphView.removeFromSuperview()
            graphView = examples.createBlueOrangeGraph(self.viewshow.frame)
            self.viewshow.insertSubview(graphView, belowSubview: reloadLabel)
            setupConstraints()
        }
        
        @objc func reloadDidTap(_ gesture: UITapGestureRecognizer) {
            graphView.reload()
        }
    }
