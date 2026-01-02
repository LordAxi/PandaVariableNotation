require "tty-screen"
require "tty-cursor"
require "tty-prompt"
require "PVN"

SCREEN = TTY::Screen
CURSOR = TTY::Cursor
PROMPT = TTY::Prompt.new
print CURSOR.clear_screen
print CURSOR.move_to(0, 0)#



$state = "menu"

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
      case $state
      when "menu"
        puts "Menu"
        puts "-" * width
        puts "Welcome to the PVN TUI Application"
        puts "To see aviable commands use help"
      when "help"
        puts "Help"
        puts "-" * width
        puts "Aviable Commands: "
        puts "menu"
        puts "read"
        puts "list"
        puts "info"
      when "read"
        puts "Read"
        puts "-" * width
      when "list"
        puts "List"
        puts "-" * width
      when "info"
        puts "This is a TUI Application for PVN"
        puts "Third-Party Libraries" 
        puts  "| Name       | License | Creator      | Link                                      |"
        puts  "| ---------- | ------- | ------------ | ----------------------------------------- |"
        puts  "| tty-prompt | MIT     | Piotr Murach | https://github.com/piotrmurach/tty-prompt |"
        puts  "| tty-cursor | MIT     | Piotr Murach | https://github.com/piotrmurach/tty-cursor |"
        puts  "| tty-screen | MIT     | Piotr Murach | https://github.com/piotrmurach/tty-screen |"
        puts ""
        puts ""
        puts "PVN is opensource and licensed under the MIT License"
        puts "GitHub: https://github.com/LordAxi/PandaVariableNotation"
      when "no_valid_comment"
        puts "Error: Please only type valid comments."
        puts "Use ""help"" for a list of valid comments."
      end
      self.command_input()
  end

  def self.command_input
    command = PROMPT.ask("Command:")
    case command.to_s.gsub(' ', '').downcase
    when "q", "quit", "e", "exit", "c", "cancel", "s", "stop"
      exit()
    when "r", "refresh", "redraw"
      $state = $state
    when "help", "read", "list", "menu", "info"
      $state = command
    else
      $state = "no_valid_comment"
    end
    self.init()
  end
end

TUI_Application.init()
