//
//  CoreDataManager.swift
//  Navigation
//
//  Created by gleb on 12/08/2023.
//

import Foundation
import UIKit
import CoreData

final class CoreDataManager {

    static let shared = CoreDataManager()
    public var savedPosts = [FavoritesModel]()
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    var viewContext: NSManagedObjectContext {
        if let context = self.appDelegate?.persistentContainer.viewContext {
            return context
        } else {
            preconditionFailure()
        }
    }
    
    /// Метод сохраняет данные в CoreData в соответствии с моделью.
    public func saveToCoreData(post: PostModel) {

        guard let entityDescription = NSEntityDescription.entity(forEntityName: "FavoritesModel", in: viewContext) else { return }

        appDelegate?.persistentContainer.performBackgroundTask( { context in
            
            let newValue = NSManagedObject(entity: entityDescription, insertInto: self.viewContext)
            let image = UIImage(named: post.image)
            let imageData = image?.pngData()

            newValue.setValue(imageData, forKey: "image")
            newValue.setValue(post.author, forKey: "author")
            newValue.setValue(post.description, forKey: "descr")
            newValue.setValue(post.likes, forKey: "likes")
            newValue.setValue(post.views, forKey: "views")

            do {
                try self.viewContext.save()
                self.readFromCoreData()
            } catch {
                print("Post could not be saved")
            }
        })
    }

    /// Метод считывает данные из CoreData. Вызывается при запуске ProfileViewController, чтобы не допустить повторное сохранение постов после перезапуска приложения, а также в методе saveToCoreData с той же целью.
    public func readFromCoreData() {
        savedPosts.removeAll()

        let fetchRequest = NSFetchRequest<FavoritesModel>(entityName: "FavoritesModel")
        fetchRequest.fetchBatchSize = 1

        do {
            let results = try viewContext.fetch(fetchRequest)
            for result in results {
                savedPosts.append(result)
            }
        } catch {
            print("Error while reading from Core Data")
        }
    }
    
    ///Метод удаляет фаворитов из CoreData. Проверка по двум свойствам: автор и описание.
    public func removeOne(post: FavoritesModel) {
        let fetchRequest = NSFetchRequest<FavoritesModel>(entityName: "FavoritesModel")
        
        do {
            let results = try viewContext.fetch(fetchRequest)
            for object in results {
                if object.author == post.author && object.description == post.description {
                    viewContext.delete(object)
                    
                    try viewContext.save()
                }
            }
        } catch {
            print("Could not delete post")
        }
    }

    /// Метод удаляет все данные в CoreData. Использовался для теста, выведен в AppDelegate (закомментирован).
    public func removeFromCoreData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "FavoritesModel")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try viewContext.execute(deleteRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    ///Метод фильтрует данные в CoreData по автору и возвращает отфильтрованный массив. В версии ДЗ с FetchResultsController не используется.
    public func filterByAuthor(author: String) -> [FavoritesModel] {
        do {
            let fetchRequest: NSFetchRequest<FavoritesModel> = FavoritesModel.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "author contains[c] %@", author)
            let fetchedResults = try viewContext.fetch(fetchRequest)
            return fetchedResults
        }
        catch {
            print(error.localizedDescription)
            return []
        }
    }
}
