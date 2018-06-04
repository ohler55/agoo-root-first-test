require 'agoo'

Agoo::Server.init(3000, 'public',
  thread_count: 0,
  worker_count: 1,
  root_first: true,

  log_dir: 'tmp/log',
  log_classic: true,
  log_colorize: true,
  log_console: true,
  log_states: {
    INFO: true,
    DEBUG: true,
    connect: true,
    request: true,
    response: true,
    eval: true
  })

class HelloWorld
  def call(env)
    [200, {}, ["Found"]]
  end
end

Agoo::Server.handle(nil, '/**', HelloWorld.new)
Agoo::Server.start

