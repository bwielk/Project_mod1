require_relative('../db/sql_runner')

class Collection

attr_accessor :name, :markdown, :product_id
attr_reader :id

def initialize(options)
  @id = options['id'].to_i unless options['id'].nil?
  @name = options['name']
  @markdown = options['markdown']
  @product_id = options['product_id'].to_i
end

def add()
  sql = "INSERT INTO collections (name, markdown, product_id) VALUES ('#{@name}','#{@markdown}',#{@product_id}) RETURNING *;"
  result = SqlRunner.run(sql)
  @id = result[0]['id'].to_i
end

def self.update(id)
  sql = "UPDATE collections SET
        name='#{options['name']}',
        price='#{options['price']}',
        product_id = '#{options['product_id']}'
        url='#{options['url']}' WHERE id='#{options['id']}';"
  SqlRunner.run( sql )
end
def self.all()
  sql = "SELECT * FROM collections;"
  result = SqlRunner.run(sql)
  return result.map {|element| Collection.new(element)}
end

def update_name(new_name)
  sql = "UPDATE collections SET name ='#{new_name}' WHERE id = #{@id};"
  return SqlRunner.run(sql)
end

def update_markdown(new_markdown)
  new_markdown = new_markdown.to_f
  sql = "UPDATE collections SET markdown = '#{new_markdown}' WHERE id = #{@id};"
  return SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM collections WHERE id = #{@id};"
  return SqlRunner.run(sql)
end

def self.delete_all
  sql = "DELETE FROM collections;"
  SqlRunner.run(sql)
end

def show_products
  sql = "SELECT * FROM products WHERE id = #{@product_id}"
  result = SqlRunner.run(sql)
  return result.map {|element| Product.new(element)}
end

# def self.markdown_on
#   sql = "UPDATE products SET price = price*#{@markdown} WHERE id = #{@product_id}"
#     result = SqlRunner.run(sql)
#     return result.map {|element| Product.new(element)}
# end


#REFACTORING METHODS#


end