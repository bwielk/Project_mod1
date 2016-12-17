require_relative('../db/sql_runner')

class Product

  attr_accessor :name, :type, :stock, :price, :order_amount, :url
  attr_reader :id, :size

  def initialize(options)
    @id = options['id'].to_i unless options['id'].nil?
    @name = options['name']
    @type = options['type']
    @size = options['size']
    @price = options['price'].to_i
    @stock = options['stock'].to_i
    @order_amount = options['order_amount'].to_i
    @url = options['url']
  end

  def add()
    sql = "INSERT INTO products (name, type, size, price, stock, order, url) VALUES ('#{@name}','#{@type}', '#{@size}', #{@price}, #{@stock}, #{@order_amount}, '#{@url}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM products;"
    result = SqlRunner.run(sql)
    return result.map {|element| Product.new(element)}
  end

  def update_price(new_price)
    sql = "UPDATE products SET price = #{new_price} WHERE id = #{@id}"
  end

  def update_name(new_name)
    sql = "UPDATE products SET name = '#{new_name}' WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def update_type(new_type)
    sql = "UPDATE products SET type = '#{new_type}' WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def update_stock(new_stock)
    sql = "UPDATE products SET stock = #{new_stock} WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def update_url(new_url)
    sql = "UPDATE products SET url = '#{new_url}' WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def update_order(new_amount)
    sql = "UPDATE products SET order_amount = #{new_amount} WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM products WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete_order
    sql = "DELETE order_amount FROM products WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM products;"
    SqlRunner.run(sql)
  end

  def place_order(amount)
    order_am = @order_amount + amount
    update_order(order_am)
  end 

  def receive_order
    result = @order_amount
    new_stock = @stock + result.to_i
    update_stock(new_stock)
  end

  def sell(number)
    new_stock = @stock - number
    update_stock(new_stock)
  end
#REFACTORING METHODS

end