# EasyOrderable
Easy ordering of Active Record objects

## Usage
```ruby
class User < ApplicationRecord
  has_many :bookings
  has_many :requests
end

class Booking < ApplicationRecord
  belongs_to :user
end

class Request < ApplicationRecord
  belongs_to :renter, class_name: 'User', foreign_key: :user_id
end

#<User id: 1, first_name: 'A'>
#<User id: 2, first_name: 'B'>
#<User id: 3, first_name: 'C'>
```

### Sort by column name asc
```ruby
>> User.assort('first_name')
=> [#<User first_name: 'A'>, #<User first_name: 'B'>, #<User first_name: 'B'>]
```

### Sort by column name desc
```ruby
>> User.assort('-first_name')
=> [#<User first_name: 'C'>, #<User first_name: 'B'>, #<User first_name: 'A'>]
```

### Sort by joined column name
```ruby
>> Booking.assort('-user.first_name')
```

### Sort by joined column name when associations name is custom
```ruby
>> Request.assort('-user.first_name', user: :renter)
```

### Sort by multiple params
```ruby
>> Booking.assort('-user.first_name,slot_places')
```

### You can use it from rails controller to handle json api compliant sort requests
```ruby
class UsersController < ApplicationController
  def index
    @users = User.assort(order_param)
  end

  private

  def order_param
    params[:order]
  end
end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'easy_orderable'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install easy_orderable
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
