//
//  NSNumber+Utils.swift
//  Merqueo
//
//  Created by iOS Development on 12/9/15.
//  Copyright © 2015 Domicilios. All rights reserved.
//
import Foundation

extension NumberFormatter {
	
	func stringColDecimal (_ number:NSNumber?) ->String {
		locale = Locale(identifier: "es_CO")
		numberStyle = .decimal
		return  string(from: number!)!
	}
}
