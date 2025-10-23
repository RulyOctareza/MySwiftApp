struct Item {
    let title: String
    let imageUrl: String
    let description: String
    
    static func getItems() -> [Item] {
        return [
            Item(title: "Item 1", imageUrl: "item1.png", description: "Description for Item 1"),
            Item(title: "Item 2", imageUrl: "item2.png", description: "Description for Item 2"),
            Item(title: "Item 3", imageUrl: "item3.png", description: "Description for Item 3"),
            Item(title: "Item 4", imageUrl: "item4.png", description: "Description for Item 4"),
            Item(title: "Item 5", imageUrl: "item5.png", description: "Description for Item 5"),
            Item(title: "Item 6", imageUrl: "item6.png", description: "Description for Item 6"),
            Item(title: "Item 7", imageUrl: "item7.png", description: "Description for Item 7"),
            Item(title: "Item 8", imageUrl: "item8.png", description: "Description for Item 8"),
            Item(title: "Item 9", imageUrl: "item9.png", description: "Description for Item 9"),
            Item(title: "Item 10", imageUrl: "item10.png", description: "Description for Item 10")
        ]
    }
}