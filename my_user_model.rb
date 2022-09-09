# require "sqlite3"

$db_filename = "db.sql"
$tablename = "users"

# class ConnectionSqLite
#     def new
#         @db = nil
#     end
#     def get_connection
#         if @db == nil
#             @db = SQLite3::Database.new($db_filename)
#             createdb
#         end
#         @db
#     end 

#     def createdb
#         rows = self.get_connection().execute <<-SQL
#         CREATE TABLE IF NOT EXISTS #{$tablename} (
#             id INTEGER PRIMARY KEY,
#             firstname varchar(30),
#             lastname varchar(30),
#             age int,
#             password varchar(30),
#             email varchar(30)
#         );
#         SQL
#     end

#     def execute(query)
#         self.get_connection().execute(query)
#     end
# end

# class User
#     attr_accessor :id, :firstname, :lastname, :age, :password, :email

#     def initialize(array)
#         @id         = array[0]
#         @firstname  = array[1]
#         @lastname   = array[2]
#         @age        = array[3]
#         @password   = array[4]
#         @email      = array[5]
#     end

#     def to_hash
#         {id: @id, firstname: @firstname, lastname: @lastname, age: @age, password: @password, email: @email}
#     end

#     def inspect
#         %Q|<User id: #{@id}, firstname: "#{@firstname}", lastname: "#{@lastname}", age: #{@age}, password: "#{@password}", email: "#{@email}">|
#     end

#     def self.create(user_info)
#        query = <<-REQUEST
#         INSERT INTO #{$tablename} (firstname, lastname, age, password, email) VALUES ("#{user_info[:firstname]}",
#         "#{user_info[:lastname]}",
#         "#{user_info[:age]}",
#         "#{user_info[:password]}",
#         "#{user_info[:email]}");    
#        REQUEST

#         ConnectionSqLite.new.execute(query)
#     end 

#     def self.get(user_id)
#         query = <<-REQUEST
#             SELECT * FROM #{$tablename} WHERE id = #{user_id};
#        REQUEST

#        rows = ConnectionSqLite.new.execute(query)
#        if rows.any?
#             User.new(rows[0])
#        else
#             nil
#        end
#     end

#     def self.all
#         query = <<-REQUEST
#             SELECT * FROM #{$tablename};
#        REQUEST

#        rows = ConnectionSqLite.new.execute(query)
#        if rows.any?
#             rows.collect do |row|
#                 User.new(row)
#             end
#        else
#             []
#        end
#     end

#     def self.filter_password(email, password)
#         User.all.filter {|user| user.email == email && user.password == password}.first
#     end

#     def self.update(user_id, attribute, value)
#         query = <<-REQUEST
#             UPDATE #{$tablename}
#             SET #{attribute.to_s} = '#{value}'
#             WHERE id = #{user_id};
#         REQUEST
#         puts query
#         ConnectionSqLite.new.execute(query)
#         updated = self.get(user_id).to_hash
#     end

#     def self.destroy(user_id)
#          query = <<-REQUEST
#             DELETE FROM #{$tablename}
#             WHERE id = #{user_id};
#         REQUEST
    
#         ConnectionSqLite.new.execute(query)
#     end
    
#      def destroy
#    @post = Post.find(paramsd[:user_id])
#    @post.destroy
#    redirect_to post_path, :notice => "You must sol"
#     end

# end