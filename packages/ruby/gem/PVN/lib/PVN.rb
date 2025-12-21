class PVN   
    def self.read(file)
        lines = File.readlines(file)

        values = {}

        lines.each_with_index do |element, id|
            tokens = element.split
            line = id +1 
            if self.check_syntax(tokens)
                values[tokens[1]] = self.set_value(tokens, line)  
            else
                self.error_handler("syntax", line)  
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
    def self.set_value(tokens, line)
        case true
            
        when tokens[0].start_with?("s")

            if tokens[0].end_with?("new") 
                return tokens[3].to_s
            elsif tokens[0].end_with?("edit")
                return tokens[3].to_s 
            else 
                self.error_handler("syntax", line)
            end
        when tokens[0].start_with?("i")

            if tokens[0].end_with?("new")

                return tokens[3].to_i
            elsif tokens[0].end_with?("edit")

                return tokens[3].to_i
            else
                self.error_handler("syntax", line)
            end
        when tokens[0].start_with?("f")
            if tokens[0].end_with?("new")

                return tokens[3].to_f
            elsif tokens[0].end_with?("edit")

                return tokens[3].to_f
            else
                self.error_handler("syntax", line)
            end
        when tokens[0].start_with?("b")
            if tokens[3] == "true"
                return true
            elsif tokens[3] == "false"
                return false
            end
        
        else 
            self.error_handler("syntax", line)
    end
    end
    def self.error_handler(type, line)
        error = ""
        case type
        
        when "syntax"
            error = "Wrong syntax. Look up the syntax in the docs on gihub. A version of the docs should also be bundeled with your pvn package"
        when "not_existing"
            error = "The variable you try to access is not declared"
        when "already_exists"
            error = "The variable you try to declare is already declared"
        end
        self.logo_printer()
        puts "Error: Line: #{line}. #{error}."
        
    end
    def self.logo_printer()
        puts    "  _____      ___   _ " 
        puts    " |  _ \\ \\   / / \\ | | "
        puts    " | |_) \\ \\ / /|  \\| | "
        puts    " |  __/ \\ V / | |\\  | "
        puts    " |_|     \\_/  |_| \\_| "
    end
end
