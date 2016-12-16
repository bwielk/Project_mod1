require_relative('../db/sql_runner')

class Product

attr_accessor :name, :type, :stock, :url
attr_reader :id

def initialize(options)
  @id = options['id'].to_i unless options['id'].nil?
  @name = options['name']
  @type = options['type']
  @stock = options['stock'].to_i
  @url = options['url']
end

def add()
  sql = "INSERT INTO products (name, type, stock, url) VALUES ('#{@name}', '#{@type}', #{@stock}, '#{@url}') RETURNING *;"
  result = SqlRunner.run(sql)
  @id = result[0]['id'].to_i
end

def self.all()
  sql = "SELECT * FROM products;"
  result = SqlRunner.run(sql)
  return result.map {|element| Product.new(element)}
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
  sql = "UPDATE products SET url = #{new_url} WHERE id = #{@id};"
  SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM products WHERE id = #{@id};"
  SqlRunner.run(sql)
end

def self.delete_all
  sql = "DELETE FROM products;"
  SqlRunner.run(sql)
end

#REFACTORING METHODS

end