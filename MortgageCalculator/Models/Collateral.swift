//
//  Collateral.swift
//  MortgageCalculator
//
//  Created by Ramon Martinez on 2/7/23.
//

import Foundation

class Collateral {
    var loanDuration: Int
    var loanAmount: Int
    var rateAPR: Double
    
    
    init(loanDuration: Int, loanAmount: Int, rateAPR: Double) {
        self.loanAmount = loanAmount
        self.loanDuration = loanDuration
        self.rateAPR = rateAPR
    }
}
