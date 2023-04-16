//
//  ViewController.swift
//  MortgageCalculator
//
//  Created by Ramon Martinez on 2/7/23.
//

import UIKit

//picker wheel options
enum LoanDuration: String {
    case select = "Select a Duration"
    case fifteenYears = "15 Years"
    case thirtyYears = "30 Years"
    
}

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
//get the loan duration options into data to calculate
    let durationOptions = [LoanDuration.select.rawValue, LoanDuration.fifteenYears.rawValue, LoanDuration.thirtyYears.rawValue]
    var rateMap: [String: Double] = [:]
    
    var loanAmount: Int = 300000
    var rate: Double = 100.00
    var tenure: Int = 30*12

//outlets that get the data from the user
    @IBOutlet weak var homeValueTxtEntry: UITextField!
    @IBOutlet weak var downPymtTxtEntry: UITextField!
    @IBOutlet weak var mortgageAmt: UILabel!
    @IBOutlet weak var loanDurationPicker: UIPickerView!
    @IBOutlet weak var rateAPR: UILabel!
    @IBOutlet weak var mortgageLbl: UILabel!
    

    @IBAction func computeMortgageAmt(_ sender: UITextField) {
//get the text entry from the outlets and be put in a variable to calculate
        if let homeValueStr = homeValueTxtEntry.text, let downPaymentStr = downPymtTxtEntry.text {
//convert the string value of the text field into int to be calculated
            if let homeValue = Int(homeValueStr), let downPayment = Int(downPaymentStr){
                mortgageAmt.text = "$\(homeValue - downPayment)"
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        populateRateMap()
        // Do any additional setup after loading the view.
        //delegate the data
        loanDurationPicker.delegate = self
        loanDurationPicker.dataSource = self
        
    }
    
    private func populateRateMap() {
        for duration in durationOptions {
            switch duration{
            case LoanDuration.fifteenYears.rawValue:
                rateMap[LoanDuration.fifteenYears.rawValue] = 2.75
            case LoanDuration.thirtyYears.rawValue:
                rateMap[LoanDuration.thirtyYears.rawValue] = 3.00
            default:
                rateMap[LoanDuration.select.rawValue] = 100.00
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return durationOptions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return durationOptions[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch durationOptions[row]{
    case LoanDuration.fifteenYears.rawValue:
            self.tenure = 15*12
    case LoanDuration.thirtyYears.rawValue:
            self.tenure = 30*12
    default:
            self.tenure = 30*12
    }
        if let currentRate = rateMap[durationOptions[row]] {
            self.rate = currentRate
            rateAPR.text = "\(currentRate)%"
        }
    }
    @IBAction func computeMortgage(_ sender: UIButton) {
        mortgageLbl.text = "Monthly Mortgage Amount is: $\(String(format: "%.2F",Mortgage().computeMortgage(collateral: self.createCollateralModel())))"
    }
    private func createCollateralModel() -> Collateral{
        return Collateral(loanDuration: self.tenure, loanAmount: self.loanAmount, rateAPR: self.rate)
    }
    
    //Set the shouldAutorotate to False
    override open var shouldAutorotate: Bool {
        return false
    }
    //Specify the orientation
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
}

