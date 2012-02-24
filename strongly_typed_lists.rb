# As we all know, ruby is dynamically typed
# I just wanted to create a class that will hold a set
# of objects of the same type
# So,  the result is a strongly typed class (trivially) :)
class List
    def initialize (defType)
        @defaultType = defType
        @objArr = []

        if (!validate_type)
          raise "Invalid type parameter: unable to create an object of type #{@defaultType}"
        end
    end

    def add(someObj)
      @objArr.push(someObj) if (someObj.class.to_s.eql?(@defaultType))
    end

    def get
      return @objArr
    end

    def getitemat(pos)
      @objArr.at(pos.to_i)
    end

    def each(&block)
      @objArr.each{|item| block.call(item)}
    end

    private
    def validate_type
      type_validation_status = true
      begin
        type = Object::const_get(@defaultType).new()
      rescue
        type_validation_status = false
      end

      type_validation_status
    end
end

class Sampleclass
  def print
    puts inspect
  end
end

class Sampleclass2

end

list = List.new("Sampleclass")

list.add(Sampleclass.new)
list.add(Sampleclass.new)
list.add(Sampleclass.new)

# this won't be added
list.add(Sampleclass2.new)

list.add(Sampleclass.new)
list.add(Sampleclass.new)

puts "Calling the print method of every instance of Sampleclass"

list.each{|a| a.print}

puts "\n"
puts "Getting a certain item from the list"

item = list.getitemat(2)
item.print
