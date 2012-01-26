class Missingmethods
	def initialize
		puts "Missingmethods - initializer"
	end
	
	# method_missing takes 3 parameters
	# @m: method's symbol name, use to_s to convert to a string
	# @*args: variable number of arguments passed to the method
	# @&block: a block of code to be executed
	def method_missing(m,*args,&block)
		puts "Not able to find the #{m} method"
		
		for i in args do
			puts(i)
		end
		
		puts "Args count = #{args.length}"
		
		if block_given?
			#if block cannot be multiline
			if (args.length < 1)
				exec(&block)
			elsif
				execwithparams(*args, &block)
			end			
		end		
	end
	
	def exec(&block)
		block.call
	end
	
	def execwithparams(*args, &block)
		puts "Executing..."
		block.call(*args)
	end	
end

Missingmethods.new.someMethod
puts("\n")
Missingmethods.new.someMethod(1,2) {|a,b| puts "The numbers are #{a} and #{b} and the sum is #{a+b}"}
puts("\n")
Missingmethods.new.someMethod {|*args| 
	if (args.length == 0)
		puts "This block does not have any arguments passed"
	elsif
		puts "This block has #{args.length} arguments passed"
	end	
}
puts("\n")
Missingmethods.new.someMethod2(1,3,5) {|*args| 
	if (args.length == 0)
		puts "This block does not have any arguments passed"
	elsif
		puts "This block has #{args.length} arguments passed"
	end	
}
