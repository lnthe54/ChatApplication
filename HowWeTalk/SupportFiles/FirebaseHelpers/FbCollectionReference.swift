//
//  FbCollectionReference.swift
//  Udemy-Messenger
//
//  Created by The Ngoc on 2022/07/04.
//

import Foundation
import FirebaseFirestore

enum FbCollectionReference: String {
    case User
    case Recent
}

func FirebaseReference(_ collectionRefer: FbCollectionReference) -> CollectionReference {
    return Firestore.firestore().collection(collectionRefer.rawValue)
}
