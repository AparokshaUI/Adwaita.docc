//
//  Binding.swift
//  Subtasks
//

import Adwaita

extension Binding: CustomStringConvertible where Value: CustomStringConvertible {

    public var description: String {
        wrappedValue.description
    }

}
