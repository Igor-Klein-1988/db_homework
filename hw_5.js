// MongoDB
//теория https://western-appeal-39b.notion.site/DB-5-Oct-18-2023-122cc14c2f1942fd9b332b35d33b2748
// 1. Вывести имена юзеров не из France
db.users.find(
  { country: { $ne: "France" } }, 
  { fullname: 1, _id: 0 }
);


// 2. Добавить несколько реакций на треки
db.tracks.updateMany(
  {},
  {
    $set: {
      likes: 0,
    },
  }
);

db.tracks.updateMany(
  {_id: {$in: [2,4]}},
  {
    $set: {
      likes: 2,
    },
  }
);
// 3. Вывести названия треков продолжительностью от 1 до 10 мин
db.tracks.find(
  { duration_secs: { $gte: 1 * 60, $lte: 10 * 60 } },
  { title: 1, _id: 0 }
)
// 4. Вывести треки юзера 4
db.tracks.find(
  { author_id: 4 },
)
// 5. С помощью инструмента онлайн-проектирования описать БД music (юзеры, треки, реакции, плейлисты)
// https://dbdiagram.io/d/65317d80ffbf5169f00df6e6
