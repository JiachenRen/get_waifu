# Get Waifu

A scraper for [mywaifulist.moe](https://mywaifulist.moe). 

## Metadata

A single JSON file containing metadata for all waifu is found [here](data/waifu_metadata.json).

An example character in `waifu_metadata.json`, a list of characters as JSON objects:

```json
{
  "name": "Artoria Pendragon",
  "slug": "artoria-pendragon-fate-stay-night",
  "id": 3,
  "original_name": "アルトリア・ペンドラゴン",
  "romaji": "Saber",
  "romaji_name": "Saber",
  "display_picture": "https://thicc.mywaifulist.moe/waifus/3/f402cd8f9243147e7d758efee5100482bcb4e23e7906f1f9cad80e96851311e0_thumb.jpeg",
  "description": "Saber's True Name is Artoria Pendragon (アルトリア・ペンドラゴン).\r\n\r\nA leg...",
  "likes": 4750,
  "trash": 735,
  "series": null,
  "type": "Waifu",
  "appearances": [
    {
      "name": "Fate/Stay Night",
      "slug": "fate-stay-night",
      "id": 3,
      "type": null,
      "original_name": null,
      "romaji_name": null,
      "description": null,
      "display_picture": null,
      "relevance": 1,
      "url": "https://www.mywaifulist.moe/series/fate-stay-night"
    }
  ],
  "url": "https://www.mywaifulist.moe/waifu/artoria-pendragon-fate-stay-night",
  "relevance": 1
}
```

As seen, the metadata is only a brief summary and does not contain detailed character information.

## Detailed Character Data

[waifu_details.json](data/waifu_details.json) is a single JSON file containing detailed data for each character. The file contains information for **30965** anime characters.

An instance in `waifu_details.json` might look like this:

```json
{
  "id": 3,
  "slug": "artoria-pendragon-fate-stay-night",
  "name": "Artoria Pendragon",
  "original_name": "アルトリア・ペンドラゴン",
  "romaji_name": "Saber",
  "display_picture": "https://thicc.mywaifulist.moe/waifus/3/f402cd8f9243147e7d758efee5100482bcb4e23e7906f1f9cad80e96851311e0_thumb.jpeg",
  "description": "Saber's True Name is Artoria Pendragon (アルトリア・ペンドラゴン).\r\n\r\nA legendary king of Britain. Also called King of Knights.\r\n\r\nArtoria is a childhood name and, upon being raised as a king, she began to be called King Arthur.\r\nIn a age when chivalry had lost its beauty, with a holy sword in her hands, she brought about a brief moment of peace and final prosperity to Britain.\r\nA man in historical fact, but it seems that in this world she was a cross-dressing beauty.\r\n\r\nOne of the ideal kings that approves a virtuous life, a virtuous livelihood for the people.\r\nA character with no faults that aided the weak and broke the strong.\r\nCalm, cool and collected; an honor student who is always serious.\r\n...that being said, although rarely mentioned, there is something of a sore loser in her: she does not go easy on any kind of competition and gets greatly vexed upon losing.\r\n\r\nThe conclusion of Arthurian Legends marks the end of the age of knights.\r\nAlthough King Arthur managed to repel outside threats, she was not able to avoid the ruin of the land of Britain itself.\r\nThe rebellion of Mordred - one of the Knights of the Round Table - caused the country to be split into two, and the castle of knights, Camelot, lost its light.\r\n\r\nAt Camlann Hill, King Arthur defeated Mordred, but also sustained a wound herself and fell on her knees.\r\nJust before drawing her last breath, she gave custody of the holy sword to her last loyal retainer, Bedivere, and departed from this world.\r\n\r\nIt has been said that, after death, she was carried to Avalon - the utopia, paradise that does not exists anywhere in this world - and will save Britain again in the far away future.",
  "weight": "42.00",
  "height": "154.00",
  "bust": "73.00",
  "hip": "76.00",
  "waist": "53.00",
  "blood_type": null,
  "origin": "Britain, England",
  "age": null,
  "birthday_month": null,
  "birthday_day": null,
  "birthday_year": null,
  "likes": 4778,
  "trash": 736,
  "popularity_rank": 17,
  "like_rank": 17,
  "trash_rank": 40,
  "husbando": false,
  "nsfw": false,
  "creator": {
    "id": 2,
    "name": "BasicSaber"
  },
  "tags": [],
  "url": "https://www.mywaifulist.moe/waifu/artoria-pendragon-fate-stay-night",
  "appearances": [
    {
      "name": "Fate/Stay Night",
      "original_name": null,
      "romaji_name": null,
      "description": "The Holy Grail War is a battle royale among seven magi who serve as Masters. Masters, through the use of the command seals they are given when they enter the war, command Heroic Spirits known as Servants to fight for them in battle. In the Fifth Holy Grail War, Rin Toosaka is among the magi entering the competition. With her Servant, Archer, she hopes to obtain the ultimate prize—the Holy Grail, a magical artifact capable of granting its wielder any wish.\n\nOne of Rin's classmates, Emiya Shirou, accidentally enters the competition and ends up commanding a Servant of his own known as Saber. As they find themselves facing mutual enemies, Rin and Shirou decide to form a temporary alliance as they challenge their opponents in the Holy Grail War. \n",
      "slug": "fate-stay-night",
      "airing_start": null,
      "airing_end": null,
      "episode_count": 24,
      "release": null,
      "display_picture": "https://thicc.mywaifulist.moe/series/3/3.jpg",
      "studio": null
    }
  ],
  "series": {
    "name": "Fate/Stay Night",
    "original_name": null,
    "romaji_name": null,
    "description": "The Holy Grail War is a battle royale among seven magi who serve as Masters. Masters, through the use of the command seals they are given when they enter the war, command Heroic Spirits known as Servants to fight for them in battle. In the Fifth Holy Grail War, Rin Toosaka is among the magi entering the competition. With her Servant, Archer, she hopes to obtain the ultimate prize—the Holy Grail, a magical artifact capable of granting its wielder any wish.\n\nOne of Rin's classmates, Emiya Shirou, accidentally enters the competition and ends up commanding a Servant of his own known as Saber. As they find themselves facing mutual enemies, Rin and Shirou decide to form a temporary alliance as they challenge their opponents in the Holy Grail War. \n",
    "slug": "fate-stay-night",
    "airing_start": null,
    "airing_end": null,
    "episode_count": 24,
    "release": null,
    "display_picture": "https://thicc.mywaifulist.moe/series/3/3.jpg",
    "studio": null
  }
}
```