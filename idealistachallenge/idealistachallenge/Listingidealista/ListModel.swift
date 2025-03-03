//
//  ListModel.swift
//  idealistachallenge
//
//  Created by Muhammad Yasir on 25/02/2025.
//

//convert JSON to Model classes
//https://app.quicktype.io/



import Foundation



// MARK: - WelcomeElement
struct ListElementIdealista: Codable {
    let propertyCode: String
    let thumbnail: String
    let floor: String
    let price: Int
    let priceInfo: PriceInfo
    let propertyType, operation: String
    let size: Int
    let exterior: Bool
    let rooms, bathrooms: Int
    let address, province, municipality, district: String
    let country, neighborhood: String
    let latitude, longitude: Double
    let description: String
    let multimedia: Multimedia
    let features: Features
    let parkingSpace: ParkingSpace?
}

// MARK: - Features
struct Features: Codable {
    let hasAirConditioning, hasBoxRoom: Bool
    let hasSwimmingPool, hasTerrace, hasGarden: Bool?
}

// MARK: - Multimedia
struct Multimedia: Codable {
    let images: [Image]
}

// MARK: - Image
struct Image: Codable {
    let url: String
    let tag: String
}

// MARK: - ParkingSpace
struct ParkingSpace: Codable {
    let hasParkingSpace, isParkingSpaceIncludedInPrice: Bool
}

// MARK: - PriceInfo
struct PriceInfo: Codable {
    let price: Price
}

// MARK: - Price
struct Price: Codable {
    let amount: Int
    let currencySuffix: String
}

//typealias Welcome = [ListIdealista]


func getDummyModel()->ListElementIdealista{
    let feature = Features(hasAirConditioning:true, hasBoxRoom:true, hasSwimmingPool:false, hasTerrace:false, hasGarden:false)
    
    let price = PriceInfo(price: Price(amount:300, currencySuffix:"$"))
    
    let multimedia = Multimedia(images: [Image(url:"www.healthy.com", tag:"Abc345")])
    
    let item = ListElementIdealista(propertyCode:"abc", thumbnail:"abc", floor:"4", price:345, priceInfo:price, propertyType:"house", operation:"Not available", size:4, exterior: false, rooms: 3, bathrooms: 2, address:"rua da caravalho", province:"Vila Real", municipality: "No", district:"Vila Real", country:"PT", neighborhood:"Avenida", latitude:34.90, longitude: 35.87, description:"Some description goes in here", multimedia:multimedia, features:feature, parkingSpace:nil)
    
    return item
}
