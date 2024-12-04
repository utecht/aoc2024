/Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/socket_reader.rb:36:in `ensure in read!': undefined method `string' for nil:NilClass (NoMethodError)

        Cache.stderr_path.write(stderr.string)
                                      ^^^^^^^
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/socket_reader.rb:37:in `read!'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/core.rb:90:in `read_socket'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/core.rb:65:in `block in process_input'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/cache.rb:150:in `write_pid_file'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/core.rb:64:in `process_input'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/core.rb:53:in `block in detach_server'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/core.rb:46:in `fork'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/core.rb:46:in `detach_server'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/core.rb:38:in `start'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/client_command/start.rb:42:in `block in run'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/cache.rb:137:in `acquire_lock'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/client_command/start.rb:29:in `run'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/cli.rb:93:in `run_command'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/cli.rb:83:in `process_arguments'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/cli.rb:49:in `run'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/exe/rubocop:8:in `<top (required)>'
	from /Users/joseph/.local/share/nvim/mason/packages/rubocop/bin/rubocop:25:in `load'
	from /Users/joseph/.local/share/nvim/mason/packages/rubocop/bin/rubocop:25:in `<main>'
/Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/socket_reader.rb:27:in `read!': uninitialized constant RuboCop::Server::SocketReader::StringIO (NameError)

        stderr = StringIO.new
                 ^^^^^^^^
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/core.rb:90:in `read_socket'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/core.rb:65:in `block in process_input'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/cache.rb:150:in `write_pid_file'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/core.rb:64:in `process_input'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/core.rb:53:in `block in detach_server'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/core.rb:46:in `fork'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/core.rb:46:in `detach_server'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/core.rb:38:in `start'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/client_command/start.rb:42:in `block in run'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/cache.rb:137:in `acquire_lock'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/client_command/start.rb:29:in `run'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/cli.rb:93:in `run_command'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/cli.rb:83:in `process_arguments'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/lib/rubocop/server/cli.rb:49:in `run'
	from /Users/joseph/.local/share/mise/installs/ruby/3.2.0/lib/ruby/gems/3.2.0/gems/rubocop-1.66.1/exe/rubocop:8:in `<top (required)>'
	from /Users/joseph/.local/share/nvim/mason/packages/rubocop/bin/rubocop:25:in `load'
	from /Users/joseph/.local/share/nvim/mason/packages/rubocop/bin/rubocop:25:in `<main>'
