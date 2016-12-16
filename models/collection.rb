require_relative('../db/sql_runner')

class Collection

attr_accessor :name, :markdown, :product_id
attr_reader :id

def initialize(options)
  @id = options['id'].to_i unless options['id'].nil?
  @name = options['name']
  @markdown = options['markdown'].to_f
  @product_id = options['product_id'].to_i
end

def add()
  sql = "INSERT INTO collections (name, markdown, product_id) VALUES ('#{@name}',#{@markdown},#{@product_id}) RETURNING *;"
  result = SqlRunner.run(sql)
  @id = result[0]['id'].to_i
end

def self.all()
  sql = "SELECT * FROM collections;"
  result = SqlRunner.run(sql)
  return result.map {|element| Collcection.new(element)}
end

def update_name(new_name)
  sql = "UPDATE collections SET name ='#{new_name}' WHERE id = #{@id};"
  return SqlRunner.run(sql)
end

def update_markdown(new_markdown)
  new_markdown = new_markdown.to_f
  sql = "UPDATE collections SET markdown = #{new_markdown} WHERE id = #{@id};"
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


#REFACTORING METHODS#


end