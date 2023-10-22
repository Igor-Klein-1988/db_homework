//теория https://western-appeal-39b.notion.site/DB-6-Oct-20-2023-058924f730594714aa19f9da8b7a8cdb
// 1. Вывести названия треков без тега test
db.tracks.find(
  {
    tags: { $nin: ["test"] },
  },
  { title: 1, _id: 0 }
);
// 2. Вывести ко-во треков с продолжительностью до одного часа с тегом new
db.tracks.countDocuments({
  tags: "new",
  duration_secs: { $lte: 60 * 60 },
});
// 3. Увеличить баланс заблокированных юзеров не из Germany на 5%
db.users.updateMany(
  {
    is_blocked: true,
    country: { $ne: "Germany" },
  },
  {
    $mul: { balance: 1.05 },
  }
);
// 4. Добавить всем трекам теги fresh и popular
db.tracks.updateMany(
  {},
  {
    $push: { tags: { $each: ["fresh", "popular"] } },
  }
);

// 5. С помощью инструмента онлайн-проектирования описать схему БД чат онлайн-поддержки
// https://dbdiagram.io/d/65353981ffbf5169f033db81
