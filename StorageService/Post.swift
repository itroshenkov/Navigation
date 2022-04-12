

import Foundation

public struct Post {
    
    public var title:String
    public var description: String
    public var image: String
    public var views: Int
    public var likes: Int
}


 let post1 = Post(title: "Отдых в горах",
                 description: "В этом году в Красной поляне выпала много снега",
                 image: "post1",
                 views: 1,
                 likes: 1)

public let post2 = Post(title: "Миллиарды",
                 description: "Сериал подписали на 7 сезон. Вернется ли Акс? Узнаем в новом сезоне",
                 image: "post2",
                 views: 2,
                 likes: 2)

public let post3 = Post(title: "Котики",
                 description: "Котики. Самый популярные посты в интернете и на YouTube",
                 image: "post3",
                 views: 3,
                 likes: 3)

public let post4 = Post(title: "Вечеринка длиною в жизнь. Элтону Джону — 75. Как ему удается оставаться звездой больше полувека?",
                 description: "Одной из главных фигур британского поп-рока, королю эпатажа и всеобщему любимцу исполняется 75 лет. Из них почти 80 процентов своей жизни Элтон Джон посвятил музыке, сумев войти в число главных королей чартов и продаж, собрать всевозможные награды от «Оскара» до «Грэмми» и даже получить титул рыцаря-бакалавра. В следующем году артист собирается отправиться на пенсию, которую пока сложно представить: кажется, что вневременная музыка была рядом всегда, а сам Элтон Джон уже давно превратился в бессмертную фигуру. Тем не менее в 2023-м культовый певец завершит прерванное из-за пандемии прощальное турне и даст свой последний концерт. Итоги шести десятилетий карьеры сэра Элтона Джона — в материале «Ленты.ру».",
                 image: "post4",
                 views: 4,
                 likes: 4)


public let arrayPosts = [post1, post2, post3, post4]
public let photoCollectionArray = ["pic1","pic2","pic3","pic4","pic5","pic6","pic7","pic8","pic9","pic10","pic11","pic12","pic13","pic14","pic15","pic16","pic17","pic18","pic19","pic20"]



