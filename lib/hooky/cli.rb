require "thor"

module Hooky

  class CLI < Thor

    def self.exit_on_failure?() true end

    desc "list", "List all hooks"
    def list
      puts Hooky::Hook.all
    end

    desc "hook [HOOK]", "Run a hook"
    def hook(hook)
      h = Hooky::Hook.new(hook)

      puts "Running hook #{hook}..."
      puts h.send_request

      # puts h.config_file
      # puts h.data_file
    end

    desc "init", "Create example hook, add Hooky to Gemfile and create a bin/hooky binstub"
    def init
      require "fileutils"

      unless (example_dir = Pathname.new(File.expand_path(".hooky/example"))).exist?
        example_dir.mkpath
        Pathname.new(File.expand_path("templates/example_hook", __dir__)).each_child do |sample_hook|
          FileUtils.cp sample_hook, example_dir, preserve: true
        end
        puts "Created example hook in .hooky/example"
      end

      if (binstub = Pathname.new(File.expand_path("bin/hooky"))).exist?
        puts "Binstub already exists in bin/hooky (remove first to create a new one)"
      else
        puts "Adding hookyrb to Gemfile and bundle..."

        `bundle add hooky --group "development, test"`
        `bundle binstubs hooky`

        puts "Created binstub file in bin/hooky"
      end
    end

    desc "version", "Show Hooky version"
    def version
      puts Hooky::VERSION
    end

  end

end

# SSHKit uses instance eval, so we need a global const for ergonomics
# KAMAL = Kamal::Commander.new


# require "thor"

# module Hookynew

#   class Cli < Thor

#     desc "hello NAME", "say hello to NAME"
#     def hello(name)
#       puts "Hello #{name}"
#     end

#     desc "list", "list all hooks"
#     def list
#       puts Hookynew::Hook.all
#     end

#   end

# end
