//
//  Mortgage.swift
//  MortgageCalculator
//
//  Created by Ramon Martinez on 2/7/23.
//

import Foundation

class Mortgage {
    public func computeMortgage(collateral: Collateral) -> Double {
        let interestRate = collateral.rateAPR/(100*12)
        return (Double(collateral.loanAmount) * interestRate)/(1-pow(1/(1+interestRate), Double (collateral.loanDuration)))
    }
}
