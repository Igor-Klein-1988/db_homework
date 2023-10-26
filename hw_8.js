// теория https://western-appeal-39b.notion.site/DB-8-Oct-25-2023-f64dab0544ec4e5a8417c527a1da63ce
// 1. Вывести среднюю реакцию по треку 1
db.reactions.aggregate([
  { $match: { track_id: 1 } },
  {
    $group: {
      _id: null,
      avg_reaction: { $avg: "$value" },
    },
  },
]);
// 2. Увеличить баланс всех незаблокированных юзеров на 0.5%
db.users.updateMany(
  {
    is_blocked: { $ne: true },
  },
  {
    $mul: { balance: 1.005 },
  }
);
// 3. Вывести ко-во реакций с оценкой 4
db.reactions.aggregate([{ $match: { value: 4 } }, { $count: "reactions" }]);
// 4. Вывести названия треков, принадлежащих юзеру 4
db.tracks.aggregate([
  { $match: { author_id: 4 } },
  {
    $project: {
      _id: 0,
      title: 1,
    },
  },
]);
// 5. С помощью инструмента онлайн-проектирования опишите схему БД поликлиника
// https://dbdiagram.io/d/65353981ffbf5169f033db81
