
enum product_status {
  in_stock
  out_of_stock
  runniing_low
}


enum order_status {
  place
  confirm
  proceseed
  complete
}


table product {
  id int [pk, increment]
  serial varchar
  name varchar(200)
  merchant int [ref: > merchant.id]
  price float(10,4)
  status product_status
  stock int

  created_at timestamp [default:  'now()']
}



table merchant {
  id int [pk, increment]
  name varchar
  country int [ref: > country.id]

  created_at timestamp [default:  'now()']
}

table country {
  id int [pk, increment]
  name varchar
}


table order {
  id int [pk, increment]
  status order_status
  user_id int
  total float(12,2)
  
  created_at timestamp [default:  'now()']
}

table order_item {
  id int [pk, increment]
  order_id int [ref: > order.id]
  product_id int [ref: > product.id]
  quantity int

}




















