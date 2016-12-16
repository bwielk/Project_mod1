require_relative('../models/collection')
require_relative('../models/product')
require('pry')

Product.delete_all()
Collection.delete_all()

product1 = Product.new({
              'name' => '1#2',
              'type' => 'scarf',
              'stock' => 23,
              'url' => 'https://mir-s3-cdn-cf.behance.net/project_modules/fs/8d3a5734273809.56cd02a598d02.jpg'})
product1.add()
product2 = Product.new ({
              'name' => '2#1',
              'type' => 'top',
              'stock' => 12,
              'url' => 'https://mir-s3-cdn-cf.behance.net/project_modules/fs/8ba69c34259197.56ca4bc295bcf.jpg'})
product2.add()

ss2016 = Collection.new({
              'name' => 'spring_summer2016',
              'markdown' => 0.1,
              'product_id' => product1.id
  })

ss2016.add()

fw2015 = Collection.new({
              'name' => 'fall_winter2015',
              'markdown' => 0.1,
              'product_id' => product2.id
  })

fw2015.add()


binding.pry