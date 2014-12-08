# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

				 			 
  Admin.create({ login_name: 'admin', password: 'admin123' })
  
  Department.create([{ name: '信息工程研究所', address: '北京市海淀区闵庄路甲89号2号楼2014室', city: '北京' }, 
 					 { name: '中国科学院大学', address: '北京市怀柔区中国科学院大学教1-115', city: '北京' },
  					 { name: '南京大学', address: '南宁京南京大学教1-115', city: '南京' }])
  
  User.create({ username: 'liying', password: 'liying', name: '李莹', sex: '女', uid: '45012222356589', 
  					phone: '13256895656', email: 'liying@ucas.cn', utype: '2', department_id: 1 })
  					
  Instrument.create([{ department_id: 1, image_url: 'public/uploads/1.png', name: '低速大容量冷冻离心机', type_name: 'CR7', number: '0731', itype: '生物',
  						bought_time: '2013-11-17', bought_price: 80000, place: '北京市海淀区闵庄路甲89号2号楼2014室', status: '正常', 
  						price: 300, description: '制备，分离。', user_id: 1},
  					{ department_id: 1, image_url: 'public/uploads/2.png', name: '高速冷冻离心机', type_name: 'CR22G', number: '6543', itype: '生物',
  						 bought_time: '2013-11-17', bought_price: 70000, place: '北京市海淀区闵庄路甲89号2号楼2013室', status: '正常', 
  						 price: 60, description: '分离，纯化。', user_id: 1},
  					{ department_id: 1, image_url: 'public/uploads/3.png', name: '冰冻切片机', type_name: 'Leica CM3050S', number: '004', itype: '生物',
  						 bought_time: '2013-11-17', bought_price: 60000, place: '北京市海淀区闵庄路甲89号2号楼2012室', status: '正常', 
  						 price: 50, description: '可对新鲜组织、冷冻保存组织或固定后的组织进行切片。', user_id: 1},
  					{ department_id: 2, image_url: 'public/uploads/4.png', name: 'FR-E VariMax X-射线衍射数据收集系统', 
  						 type_name: 'Rigaku FR-E/VariMax HR/Raxis IV++(3102右台)', number: '001', itype: '物理',
  						 bought_time: '2013-11-17', bought_price: 50000, place: '北京市怀柔区中国科学院大学教1-105', status: '正常', 
  						 price: 300, description: '收集蛋白质及生物大分子、X-射线单晶衍射数据', user_id: 1},
  					{ department_id: 2, image_url: 'public/uploads/5.png', name: '上海精科物光 WSC-S 测色色差计', type_name: 'CR7', number: '0731', itype: '物理',
  						 bought_time: '2013-11-17', bought_price: 40000, place: '北京市怀柔区中国科学院大学教1-125', status: '正常', 
  						 price: 300, description: '制备，分离。', user_id: 1},
  					{ department_id: 3, image_url: 'public/uploads/1.png', name: '实验室测设仪/', type_name: 'CR7', number: '0731', itype: '物理',
  						 bought_time: '2013-11-17', bought_price: 30000, place: '南宁京南京大学教1-115', status: '正常', 
  						 price: 300, description: '制备，分离。', user_id: 1},
  					{ department_id: 3, image_url: 'public/uploads/4.png', name: '实验室测设仪/', type_name: 'CR7', number: '0741', itype: '物理',
  						 bought_time: '2013-11-17', bought_price: 20000, place: '南宁京南京大学教1-315', status: '正常', 
  						 price: 300, description: '制备，分离。', user_id: 1}])