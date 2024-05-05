
## users table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| name               | string              | null: false, unique: true |
| email              | string              |                           |
| encrypted_password | string              | null: false,              |

### Association
* has_many :items
* has_many :order

# items table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| user               | references          | null: false, foreign_key: true |
| item_name          | string              | null: false,              |
| item_explain       | string              | null: false,              |
| category           | string              | null: false,              |
| item_explain       | text                | null: false,              |
| item_status        | text                | null: false,              |
| shipping_cost      | string              | null: false,              |
| prefecture         | string              | null: false,              |
| date               | string              | null: false,              |
### Association

- belongs_to :user
- has_one :order

# order table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| user               | references          | null: false,foreign_key: true|
| item_name          | references          | null: false,foreign_key: true|

### Association

- belongs_to :items
- belongs_to :user
