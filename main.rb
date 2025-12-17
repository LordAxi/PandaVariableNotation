pvn = Class.new do    
    def self.read(file)
        lines = File.readlines(file)

        values = {}

        lines.each_with_index do |element, id|
            tokens = lines[id].split
            if self.check_syntax(tokens)
                values[tokens[1]] = self.set_value(tokens)  
            else
                puts "Error: wrong syntax. Look up the syntax in the docs on gihub. A version of the docs should also be bundeled with your pvn package"  
            end
        end
        return values
        
    end
    def self.list(var)
        var.each do |key, value|
            puts "#{value}"
        end
    end
    def self.check_syntax(tokens)
        if tokens[2] == "=" 
            return true
        else 
            return false  
        end 
    end
    def self.set_value(tokens)
        case tokens[0]
            
        when "s.new"
            return tokens[3].to_s
        when "i.new"
            return tokens[3].to_i
        when "f.new"
            return tokens[3].to_f
        when "b.new"
            if tokens[3] == "true"
                return true
            elsif tokens[3] == "false"
                return false
            end
        end
    end

end

timer = Time.now


50.times do 
    timer = Time.now
    r = pvn.read("something.pvn")
    puts Time.now - timer
    r.clear
end
