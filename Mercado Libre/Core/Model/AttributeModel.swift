//
//  AttributeModel.swift
//  Mercado Libre
//
//  Created by Andre Ikeda on 17/10/19.
//  Copyright © 2019 Andre Ikeda. All rights reserved.
//

class AttributeModel {
    let name: String
    let valueId: String?
    let valueName: String?
    let attributeGroupId: String
    let attributeGroupName: String
    let id: String
    
    init(id: String, name: String, valueId: String?, valueName: String?, attributeGroupId: String, attributeGroupName: String) {
        self.id = id
        self.name = name
        self.valueId = valueId
        self.valueName = valueName
        self.attributeGroupId = attributeGroupId
        self.attributeGroupName = attributeGroupName
    }
}
