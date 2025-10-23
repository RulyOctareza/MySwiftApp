import Foundation

struct Meal: Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
}

struct MealsResponse: Codable {
    let meals: [Meal]
}

class MealsAPI {
    static let shared = MealsAPI()
    private let baseURL = "https://www.themealdb.com/api/json/v1/1/search.php?s="

    func fetchMeals(completion: @escaping ([Meal]?) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            do {
                let decoded = try JSONDecoder().decode(MealsResponse.self, from: data)
                completion(decoded.meals)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}
