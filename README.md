## users table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| name               | string              | null: false,              |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false,              |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_kana         | string              | null: false               |
| last_kana          | string              | null: false               |
| birthday           | date                | null: false               |

### Association
* has_many :items
* has_many :orders
* has_many :comments

# items table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| user               | references          | null: false, foreign_key: true |
| item_name          | string              | null: false               |
| item_explain       | text                | null: false               |
| category_id        | integer             | null: false               |
| item_status_id     | integer             | null: false               |
| shipping_cost_id   | integer             | null: false               |
| prefecture_id      | integer             | null: false               |
| shipping_date_id   | integer             | null: false               |
| price              | integer             | null: false               |
### Association

- belongs_to :user
- has_one :order
- has_many :comments

# orders table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| user               | references          | null: false,foreign_key: true|
| item               | references          | null: false,foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
- has_one :purchase

# purchases table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------| 
| order 	           | references          | null: false, foreign_key: true|
| post_code          | string              | null:false                |
| prefecture_id      | integer             | null:false                |
| municipality       | string              | null:false                |
| address            | string              | null:false                |
| build              | string              |                           |
| phone_number       | string              | null:false,               |

### Association
- belongs_to :order

# comments table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------| 
| user               | references          | null: false,foreign_key: true|
| item               | references          | null: false,foreign_key: true|
| text               | text                | null:false                |

### Association
belongs_to :user
belongs_to :item