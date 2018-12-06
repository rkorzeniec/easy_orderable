require 'test_helper'

class BaseTest < ActiveSupport::TestCase
  def test_it_should_sort_records_by_field_asc
    users = [user1, user2, user3]
    assert_equal User.assort('first_name'), [user3, user2, user1]
  end

  def test_it_should_sort_records_by_field_desc
    users = [user1, user2, user3]
    assert_equal User.assort('-first_name'), [user1, user2, user3]
  end

  def test_it_should_sort_records_by_joined_table_field_asc
    bookings = [booking1, booking2, booking3]
    assert_equal Booking.assort('user.first_name'), [booking3, booking2, booking1]
  end

  def test_it_should_sort_records_by_joined_table_field_desc
    bookings = [booking1, booking2, booking3]
    assert_equal Booking.assort('-user.first_name'), [booking1, booking2, booking3]
  end

  def test_it_should_sort_records_by_multiple_fields_both_asc
    bookings = [booking1, booking2, booking3]
    assert_equal Booking.assort('slots_count,user.first_name'), [booking1, booking3, booking2]
  end

  def test_it_should_sort_records_by_multiple_fields_asc_and_desc
    bookings = [booking1, booking2, booking3]
    assert_equal Booking.assort('slots_count,-user.first_name'), [booking1, booking2, booking3]
  end

  private

  def user1
    @user1 ||= User.create(first_name: 'C')
  end

  def user2
    @user2 ||= User.create(first_name: 'B')
  end

  def user3
    @user3 ||= User.create(first_name: 'A')
  end

  def booking1
    @booking1 ||= Booking.create(user: user1, slots_count: 12)
  end

  def booking2
    @booking2 ||= Booking.create(user: user2, slots_count: 122)
  end

  def booking3
    @booking3 ||= Booking.create(user: user3, slots_count: 122)
  end
end
