# テーブル設計

## usersテーブル

| Column    | Type         | Options             |
| --------- | ------------ | ------------------- |
| name      | string       | null: false         |
| email     | string       | null: false         |
| password  | string       | null: false         |

### Association
- has_many: room_users
- has_many: rooms,through: room_users
- has_many: customers

## roomsテーブル

| Column    | Type         | Options             |
| --------- | ------------ | ------------------- |
| room_name | string       | null: false         |

### Association
- has_many: room_users
- has_many: users, through: room_users
- has_many: room_customers
- has_many: customers, through: room_customers

## room_usersテーブル

| Column    | Type         | Options                        |
| --------- | ------------ | ------------------------------ |
| user      | references   | null: false, foreign_key: true |
| room      | references   | null: false, foreign_key: true |

### Association
- belongs_to: user
- belongs_to: room

## customerテーブル

| Column        | Type         | Options                        |
| ------------- | ------------ | ------------------------------ |
| last_name     | string       | null: false                    |
| first_name    | string       | null: false                    |
| last_name_kana| string       | null: false                    |
| first_name    | string       | null: false                    |
| postal_code   | string       | null: false                    |
| prefecture_id | integer      | null: false                    |
| city          | string       | null: false                    |
| house_number  | string       | null: false                    |
| building_name | string       |                                |
| phone         | string       |                                |
| product_name  | string       |                                |
| amount_money  | integer      |                                |
| visit_date    | date       | null: false                    |
| purchase_date | date       |                                |
| remark_column | text         |                                |
| user          | references   | null:false, foreign_key: true  |

### Association

- belongs_to: user
- has_many: room_customers
- has_many: rooms, through: room_customers

## room_customersテーブル

| Column        | Type         | Options                        |
| ------------- | ------------ | ------------------------------ |
| room          | references   | null: false, foreign_key: true |
| customer      | references   | null: false, foreign_key: true |

### Association

- belongs_to: room
- belongs_to: customer



