require "tty-screen"
require "tty-cursor"
require "tty-prompt"
require "tty-logger"
require "tty-table"
require "PVN"
require "json"

SCREEN = TTY::Screen
CURSOR = TTY::Cursor
PROMPT = TTY::Prompt.new
LOGGER = TTY::Logger.new do |config|
  config.metadata = [:date, :time]
end



print CURSOR.clear_screen
print CURSOR.move_to(0, 0)#


$state = "menu"
$path = ""
TEXT_PATH = File.join(__dir__, "text.json")
$TEXT = JSON.parse(File.read(TEXT_PATH))


class TUI_Application
  def self.init()
    
    width = SCREEN.width
    height = SCREEN.height
      print CURSOR.clear_screen()
      print CURSOR.move_to(width/2 - (21 / 2) -1, 0)
      puts    "  _____      ___   _ " 
      print CURSOR.move_to(width/2 - (21 / 2)- 1, 1)
      puts    " |  _ \\ \\   / / \\ | | "
      print CURSOR.move_to(width/2 - (21 / 2)-1, 2)
      puts    " | |_) \\ \\ / /|  \\| | "
      print CURSOR.move_to(width/2 - (21 / 2)-1, 3)
      puts    " |  __/ \\ V / | |\\  | "
      print CURSOR.move_to(width/2 - (21 / 2)-1, 4)
      puts    " |_|     \\_/  |_| \\_| "
      print CURSOR.move_to(0, 5)
      puts    "/" + "- " * ((width/ 2)-1) + "\\"
      print CURSOR.move_to(0, 6)
      puts    "\\" + " -" * ((width/ 2)-1) + "/"

      print CURSOR.move_to(0, 8)
        puts $state.gsub("_", " ").capitalize
        puts "-" * width

      case $state
      when "read"
        table = TTY::Table.new(header: ["NAME", "VALUE"])
        r = PVN.read(File.join(__dir__, $path))
        r.each do |key, value|
            table << [key, value]
        end
        puts table.render(:unicode, alignment: [:center], resize: true, multiline: true)
      when "path_empty", "file_not_existing", "no_valid_command"
        $TEXT[$state].each do |content|
          LOGGER.error content, file: "#{$path}"
        end
      else
        $TEXT[$state].each do |content|
          puts content
        end
      end
      self.command_input()
  end

  def self.command_input
    command = PROMPT.ask("Command:")
    command = command.to_s.downcase
    if command == ("read")
      command = "path_empty"
      $path = ""
    end
    if command.start_with?("read ")
      
      $path = command.delete_prefix("read ").to_s
      command = "read"
      if $path == ""
        command = "path_empty"
      elsif File.file?(File.join(__dir__, $path)) == false
        command = "file_not_existing"
      end
    end
    case command
    when "q", "quit", "e", "exit", "c", "cancel", "s", "stop"
      print CURSOR.clear_screen()
      print CURSOR.move_to(0, 0)
      exit()
    when "r", "refresh", "redraw"

    when "help", "read", "menu", "info", "path_empty", "file_not_existing"
      $state = command
    else
        $state = "no_valid_command"
    end

    self.init()
  end
end


TUI_Application.init()
