require 'test_helper'

class BaseTest < ActiveSupport::TestCase
  def test_it_should_sort_record_by_field_asc
    assert_equal User.assort('first_name'), [user3, user2, user1]
  end

  def test_it_should_sort_records_by_field_desc
    assert_equal User.assort('-first_name'), [user1, user2, user3]
  end

  def test_it_should_sort_records_by_joined_table_field_asc
    assert_equal Booking.assort('user.first_name'), [booking3, booking2, booking1]
  end

  def test_it_should_sort_records_by_joined_table_field_desc
    assert_equal Booking.assort('-user.first_name'), [booking1, booking2, booking3]
  end

  private

  def user1
    User.create(first_name: 'C')
  end

  def user2
    User.create(first_name: 'B')
  end

  def user3
    User.create(first_name: 'A')
  end

  def booking1
    Booking.create(user: user1)
  end

  def booking2
    Booking.create(user: user2)
  end

  def booking3
    Booking.create(user: user3)
  end
end
