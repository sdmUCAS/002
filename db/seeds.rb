# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
		
  Order.create({ user_id: 2, create_time: '2014-12-05 13:01:08' })
  
  OrdersInstrument.create({ order_id: 2, instrument_id: 2, order_time: '2014-12-06', part: '7,8' })
  
  OrdersState.create({ order_id: 2, state: '提交订单', create_time: '2014-12-05 13:01:08' })
  
  Order.create({ user_id: 2, create_time: '2014-12-05 13:06:08' })
  
  OrdersInstrument.create({ order_id: 3, instrument_id: 2, order_time: '2014-12-05', part: '7,8' })
  
  OrdersState.create({ order_id: 3, state: '提交订单', create_time: '2014-12-05 13:06:08' })